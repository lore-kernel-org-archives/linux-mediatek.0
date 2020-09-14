Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36847C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 06:19:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACDAC207C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 06:19:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lzy05yaG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ej2v/DB2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACDAC207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uD0BPHRfkoqS5son31qKqDwsv5RriBLeVnEvgMn8/bw=; b=Lzy05yaGFkXMbnrphe0KADX1Y
	SPuGbw4ERv5MRfK8gQyinD2M7ArHNbxo+y4PxdtkpQ1Fpi9Z+zWLshrLjD6jwOIomBRQ28t6x3f0w
	OLDSaAlB37imtFQhTXcXGnnSMHHRTh+oVEgH002F1Wuz0NlJpRkJdH1JlOCv6JFJsZ93fLLkAm6de
	wEvTy/g5Ne/3GSiDsex12EA4EY0FwIikShqu8sDUJ+JpTLh366eEGDf7DjjGvBV6mfv0BlS2HnPYx
	/Q6MpUCHMcnkKdrKdkVIk9VBdh10u28jpiZzbv0OaA4bP8SGIPni4dqpVNxXwIl0aUHUMj5uperfr
	ihL37w9aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHhpG-00034G-Nb; Mon, 14 Sep 2020 06:18:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHhp9-00032d-Ix; Mon, 14 Sep 2020 06:18:50 +0000
X-UUID: da2bd5cda1494871b36cc28efc06fa28-20200913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FgYGajFnr48178YWlLNBCrvjxfgu8FSyvJO866EVJIo=; 
 b=ej2v/DB2B/D9UhzwXru0U1Y702h6SfGBRQ7CArp8gQkYi+N91eXG2i60uToa9o4b87b22RCWuR9x9opkcmEkRGe3qHnOjHyIHZIhTjjIHD75p3HczxgP2lCzNNwO2LoopytwYf1FTn8GbPqhAn9RfOj28fTOjKYCkgf2f9IehWw=;
X-UUID: da2bd5cda1494871b36cc28efc06fa28-20200913
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 685117921; Sun, 13 Sep 2020 22:18:42 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Sep 2020 23:18:40 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Sep 2020 14:18:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Sep 2020 14:18:36 +0800
Message-ID: <1600064195.29909.13.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: gadget: bcm63xx_udc: fix up the error of
 undeclared usb_debug_root
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 14 Sep 2020 14:16:35 +0800
In-Reply-To: <20200914061210.GA788192@kroah.com>
References: <1600061930-778-1-git-send-email-chunfeng.yun@mediatek.com>
 <20200914061210.GA788192@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4EF90E5793C0723BBF8B3E7E35116F0E7C228F9523B03CB81A31635FD5023F032000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_021847_830473_EC56BD07 
X-CRM114-Status: GOOD (  10.16  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, linux-kernel@vger.kernel.org,
 stable <stable@vger.kernel.org>, linux-usb@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-14 at 08:12 +0200, Greg Kroah-Hartman wrote:
> On Mon, Sep 14, 2020 at 01:38:50PM +0800, Chunfeng Yun wrote:
> > Fix up the build error caused by undeclared usb_debug_root
> > 
> > Cc: stable <stable@vger.kernel.org>
> > Fixes: a66ada4f241c("usb: gadget: bcm63xx_udc: create debugfs directory under usb root")
> 
> Nit, you need a ' ' before the '(' character...
Ok, thanks
> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
