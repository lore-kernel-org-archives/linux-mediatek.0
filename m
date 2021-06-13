Return-Path: <SRS0=gblj=LH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDA3C48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 23:28:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 573EA61159
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 23:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 573EA61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrEj7OFTA6e8fynAG+1HJ7+SpSbrcqhhP/fayzxrMis=; b=zS1BT+lA9aE/13
	mxsfM5elmryT5Xm2Nl2Xc1PbtlpEK6yybubi2Kzyf2gSWKwMdLSbqLtSFnrdnENA8H6UOz4odDEhE
	8wF4LOpyBZEuA7LRLwoIiPigDhGdqdP5cKo1KxV0GUi22Bj1TcsTHdoJInMAzhnrYd8aiO+21G5a3
	TBzn+tqf2wRgvuVc5fJCY0xy/LLVQLPwE3SVVPRbNkHIRXP4faYbooIQts5tDNM3hAk2rQf/xd0MS
	1De98irNi58W0faiUbD+g+HRcz0RhvNT5ncLiu/4sqb+x8xCFYRXGveMfes7tq6vghhqrkn0hVNBJ
	YEagL1GC3jOywXoLuOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsZU6-00BcX2-Q0; Sun, 13 Jun 2021 23:25:42 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsZU1-00BcVR-O6
 for linux-mediatek@lists.infradead.org; Sun, 13 Jun 2021 23:25:41 +0000
Received: by mail-lf1-f42.google.com with SMTP id p17so17935532lfc.6
 for <linux-mediatek@lists.infradead.org>; Sun, 13 Jun 2021 16:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8LX8djcFDE6EP1q+j6q4heiZPR2laaaC2KAlvm+CZBg=;
 b=v1bFFGIm/IK1Xi4cWQgSUjcKoHdhUjhQe9clg9fEl419oO7GqysAUVwoaJSCzreAOl
 TK8XllNUO98Lf701epVkUeEXZMNkWutYxIMjtU58bXrpH/CzObUUxJKL9ERCWAlMIlvv
 gogHqN1sW92dSOMpkj3mxIQq+S9Z8WHA+5idFiDN2a64Vv69NqkPSCj9Oom4UVQhKexC
 CDgtP7plJfM/2r2epPrSBYfiX5v2J7AIPJW8NEztnicV/HvRl7Mkku8pCIw29oZGe5+O
 8mEKc1BQkmQ3P3Qskrl+IishScsxCDLPRdQmObkHh+mQL133mOUsxbAe5qwvViH8Jcqr
 NfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8LX8djcFDE6EP1q+j6q4heiZPR2laaaC2KAlvm+CZBg=;
 b=fxOJaerlTNduUQLeADVhr3/ZUk1xcBOQzeG8/b1eCC/2PwxDkZJ/qRBWmL0p7a3FMk
 +0R0fcS3UMFXZ7wAJDqzY0nW6KmtWN+5DmMbGcvSNgwVCujQyZmUH/zPO6++yuZD70tP
 prgz/fBBgfa6fhERBe34sNEWRbSbtVmGlVHftYkp+I7ENKF2munWt97bKnJjPvRZEkbA
 1Llqg3q1vHDh1yt59hijaqH9ZjlydtmS4LehjcW/qlb8tmx5O8/iuRWZOpdrtpZz+beT
 xpQzUcK/dw7lGNnYCiX2sHqSO2+bpM35Qg8OohuNSRyTIy3z/NPRxp3ncxSPsnYUNgQi
 4SdA==
X-Gm-Message-State: AOAM532hemZ0U9aoJSvCjyfuCYDXIZgWiuZf30/Feolr3uEj9f/7zChl
 qSR+DzmdhibbmD0x/MwJDJ5kFDJDD1FuLfHj5SYq/A==
X-Google-Smtp-Source: ABdhPJxAmJqouBLRHK9vapOoB8AgqyYhqhda225jRWZDJ5nVLAgKab2TUi3hUlyA+oBy0EhiOJ1ZVkrhCEpwcXvpWOg=
X-Received: by 2002:a05:6512:20c9:: with SMTP id
 u9mr9891191lfr.291.1623626675791; 
 Sun, 13 Jun 2021 16:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210613120608.1527394-1-code@reto-schneider.ch>
 <CAHp75Vc5LRRLc-1A5W4BVQ3QQx-+4Y5CUjG3ksosVdPEecEyqA@mail.gmail.com>
 <db862b9d-2003-08f4-6856-26fb4870caff@reto-schneider.ch>
In-Reply-To: <db862b9d-2003-08f4-6856-26fb4870caff@reto-schneider.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Jun 2021 01:24:24 +0200
Message-ID: <CACRpkdbSv0h6hB_yR+_ZC3vxSUOkaa94EzCArSaSC=nvc5AT3g@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: mt7621: Assign base field in gpio_chip
To: Reto Schneider <code@reto-schneider.ch>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Stefan Roese <sr@denx.de>, 
 Reto Schneider <reto.schneider@husqvarnagroup.com>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_162537_796640_726C46FD 
X-CRM114-Status: GOOD (  10.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jun 13, 2021 at 5:51 PM Reto Schneider <code@reto-schneider.ch> wrote:

> I did some digging and indeed, it turned out that I used the
> pre-mainline GPIO driver from OpenWRT even on Kernel 4.19 (for which the
> current driver already got mainlined).

Hm isn't OpenWrt switched to the mainline driver?

Another thing we should do is to add libgpiod to the OpenWrt
base distribution so as to encourage people to use the character
device ABI.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
