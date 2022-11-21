Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2015DC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 16:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SC7kU/RjxjlrzONN6C/wdXNeo0hHtz4sZV7GR4/xunI=; b=O0RqPvnR3zGk+P0fJIhyGfgmMC
	cV2sC5rK9pswsr362Wv+wGQCIgo2bCXkNz2lPm5o++CuOz2SdhHDnV6kMveUqABWAK39VDrQuYQpF
	ZMmBzd6h5DJwukOaJWOLbUDD3xGPaQMcPakWLBq1sAhcmL/ob9j5qpACqS02v1L43kZP3SMGafa8J
	wvWHDGHpmoQqPdc2to6uI1n8ZfBWQmxenr8YnB2OtCTs7Nuvyo0sqfYwyoJukW6ohY1YcHCdNWAXd
	2BI0AGadiK3tS5PxVIRLo1kUTIKsYwsgVGKkr2dZ1MpxoInwGDViSPPrIWhbvzb8QNfa+kc4PMgDA
	mfr+AWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxA5L-00G7YD-La; Mon, 21 Nov 2022 16:55:55 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxA5I-00G7XT-OM
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 16:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669049752; x=1700585752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G2iJcXvS0zhaskTE1Pfig9C99ZUTxBpWV4h6OI7DZ3A=;
  b=S54dAJWlUN5ROlF33Mf8R80CQLwTn1erwgiiPMrQrEcvpxDO6H/kvq9u
   4VFbQhpZAlPL1O+jX0/bRRXPRfzIdDCyWKqwFl35OhIuJockLDwJe/48R
   UItCC8VFHnCukhKftErmwXJKk1CPzHl9SWpE0lpJ50oXOqBaPc/Vc9HKG
   yrVSBXwzsZy7lpXAAblVOEC7TC2xaezerz6xqavl7qleAePQO3lpVnkZ6
   aOJ8YvdfVq/Bk0r6tVOg6+8UtL00eUd+/pexH1C1sJKBUHwzE6cJQvWS3
   mjynCmdpOVR9zN2640PeFjGujGEXKWZCNUwwrbe9canIhZwn/az+59M40
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="311235582"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="311235582"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 08:55:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="970138771"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="970138771"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga005.fm.intel.com with ESMTP; 21 Nov 2022 08:55:47 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 2ALGtjnc025169;
	Mon, 21 Nov 2022 16:55:45 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>, netdev@vger.kernel.org,
        nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
        Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, lorenzo.bianconi@redhat.com,
        sujuan.chen@mediatek.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 1/5] net: ethernet: mtk_wed: return status value in mtk_wdma_rx_reset
Date: Mon, 21 Nov 2022 17:55:21 +0100
Message-Id: <20221121165521.396686-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <8917d87eded7142a3a792c3ba64434a983278247.1669020847.git.lorenzo@kernel.org>
References: <cover.1669020847.git.lorenzo@kernel.org> <8917d87eded7142a3a792c3ba64434a983278247.1669020847.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_085552_831665_E4643996 
X-CRM114-Status: GOOD (  17.33  )
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


From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 21 Nov 2022 09:59:21 +0100

> Move MTK_WDMA_RESET_IDX configuration in mtk_wdma_rx_reset routine.
> This is a preliminary patch to add Wireless Ethernet Dispatcher reset
> support.
> 
> Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_wed.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index 7d8842378c2b..dc898ded2f05 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -101,17 +101,21 @@ mtk_wdma_read_reset(struct mtk_wed_device *dev)
>  	return wdma_r32(dev, MTK_WDMA_GLO_CFG);
>  }
>  
> -static void
> +static int
>  mtk_wdma_rx_reset(struct mtk_wed_device *dev)
>  {
>  	u32 status, mask = MTK_WDMA_GLO_CFG_RX_DMA_BUSY;
> -	int i;
> +	int i, ret;
>  
>  	wdma_clr(dev, MTK_WDMA_GLO_CFG, MTK_WDMA_GLO_CFG_RX_DMA_EN);
> -	if (readx_poll_timeout(mtk_wdma_read_reset, dev, status,
> -			       !(status & mask), 0, 1000))
> +	ret = readx_poll_timeout(mtk_wdma_read_reset, dev, status,
> +				 !(status & mask), 0, 10000);

You didn't mention anywhere this change of the timeout from 1000 to
10000, and for example for me it's not clear from the code why you
did this. Maybe leave a comment in the commitmsg?
Same in 2/5 for Tx, also 1000 -> 10000.

> +	if (ret)
>  		dev_err(dev->hw->dev, "rx reset failed\n");
>  
> +	wdma_w32(dev, MTK_WDMA_RESET_IDX, MTK_WDMA_RESET_IDX_RX);
> +	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
> +
>  	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++) {
>  		if (dev->rx_wdma[i].desc)
>  			continue;

[...]

> -- 
> 2.38.1

Thanks,
Olek

