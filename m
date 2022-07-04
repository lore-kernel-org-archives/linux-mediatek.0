Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D07CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 04:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnvkTob9JxAXj3cCksRHVu/Zmndab/ZO+alnhXaDHto=; b=WGiKaSBYPo3717WGcjcZhZo069
	kxFVT0L37KZV0VyqbGD6CiTRXL3wFCsctnNGIZJfSzYRbCPTes0gkdhsC5X8BxY2zW9irdohlEGGU
	tGbkcy6uOAVtwzBrmSleEB2tmwoEDuGL7kkY9w9dAUPN7dSV1jZEEB2ZF4ukHiaL2g1Ah4yaE+f1p
	K0dInxNO6683IxcqYeCaCm/y2+UlE09xbHU8KJl0ZgH50OvcHj0zkjINW7scvavAJKFwbJcfjPiiL
	vq6SmSFnVyA20ZrTSifO4AypxFLeCYVXLOrwKWu+W6Esr7sjO15TrKk4FNz7er0IYfU1zCiO0k7Kx
	HWiSkGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8DWP-004Rdf-SW; Mon, 04 Jul 2022 04:17:17 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8DWM-004RW8-S3
	for linux-mediatek@lists.infradead.org; Mon, 04 Jul 2022 04:17:16 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-31c1d580e4bso71026087b3.3
        for <linux-mediatek@lists.infradead.org>; Sun, 03 Jul 2022 21:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SnvkTob9JxAXj3cCksRHVu/Zmndab/ZO+alnhXaDHto=;
        b=UxjwJvhPQz8Hbl6Id472zcA+hG2Tb3K2c4pLpiq7vMkXbEE1Qn6jeYePc6PyZD04wV
         3F6MlJBlXjZycneXtfa/GyXxmpvHX7AlaojmPGKdQw8Ah5Z6PjVkCcdd4YUgwqkyC7XV
         g8hwBSPzgXbF3C3KS2ZA5FTyFoly5mWLB9Um0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SnvkTob9JxAXj3cCksRHVu/Zmndab/ZO+alnhXaDHto=;
        b=F5u9Z+pRbMgq2hLlgjhYQno6JtlMhaWo3RxfAE4w33lp0SN/Y22Z/Rxws0BaboDT9D
         MYoa4GmuTHWAkTVnC1yUD7BXDpzuGLUX0XcGCpoWuT2T422vXjwomkbKv93EXCVcjN6T
         WE7qfKbS3Gw/7xSmeGV0eUzlbMFuS+M9zLTzepTgbkhs79HRS3jky7ZVtAfpi3GgjcPv
         7gXZfdo+QP6QIJJahzWPe0sbr4EAOo/AuA0NQcqnaMKUualV5pr8HoHfGuaWWzPgTaYY
         fCicXTd+oJ0QL1tshn23JoXRNQqyCDbb1EYYBy+UEs9jEC9ZeqoEqhrSJj/3vrDhm/ot
         RQkA==
X-Gm-Message-State: AJIora/npJimnaa1WxFejlkVw10Y3xPlTf8gKgXt30r8oDjYL8mANBYI
	ikyZjM0B+nURsuVWJXsqDuz1q4nycI8wSHcGdrAuvw==
X-Google-Smtp-Source: AGRyM1uEEhhuAbH2ef0MhtMLltmJW5iNsMjxZxvRRjC5JnT25dH17+A40VJtHSgng3Ur8v8DvVEBXTqGXvucducXsc0=
X-Received: by 2002:a0d:ff02:0:b0:318:41fd:6b1f with SMTP id
 p2-20020a0dff02000000b0031841fd6b1fmr29804621ywf.354.1656908232160; Sun, 03
 Jul 2022 21:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-3-angelogioacchino.delregno@collabora.com> <20220701221158.iuw5fehgkjrqw6zh@notapiano>
In-Reply-To: <20220701221158.iuw5fehgkjrqw6zh@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Jul 2022 12:17:00 +0800
Message-ID: <CAGXv+5FwDuUjbP4THBsXorps12in-=JUtB-4VO5ygDBuQn1SeQ@mail.gmail.com>
Subject: Re: [PATCH 02/11] arm64: dts: mediatek: Introduce MT8195 Cherry
 platform's Tomato
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	hsinyi@chromium.org, allen-kh.cheng@mediatek.com, gtk3@inbox.ru, 
	luca@z3ntu.xyz, sam.shih@mediatek.com, sean.wang@mediatek.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_211715_190355_E10BF8E0 
X-CRM114-Status: GOOD (  23.33  )
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

On Sat, Jul 2, 2022 at 6:12 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Thu, Jun 30, 2022 at 05:33:07PM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Introduce the MT8195 Cherry Chromebook platform, including three
> > revisions of Cherry Tomato boards.
> >
> > This basic configuration allows to boot Linux on all board revisions
> > and get a serial console from a ramdisk.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile         |  3 +++
> >  .../dts/mediatek/mt8195-cherry-tomato-r1.dts  | 11 ++++++++
> >  .../dts/mediatek/mt8195-cherry-tomato-r2.dts  | 11 ++++++++
> >  .../dts/mediatek/mt8195-cherry-tomato-r3.dts  | 12 +++++++++
> >  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 26 +++++++++++++++++++
> >  5 files changed, 63 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r=
1.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r=
2.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r=
3.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> [..]
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b=
/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> > new file mode 100644
> > index 000000000000..17e9e4d6f6ab
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> > @@ -0,0 +1,11 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2021 MediaTek Inc.
> > + */
> > +/dts-v1/;
> > +#include "mt8195-cherry.dtsi"
> > +
> > +/ {
> > +     model =3D "MediaTek Tomato (rev1) board";
>
> Given that the compatible is "google," I believe we'll want to rename the=
 model
> to "Google Tomato", much like was commented on the Asurada series [1], bu=
t
> better to have confirmation from someone from Google. Chen-Yu? :)

I asked for clarification internally and it turns out we didn't get the
Asurada series quite right either.

Google only owns the reference design, that is Asurada for MT8192 and
Cherry for MT8195. The vendor own the end product design that is based
off of Google's reference design.

So for Tomato, the vendor is Acer. Note that "Tomato" and the other
codenames seen in ChromeOS are public codenames that Google uses.

The compatible string will likely stay "google,XXX", since this is set
in firmware, and updating it after the product has shipped poses both
a significant hurdle and risk.


Regards
ChenYu

> Otherwise,
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> Thanks,
> N=C3=ADcolas
>
> [1] https://lore.kernel.org/all/CAGXv+5Gv2pjPXynz6HCdgux+giPDC5qRk+KW1aFd=
uVz82rM=3D+g@mail.gmail.com/
>
> > +     compatible =3D "google,tomato-rev1", "google,tomato", "mediatek,m=
t8195";
> > +};
> [..]
> > --
> > 2.35.1
> >

