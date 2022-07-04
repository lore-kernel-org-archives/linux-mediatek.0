Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF95C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 09:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/txlkwsSXqpHvse6mvjLzWXeKgq/3s2YGv3xUbY5Mw=; b=KlTYPJY0sB1GK0BiQgOJnTGJ08
	r+ZemWrIYchoKG9y9c0N/YdqdtolPQ4kQb4KHZSoqGPRH0VTijuC7A7JVQwIl4fTYFj1r1jF+mD53
	FxhaAJZydZ6BbYNeqsv2P/nsmkFi85yDhd6O4Vu+K5RTZk4utgVpKtqKWTXHvSydPXQsQTDKQNg/C
	ThMfFxbhp4NkR1+qdrDdRPjeDnlhCuDbXY4nQFFkW9Y8jU5cfrLF/iwg+ZftfKOEVEKXJ6mcOLEkI
	tfK573lHBe9j/6HbyfjpJngb7wLe8oNHbzRrctMDIWIp9zlCvXX/phXXvgBb0rSx5mKYjGYA5/KXz
	dwCeDeTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8I1R-006Hdd-7y; Mon, 04 Jul 2022 09:05:37 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8I1N-006HYH-Rg
	for linux-mediatek@lists.infradead.org; Mon, 04 Jul 2022 09:05:35 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 76so146401ybd.0
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Jul 2022 02:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r/txlkwsSXqpHvse6mvjLzWXeKgq/3s2YGv3xUbY5Mw=;
        b=IZMtQaneY5bkRCRn435yzjopTFrLGsnNAroUEZA60DC0wDcRkqcBfVDxlEqIAnCcnv
         MJ+3wG9bMVU7XIr1JE4rMRp8GxdmdHqRQssIXdAKWzib8AhqRQfMtd1Ev5UYgUXL60hU
         mbNGA3bwTtz5fkHWvaWYAA7QgoSNJDezpHkjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r/txlkwsSXqpHvse6mvjLzWXeKgq/3s2YGv3xUbY5Mw=;
        b=nIzcxSzjWpEHq1hjz0k2ETyZTMXlv6VjaeuWz2gTgmBwuUg2X4mn7H2XcshUlRw7Tr
         7Awl0f3P6VPOSGu/mRdzV7IU7GEHjaGA2TsBOHMsIRYzDxXkvuksYO2Xkgx1rmMTzEuz
         YoJfQ5OCJIpOWoLTRkEQK33U/NKItTCPKQy9O6vF8R8AfaYbv4IEoajl1SquBLtoOVIQ
         ZuLMnW9uGHXPfC41QNGTivVjMhWVOsNHOKikxKLq6kZx+iOyDfqG1d6OpOdvvr5mJwGS
         +sf0z+IZ0sAFHdv4QL/DDRu87rfeGWnJqh7gC+dw7Zbgb7GNJe+0mB1dvWIiUZYqjsFi
         h/aA==
X-Gm-Message-State: AJIora8spTEk7NPO+rVCadn/2pNSMJfB3A0zXjuV+Qj+zakDnvpRWW5G
	Lsn6720Oxymh2R5RHJC8DM86CCrBKkIX83LUYi4iog==
X-Google-Smtp-Source: AGRyM1u/TsAK473TGC7wQD7QiZ3JS9EK3BN1tnkdsrtBgG5BwbEhf2QtpJUMvLNJcqA/nNx8tedpcrxKO3kN0Gu4/0Y=
X-Received: by 2002:a25:7801:0:b0:669:b51b:10d0 with SMTP id
 t1-20020a257801000000b00669b51b10d0mr30989188ybc.204.1656925530744; Mon, 04
 Jul 2022 02:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-3-angelogioacchino.delregno@collabora.com>
 <20220701221158.iuw5fehgkjrqw6zh@notapiano> <CAGXv+5FwDuUjbP4THBsXorps12in-=JUtB-4VO5ygDBuQn1SeQ@mail.gmail.com>
 <91e60954-d44d-f99f-2b4f-c164fb33cc0e@collabora.com>
