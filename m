Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7C7C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 11:33:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D21C206F2
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 11:33:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VNOOKwXz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKKZRAuR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D21C206F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fzFwvQx1aYJ8/wy2uDLWoNEbxikqS0coKEdEdxxi9gU=; b=VNOOKwXzBuT+10Zbua9dl6R2x
	xW1S3oZJveckz9mAvb7rmeJ4i5o/ZlbCICavErnnKyC083Qt4gxIT3D/svxgQ8qwVMBI0DbK1MaQm
	T4qIXQCsTGv0Hqb4KZidG6Pb6f8Wa8npPeOw7Qr7n4tzioD/SviqhzfWcjVA2Z9SWZLFEcVrKMggc
	3C3GnQQrZShbfhc0fkdcOB733gKJ0c6w4lvnw4HqCTjb4f5H1rLaTppmGafabiTYJ1UbbbnRk5M0n
	r3J4CYgR1mLiJHApmjLO5XP2Rgp32cYMYT2j8pmtSyegSLkDZDHxMgZs2nQ4yTOlF93FzEP8BAv86
	qMtiWwp5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxqWs-0002yl-7g; Tue, 21 Jul 2020 11:33:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxqWo-0002x5-JQ; Tue, 21 Jul 2020 11:33:47 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F832206F2;
 Tue, 21 Jul 2020 11:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595331225;
 bh=Mg6L1cR7Ir4UqEXXKL4h/HOxKKegC7bgckzLjWHf03E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MKKZRAuRSOYspVvmRoUmEGX/onlIPbHSCRzt75offJy0YinwoNaV1OYgOYFWjwBdH
 WCzW83kOadlAR/4pgOZyfQDcdzsKQi1Q4TrHiDlucy1DEHBZ5iWAxSfbVsMcWZVryC
 XYgebVnhamm5EbTSZXm+qR10TwLcPdP1Xj5aLlAo=
Date: Tue, 21 Jul 2020 13:33:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v2] usb: gadget: configfs: Fix use-after-free issue with
 udc_name
Message-ID: <20200721113353.GA1686460@kroah.com>
References: <1594881666-8843-1-git-send-email-macpaul.lin@mediatek.com>
 <1595040303-23046-1-git-send-email-macpaul.lin@mediatek.com>
 <1595041133.23887.4.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595041133.23887.4.camel@mtkswgap22>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_073346_755875_994B301C 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Macpaul Lin <macpaul.lin@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jul 18, 2020 at 10:58:53AM +0800, Macpaul Lin wrote:
> On Sat, 2020-07-18 at 10:45 +0800, Macpaul Lin wrote:
> > From: Eddie Hung <eddie.hung@mediatek.com>
> > 
> 
> Well, it's strange, I simply replaced the uploader's name to my
> colleague, git send-email pop up this line automatically.
> 
> Shouldn't I do that kind of change. It did not happened before.
> Do I need to change it back and update patch v3?

Who is the real author of this, Eddie or you?  If Eddie, this is
correct, if you, it is not.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
