Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 10:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asP8dhyxSUgO0L29Od55/p+ittqGFcnMIB0u28ju8Tk=; b=RS9fLL9ThHzRHK7Eh5Fs/lanUh
	4NgeSoR8Xfk5+JRsyuvCAddA3qxS3F2vdIS3qesCVib3ZLibOB03/t4fuA1xuZEpFMZby9wvU8WHj
	/pB1Cdv0OlIvBBn+Qir8u/4wpvNVMaVR1JTLY59rkqmVTzBcfUPe3uriVj5fa/HKD2xfJYVu6fY2l
	MS0d90xp3YDsvw7qa8wDX62xGhX9F8Fd4dluF/apEtfVChBUNQHzfEPLFEzWq6Na9jBhKhn9LZRrB
	KKwt17PxTOAkwKHVbpv7knt/sjDjLYV6nfUFrC2uniJZjuf2LMvE+4o4IN4o9bezWOOkMy0RsIaMY
	yn1CJ1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBCqF-009cNI-10; Tue, 12 Jul 2022 10:10:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBCqB-009cF8-W1
	for linux-mediatek@lists.infradead.org; Tue, 12 Jul 2022 10:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657620601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asP8dhyxSUgO0L29Od55/p+ittqGFcnMIB0u28ju8Tk=;
	b=WrIqsPS9WSV8wNLobJsWy03xl1O3THckQbK4a6YyUdkAHHUk+3cGz0zMfUb0cQJMAI3+hJ
	CXlYnMBlQFXXQRsveLIKyfpSs165kwfbpz/q+3v2bvHvoJUUdURaQH4O+kMXuuWUle4mx0
	ejmNdB5KEh7MyBSECwy1gmBgkUNtod4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-ADhE-ZTANyG023VZA1tvZw-1; Tue, 12 Jul 2022 06:08:09 -0400
X-MC-Unique: ADhE-ZTANyG023VZA1tvZw-1
Received: by mail-wm1-f71.google.com with SMTP id a6-20020a05600c348600b003a2d72b7a15so6510335wmq.9
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Jul 2022 03:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=asP8dhyxSUgO0L29Od55/p+ittqGFcnMIB0u28ju8Tk=;
        b=JKLnijvL8cdg6hPL0O6tZN6LRLY5nPwcrAo1JIzQdq4VIN2I/MYT7I6ucqv3F39bhI
         7F2VI7qyUJyb70XyGpfNItTUgsRY2d3cZEPlzqAumvKtfNT3FmnIj9ET7SjUECHPVNv3
         b/RB3MmoMs8BM8ZiMbMaPmm9Zkji8rI6ijQoNyYRIKv6RI/li1Wg259o8c9lZhN0/akz
         mpHKc2ZAVFD1tWhcjjNP6Mom7jq/rejvTHmgB1K+7dOmcIfyOdXZOgpYhFBob6KeUDDK
         8h3EYHrV8i0BTt9SI33NKd/49r9dUmxkxwYJWCMoTZs/XFcPZvQxgGuniBxwVjRpnn18
         3QOA==
X-Gm-Message-State: AJIora95ZV5+AlqEhof1V1uuWvnAToPYuYqHUGxHJoNyuFOfDMpUqJGH
	p7q3JrJYomuiV3vIUQNDvrn819bzCsA0s2VkC8S8Bb4ZLcKMtZaXJHcojrT8IJCurnAy5vqmYRY
	pimfZ+BO6/UAp1XdtqKd/G9waGUlkyEJA
X-Received: by 2002:a05:600c:19cd:b0:3a1:77b6:cf1d with SMTP id u13-20020a05600c19cd00b003a177b6cf1dmr2833035wmq.141.1657620488727;
        Tue, 12 Jul 2022 03:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1SefFmZkzyMfcY527GGFtqz++KRFKTRxAYUMCOJyY2MyCpI06LmrS10U0FyeLhmcsKyHfcQ==
X-Received: by 2002:a05:600c:19cd:b0:3a1:77b6:cf1d with SMTP id u13-20020a05600c19cd00b003a177b6cf1dmr2833006wmq.141.1657620488462;
        Tue, 12 Jul 2022 03:08:08 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-97-238.dyn.eolo.it. [146.241.97.238])
        by smtp.gmail.com with ESMTPSA id c9-20020adfed89000000b0021d9233e7e6sm9505539wro.54.2022.07.12.03.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 03:08:07 -0700 (PDT)
