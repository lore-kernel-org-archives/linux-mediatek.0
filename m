Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D27C433EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 09:45:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8027E2070B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 09:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AEcM6hBC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nb96BsOq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8027E2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iKhuBGSKBGeJ0LWD9J8IfOZv46xyrKPIT61DiclA8GQ=; b=AEcM6hBCRTbEICrOc2fcixMlt
	XmWpMSrUL31ycRch7fFOrTHaAmcAEOHx56kZjZ6kTcqpenuHYOf2SpPxdrKtT9uCelPMVXecMjabK
	VYhLfcABr6X13QT03+WpGnraqfm3x+UrfiBY1hSKtX9zaBBWTir5P6I5fKvDxvUzEyprm+0qDzSd5
	eaJ35h4aLsvchSNhs2WIeT1nOxGbTBvpvpCEEslDAmPrnzk7f+wUiiqydExo9hbmGT3y6cpjWeHOU
	rOZ+gE0ZmKD7rhDovC8DIBIm2/9MBRQ1cU3hcGLsvZVCYRrPrGuj8mBAhFAAw7wkOVMXA1Rj6mpjU
	ygPUfJmiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzzgw-0004ao-6S; Mon, 27 Jul 2020 09:45:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzzgt-0004a4-FK; Mon, 27 Jul 2020 09:45:04 +0000
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E014206D7;
 Mon, 27 Jul 2020 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595843102;
 bh=DLS6vu+tF/Yr4axusONjg1ATVJlwfe6hyJtgwtl3cEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nb96BsOq2UFJortPd2AwocDDVxbx43ewV+au31xXLCatkujH299GZIJ40VXDICWc+
 jz+AhXxOnYIVA8X5MlTUwOt8yLVgxxdWAZnW0JqsvaWc71gmId1L0LeQOyElEADiYS
 exnlU70eGFczsyRZcdsjPiFSRelD3n2PWlK2mi+w=
Date: Mon, 27 Jul 2020 15:14:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: EastL <EastL.Lee@mediatek.com>
Subject: Re: [PATCH v6 2/4] dmaengine: mediatek-cqdma: remove redundant queue
 structure
Message-ID: <20200727094458.GU12965@vkoul-mobl>
References: <1593673564-4425-1-git-send-email-EastL.Lee@mediatek.com>
 <1593673564-4425-3-git-send-email-EastL.Lee@mediatek.com>
 <20200715061957.GA34333@vkoul-mobl>
 <1595471650.22392.12.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595471650.22392.12.camel@mtkswgap22>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_054503_589642_DC18BDE4 
X-CRM114-Status: GOOD (  12.79  )
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

On 23-07-20, 10:34, EastL wrote:
> On Wed, 2020-07-15 at 11:49 +0530, Vinod Koul wrote:
> > On 02-07-20, 15:06, EastL Lee wrote:
> > 
> > >  static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
> > >  					   dma_cookie_t cookie,
> > >  					   struct dma_tx_state *txstate)
> > >  {
> > > -	struct mtk_cqdma_vchan *cvc = to_cqdma_vchan(c);
> > > -	struct mtk_cqdma_vdesc *cvd;
> > > -	struct virt_dma_desc *vd;
> > > -	enum dma_status ret;
> > > -	unsigned long flags;
> > > -	size_t bytes = 0;
> > > -
> > > -	ret = dma_cookie_status(c, cookie, txstate);
> > > -	if (ret == DMA_COMPLETE || !txstate)
> > > -		return ret;
> > > -
> > > -	spin_lock_irqsave(&cvc->vc.lock, flags);
> > > -	vd = mtk_cqdma_find_active_desc(c, cookie);
> > > -	spin_unlock_irqrestore(&cvc->vc.lock, flags);
> > > -
> > > -	if (vd) {
> > > -		cvd = to_cqdma_vdesc(vd);
> > > -		bytes = cvd->residue;
> > > -	}
> > > -
> > > -	dma_set_residue(txstate, bytes);
> > 
> > any reason why you want to remove setting residue?
> Because Mediatek CQDMA HW can't support residue.

And previously it did?
-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
