void vadd(int* in_a, int* in_b, int* out_c, int count) {
#pragma HLS INTERFACE m_axi port=in_a offset=slave
#pragma HLS INTERFACE s_axilite port=in_a bundle=control
#pragma HLS INTERFACE m_axi port=in_b offset=slave
#pragma HLS INTERFACE s_axilite port=in_b bundle=control
#pragma HLS INTERFACE m_axi port=out_c offset=slave
#pragma HLS INTERFACE s_axilite port=out_c bundle=control
#pragma HLS INTERFACE s_axilite port=count bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control
    for (int i = 0; i < count; ++i) {
        *out_c++ = *in_a++ + *in_b++;
    }
}
