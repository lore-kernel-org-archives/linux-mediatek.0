Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF1AC56205
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2026 15:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyD3MC/LYtqqEnSjFEabCt1+8sKgizIUqavkWxkyS9A=; b=zyBASd9dzjKU4Y2rC6Xpixrjfm
	hQobYWzylgKeR7UF1ujblXsbMw2ADLcV6EcbmVg0fz0k9K5TQceEbSMLOpPyYWVuUJcbsN+//yV32
	wIPncHcst3c0KDAhpEOktUGqFYJRj8YikcEYn4YnrCk5SwO9QaAhBZx5bSEQo6/NEShEcIAF3zBP2
	9JYdj2PZTL70+Z30VU2StQ+0Pnu9kn8ZRjHHKKQIeNub4qu1wNH0/cI5iUa5I2tdp5ZRHBnNDORu0
	PHxrQPt9sTiVjfKPnhYHuTW60yxBNpW87JsreJ3G8I8KmNvNA1mBC6/edC0zF7AyMGYvSW1lK6A3I
	Q7s0yepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzxV-000000064eG-2PMT;
	Thu, 06 Aug 2026 15:24:37 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrzwu-000000064b4-1jLv
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Aug 2026 15:24:36 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1201855a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2026 08:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786029839; x=1786634639; darn=lists.infradead.org;
        h=content-transfer-encoding:lines:status:content-disposition
         :content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyD3MC/LYtqqEnSjFEabCt1+8sKgizIUqavkWxkyS9A=;
        b=DGne33Bc6m15jL3lDXcbCgRJEdUgQ2Ac1VUONxEs/CvG64TthKXgvSHXNwdkqp2FxN
         A47hsiIY0LlAhwLQegONPi889t6rn1Urzi6Zpo5zjN2+I5AwuZ0EZBhERKueBnfSiYhn
         tkKYKDYPjnxSGqtQ37amLn6JmQbQdGo9el4gyUjB40FLbixLY3A50fYYmFhYpEnkodlh
         Bn624+3dTfMFi/vrKHvYt+o+gBhhIU0s8hJ4wCe2xKhZwzSAqz5o7P9MoKmQgcku2vg6
         mksJtj5lrhYS6ELnHeRAFzDAnGCA2RMfxVKWzna70FSs+tlmTDTbgBPdwq7iflRduEH2
         Q0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786029839; x=1786634639;
        h=content-transfer-encoding:lines:status:content-disposition
         :content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JyD3MC/LYtqqEnSjFEabCt1+8sKgizIUqavkWxkyS9A=;
        b=GisxFljhRR9+Ds0XGicpJFRVLJK11HPFgLBFxGX01331QpRFD/xtWVX3q4pEeprS/9
         /omAos3ZYserH6O3qnNn/4wgm2vTGdTXdsYqJKiwRZ1oocRVhlro5JwjHpdwy2aZr9dE
         esrMXvTDJTj345ee/0ore8gzGhsTvo/bktxBu/WjEFAp/BklzhV14VHdHg1fARxDIM77
         iLWtn9bTaeBPpjJwHWWN5LMVd5EGASFGr8sg0eVcFVLnrOVFZB7yZY1gXk0LkWmF3cCR
         3JOxWLkfpSpHLR1Jz7iH05jHSn3kobo0QdSqftJCccpfkwJRbD1/UWfKQ951fXFabqU1
         P2lg==
X-Forwarded-Encrypted: i=1; AHgh+RrsCMPg1YyvwmwHxZ4Ae4ZXhY2K92ANeyRhfFUqjbKjzG5ez5ZdAbuqBY7+j5PgGsjSt9IN7e/MPypvcqx/WQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+4irOidNsHQ4VVJCK0FPYjTUDssNypvNhhPuCugfXB+S8ZpQZ
	OxUG65+GDRPoFvGiOJXaGBXgUNd1wR00AdkG41Fr6cegfziCsFVrmpvU
