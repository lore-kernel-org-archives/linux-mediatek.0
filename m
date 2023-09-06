Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC57EB8FA5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 11:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rJcTQB0IVjNr8quu08zT7i+qTtfUrkrHhYtSeZgiSHY=; b=3eE1SHRTVhZgwzK2AR22XsqjUz
	4ZhDHOUHoI1Rx/pQnblWHeIHZ+6/4K5jpmmgEU+ZWFAwacVlBZRMVBslUJ6gR1/sBvZZK5BIzKgVR
	KhwfC9t3FBXoz0P3CjsehuSmI7jy6b/Nyl59T34rvBOSy0hWdWup15Hk1AyIsvlVcRycmL9AUsara
	zckhvhF9eEydV3gPY5qB84zyBTGDMNORGnvnKAKIex/Z2WV2pB7cz7ULdI6CK8ZqWrLUJuHZKUv3a
	3pImcj4hJDs/2KGxPB7895K5z+9/fDJYKVJKMhor0CIZ9Mjle6/73+ZQxQ6EODdTPDCBy5syK/OlY
	YVlTFF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdr4Z-00918O-0O;
	Wed, 06 Sep 2023 11:51:51 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdr4V-00913r-2x
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Sep 2023 11:51:49 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-500c7796d8eso5681186e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Sep 2023 04:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694001105; x=1694605905; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rJcTQB0IVjNr8quu08zT7i+qTtfUrkrHhYtSeZgiSHY=;
        b=bxKR24igCZuMSWU0k68MuprXGgLTBgQxZGO6Y/ydeH1CEXKradYIJQSrvT/crH0mlx
         e9dmMpR9NQ4BUerM1Tbk1xfZ8t0H/yE2mJRV/UsrSDbgPEdhOwsIG5G49ZquSfV8aun0
         NybFtIeL1oTmMzTZG+pLraVsS9DKs2uxj2Lz/T6aoHl8gkggjSAu6kOYOxhgjlJuJMsy
         Medh4Z6rdmmgAjuDH7B+TmAA7DZUf69TewPrR8VdSBfBJCMO56ahxJTmD7U+eorf5o5L
         vHAzACgw+oYbeOxQEKUDra+IYRzAZA9j8nloXMq+SRR2y7WG5aAtVkxcDiHqnbjRwJTQ
         3y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694001105; x=1694605905;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJcTQB0IVjNr8quu08zT7i+qTtfUrkrHhYtSeZgiSHY=;
        b=lY4s6T6LKZGkO6u7kLTXpfHBsyMhbZncGbi8MubZtl6Nvy41Gfk6SMKyzgTcHoJS2/
         uuM8HicmfwLpHEaDZSVckE1tKT4EONJfT1OBdMujxV+uz9ScSaNeEmVNjYWxvgvm7Vb+
         vcmtY/LSbvUu6RxSimfWqgvvklTHx6zBysTvAM3aZ2M/azegIHrOFBS56ffIe5syOjzg
         l9AUQhxlgWBmHPUOP5DVRySgIad+LbHWhS0t3LV3qty/Ifoz/LHVYjpBC5e0rrr0Lcj7
         +DkZ8uzQ8w27hrOq78FEw+OhnoqVhMIjDYbbK4U/RhPJZUyraUrbsU6+diuOChv24Kk1
         v83g==
X-Gm-Message-State: AOJu0YyBZ504QmOuluFs9CFR7o15hwX7YBCMjt6nIyoD+DVfQtUsngz1
	pP0j6k6qc3lln1yE35iYmdlOPYL7VGlG2x1s9LM=
X-Google-Smtp-Source: AGHT+IG9x45Zisg/skUcZRHuO3ANB+P34AcHrS/Fe3X5/SeQyq961dBXPH0LShB2oFGfsLIVMLEKAA==
X-Received: by 2002:a05:6512:3444:b0:4f8:67f0:7253 with SMTP id j4-20020a056512344400b004f867f07253mr1813766lfr.49.1694001104783;
        Wed, 06 Sep 2023 04:51:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm19430685wms.39.2023.09.06.04.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 04:51:44 -0700 (PDT)
Date: Wed, 6 Sep 2023 14:51:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: daniel@makrotopia.org
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] net: ethernet: mtk_eth_soc: support 36-bit DMA
 addressing on MT7988
Message-ID: <9918f1ae-5604-4bdc-a654-e0566ca77ad6@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_045147_975809_1D4DECCC 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Daniel Golle,

The patch 2d75891ebc09: "net: ethernet: mtk_eth_soc: support 36-bit
DMA addressing on MT7988" from Aug 22, 2023 (linux-next), leads to
the following Smatch static checker warning:

	drivers/net/ethernet/mediatek/mtk_eth_soc.c:2190 mtk_poll_rx()
	error: uninitialized symbol 'dma_addr'.