In-Reply-To: <91e60954-d44d-f99f-2b4f-c164fb33cc0e@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Jul 2022 17:05:19 +0800
Message-ID: <CAGXv+5HUQ1pNSDqyiH8taec8ykeaztjNY5dQPKTcJPpYh5JS9g@mail.gmail.com>
Subject: Re: [PATCH 02/11] arm64: dts: mediatek: Introduce MT8195 Cherry
 platform's Tomato
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	hsinyi@chromium.org, allen-kh.cheng@mediatek.com, gtk3@inbox.ru, 
	luca@z3ntu.xyz, sam.shih@mediatek.com, sean.wang@mediatek.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_020534_011882_F931376A 
X-CRM114-Status: GOOD (  28.17  )
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

On Mon, Jul 4, 2022 at 4:59 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 04/07/22 06:17, Chen-Yu Tsai ha scritto:
> > On Sat, Jul 2, 2022 at 6:12 AM N=C3=ADcolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> >>
> >> On Thu, Jun 30, 2022 at 05:33:07PM +0200, AngeloGioacchino Del Regno w=
rote:
> >>> Introduce the MT8195 Cherry Chromebook platform, including three
> >>> revisions of Cherry Tomato boards.
> >>>
> >>> This basic configuration allows to boot Linux on all board revisions
> >>> and get a serial console from a ramdisk.
> >>>
> >>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> >>> ---
> >>>   arch/arm64/boot/dts/mediatek/Makefile         |  3 +++
> >>>   .../dts/mediatek/mt8195-cherry-tomato-r1.dts  | 11 ++++++++
> >>>   .../dts/mediatek/mt8195-cherry-tomato-r2.dts  | 11 ++++++++
> >>>   .../dts/mediatek/mt8195-cherry-tomato-r3.dts  | 12 +++++++++
> >>>   .../boot/dts/mediatek/mt8195-cherry.dtsi      | 26 ++++++++++++++++=
+++
> >>>   5 files changed, 63 insertions(+)
> >>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomat=
o-r1.dts
> >>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomat=
o-r2.dts
> >>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomat=
o-r3.dts
> >>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> >> [..]
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts=
 b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> >>> new file mode 100644
> >>> index 000000000000..17e9e4d6f6ab
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
> >>> @@ -0,0 +1,11 @@
> >>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >>> +/*
> >>> + * Copyright (C) 2021 MediaTek Inc.
> >>> + */
> >>> +/dts-v1/;
> >>> +#include "mt8195-cherry.dtsi"
> >>> +
> >>> +/ {
> >>> +     model =3D "MediaTek Tomato (rev1) board";
> >>
> >> Given that the compatible is "google," I believe we'll want to rename =
the model
> >> to "Google Tomato", much like was commented on the Asurada series [1],=
 but
> >> better to have confirmation from someone from Google. Chen-Yu? :)
> >
> > I asked for clarification internally and it turns out we didn't get the
> > Asurada series quite right either.
> >
> > Google only owns the reference design, that is Asurada for MT8192 and
> > Cherry for MT8195. The vendor own the end product design that is based
> > off of Google's reference design.
> >
> > So for Tomato, the vendor is Acer. Note that "Tomato" and the other
> > codenames seen in ChromeOS are public codenames that Google uses.
> >
> > The compatible string will likely stay "google,XXX", since this is set
> > in firmware, and updating it after the product has shipped poses both
> > a significant hurdle and risk.
> >
>
> Yeah, makes sense. Should we call this "Acer Tomato (revX) board" then?
> ...if we do that, though, we need to know if the other revisions of Tomat=
o
> are also from Acer, or we would be getting one right and all the others w=
rong.

AFAIK each "device build" is its own project and gets its own codename,
otherwise it would get real confusing for us internally really fast.

ChenYu

> Cheers,
> Angelo
>
> >
> > Regards
> > ChenYu
> >
> >> Otherwise,
> >>
> >> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >>
> >> Thanks,
> >> N=C3=ADcolas
> >>
> >> [1] https://lore.kernel.org/all/CAGXv+5Gv2pjPXynz6HCdgux+giPDC5qRk+KW1=
aFduVz82rM=3D+g@mail.gmail.com/
> >>
> >>> +     compatible =3D "google,tomato-rev1", "google,tomato", "mediatek=
,mt8195";
> >>> +};
> >> [..]
> >>> --
> >>> 2.35.1
> >>>
>

