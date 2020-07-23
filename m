Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFFAC433F8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:34:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D8292084D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lw/d24ZF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="arU8Ru/y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D8292084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=716VaTalAKSPc0SdkwHcIOumTtoBb3e7GWzjeZ/8+hI=; b=Lw/d24ZFXj85NJi+TJtLbJq5q
	3ctHMeiX+2ychnBgeiSKi1I+Qz22Q1yj6sObOUSGYo9AU2spD/W7Kp9FZ26pK1VTdxeTgHMgQMiVz
	P4Q0uwHZyALWEvlyzv8FIBTvBmkPzPjPAgy1ke81Lm3g4pjoGCFHmKRHpXCP4dd48cQRvlXuBE40J
	sdgN5aZltQrYnHrG1VyZNFRxOu+BfTgYHcoAMTDof6Z2EMXMH+taRQNGIFVRwROhzKv1/ywZLff+a
	Rp01iCxXOY2j8NjHSBQXOg+ey1a1L5yCYzZSbzDR3vIWSf10KsKS0KwAJLyzdo+BKvtWar+B84BI9
	GakWiyWwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyR3u-0006mV-0u; Thu, 23 Jul 2020 02:34:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyR3p-0006la-KH; Thu, 23 Jul 2020 02:34:18 +0000
X-UUID: 67103324500745f198458de83e4e93f2-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9hTIinPJ/86OaOzsDAjqdA+TQ7VtOw4pAcixEozya7A=; 
 b=arU8Ru/yuG0TpypuMhw6gbzfQiwEpS2Xq1YELHCSXKxHg//a1tsTOMYL9l1knqpJgtOP+vfOvScdQ8CaypLJmo7poMls//PwavUwLbCNVRIQoI0L6Q+8BFccV9/AAdCf6NBCfVnauxXoCTReJmAGdWnPxEL3D93nZblyBPsklwE=;
X-UUID: 67103324500745f198458de83e4e93f2-20200722
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 355552065; Wed, 22 Jul 2020 18:34:12 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 19:34:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 10:34:10 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 10:34:07 +0800
Message-ID: <1595471650.22392.12.camel@mtkswgap22>
Subject: Re: [PATCH v6 2/4] dmaengine: mediatek-cqdma: remove redundant
 queue structure
From: EastL <EastL.Lee@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 23 Jul 2020 10:34:10 +0800
In-Reply-To: <20200715061957.GA34333@vkoul-mobl>
References: <1593673564-4425-1-git-send-email-EastL.Lee@mediatek.com>
 <1593673564-4425-3-git-send-email-EastL.Lee@mediatek.com>
 <20200715061957.GA34333@vkoul-mobl>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_223417_808956_2C01E0EB 
X-CRM114-Status: GOOD (  11.94  )
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

On Wed, 2020-07-15 at 11:49 +0530, Vinod Koul wrote:
> On 02-07-20, 15:06, EastL Lee wrote:
> 
> >  static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
> >  					   dma_cookie_t cookie,
> >  					   struct dma_tx_state *txstate)
> >  {
> > -	struct mtk_cqdma_vchan *cvc = to_cqdma_vchan(c);
> > -	struct mtk_cqdma_vdesc *cvd;
> > -	struct virt_dma_desc *vd;
> > -	enum dma_status ret;
> > -	unsigned long flags;
> > -	size_t bytes = 0;
> > -
> > -	ret = dma_cookie_status(c, cookie, txstate);
> > -	if (ret == DMA_COMPLETE || !txstate)
> > -		return ret;
> > -
> > -	spin_lock_irqsave(&cvc->vc.lock, flags);
> > -	vd = mtk_cqdma_find_active_desc(c, cookie);
> > -	spin_unlock_irqrestore(&cvc->vc.lock, flags);
> > -
> > -	if (vd) {
> > -		cvd = to_cqdma_vdesc(vd);
> > -		bytes = cvd->residue;
> > -	}
> > -
> > -	dma_set_residue(txstate, bytes);
> 
> any reason why you want to remove setting residue?
Because Mediatek CQDMA HW can't support residue.
> 
> > -static void mtk_cqdma_free_active_desc(struct dma_chan *c)
> > +static int mtk_cqdma_terminate_all(struct dma_chan *c)
> >  {
> >  	struct mtk_cqdma_vchan *cvc = to_cqdma_vchan(c);
> > -	bool sync_needed = false;
> > +	struct virt_dma_chan *vc = to_virt_chan(c);
> >  	unsigned long pc_flags;
> >  	unsigned long vc_flags;
> > +	LIST_HEAD(head);
> > +
> > +	/* wait for the VC to be inactive  */
> > +	if (!wait_for_completion_timeout(&cvc->cmp, msecs_to_jiffies(3000)))
> > +		return -EAGAIN;
> >  
> >  	/* acquire PC's lock first due to lock dependency in dma ISR */
> >  	spin_lock_irqsave(&cvc->pc->lock, pc_flags);
> >  	spin_lock_irqsave(&cvc->vc.lock, vc_flags);
> >  
> > -	/* synchronization is required if this VC is active */
> > -	if (mtk_cqdma_is_vchan_active(cvc)) {
> > -		cvc->issue_synchronize = true;
> > -		sync_needed = true;
> > -	}
> > +	/* get VDs from lists */
> > +	vchan_get_all_descriptors(vc, &head);
> > +
> > +	/* free all the VDs */
> > +	vchan_dma_desc_free_list(vc, &head);
> >  
> >  	spin_unlock_irqrestore(&cvc->vc.lock, vc_flags);
> >  	spin_unlock_irqrestore(&cvc->pc->lock, pc_flags);
> 
> Good cleanup, do you need both these locks?
Yes, because we will have multiple vc to pc, it will need both lock.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