drivers/net/ethernet/mediatek/mtk_eth_soc.c
    1996 static int mtk_poll_rx(struct napi_struct *napi, int budget,
    1997                        struct mtk_eth *eth)
    1998 {
    1999         struct dim_sample dim_sample = {};
    2000         struct mtk_rx_ring *ring;
    2001         bool xdp_flush = false;
    2002         int idx;
    2003         struct sk_buff *skb;
    2004         u64 addr64 = 0;
    2005         u8 *data, *new_data;
    2006         struct mtk_rx_dma_v2 *rxd, trxd;
    2007         int done = 0, bytes = 0;
    2008 
    2009         while (done < budget) {
    2010                 unsigned int pktlen, *rxdcsum;
    2011                 struct net_device *netdev;
    2012                 dma_addr_t dma_addr;
    2013                 u32 hash, reason;
    2014                 int mac = 0;
    2015 
    2016                 ring = mtk_get_rx_ring(eth);
    2017                 if (unlikely(!ring))
    2018                         goto rx_done;
    2019 
    2020                 idx = NEXT_DESP_IDX(ring->calc_idx, ring->dma_size);
    2021                 rxd = ring->dma + idx * eth->soc->txrx.rxd_size;
    2022                 data = ring->data[idx];
    2023 
    2024                 if (!mtk_rx_get_desc(eth, &trxd, rxd))
    2025                         break;
    2026 
    2027                 /* find out which mac the packet come from. values start at 1 */
    2028                 if (mtk_is_netsys_v2_or_greater(eth)) {
    2029                         u32 val = RX_DMA_GET_SPORT_V2(trxd.rxd5);
    2030 
    2031                         switch (val) {
    2032                         case PSE_GDM1_PORT:
    2033                         case PSE_GDM2_PORT:
    2034                                 mac = val - 1;
    2035                                 break;
    2036                         case PSE_GDM3_PORT:
    2037                                 mac = MTK_GMAC3_ID;
    2038                                 break;
    2039                         default:
    2040                                 break;
    2041                         }
    2042                 } else if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628) &&
    2043                            !(trxd.rxd4 & RX_DMA_SPECIAL_TAG)) {
    2044                         mac = RX_DMA_GET_SPORT(trxd.rxd4) - 1;
    2045                 }
    2046 
    2047                 if (unlikely(mac < 0 || mac >= MTK_MAX_DEVS ||
    2048                              !eth->netdev[mac]))
    2049                         goto release_desc;

dma_addr is not initialized here

    2050 
    2051                 netdev = eth->netdev[mac];
    2052 
    2053                 if (unlikely(test_bit(MTK_RESETTING, &eth->state)))
    2054                         goto release_desc;

