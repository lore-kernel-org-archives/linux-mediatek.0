Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A8FC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:19:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73B9522D2C
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rBDNh5pI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SmiOYQX5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73B9522D2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=amAYROYwEAcqSky7xxLVMmtR/GbddjgudqqCF4sP034=; b=rBDNh5pIwdyVrscBSnxGphTeZ
	XIkz5VcbdEzKVKeUIVeSpGTK0Aw1KMdoq7fQez9RKv4cExfHs9una4KrWG/CmvfsYPA0YEDbwHiUx
	K7NETcCBde1Em4RGOVGX54rXWR5T9A+0xVLHvgiUl/fLROs0vv3Wu0MtR+I5vWvuC4zyyLgis/AVM
	KLA9JNEmW8kEAcSpI3Cd3O/tOi65TF7fR8MPP3u7Z7qkDpKFlsK6LCW15CzEN3GtD15lwtlgerJdW
	eLA+WehGm8OeSOP8UZU8DmIjpjlhul1mVRgvAfhV7FhKM+B45BB13UmoXyUUl60TpyQdmqpA2BIe7
	ACIgMiNrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3ZVI-0006MG-MP; Thu, 06 Aug 2020 06:35:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3ZVD-0006Kv-MQ; Thu, 06 Aug 2020 06:35:48 +0000
X-UUID: 88e7bb3985464b54b064a90b1f1a5095-20200805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=0AEHGNsfy4Kowym5Y/9MX+FAdIMhxa+q99bMpmtdLlk=; 
 b=SmiOYQX5nyus4h0miAuTv0wdQMYEQaHIIwRMlc3P5i506JhUbx5z30hsDOB89C96iB3eHHb5Qc770W0lXJTvqw4ggj9gtm6OdEaIFxOd1+8gHq0siEBivLLJ6SvSaNQ0ZoZ8Msp7vo3D7iBGOgHaitPGIcCOmK8Y1UWdERXj+/w=;
X-UUID: 88e7bb3985464b54b064a90b1f1a5095-20200805
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 623863724; Wed, 05 Aug 2020 22:35:23 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Aug 2020 23:27:21 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 14:27:18 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Aug 2020 14:27:18 +0800
Message-ID: <1596695238.26800.4.camel@mtkswgap22>
Subject: Re: [PATCH v6 2/4] dmaengine: mediatek-cqdma: remove redundant
 queue structure
From: EastL <EastL.Lee@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
Date: Thu, 6 Aug 2020 14:27:18 +0800
In-Reply-To: <20200727094458.GU12965@vkoul-mobl>
References: <1593673564-4425-1-git-send-email-EastL.Lee@mediatek.com>
 <1593673564-4425-3-git-send-email-EastL.Lee@mediatek.com>
 <20200715061957.GA34333@vkoul-mobl> <1595471650.22392.12.camel@mtkswgap22>
 <20200727094458.GU12965@vkoul-mobl>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F4B7DC2C1D8B20EE4F229651815F3A8E35BCF4AAA4E64D95EAC95B78FBFF707C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_023547_943583_43AD2041 
X-CRM114-Status: GOOD (  11.66  )
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

On Mon, 2020-07-27 at 15:14 +0530, Vinod Koul wrote:
> On 23-07-20, 10:34, EastL wrote:
> > On Wed, 2020-07-15 at 11:49 +0530, Vinod Koul wrote:
> > > On 02-07-20, 15:06, EastL Lee wrote:
> > > 
> > > >  static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
> > > >  					   dma_cookie_t cookie,
> > > >  					   struct dma_tx_state *txstate)
> > > >  {
> > > > -	struct mtk_cqdma_vchan *cvc = to_cqdma_vchan(c);
> > > > -	struct mtk_cqdma_vdesc *cvd;
> > > > -	struct virt_dma_desc *vd;
> > > > -	enum dma_status ret;
> > > > -	unsigned long flags;
> > > > -	size_t bytes = 0;
> > > > -
> > > > -	ret = dma_cookie_status(c, cookie, txstate);
> > > > -	if (ret == DMA_COMPLETE || !txstate)
> > > > -		return ret;
> > > > -
> > > > -	spin_lock_irqsave(&cvc->vc.lock, flags);
> > > > -	vd = mtk_cqdma_find_active_desc(c, cookie);
> > > > -	spin_unlock_irqrestore(&cvc->vc.lock, flags);
> > > > -
> > > > -	if (vd) {
> > > > -		cvd = to_cqdma_vdesc(vd);
> > > > -		bytes = cvd->residue;
> > > > -	}
> > > > -
> > > > -	dma_set_residue(txstate, bytes);
> > > 
> > > any reason why you want to remove setting residue?
> > Because Mediatek CQDMA HW can't support residue.
> 
> And previously it did?
No, It was calculated by sw before.
We found that the residue was not necessary, so we removed it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
