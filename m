Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63BAC3ABDA
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 May 2025 19:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZkh8g9me+Nykm0HQx0KLgmoG9EtGGARK97CTcvbJUE=; b=EorCDHsjtbar5sZUGcqtR2HkY6
	I/gEewPkf/BB6slR9o9DhkvnxdN7WbUHB28dkAAgU5wqTLoNX/OlQUsbBTPtoC6pBj3wCGtpOeVol
	9qwgC8ehvoNaiRTW9W3ssLngXSiMBlS0QPWW2pio8qOTh/e7TB6REB7ILeysopnXRZGh8Mwx1LpPu
	6FoZKkfmUzU+Y3rsRuPnF4clwla8kWkY3hPxwzPxydLhXsmiNdEv3vGJxT3L3fs5DPQhd0uQcPS2j
	auOqqn5gbyDIh3qKMVFRjWmzQXVMjv/ZicNJyK8Ax6Q5YwohY4CJq5XirD9nw0oHL6JgXAdNNTFz2
	UJoLLwjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFICv-0000000GE03-00uA;
	Wed, 14 May 2025 19:56:01 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFI6N-0000000GDC4-0DgY
	for linux-mediatek@lists.infradead.org;
	Wed, 14 May 2025 19:49:16 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-72b7a53ceb6so181352a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 May 2025 12:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747252153; x=1747856953; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZkh8g9me+Nykm0HQx0KLgmoG9EtGGARK97CTcvbJUE=;
        b=Sx65x7E+b7d4xiwQvF+t/Pwbod/5R5EsR8Wxd7WDGK2g2pMVlGhn7sAlXzQH3e0v0t
         O0WLhsYEzFIk6CNQwknNGm4waAUcS3t5psMUUF34v5i3jzaRXGUXMl1QHlChSuUWO+CS
         yBcfKxgSgmpKhXsr2S2Q/Ycg81WPKf4EEHeBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747252153; x=1747856953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZkh8g9me+Nykm0HQx0KLgmoG9EtGGARK97CTcvbJUE=;
        b=CfpsIb2M/dDrAJ+PM/Ij7Y7rE9LBv/+dnts7OYopARCgYQvTT6DZyz6N4L+u9Kufv+
         WPhMArbQyHVhwVTqj2sRMBngYoJZLBwBtKzvSaG2fIIbjcZeepoigJr2s04by9dM7ZPI
         xbsTjpuumsFQj8kE63iYkX5q2bUkH/rVfBxOZ6OrOUAIsA9vpRZMF8ToWNwsEdjAqi+v
         X9LILY/P3e4dKTwvAaobcSg7JVG5lJLAshwYZdk9cpWwKmZS7x2zhQSrrbiNQ7bNvprU
         /D2DXuvF+3CLM0e9c2wRFlcQB8kTSjQ7pjDdPyXtpujPhuO4t3a2Nve0iz5iLc+XrgLC
         BqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhWtmftYowgxdUl/v0+v6dHwjnIuaQ2ZYOkhDm+jBKsrRW66ynKMV+j93szd1GrhlAOVQGCv4dMijwn7KtcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxF+Sy5vvXq7wwgpigqSjTXK7t0BseGUq77d3FV2+/2cb0kKUIw
	CBr+0flSz2xvkSI9ru/AgqoiOUR9Lc1ATGpN7+d0mB9eTZPtyfUcHkuGjB4XDWFUpYCfOpNkQSq
	BVggUM9R436ZWjpFjz3PF3pPWPxfQgJSKOR70
X-Gm-Gg: ASbGnctfUoNFXh6Dq6IkN0TbxaLMeS67+59mKlJEDpiZBwin+x+J8JI3OMyWM5Y+0oX
	6majmVpHTUJ6p3iYobNIIS7Tn9RN+2Adqh0w9HTWb9G9K7BlX0rd4uTdJ2R7P1aMTWc+iRHg/LK
	ObeQFJSaS5VricGiVDeE58MaEXSDvhR9ohEwUSEKBSz0T22+Owrf/grYc8Z2Vuxg==
X-Google-Smtp-Source: AGHT+IFCJSg8hIfl+Y+fxKZiYgrSWqqDLysVmocjXAAcg6uBcAFRx9APEaATMEgkLVcMFoVK/5iaOwFvZXjnUM20XV4=
X-Received: by 2002:a05:6830:3814:b0:72b:8593:d3eb with SMTP id
 46e09a7af769-734ec6bf6bcmr531328a34.2.1747252153472; Wed, 14 May 2025
 12:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240410000730.628043-1-treapking@chromium.org>
 <9c5aa4fb-a83c-470e-acf8-dd31303e50c2@collabora.com> <77c4437f2643475de495733d7840421198b78f49.camel@mediatek.com>