or here

    2055 
    2056                 pktlen = RX_DMA_GET_PLEN0(trxd.rxd2);
    2057 
    2058                 /* alloc new buffer */
    2059                 if (ring->page_pool) {
    2060                         struct page *page = virt_to_head_page(data);
    2061                         struct xdp_buff xdp;
    2062                         u32 ret;
    2063 
    2064                         new_data = mtk_page_pool_get_buff(ring->page_pool,
    2065                                                           &dma_addr,
    2066                                                           GFP_ATOMIC);
    2067                         if (unlikely(!new_data)) {
    2068                                 netdev->stats.rx_dropped++;
    2069                                 goto release_desc;

or here

    2070                         }
    2071 
    2072                         dma_sync_single_for_cpu(eth->dma_dev,
    2073                                 page_pool_get_dma_addr(page) + MTK_PP_HEADROOM,
    2074                                 pktlen, page_pool_get_dma_dir(ring->page_pool));
    2075 
    2076                         xdp_init_buff(&xdp, PAGE_SIZE, &ring->xdp_q);
    2077                         xdp_prepare_buff(&xdp, data, MTK_PP_HEADROOM, pktlen,
    2078                                          false);
    2079                         xdp_buff_clear_frags_flag(&xdp);
    2080 
    2081                         ret = mtk_xdp_run(eth, ring, &xdp, netdev);
    2082                         if (ret == XDP_REDIRECT)
    2083                                 xdp_flush = true;
    2084 
    2085                         if (ret != XDP_PASS)
    2086                                 goto skip_rx;
    2087 
    2088                         skb = build_skb(data, PAGE_SIZE);
    2089                         if (unlikely(!skb)) {
    2090                                 page_pool_put_full_page(ring->page_pool,
    2091                                                         page, true);
    2092                                 netdev->stats.rx_dropped++;
    2093                                 goto skip_rx;
    2094                         }
    2095 
    2096                         skb_reserve(skb, xdp.data - xdp.data_hard_start);
    2097                         skb_put(skb, xdp.data_end - xdp.data);
    2098                         skb_mark_for_recycle(skb);
    2099                 } else {
    2100                         if (ring->frag_size <= PAGE_SIZE)
    2101                                 new_data = napi_alloc_frag(ring->frag_size);
    2102                         else
    2103                                 new_data = mtk_max_lro_buf_alloc(GFP_ATOMIC);
    2104 
    2105                         if (unlikely(!new_data)) {
    2106                                 netdev->stats.rx_dropped++;
    2107                                 goto release_desc;
    2108                         }
    2109 
    2110                         dma_addr = dma_map_single(eth->dma_dev,
    2111                                 new_data + NET_SKB_PAD + eth->ip_align,
    2112                                 ring->buf_size, DMA_FROM_DEVICE);
    2113                         if (unlikely(dma_mapping_error(eth->dma_dev,
    2114                                                        dma_addr))) {
    2115                                 skb_free_frag(new_data);
    2116                                 netdev->stats.rx_dropped++;
    2117                                 goto release_desc;
    2118                         }
    2119 
    2120                         if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA))
    2121                                 addr64 = RX_DMA_GET_ADDR64(trxd.rxd2);
    2122 
    2123                         dma_unmap_single(eth->dma_dev, ((u64)trxd.rxd1 | addr64),
    2124                                          ring->buf_size, DMA_FROM_DEVICE);
    2125 
    2126                         skb = build_skb(data, ring->frag_size);
    2127                         if (unlikely(!skb)) {
    2128                                 netdev->stats.rx_dropped++;
    2129                                 skb_free_frag(data);
    2130                                 goto skip_rx;
    2131                         }
    2132 
    2133                         skb_reserve(skb, NET_SKB_PAD + NET_IP_ALIGN);
    2134                         skb_put(skb, pktlen);
    2135                 }
    2136 
    2137                 skb->dev = netdev;
    2138                 bytes += skb->len;
    2139 
    2140                 if (mtk_is_netsys_v2_or_greater(eth)) {
    2141                         reason = FIELD_GET(MTK_RXD5_PPE_CPU_REASON, trxd.rxd5);
    2142                         hash = trxd.rxd5 & MTK_RXD5_FOE_ENTRY;
    2143                         if (hash != MTK_RXD5_FOE_ENTRY)
    2144                                 skb_set_hash(skb, jhash_1word(hash, 0),
    2145                                              PKT_HASH_TYPE_L4);
    2146                         rxdcsum = &trxd.rxd3;
    2147                 } else {
    2148                         reason = FIELD_GET(MTK_RXD4_PPE_CPU_REASON, trxd.rxd4);
    2149                         hash = trxd.rxd4 & MTK_RXD4_FOE_ENTRY;
    2150                         if (hash != MTK_RXD4_FOE_ENTRY)
    2151                                 skb_set_hash(skb, jhash_1word(hash, 0),
    2152                                              PKT_HASH_TYPE_L4);
    2153                         rxdcsum = &trxd.rxd4;
    2154                 }
    2155 
    2156                 if (*rxdcsum & eth->soc->txrx.rx_dma_l4_valid)
    2157                         skb->ip_summed = CHECKSUM_UNNECESSARY;
    2158                 else
    2159                         skb_checksum_none_assert(skb);
    2160                 skb->protocol = eth_type_trans(skb, netdev);
    2161 
    2162                 /* When using VLAN untagging in combination with DSA, the
    2163                  * hardware treats the MTK special tag as a VLAN and untags it.
    2164                  */
    2165                 if (mtk_is_netsys_v1(eth) && (trxd.rxd2 & RX_DMA_VTAG) &&
    2166                     netdev_uses_dsa(netdev)) {
    2167                         unsigned int port = RX_DMA_VPID(trxd.rxd3) & GENMASK(2, 0);
    2168 
    2169                         if (port < ARRAY_SIZE(eth->dsa_meta) &&
    2170                             eth->dsa_meta[port])
    2171                                 skb_dst_set_noref(skb, &eth->dsa_meta[port]->dst);
    2172                 }
    2173 
    2174                 if (reason == MTK_PPE_CPU_REASON_HIT_UNBIND_RATE_REACHED)
    2175                         mtk_ppe_check_skb(eth->ppe[0], skb, hash);
    2176 
    2177                 skb_record_rx_queue(skb, 0);
    2178                 napi_gro_receive(napi, skb);
    2179 
    2180 skip_rx:
    2181                 ring->data[idx] = new_data;
    2182                 rxd->rxd1 = (unsigned int)dma_addr;
    2183 release_desc:
    2184                 if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
    2185                         rxd->rxd2 = RX_DMA_LSO;
    2186                 else
    2187                         rxd->rxd2 = RX_DMA_PREP_PLEN0(ring->buf_size);
    2188 
    2189                 if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA))
--> 2190                         rxd->rxd2 |= RX_DMA_PREP_ADDR64(dma_addr);
                                                                 ^^^^^^^^
    2191 
    2192                 ring->calc_idx = idx;
    2193                 done++;
    2194         }
    2195 
    2196 rx_done:
    2197         if (done) {
    2198                 /* make sure that all changes to the dma ring are flushed before
    2199                  * we continue
    2200                  */
    2201                 wmb();
    2202                 mtk_update_rx_cpu_idx(eth);
    2203         }
    2204 
    2205         eth->rx_packets += done;
    2206         eth->rx_bytes += bytes;
    2207         dim_update_sample(eth->rx_events, eth->rx_packets, eth->rx_bytes,
    2208                           &dim_sample);
    2209         net_dim(&eth->rx_dim, dim_sample);
    2210 
    2211         if (xdp_flush)
    2212                 xdp_do_flush_map();
    2213 
    2214         return done;
    2215 }

regards,
dan carpenter

