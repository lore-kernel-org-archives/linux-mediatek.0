Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4FAC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 20:10:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5250B60F41
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 20:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5250B60F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCEITnM4aaSmW5KZjZFITRhNgNseIX3lQzF7gOFP9bI=; b=S0BOneimpSUXQg
	AsecH+i7esMD4ZWLaQqWKlI+g/xahjgk1Jf8ggTK/3R+sW+HhnBURhrTFrGfMX6ieTSIwKI+inGoh
	smleQ6N7YMMnuJAvTrcT6hJpMzxBc1jp/FRKY8ws1n2VVjhKYeaUwAgVNkiwMGroEkvm221Az23C7
	yRzDzLYh0bdGjJpgI/LGSbv0PRp3rM+0/OTm+EgMWKWBUik2R4/2OIorqhvEEVn+/Od1zn//pnLPy
	a7k4GFfzQZ5yt3ITZht2S8zcxKddfoWDq5uH2JLSsFQVBX1K5CseJeIVSrN0QLKKMlpkDbukNQ3on
	W3JIBkHuDQnVJ9LDVKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG5PD-003M9S-SS; Tue, 17 Aug 2021 20:09:51 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG5Ow-003M3j-Sy
 for linux-mediatek@lists.infradead.org; Tue, 17 Aug 2021 20:09:38 +0000
Received: by mail-lf1-x133.google.com with SMTP id p38so43839903lfa.0
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Aug 2021 13:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k8AfVuCGxDrAVAQEMwEyKZr/585805GvK2MzsN/gS3A=;
 b=CZPAZB5/x6SSKO3/e4ljoCjcPsrNGDpLblZMD69HhLBEw4EpEnaMCLjsSRVWWn5c8R
 6qK/hjUcTlz7tWO+lSjquayDXvuIN/47A6alfgci5XZp4ZVck4LIDSG8X7Q4SDpoCz7q
 LZldLdE0hvD9Rs6Nr3Up4gkhyI3fIuSToGWAn4IZ92cR4YbsAltHiAVd+9v9BeE0nzik
 ZPzZ6EjD8WwP1T0XpfKHkv1ra0lT7gDQWjVvNmU6cMwDo70qRzQnBhZIsfPpSsi6FIQy
 DycVicbxZ8DEKI/CY5OzuH7cofexceLkH5ljhdve4pmcRWOn6+KyDnNaqxa4SUW4vZA7
 vfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k8AfVuCGxDrAVAQEMwEyKZr/585805GvK2MzsN/gS3A=;
 b=asORiWHgPynqRN1lSCAv/ylZ/SN6/2QFXyUq+kUZhSaHDkhlMZB60+jeM5rYcY8DAQ
 TJa7KJDKOTNUvGJwTvrZP3+VOBtZETcqXSeuuvpWXPOmPN4emxOcpiB2BLo4Rlq8DQ+t
 9Fic+aS6x7/VwuGA1wAD+y2QeD5CFz2OYZSxLgJhnifABfciURl/8OUrY6vr//tk1/NC
 FQIAZRkAe4emBiGQL77MeATB6HsuAhelNHT/1jI+J4yM0FCJ6lXyNHL2sv3mtzx84L0G
 7QF8tFIZmDnO1NWDmuJNz9iNYeSprUsFyxHqEJFhgvybYAPES5NdY5pHaES60zQRQSj+
 0CWw==
X-Gm-Message-State: AOAM532+9ZngbqFIV+oc5NhozYj83qvz+xwLq7GLyXqVzbTRqnfx1OLn
 7kXTLtxAdh3L1Tmh7x+2pnFi8Iv0Gf8Zqn7uCuJfmQ==
X-Google-Smtp-Source: ABdhPJxghIUV5K9nnRKPIlLjW0aY8CAvGBeUp9sBilijN+pjZbbOVx9RaTN3WM8sx4gBVuvt9YsAcirfPdhwGO8Ypzw=
X-Received: by 2002:ac2:58d4:: with SMTP id u20mr3489426lfo.157.1629230973143; 
 Tue, 17 Aug 2021 13:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com>
 <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03>
 <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
 <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
 <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
 <CAGXv+5HohMwU8jow5QXO5MK1tO+u=5YsfhArBWCP4Dgm1Q8igg@mail.gmail.com>
 <4fd12d5c53f6492e5fa3ba94a78b9a149f5b6ed9.camel@mediatek.com>
 <CAGXv+5GCuNK=-z9VAOjkpJdZLUSZFPfUsQ09m1FhfTsbCYLLRw@mail.gmail.com>
 <CACRpkdbZKh8cqqiDRUik6Ooo33e+feGwYsLjcLRvBQnT3x5M3A@mail.gmail.com>
 <a7c8ab68ac3513865698cde27e665bdd554f459e.camel@mediatek.com>
 <CAGXv+5FtL2zaSWx4tUymx6mpCSb5dXG4XNWM9AJL+b6Ok3dxMg@mail.gmail.com>
 <d40f6d5fd26aedb13e7a393202e5794b1893ecf8.camel@mediatek.com>
In-Reply-To: <d40f6d5fd26aedb13e7a393202e5794b1893ecf8.camel@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Aug 2021 22:09:21 +0200
Message-ID: <CACRpkdYkwXr76Kq5WYdz=1KkLTpaByAL1vJFo8V+2mncqs8-3Q@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
 Devicetree List <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_130935_002095_9D4FEC85 
X-CRM114-Status: GOOD (  14.76  )
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

On Tue, Aug 17, 2021 at 9:51 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:

> In one chip, If GPIO is different, the MTXXXX_PULL_UP_RSEL_001 may
> means different actual bias resistance setting.
>
> For example,
>
> KPROW IO
> Paramters       Descriptions                   Min      Typ     Max
>  UNIT
> Rpd     Input pull-down resistance      40      75      190     Kohm
> Rpu     Input pull-up resistance        40      75      190     Kohm
> Rpd     Input pull-down resistance      0.8     1.6     2       Kohm
> Rpu     Input pull-up resistance        0.8     1.6     2       Kohm

This is exactly why we should try to use SI units in the device tree.
I assume that the software can eventually configure which resistance
it gets?

The electronics people will say make sure it is pulled down by around
80 kOhm, they can put that on the device tree and your code can
say, "hm 40 < 80 < 190 this is OK" and let the value pass.

We do not define these exact semantics, it is up to the driver code
to decide what to do with the Ohm value 80000 in this case, but
it makes perfect sent for me to let it pass and fail if someone
for example requests 20 kOhm, or at least print a helpful warning:

dev_warn(dev, "the requested resistance %d is out of range, supported
range %d to %d kOhm\n",
                 val, low, high);

This is what makes the SI units really helpful for people writing device
trees: solve real integration tasks and make it easy to do the right thing.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
