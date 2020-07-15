Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D626AC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 06:20:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E1A220663
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 06:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BGhkx7Ce";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkN9kI7s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E1A220663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hVXsaKBqa1MkY3AkGTqeWDxvSkADwPwj5p9VldKD40I=; b=BGhkx7CeHt+IU1xYg+nSUdwsz
	wwX+f76kISIX4s8lVSFrhKkWh75Pcvlcnoi0/l7O9IpMn3w+yIe0lyetV2tNlQslXvObzbhZcgC3O
	57GXaJ5id86cVHvs77SjlfFZiFo3YKAFzpsPYxqvITGHySeEOjvUZ0OM8w8v5xT7lZFnSRPL+vwf5
	YtdzzyB+NAVCx+Kx/1Zct62Am30jJEYXpp5sj7+0tAEIXB7KWMfLAuWofane68spSMxgJvR0T9czq
	gg4dGk6T20WJ7UCqLQ69z9owGToiqLDGU0Gk3pK2OANfPI2dkKva7cwpJQcyEnNS4ydljYOtRhpIb
	Q1VMqvFog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvalz-0000GR-Lu; Wed, 15 Jul 2020 06:20:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvalu-0000FM-6R; Wed, 15 Jul 2020 06:20:03 +0000
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E49520672;
 Wed, 15 Jul 2020 06:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594794001;
 bh=05czjJvRJc8XN686B6X5OIjt1m5Lx94Zy66nZ0TFTuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TkN9kI7sW2FxzrMGLsnMSOwyLrYgRTsapamaHFT5ehvpboZalM4to6Kn4CneZsoAf
 l4tDgoEVPTgKkzAIWkq6cI1RYmZsqxw6PeL35Jmiwe4gky+oFMzPrqQysl6qj66iMd
 mZBGDFdxeuRN4wxW83eGEdBuxtQBaZu7WESwQtMo=
Date: Wed, 15 Jul 2020 11:49:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: EastL Lee <EastL.Lee@mediatek.com>
Subject: Re: [PATCH v6 2/4] dmaengine: mediatek-cqdma: remove redundant queue
 structure
Message-ID: <20200715061957.GA34333@vkoul-mobl>
References: <1593673564-4425-1-git-send-email-EastL.Lee@mediatek.com>
 <1593673564-4425-3-git-send-email-EastL.Lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593673564-4425-3-git-send-email-EastL.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_022002_344768_6A967595 
X-CRM114-Status: GOOD (  12.09  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, cc.hwang@mediatek.com,
 wsd_upstream@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 02-07-20, 15:06, EastL Lee wrote:

>  static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
>  					   dma_cookie_t cookie,
>  					   struct dma_tx_state *txstate)
>  {
> -	struct mtk_cqdma_vchan *cvc = to_cqdma_vchan(c);
> -	struct mtk_cqdma_vdesc *cvd;
> -	struct virt_dma_desc *vd;
> -	enum dma_status ret;
> -	unsigned long flags;
> -	size_t bytes = 0;
> -
> -	ret = dma_cookie_status(c, cookie, txstate);
> -	if (ret == DMA_COMPLETE || !txstate)
> -		return ret;
> -
> -	spin_lock_irqsave(&cvc->vc.lock, flags);
> -	vd = mtk_cqdma_find_active_desc(c, cookie);
> -	spin_unlock_irqrestore(&cvc->vc.lock, flags);
> -
> -	if (vd) {
> -		cvd = to_cqdma_vdesc(vd);
> -		bytes = cvd->residue;
> -	}
> -
> -	dma_set_residue(txstate, bytes);

any reason why you want to remove setting residue?

> -static void mtk_cqdma_free_active_desc(struct dma_chan *c)
> +static int mtk_cqdma_terminate_all(struct dma_chan *c)
>  {
>  	struct mtk_cqdma_vchan *cvc = to_cqdma_vchan(c);
> -	bool sync_needed = false;
> +	struct virt_dma_chan *vc = to_virt_chan(c);
>  	unsigned long pc_flags;
>  	unsigned long vc_flags;
> +	LIST_HEAD(head);
> +
> +	/* wait for the VC to be inactive  */
> +	if (!wait_for_completion_timeout(&cvc->cmp, msecs_to_jiffies(3000)))
> +		return -EAGAIN;
>  
>  	/* acquire PC's lock first due to lock dependency in dma ISR */
>  	spin_lock_irqsave(&cvc->pc->lock, pc_flags);
>  	spin_lock_irqsave(&cvc->vc.lock, vc_flags);
>  
> -	/* synchronization is required if this VC is active */
> -	if (mtk_cqdma_is_vchan_active(cvc)) {
> -		cvc->issue_synchronize = true;
> -		sync_needed = true;
> -	}
> +	/* get VDs from lists */
> +	vchan_get_all_descriptors(vc, &head);
> +
> +	/* free all the VDs */
> +	vchan_dma_desc_free_list(vc, &head);
>  
>  	spin_unlock_irqrestore(&cvc->vc.lock, vc_flags);
>  	spin_unlock_irqrestore(&cvc->pc->lock, pc_flags);

Good cleanup, do you need both these locks?
-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