In-Reply-To: <77c4437f2643475de495733d7840421198b78f49.camel@mediatek.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 14 May 2025 15:49:02 -0400
X-Gm-Features: AX0GCFtecwOi8CEP2jK1ekxhH3Moa-nChPFzhyIRNlzu-0bbcdPxgTRcYXfWwSA
Message-ID: <CAEXTbpdNxFd7-RMXyvYraqC5cj_BgycAO6JWdNUo50DVn+yntw@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Remove redundant
 code in lvts_ctrl_configure
To: =?UTF-8?B?Q2hhbmctWWkgTGluICjmnpfplbflhIQp?= <ds_chang-yi.lin@mediatek.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "nico@fluxnic.net" <nico@fluxnic.net>, 
	"rafael@kernel.org" <rafael@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"rui.zhang@intel.com" <rui.zhang@intel.com>, "lukasz.luba@arm.com" <lukasz.luba@arm.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "duminjie@vivo.com" <duminjie@vivo.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"bchihi@baylibre.com" <bchihi@baylibre.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	Nicolas Prado <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_124915_087395_BD93678B 
X-CRM114-Status: GOOD (  34.23  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chang-Yi,

On Wed, Apr 30, 2025 at 4:26=E2=80=AFAM Chang-Yi Lin (=E6=9E=97=E9=95=B7=E5=
=84=84)
<ds_chang-yi.lin@mediatek.com> wrote:
>
> On Wed, 2024-04-10 at 11:55 +0200, AngeloGioacchino Del Regno wrote:
> > Il 10/04/24 02:07, Pin-yen Lin ha scritto:
> > > The removed variable assignment is never written to the register,
> > > so it
> > > has no effect on the device behavior.  Mediatek has confirmed that
> > > it
> > > is not required to initialize this register for current platforms,
> > > so
> > > remove this segment to avoid confusion.
> > >
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > >
> >
> > Added Nicolas Pitre to the loop;
> >
> > Nicolas, since you're pushing support for those, can you please check
> > if CALSCALE
> > is used/useful/necessary on MT8186/88 before I give a R-b to this
> > commit?
> >
> > P.S.: Can anyone from MediaTek please confirm if the 0x300 value is
> > right for this
> >        register? I'd still like Linux to properly initialize the
> > registers, even if
> >        this could technically be a default value.
> >
> >
> > > ---
> > >
> > >   drivers/thermal/mediatek/lvts_thermal.c | 6 ------
> > >   1 file changed, 6 deletions(-)
> > >
> > > diff --git a/drivers/thermal/mediatek/lvts_thermal.c
> > > b/drivers/thermal/mediatek/lvts_thermal.c
> > > index fd4bd650c77a..48d2f8ba3f18 100644
> > > --- a/drivers/thermal/mediatek/lvts_thermal.c
> > > +++ b/drivers/thermal/mediatek/lvts_thermal.c
> > > @@ -985,12 +985,6 @@ static int lvts_ctrl_configure(struct device
> > > *dev, struct lvts_ctrl *lvts_ctrl)
> > >   value =3D LVTS_TSSEL_CONF;
> > >   writel(value, LVTS_TSSEL(lvts_ctrl->base));
> > >
> > > -/*
> > > - * LVTS_CALSCALE : ADC voltage round
> > > - */
> > > -value =3D 0x300;
> > > -value =3D LVTS_CALSCALE_CONF;
> >
> > As a side note, I believe that the original author wanted to write,
> > instead...
> >
> > value =3D LVTS_CALSCALE_CONF;
> > writel(value, LVTS_CALSCALE(lvts_ctrl->base);
> >
> > Cheers,
> > Angelo
> >
> > > -
> > >   /*
> > >    * LVTS_MSRCTL0 : Sensor filtering strategy
> > >    *
> >
> >
> Base on xiaojun.zheng
>      The register is for PTP function, and in MT8192 it's not required
> to do such setting any more

This driver is now also used by mt7988, mt8188, and mt8195. Could you
confirm if the PTP function are not required for all these SoCs, so we
are safe to remove this?

As a side note, Mediatek explained PTP in an offline discussion with us:
PTPOD stands for PTP (Performance Thermal Power) OD (Overdrive).
PTPOD is a technique to let the HW runs at the same frequency but with
lower operating voltage to save power.

Regards,
Pin-yen
>
>
> ************* MEDIATEK Confidentiality Notice
>  ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
>
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

