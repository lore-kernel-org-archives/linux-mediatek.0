Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1D0C54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 07:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sW1HtD6+QhlshBfo2O8TyLUxF3XBhVUqFEhPUgz1nks=; b=CYI6YgyZwpyAnQToHPFN9cH91l
	Y3AiyPJTyppMRAixeQz/WtrbxJE+wM3mpmE5G0baUb9jQg/0Mijuke6jHe8GA2zPy+n4HhY4Rw0R7
	eNXkpUEda67912zWSvCFdwY/kDZJYpl1WVP6AqnMimJ3VBjcfHlhNAYrc/O2rktl/wxoICxagZjji
	4S04gZxoINzRmvZ2iRyYQ2vI9M2ZyiEZHHT1K2/ia539LwWvgGihZrKPfFNlV63tZrKpBRmlOrC/M
	Etb3BwMm/WN1PNpSrpebSovfYcaJt/zCr2flKGH6SU0OObd+Mp7u8GEv4IvOgFxGfqYDpUloOsR7y
	iewZVGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfac4-0000000CQP2-2pY6;
	Thu, 29 Feb 2024 07:13:52 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfac0-0000000CQKh-3z2a
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Feb 2024 07:13:50 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-512e39226efso460835e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Feb 2024 23:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709190826; x=1709795626; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sW1HtD6+QhlshBfo2O8TyLUxF3XBhVUqFEhPUgz1nks=;
        b=eCFcS3y/nq1aV3eOdjJm8ZYLpMPJDWKfSuhwcwOlBVwmoDwzY/m+sX+dgayPFvAJcJ
         wYHP7xGytU72kWF85iMoU+0WCdTz7WkCqxRcaJ7waoeW/1veA9iYnRq1R+SInb1Pn+Uy
         2C41hFyQiQMoT+tKonOJxy/zj///lL3vU4hd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709190826; x=1709795626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sW1HtD6+QhlshBfo2O8TyLUxF3XBhVUqFEhPUgz1nks=;
        b=X88oFglBKcA3zIUAXb75Wi8/BeNxVUTRijiVLHrTWRdCBxLecLKqTAM8fl6+tVnTGG
         3D8+lns53NShw1nSSEt7T9aorBe8WqPW3NqOzWGs6+XSM+Rlpgd6N8jBwToGnem9DSPU
         P5Y05LOEqXOscGORwMKPiDtUByB9/a1oL82pE75T/8QpsOSKylTn2b7g94JDxCeGYBHe
         6TBclUR3ZwyhsWb1tTgNU+sTBvCyv4GEz/2hctGXuLIS+5y4Wf81TrM3M1cQVEdW228+
         t3uNMQdEP0DDuaEgJxFR5gwVylA8/h1CXdosThRrCJbZ25SC6WK3nIPO5E5M+PL3k5AN
         bYMA==
X-Forwarded-Encrypted: i=1; AJvYcCWKSWZ7ZZTFI7XVIZmPwPymRHOW1KhdxGnBNVL3qZpwH72Nddg0yQTxyddd1dsnIH60Kvpx1Axv7KJmkDsExP/Bct96GfP+NBsbzoJl3UCIiV5L
X-Gm-Message-State: AOJu0YzV82g3agCm7uPkqbSIBAs4d3jTNn809HNHthkQx8WeF3MDnIpC
	V4yksGKwf4mHG4qhPOdAPH4ejYebD0D6QORNdLyXQbNs+I5LXnSnE9IUW6DC1dxvfdYmdVg7u0+
	XkZIVSXRI9zsHn7fi8j+wqimT5Wc/ftDuxKLE
X-Google-Smtp-Source: AGHT+IHYP2zEhw8fwOpmvt31M+HZmbYGEsHZBSayotV4ShVjz9H7wVGQo4fCF7t4FZe3rQUT6hsM0aXuVn25hgznTb0=
X-Received: by 2002:ac2:5145:0:b0:513:1e22:1f17 with SMTP id
 q5-20020ac25145000000b005131e221f17mr779797lfd.29.1709190825888; Wed, 28 Feb
 2024 23:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20240223091122.2430037-1-wenst@chromium.org> <feab2039-5745-41a4-87c3-44fa266efc1d@collabora.com>
In-Reply-To: <feab2039-5745-41a4-87c3-44fa266efc1d@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Feb 2024 15:13:34 +0800
Message-ID: <CAGXv+5GpTJzMHxY+J6PshW6-xLfc5G3DTuAG4d9eCc+=WWRd9A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: Add power-domains properity
 to mfgcfg
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Weiyi Lu <weiyi.lu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_231349_043685_AF40E1F0 
X-CRM114-Status: GOOD (  25.77  )
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

On Mon, Feb 26, 2024 at 4:54=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 23/02/24 10:11, Chen-Yu Tsai ha scritto:
> > From: Ikjoon Jang <ikjn@chromium.org>
> >
> > mfgcfg clock is under MFG_ASYNC power domain.
> >
> > Fixes: e526c9bc11f8 ("arm64: dts: Add Mediatek SoC MT8183 and evaluatio=
n board dts and Makefile")
> > Fixes: 37fb78b9aeb7 ("arm64: dts: mediatek: Add mt8183 power domains co=
ntroller")
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > This patch is long overdue. Could we merge it for fixes for this or the
> > next release?
> >
>
> A clock controller that needs a power domain? Can you please describe the=
 issue
> that you're trying to solve with this?

Our issue tracker doesn't have much on this. But this was part of the initi=
al
submission for MT8183, but somehow got left out. The clk driver patch to
enable runtime PM was even merged, but was effectively reverted following
the clk driver rework.

> It's not very uncommon but I'm not entirely convinced that this is right,=
 because
> the MFG_BG3D is a gate - and it's *not* outputting a clock rate on its ow=
n: the
> mfgcfg is entirely GPU related and if there is no GPU support this clock =
is not
> even ever needed.

It could be just a gate, or could be a buffer. Either way, the registers to
control said device could be in a power domain that is not always on. I don=
't
think this can be ruled out.

And if the registers are in a powered down domain, then either the readout
would be bogus (if access isolation is implemented) or just hang the system=
.

ChenYu

> MediaTek, can you please clarify if (and why) this gate clock needs a MTC=
MOS to
> be ungated?
>
> Thanks,
> Angelo
>
> > Changes since v2:
> > - Rebased onto current tree
> > - Added Fixes tags
> > - Fix up subject prefix
> >
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8183.dtsi
> > index 93dfbf130231..774ae5d9143f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -1637,6 +1637,7 @@ mfgcfg: syscon@13000000 {
> >                       compatible =3D "mediatek,mt8183-mfgcfg", "syscon"=
;
> >                       reg =3D <0 0x13000000 0 0x1000>;
> >                       #clock-cells =3D <1>;
> > +                     power-domains =3D <&spm MT8183_POWER_DOMAIN_MFG_A=
SYNC>;
> >               };
> >
> >               gpu: gpu@13040000 {
>
>

