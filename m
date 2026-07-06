Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E983C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UrHChc8M+M+p0SiB4fBzc+NlWnId3OCW6A/n3Cjpjw=; b=lbX//5WaMv3MaFMbkFa/PR4sKN
	mXQklYuT0n/eimuuRX+6SyFqAv0FvZj/FoPT8jBgivTgObRmgmTVvE6Llty6k9D8ScnQexZyXujd+
	80kF/3O0EKXX/mvYwWDSFdYP3lY3RFo0kDKuIYxS1F19xzXphNnEgFURfuH1TwopzedPWzrh9IAOz
	RbUK3j1+r16OGZIZvXluvN4KYSyx/on0tcOWjqL/eO3cvllkj3TLdoy3nPIhXOlo7ax1POb4oAAiT
	+VY0fyd6iZ4n4CYBr46CJ0XmMNRZTTElGtItT//0LLYMjE5z9g6k70yqlL9HB07OXARBcFd4zL9tn
	nnvDBzEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggI2-0000000C9qb-0EK9;
	Mon, 06 Jul 2026 10:11:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggHx-0000000C9pR-24SU
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 10:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783332656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UrHChc8M+M+p0SiB4fBzc+NlWnId3OCW6A/n3Cjpjw=;
	b=eHNcMmPviiVg7gAZMu4v1OOiUUJibHETqVl0w7seiR7kKoeOB0UJned+CSSfR9cmiBjzuc
	OUKrRCVZU+afEkTrLsWAAQ9kS/pgAk3M8EuEcrrYEQqLthjVs+vCao5z7r46kOdS/G6/Kd
	loNxOLPYGuM2YJGRd7PcZlVFMqrFaUw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-6UL7jBsPPSGmYehftaPLMA-1; Mon,
 06 Jul 2026 06:10:52 -0400
X-MC-Unique: 6UL7jBsPPSGmYehftaPLMA-1
X-Mimecast-MFC-AGG-ID: 6UL7jBsPPSGmYehftaPLMA_1783332651
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 16C851955F72;
	Mon,  6 Jul 2026 10:10:51 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.156])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4178E1800591;
	Mon,  6 Jul 2026 10:10:49 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: hujy652@gmail.com
Cc: lorenzo@kernel.org,
	nbd@nbd.name,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
Date: Mon,  6 Jul 2026 12:10:44 +0200
Message-ID: <20260706101044.161059-1-pabeni@redhat.com>
In-Reply-To: <20260630144831.1109-1-hujy652@gmail.com>
References: <20260630144831.1109-1-hujy652@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: A-qlRW1dLjI3DTbKPSzeKO_xdsrhtK-uq6a2c4xN6Rs_1783332651
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031058_167168_AF067163 
X-CRM114-Status: GOOD (  16.99  )
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

From: AI Reviewer <ai@example.com>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/
---
net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986

This commit updates mtk_wed_start() to configure WDMA_RING_TX(0) on
non-DBDC MT7986 devices. It adds a call to mtk_wed_wdma_tx_ring_setup()
for v2 hardware if the descriptor is not yet set up.

> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index 10d9beaae3721..2420557f6c966 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -2334,6 +2334,10 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
>  		if (!dev->rx_wdma[i].desc)
>  			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);

[Severity: High]
This isn't a bug introduced by this patch, but does this loop need to check
the return value of mtk_wed_wdma_rx_ring_setup()?

If mtk_wed_wdma_rx_ring_setup() returns -ENOMEM, the hardware registers are
not programmed, but mtk_wed_start() continues execution and enables DMA.

Could this lead to hardware DMA using an uninitialized ring base address?

>  
> +	if (mtk_wed_is_v2(dev->hw))
> +		if (!dev->tx_wdma[0].desc)
> +			mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, false);

[Severity: High]
Are there similar error handling concerns with this new call to
mtk_wed_wdma_tx_ring_setup()?

Like the RX path, if dma_alloc_coherent() fails inside this setup function,
it returns -ENOMEM without programming the hardware registers.

Since mtk_wed_start() doesn't check this return value, it will proceed to
enable hardware DMA, which might attempt to use an uninitialized DMA address.

[Severity: High]
Does the check for !dev->tx_wdma[0].desc prevent necessary hardware
initialization after a warm reset?

When the WLAN driver triggers a hardware reset, the WED hardware registers
are cleared, and mtk_wed_start() is called again.

Because dev->tx_wdma[0].desc was allocated during the initial start, the
guard will evaluate to false, skipping the hardware register reprogramming
for tx_wdma[0].

Will the hardware DMA end up using a zeroed ring base address after a reset?

> +
>  	if (dev->wlan.hw_rro) {
>  		for (i = 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {
>  			u32 addr = MTK_WED_RRO_MSDU_PG_CTRL0(i) +
-- 
This is an AI-generated review.