X-Gm-Gg: AR+sD13UhPgwT6VOMqpHqppaGfh7SImfIdklOFKWzSF46YrV2bVHi3hDlmOZ9MQ3wYq
	8JZXgUprLVQs8jcGAF5JFR99Kza+FPgTTs9jBRypl1Muin6JBnTURkrlcQIHaI1306AmlxLkhKm
	I0+jZ7xDooI/r61jfbz8f3qCRatZrD4FG3Ugifmb2I9DnNykY/rnRVQKo+3u9hExRx/EWvthW6j
	MNJDCAPuIVkQQMWDpMXrmtnxfAq+99GR6FC1mPr7awErGvNZ0daxhuCgBxHDp8CPMVQKChMNPab
	Onw8+vZZuE1PaVwJnXXI0t50YWTJGVeXn0Md3mcupEWBoesJGwpt0+U0yYKuuNFVOC+5Uz4IFJX
	y3yHCjL77xjXNfzAYrx3+YGYIScu8Ih0lMIAC67qACi6L44XJCo5yLV0tQtr30ZbI1uLIMzT+Gz
	oEMRIpSNVfHVAU7tCOtHOXpASIkZxuPLdfEztGxm6K1S3BM24QNnMjyE2LuWlVpISpWiY8+wKBY
	GJgEoVbR7qFzsbxuM5XPVtYXpnfJA==
X-Received: by 2002:a17:90b:4ccc:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-3908982a10emr2522273a91.19.1786029838637;
        Thu, 06 Aug 2026 08:23:58 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f5c9a5sm1696416a91.15.2026.08.06.08.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 08:23:58 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: hujy652@gmail.com,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	sujuan.chen@mediatek.com
Subject: Re: [PATCH net v3 1/2] net: ethernet: mtk_wed: skip ring reset in wdma_tx_ring_setup for WED v3
Date: Thu,  6 Aug 2026 23:23:50 +0800
Message-ID: <20260806152350.555-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260724172040.1653-1-hujy652@gmail.com>
References: <20260724172040.1653-1-hujy652@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-References: <20260724172040.1653-1-hujy652@gmail.com>
X-Mutt-Fcc: ~/sent
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_082400_445582_3DB19C45 
X-CRM114-Status: GOOD (  22.90  )
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

On Sat, Jul 25, 2026 at 01:20:39AM +0800, Zhi-Jun You wrote:
> Currently WED v3 tx wdma ring, ring reset happens in a separate code
> block unconditionally.
> 
> Moreover, v3 has double the size of wdma_desc and has different init
> values. mtk_wed_ring_reset doens't deal with that and would corrupt the
> wdma_desc.
> 
> Fix this by skipping mtk_wed_ring_reset in mtk_wdma_tx_ring_setup for
> WED v3.

Commenting on Sashiko's report:
https://sashiko.dev/#/patchset/20260724172040.1653-1-hujy652%40gmail.com

> 
> Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
> Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
> ---
> Changes in v3:
> - new patch addressing WED v3 ring reset issue raised by Sashiko
> - Link to the review: https://lore.kernel.org/netdev/20260630144831.1109-1-hujy652@gmail.com/
> ---
>  drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index 10d9beaae372..7d2775a97fa0 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -1938,7 +1938,7 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
>  	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_CPU_IDX, 0);
>  	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_DMA_IDX, 0);
>  
> -	if (reset)
> +	if (!mtk_wed_is_v3_or_greater(dev->hw) && reset)
>  		mtk_wed_ring_reset(wdma, MTK_WED_WDMA_RING_SIZE, true);
>  
>  	if (!idx)  {

-This is a pre-existing issue, but while reviewing the WDMA ring reset logic,
 I noticed what looks like reversed logic in mtk_wdma_rx_reset():
 drivers/net/ethernet/mediatek/mtk_wed.c:mtk_wdma_rx_reset() {
 	...
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++) {
 		if (dev->rx_wdma[i].desc)
 			continue;
 		wdma_w32(dev,
 			 MTK_WDMA_RING_RX(i) + MTK_WED_RING_OFS_CPU_IDX, 0);
 	}
 	...
 }
 Does the if (dev->rx_wdma[i].desc) continue; check skip the CPU_IDX reset for
 active rings?
 When a WDMA RX reset occurs (e.g., during recovery from a hang), the hardware
 index is reset to 0, but the CPU_IDX register won't be reset for active rings
 since they have a non-NULL desc.
 Could this desynchronize the driver and hardware, leading to a permanent stall
 of the WDMA RX rings and network traffic failure?
 - ACK I will add a patch addressing this.

 Best regards,
 Zhi-Jun
> -- 
> 2.47.3
> 


