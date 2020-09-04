Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8653BC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 07:34:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BB70206D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 07:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VaXkrJVa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LFBdQODW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BB70206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OmdE0+vjauensqaaZFPAK+IWtNXe+2PufPr063yNAig=; b=VaXkrJVau2013imkI/1jg7Xd7
	PcZpfsb1vQgD8yDS/k0XCagU2giq1UBK3fOAXZ+F9/0c17wZ+dsRUYHJGC3T6viX/qIRPCQXn6DZ/
	O+sPkWYdrvVEQ0bMfzdo07NUV5vGFF6UwZH5H3xmgPru6uFtMyjcD/u6XoGArRdSSInHtAvWjrCPl
	YBEGtWSzbpkElI7eGnlsjWDU7A33LeFlpSF0rPWplvXzvViUJ1FqL+otkT81Upoluv0ghyIGPGYrN
	9UAu2n+u43pt4WmWQmMazhf1Y2Yj4CSvhaXe2KQnD9GnI3re5J+pk1xZbpIpUKWYh6/Deet5IoKhs
	XucDJUhmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE6Eo-00020E-Bl; Fri, 04 Sep 2020 07:34:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE6Ei-0001xe-Sb; Fri, 04 Sep 2020 07:34:19 +0000
X-UUID: 09f0c44379aa4a0495630e952c7b48b2-20200903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qpQfU16O8C6LhsM/nHrr7bte2XTuSnob/XP3/krDZwg=; 
 b=LFBdQODWlAP4WUYvMo2Tpc0YorgB3w0r58vyorJ7wT4DC0SZaEJUEhRQmIgwvbUr/xidIMfBTHnUpp+tFhjN1Czz5w7jnX92JANxgbmpPIarmD7bqWlMdWSKbgWiKlGVv1OQ5GkDH0z4qCWFyljEHssakIfimfSWQdlnIHG5unI=;
X-UUID: 09f0c44379aa4a0495630e952c7b48b2-20200903
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2143218812; Thu, 03 Sep 2020 23:32:05 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 00:22:03 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Sep 2020 15:22:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Sep 2020 15:21:59 +0800
Message-ID: <1599204018.11403.34.camel@mhfsdcap03>
Subject: Re: [RFC PATCH 3/4] usb: xhci-mtk: add support runtime pm
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Fri, 4 Sep 2020 15:20:18 +0800
In-Reply-To: <1599203472.23494.3.camel@mtksdaap41>
References: <1599104065-8009-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599104065-8009-3-git-send-email-chunfeng.yun@mediatek.com>
 <1599203472.23494.3.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 049290813177FBCC7EF5C33060E3EF56D8F1174D51B04365B5F5824B1702E5142000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_033417_134091_6D6E4229 
X-CRM114-Status: GOOD (  18.65  )
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
Cc: linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
 Zhanyong Wang <zhanyong.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK,
On Fri, 2020-09-04 at 15:11 +0800, CK Hu wrote:
> Hi, Chunfeng:
> 
> On Thu, 2020-09-03 at 11:34 +0800, Chunfeng Yun wrote:
> > From: CK Hu <ck.hu@mediatek.com>
> > 
> > add support runtime pm feature
> > 
> > Signed-off-by: Zhanyong Wang <zhanyong.wang@mediatek.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/host/xhci-mtk.c | 446 +++++++++++++++++++++++++++++++++++++++++++-
> >  drivers/usb/host/xhci-mtk.h |  14 ++
> >  2 files changed, 455 insertions(+), 5 deletions(-)
> >  mode change 100644 => 100755 drivers/usb/host/xhci-mtk.h
> > 
> 
> [snip]
> 
> > @@ -562,6 +794,31 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		goto dealloc_usb2_hcd;
> >  
> > +	INIT_DELAYED_WORK(&mtk->seal, xhci_mtk_seal_work);
> > +	snprintf(mtk->seal_descr, sizeof(mtk->seal_descr), "seal%s:usb%d",
> > +		 hcd->driver->description, hcd->self.busnum);
> > +	ret = devm_request_irq(mtk->seal_irq, &xhci_mtk_seal_irq,
> > +			  IRQF_TRIGGER_FALLING,	mtk->seal_descr, mtk);
> 
> In interrupt.h [1], devm_request_irq() need 6 parameters:
> 
> static inline int __must_check
> devm_request_irq(struct device *dev, unsigned int irq, irq_handler_t
> handler,
> 		 unsigned long irqflags, const char *devname, void *dev_id)
> {
> 	return devm_request_threaded_irq(dev, irq, handler, NULL, irqflags,
> 					 devname, dev_id);
> }
> 
Will fix it, thanks
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/interrupt.h?h=v5.9-rc1
> 
> Regards,
> CK
> 
> > +	if (ret != 0) {
> > +		dev_err(dev, "seal request interrupt %d failed\n",
> > +			mtk->seal_irq);
> > +		goto dealloc_usb2_hcd;
> > +	}
> > +	xhci_mtk_seal_wakeup_enable(mtk, false);
> > +
> > +	device_enable_async_suspend(dev);
> > +	xhci_mtk_runtime_ready = 1;
> > +
> > +	ret = add_power_attributes(dev);
> > +	if (ret)
> > +		goto dealloc_usb2_hcd;
> > +
> > +	pm_runtime_mark_last_busy(dev);
> > +	pm_runtime_put_autosuspend(dev);
> > +
> > +	dev_dbg(dev, "%s: xhci_mtk_runtime_ready %i",
> > +		 __func__, xhci_mtk_runtime_ready);
> > +
> >  	return 0;
> >  
> >  dealloc_usb2_hcd:
> > @@ -584,7 +841,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> >  	xhci_mtk_ldos_disable(mtk);
> >  
> >  disable_pm:
> > -	pm_runtime_put_sync(dev);
> > +	pm_runtime_put_sync_autosuspend(dev);
> >  	pm_runtime_disable(dev);
> >  	return ret;
> >  }
> 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
