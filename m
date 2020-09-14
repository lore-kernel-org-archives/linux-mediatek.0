Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9791BC43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 06:12:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CACD206F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 06:12:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U+iFMaTg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfMRweeL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CACD206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZITsiFQEH8D3sNHWjJn9QUEnviBImX/2TlbYiXXGXEQ=; b=U+iFMaTggXik4v8CTGWyNB+NT
	QZHsJiO08x/G7BC0+3IRHCM+eQYuyRslb9UlM2cUS2tG9QHT5l3sWwYsPf08LijwiIRQO/nAVVPov
	Io/B1dcZloykrSwlqc1hu3aS3uooGVcZnLC5Ei6I013oh5eyY7nJcEnwJBw3Zho7ZkYKu1+M/GGWc
	/HeelsxiNgFca+8BjPXfuhn3Uv0bv0+BbL0bLIjE5qIQ4la/TgjriGwrbTEAG7gTjGEjtab9k0y/z
	e336Am9S+B+xfeLcunnY4qtudqHlg4uRRfzuu8gNZGKkihAGcAGpaiv1YHbwjzRUcoaFNJye8gJI2
	WFIOMBbjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHhiu-0002Qi-NG; Mon, 14 Sep 2020 06:12:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHhiq-0002Q1-8X; Mon, 14 Sep 2020 06:12:17 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7C1E206F4;
 Mon, 14 Sep 2020 06:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600063934;
 bh=ZKOHf2zMJ25tsrVOijUOnI9bZN2JzvoOq1izeZqL5m8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EfMRweeL90HLKvDBprKOhF4+ELQkJXvlVWgLXVwzXa+x0lIL9WzLmpVuaKOTsey18
 Z8uzeR2+7Bx9clnefccjp3Chx4t0Q3Nv/MwA9cLBOgnIXsOr5VAZHUmbhdvc6Gtpd5
 lci0reQSkZFMeurt55H/3uqKpuqkj4asGPD0itlk=
Date: Mon, 14 Sep 2020 08:12:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] usb: gadget: bcm63xx_udc: fix up the error of undeclared
 usb_debug_root
Message-ID: <20200914061210.GA788192@kroah.com>
References: <1600061930-778-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600061930-778-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_021216_503231_E1D6362C 
X-CRM114-Status: GOOD (  10.41  )
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

On Mon, Sep 14, 2020 at 01:38:50PM +0800, Chunfeng Yun wrote:
> Fix up the build error caused by undeclared usb_debug_root
> 
> Cc: stable <stable@vger.kernel.org>
> Fixes: a66ada4f241c("usb: gadget: bcm63xx_udc: create debugfs directory under usb root")

Nit, you need a ' ' before the '(' character...

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