Message-ID: <2112728b3e53609c46d6403bffd563d62846a1d6.camel@redhat.com>
Subject: Re: [PATCH net-next 3/4] net: ethernet: mtk_eth_soc: introduce xdp
 ethtool counters
From: Paolo Abeni <pabeni@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, 
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, 
 kuba@kernel.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org,  ilias.apalodimas@linaro.org,
 lorenzo.bianconi@redhat.com, jbrouer@redhat.com
Date: Tue, 12 Jul 2022 12:08:05 +0200
In-Reply-To: <6a522ca5588fde75f42d4d812e8990eca6d8952d.1657381057.git.lorenzo@kernel.org>
References: <cover.1657381056.git.lorenzo@kernel.org>
	 <6a522ca5588fde75f42d4d812e8990eca6d8952d.1657381057.git.lorenzo@kernel.org>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_031004_147449_13A30940 
X-CRM114-Status: GOOD (  24.30  )
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

On Sat, 2022-07-09 at 17:48 +0200, Lorenzo Bianconi wrote:
> Report xdp stats through ethtool
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 54 +++++++++++++++++----
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h | 12 +++++
>  2 files changed, 57 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 3b583abb599d..ae7ba2e09df8 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -34,6 +34,10 @@ MODULE_PARM_DESC(msg_level, "Message level (-1=defaults,0=none,...,16=all)");
>  #define MTK_ETHTOOL_STAT(x) { #x, \
>  			      offsetof(struct mtk_hw_stats, x) / sizeof(u64) }
>  
> +#define MTK_ETHTOOL_XDP_STAT(x) { #x, \
> +				  offsetof(struct mtk_hw_stats, xdp_stats.x) / \
> +				  sizeof(u64) }
> +
>  static const struct mtk_reg_map mtk_reg_map = {
>  	.tx_irq_mask		= 0x1a1c,
>  	.tx_irq_status		= 0x1a18,
> @@ -141,6 +145,13 @@ static const struct mtk_ethtool_stats {
>  	MTK_ETHTOOL_STAT(rx_long_errors),
>  	MTK_ETHTOOL_STAT(rx_checksum_errors),
>  	MTK_ETHTOOL_STAT(rx_flow_control_packets),
> +	MTK_ETHTOOL_XDP_STAT(rx_xdp_redirect),
> +	MTK_ETHTOOL_XDP_STAT(rx_xdp_pass),
> +	MTK_ETHTOOL_XDP_STAT(rx_xdp_drop),
> +	MTK_ETHTOOL_XDP_STAT(rx_xdp_tx),
> +	MTK_ETHTOOL_XDP_STAT(rx_xdp_tx_errors),
> +	MTK_ETHTOOL_XDP_STAT(tx_xdp_xmit),
> +	MTK_ETHTOOL_XDP_STAT(tx_xdp_xmit_errors),
>  };
>  
>  static const char * const mtk_clks_source_name[] = {
> @@ -1495,7 +1506,8 @@ static void mtk_rx_put_buff(struct mtk_rx_ring *ring, void *data, bool napi)
>  }
>  
>  static u32 mtk_xdp_run(struct mtk_rx_ring *ring, struct bpf_prog *prog,
> -		       struct xdp_buff *xdp, struct net_device *dev)
> +		       struct xdp_buff *xdp, struct net_device *dev,
> +		       struct mtk_xdp_stats *stats)
>  {
>  	u32 act = XDP_PASS;
>  
> @@ -1505,10 +1517,13 @@ static u32 mtk_xdp_run(struct mtk_rx_ring *ring, struct bpf_prog *prog,
>  	act = bpf_prog_run_xdp(prog, xdp);
>  	switch (act) {
>  	case XDP_PASS:
> +		stats->rx_xdp_pass++;
>  		return XDP_PASS;
>  	case XDP_REDIRECT:
>  		if (unlikely(xdp_do_redirect(dev, xdp, prog)))
>  			break;
> +
> +		stats->rx_xdp_redirect++;
>  		return XDP_REDIRECT;
>  	default:
>  		bpf_warn_invalid_xdp_action(dev, prog, act);
> @@ -1520,14 +1535,38 @@ static u32 mtk_xdp_run(struct mtk_rx_ring *ring, struct bpf_prog *prog,
>  		break;
>  	}
>  
> +	stats->rx_xdp_drop++;
>  	page_pool_put_full_page(ring->page_pool,
>  				virt_to_head_page(xdp->data), true);
>  	return XDP_DROP;
>  }
>  
> +static void mtk_xdp_rx_complete(struct mtk_eth *eth,
> +				struct mtk_xdp_stats *stats)
> +{
> +	int i, xdp_do_redirect = 0;
> +
> +	/* update xdp ethtool stats */
> +	for (i = 0; i < MTK_MAX_DEVS; i++) {
> +		struct mtk_hw_stats *hw_stats = eth->mac[i]->hw_stats;
> +		struct mtk_xdp_stats *xdp_stats = &hw_stats->xdp_stats;
> +
> +		u64_stats_update_begin(&hw_stats->syncp);
> +		xdp_stats->rx_xdp_redirect += stats[i].rx_xdp_redirect;
> +		xdp_do_redirect += stats[i].rx_xdp_pass;
> +		xdp_stats->rx_xdp_pass += stats[i].rx_xdp_pass;
> +		xdp_stats->rx_xdp_drop += stats[i].rx_xdp_drop;
> +		u64_stats_update_end(&hw_stats->syncp);
> +	}
> +
> +	if (xdp_do_redirect)
> +		xdp_do_flush_map();
> +}
> +
>  static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  		       struct mtk_eth *eth)
>  {
> +	struct mtk_xdp_stats xdp_stats[MTK_MAX_DEVS] = {};

This is allocating on the stack and clearing a relatively large struct
for every poll() call, which is not good.

Why can't you touch directly the eth->mac[i]->hw_stats.xdp_stats
counters where needed?

>  	struct bpf_prog *prog = READ_ONCE(eth->prog);
>  	struct dim_sample dim_sample = {};
>  	struct mtk_rx_ring *ring;
> @@ -1535,7 +1574,6 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  	struct sk_buff *skb;
>  	u8 *data, *new_data;
>  	struct mtk_rx_dma_v2 *rxd, trxd;
> -	bool xdp_do_redirect = false;
>  	int done = 0, bytes = 0;
>  
>  	while (done < budget) {
> @@ -1597,12 +1635,10 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  					 false);
>  			xdp_buff_clear_frags_flag(&xdp);
>  
> -			ret = mtk_xdp_run(ring, prog, &xdp, netdev);
> -			if (ret != XDP_PASS) {
> -				if (ret == XDP_REDIRECT)
> -					xdp_do_redirect = true;
> +			ret = mtk_xdp_run(ring, prog, &xdp, netdev,
> +					  &xdp_stats[mac]);
> +			if (ret != XDP_PASS)
>  				goto skip_rx;
> -			}
>  
>  			skb = build_skb(data, PAGE_SIZE);
>  			if (unlikely(!skb)) {
> @@ -1725,8 +1761,8 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  			  &dim_sample);
>  	net_dim(&eth->rx_dim, dim_sample);
>  
> -	if (prog && xdp_do_redirect)
> -		xdp_do_flush_map();
> +	if (prog)
> +		mtk_xdp_rx_complete(eth, xdp_stats);
>  
>  	return done;
>  }
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index a1cea93300c1..629cdcdd632a 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -570,6 +570,16 @@ struct mtk_tx_dma_v2 {
>  struct mtk_eth;
>  struct mtk_mac;
>  
> +struct mtk_xdp_stats {
> +	u64 rx_xdp_redirect;
> +	u64 rx_xdp_pass;
> +	u64 rx_xdp_drop;
> +	u64 rx_xdp_tx;
> +	u64 rx_xdp_tx_errors;
> +	u64 tx_xdp_xmit;
> +	u64 tx_xdp_xmit_errors;
> +};
> +
>  /* struct mtk_hw_stats - the structure that holds the traffic statistics.
>   * @stats_lock:		make sure that stats operations are atomic
>   * @reg_offset:		the status register offset of the SoC
> @@ -593,6 +603,8 @@ struct mtk_hw_stats {
>  	u64 rx_checksum_errors;
>  	u64 rx_flow_control_packets;
>  
> +	struct mtk_xdp_stats	xdp_stats;
> +
>  	spinlock_t		stats_lock;
>  	u32			reg_offset;
>  	struct u64_stats_sync	syncp;


