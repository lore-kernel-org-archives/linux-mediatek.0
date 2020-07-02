Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A03C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 07:36:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90CBE206BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 07:36:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OyBn1vHL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKkyx7Nd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90CBE206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CQs3cV5eTIa4b0/J6XUWgKdz9vFiyOUZI+tCiKJzhGg=; b=OyBn1vHLxbLBLn5k9nORxa0SO
	BoQS0uVoEZbqeqgKQSri8ItXA6CbOxbkbR+4wUcru4AMpRHpdtwH99i7b8L4wBozqHg9sWEDFyq8d
	KEn6QYbhMVBEHA/xXA1Kgcn4qLVc3oBxkE1FmkkaqwdCWdK2AUtHNEb18aelkXRO+nBgeQwoqQzRo
	FW7IjNlr6X3WfnaKmCj6p6HvKDxH/3VtZk+xuynr+BpETVX9j5xr3NFpDGMwu6tOZOnM/aKuVMv0B
	wSxqqlcZjg5QKA5rwUZAzbSuY1LaLrITjv+F9MwVY4dLWFJGaqHrc6Vk5//2kOUO1foSaFirodXrM
	hdTNbpTEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqtlP-000866-DJ; Thu, 02 Jul 2020 07:36:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqtlM-00085e-5m
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 07:36:05 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A16A1206BE;
 Thu,  2 Jul 2020 07:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593675363;
 bh=1n77CNPeJ33Kywgw5iC9Ya49YYvivp0h8s4IwclTbf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PKkyx7NdRs71xsCwaGxelmBAxbGoAQjIq8RmaCZiqgqFPOXr1MqVudESyN7L88Ms9
 rZTGOpoQnLPyrJWY7SGzybyYPYxqJbxm6ptrjgt4ejS+OODyTWMVbGSwkA1GGtRyQW
 3N5vEVBfGOwxoLMW/cqh1q8pB7g9lUfbs3ptCgXk=
Date: Thu, 2 Jul 2020 09:36:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Winkler <danielwinkler@google.com>
Subject: Re: [PATCH v2 1/1] Revert "serial: 8250: Fix max baud limit in
 generic 8250 port"
Message-ID: <20200702073607.GD1073011@kroah.com>
References: <20200701211337.3027448-1-danielwinkler@google.com>
 <20200701141329.v2.1.I2cc415fa5793b3e55acfd521ba8f0a71e79aa5f1@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701141329.v2.1.I2cc415fa5793b3e55acfd521ba8f0a71e79aa5f1@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_033604_320304_34B7CFB8 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
Cc: chromeos-bluetooth-upstreaming
 <chromeos-bluetooth-upstreaming@chromium.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 BlueZ <linux-bluetooth@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, abhishekpandit@chromium.org,
 Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 01, 2020 at 02:13:37PM -0700, Daniel Winkler wrote:
> This reverts commit 7b668c064ec33f3d687c3a413d05e355172e6c92.
> 

I need a reason _why_ to revert this in the changelog text.  Your 0/1
comments would be great to see in here, otherwise I have no idea what is
going on when I look at the kernel changelog in the future.

> Fixes: 7b668c064ec3 ("serial: 8250: Fix max baud limit in generic 8250
> port")

Nit, in the future, this line does not need to be wrapped at all, just
let it go the full length please.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
