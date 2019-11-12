Return-Path: <SRS0=+xT1=ZE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C90FC17441
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 18:18:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E94C521A49
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 18:18:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p52m65YY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E94C521A49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYZ9oEtmKqLzbvBYWL12bAjKslN2uTGul+gFzDi4iVE=; b=p52m65YYIlEN8l
	mGXihAelveb16LMilza91nIalOlc52huVeBuz556DcS3GlDCzrcJdJXw5xONpvD4JMVOZkhqdShrX
	Sk5Ir6EMz9YmkjcwIPERoToe8h+T77g1VvlKB0WyBKA09RS71BaQX/6JKW4dU4n6wtFwJ/oqJMKIy
	/JnTdjidQQ2wOkbNFFwuNnSPTUtGqX9redtA+yRGTAyf+/qoO2m3TWXnRBzqeTbIplC/t1xubb7Lz
	U/S/yzGoGkUPCMKj21oSYf2P0lMLVFIIkJhpwKivZesTD8BE1V84RXtlnCijGHkH6gftIsF8+y/BO
	c6OGXQy8S9t/sh0kz+4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUajn-0001Cy-38; Tue, 12 Nov 2019 18:17:59 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUajf-00016P-L4; Tue, 12 Nov 2019 18:17:53 +0000
Received: by mail-oi1-f194.google.com with SMTP id s71so15682637oih.11;
 Tue, 12 Nov 2019 10:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=apbcn+4sF2345Jm7spGk7DwHgRpb64aZnTUJ4t12uLg=;
 b=IztddMtP/XjttEc4vNIaohOMc0/zcU5u9Z2FweW6NII3Grp2RD4HDdnofjQyZpzgnP
 RfrGt1RX8zRAEKrL4AenpTXUngSSRAR9srmUMkobw2frTW0WnKBOUSxDUAEAf4L7446A
 OmfvxKkNzjwkhg3vnV3MlYuRCN5m+Nd+lzUp13tXtgZ5ntIxp9z2FlaBck9h5jR/3mOC
 ugsjwpQXkMRmg7tDcrMY2jouAhlIgfLegm/8FHm2GEOtSsrTv+u3v0PFkWkYL9fIwJO6
 OSC4jNGURPqUn/GwdV6XMiKChpd7CcwOBYZ1dHMqVdkPoFkFZDqV45r1WVEcnC5fWI4s
 7BOg==
X-Gm-Message-State: APjAAAXIlFbgId51CvYvHyJeiW2WbqKQe8Q6fLfBwrz1hyUq4tTtAOjF
 U86+VSr/jFoYsrZLUd6Ay9G13zdhMQkrMClnBGBqmoQm
X-Google-Smtp-Source: APXvYqyVJRey7Eo3u6IB7XCIegs7fVJAoP+7XL/QcuCsEX4q0nKSDAcDk7fBaRLT6qKtY/fuhfTCipYmaHShCQVE3xE=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr258343oia.148.1573582670146; 
 Tue, 12 Nov 2019 10:17:50 -0800 (PST)
MIME-Version: 1.0
References: <20191112141748.GA22061@localhost.localdomain>
In-Reply-To: <20191112141748.GA22061@localhost.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Nov 2019 19:17:39 +0100
Message-ID: <CAMuHMdWUWPdRvVJ_pdDqUdZpahYCyjDDS0KWGw9JzjUjaunHQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: rza1: remove unnecerssary static inline
 function
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_101751_693308_7AC2D18D 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 12, 2019 at 3:18 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

s/unnecerssary/unnecessary/

> Having static inline oneliner does not benefit too much when it is
> only called from another oneliner function. Remove some of the
> 'onion'. This simplifies also the coming usage of the gpiolib
> defines. We can do conversion from chip bits to gpiolib direction
> defines as last step in the get_direction callback. Drivers can
> use chip specific values in driver internal functions and do
> conversion only once.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As this is a dependency for 2/2, which will go in through the GPIO tree:

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
