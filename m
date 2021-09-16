Return-Path: <SRS0=M/W3=OG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A932C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 10:08:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DBD061185
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 10:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DBD061185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESIfAMdPof4lB3EmtqPmQJQogUI6hgPQL5Qog6iwJoY=; b=ApistodKLaWQJ3
	XJSsqhBDQ3nJtB+LNJ/GLQirVFQHLn/VrpSaX+L2c7KXfqIU4LNR/ECkQRRCQH3TdSKV+jP4Mebk6
	XQFCVFSDpqp5h/e+PDWRxUny5etiAA9O0ya59ABL7+aHgOFmBEn1GBC0J+DKS4jl4H5qQq/2Eimll
	iC2FSzQTe8auSNn516/mDRMwCeoaGXaJlTqv0Ef8z/8/JH4XThKj0Eh3GC8hzlApyPs1zTBBL8ADc
	lX7IW96hA1To1FVZIAinKoY3TfrV4jUroOuJ8DKyFVBVrobQR31dYUQLOMDkNI6pY0C2o1J+Mxt8O
	k4423cbrKueDiX1olpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQoJ8-00Aodx-JK; Thu, 16 Sep 2021 10:07:54 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQoJ5-00AocZ-Lm
 for linux-mediatek@lists.infradead.org; Thu, 16 Sep 2021 10:07:53 +0000
Received: by mail-lf1-x131.google.com with SMTP id c8so16418864lfi.3
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Sep 2021 03:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jUO5tSYLVRile5AWlAafA8DmhpHLLp7fGg/YtJNAKkA=;
 b=kb18yEmDjFeTISL5Cj3f+OE1reEAL0nH5XmyNUxp+vvOyzUcj+l9m5OworF15vyOXF
 b8YVBrLmGwq/u0XPPb8fk3JaoNhQe+7Ho6ZKojUxfMsvVZB1S+AXaj2bjkGQpTH2BDMF
 RFKGzdZkL5STdbXuztAsLUi82lROJaEFce1QQBJQFnJ6BNDzh73ydU6twoHnOf/LFIT6
 m36gdukOrXppQsBrmuso+yADYfJZDVaWVxIsFzYI2GyA9+KlNEDbRQnmoxutZH37cusb
 kMvPFWujPGOtbzPt0qbQ8UKq9xhYrz+jKKgOqdrQtVAmzqRwqbisq3ed603uxeTFFJJ1
 7TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jUO5tSYLVRile5AWlAafA8DmhpHLLp7fGg/YtJNAKkA=;
 b=tixVTpPLhtwmqGCNuT1MoNPMNqToWOyG8lhx1RlbO0+Zua9e9ByWgQaQmS+XP2T3ca
 cmU1oQK03yz3BmyuyNnv1waMFhGvRw/4ISsi5GVyaOYeDPbNxeV4EX2BJyrlf63BQ9Xr
 iv/4fRe9L82wCMgnBlULxDsBP12YiA1C+y7sPcmKzIeCQ6Pmq6ojPzQ6h03sp00WAPI7
 fhWI6tOvzOLKToRyFbCIcY3cFQLoV3tk2D3Y6swW73gZIpOQLT+BIF0ZIjUuqOQGXHMM
 HltGs/vz87OKOrUbWAocJz8bXZtjFexnplrUfLWc6w6L5Zy83vAdoPWHx2agH/r+C76p
 l4dQ==
X-Gm-Message-State: AOAM5302xTCaGFl72Paa9B7/9mu1P6mJUbtYxu8Tn0Ulu8QH9kYPYkXN
 +6Y23L5PTJQ6MelW9QsCepE3dZErZ76SyT2KhYbs3A==
X-Google-Smtp-Source: ABdhPJytweAIsY0sxsinkWN7FPbeTdhVCteGXtpk0WGBS/7V1nIDt7Ry+vbrBBnhe783d+4wyWb3AQdWBV5/FDYn/9Q=
X-Received: by 2002:a05:6512:3096:: with SMTP id
 z22mr3486963lfd.584.1631786869054; 
 Thu, 16 Sep 2021 03:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210914085137.31761-1-sam.shih@mediatek.com>
 <20210914085137.31761-5-sam.shih@mediatek.com>
In-Reply-To: <20210914085137.31761-5-sam.shih@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Sep 2021 12:07:38 +0200
Message-ID: <CACRpkdYkvBS5+MHSGBDhNQtvCxRquef1kPHmCSfzruz2N=VCyw@mail.gmail.com>
Subject: Re: [RESEND,v3,4/9] pinctrl: mediatek: moore: check if pin_desc is
 valid before use
To: Sam Shih <sam.shih@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Matt Mackall <mpm@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, 
 Seiya Wang <seiya.wang@mediatek.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, 
 John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_030751_781470_8C2154EC 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

On Tue, Sep 14, 2021 at 10:52 AM Sam Shih <sam.shih@mediatek.com> wrote:

> Certain SoC are missing the middle part gpios in consecutive pins,
> it's better to check if mtk_pin_desc is a valid pin for the extensibility
>
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Acked-by: Sean Wang <sean.wang@mediatek.com>

This patch applied for v5.16 so we get some stuff merged.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
