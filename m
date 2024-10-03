Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A397CF855A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 06:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjCn7wNLVdT3ReTaN+Qz+I/dQF+bFHwwiGL3poiE5os=; b=1aeQjWz41dYrFp5M19F0/+VgAc
	fAXLvbSwcUYScKQe1C3UbjBpXaA60ifbdVeo1XEisEY77DjL5f4Ahy16pU26/F7yhRC6O2ugbgq+6
	nc1VCsCsh9DBuWiVKpsBf2oEDK66kNuA4vafxXuG+LpEd5y8Zh6ZrdXldQh7p5osRDwh6CqTPGUn4
	wlYI3X80QEC++yKLp0I8kf1ptmeqKjvtt9mWo70OncFjWAQjo3toUdiAgxKhDjtenSJsZi02Pq0J1
	TdLXqTuN/6BXbR/DjH5Z3aYpVELlhbrY5LLnC6xfD8xK/NA9/SiePhdBgVCNvUjyM9MpEWkJaeZdf
	77WFQHrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swFAe-00000008Gvq-1MQG;
	Thu, 03 Oct 2024 06:18:40 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swFAb-00000008Gv1-2dqL
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Oct 2024 06:18:39 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-505a9e521b8so184668e0c.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 23:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727936316; x=1728541116; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjCn7wNLVdT3ReTaN+Qz+I/dQF+bFHwwiGL3poiE5os=;
        b=SheH6CER/ddLmDpE+tjqcooWZXVq/FYcBgui/O7Pkih2FavZD1e73SYU0tww4G2Tbc
         n9jKZN6Rdxc6ayMyExlW4AdrdsbKhYNuUEjjIuxX1Tt6ukQDIBoujXlUQfAZF+fW7vcQ
         ybTnhYt/b5nDmdMoijnbpnGapbQFeSPGA0pTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727936316; x=1728541116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjCn7wNLVdT3ReTaN+Qz+I/dQF+bFHwwiGL3poiE5os=;
        b=fW+9wjRF0vjMmFpQ/UIRgXgXBHZEACyOUc1GCDwh9lhFGNwU1nAXpg7R6GDf4bvOGY
         wmr4U7AhutGLeK+MGplMvoGK/81ODv0NWBp65TXIiOipzqtFQXda7rJZTnK7Wh+A5LoG
         9gxIgI3+EpcjL0uDKdrfwWXUjEaJOJYOR9IvUyzj+eRuVKzGEByw4jlA4yutJdLcc+Jp
         mYQ19bib43Vol6FU+mksOEq/A4QyXgRqN3cTagdYA+sFUq+wx93iu19TkjKtB2mdKeVa
         Pq/Rp4LM+x3wXsO7LI/QJghfCYic0bCoBUrR3S9LguD2y4/5I9ZrYFbXGTCTxIBltjkq
         PMOw==
X-Forwarded-Encrypted: i=1; AJvYcCVJEMFay1n83e/jiN8KSo0xA5tnk/KeGnycKPBHsltOrdaW19zqEco4mELSJNHUdJHIhvsHd0zhRuYzFaWOuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxhmnPZn15+otG/5dKwHqdwYYArFA9llKmtBj7GtGWv5nWvUvp
	KLDA2tG6WGESmGmNwzktlv3e5JpCriPL5tJg/jYtHffJptbgowRk5BSoCc/1VdEGHRjve00MX7Z
	qLQ==
X-Google-Smtp-Source: AGHT+IEXkzy2JyDFG/p9D6MgKQsuNFpYd3lg+1Zt30S2w6aT77NFqdA6BqUXSJFov/xB7+bWkQSrLg==
X-Received: by 2002:a05:6122:2004:b0:50a:c52d:6baa with SMTP id 71dfb90a1353d-50c57dc2623mr4522353e0c.0.1727936315775;
        Wed, 02 Oct 2024 23:18:35 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-84f3af7be6asm68801241.34.2024.10.02.23.18.34
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 23:18:35 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-84ea658b647so190862241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 23:18:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPJu8rv6HaeBoMfry237LGGa37O2F6RTSq6sLo2SJ5+7nGqJhgr1GJLd5nFlzizZxICPvxir0RCYh7t58ggw==@lists.infradead.org
X-Received: by 2002:a05:6102:3584:b0:4a3:a7a0:889a with SMTP id
 ada2fe7eead31-4a3e6924383mr4417458137.19.1727936314349; Wed, 02 Oct 2024
 23:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20241002114614.847553-1-fshao@chromium.org> <20241002114614.847553-3-fshao@chromium.org>
 <7faeac1b-0b7a-a820-16a5-330b82d12e01@mediatek.com>
In-Reply-To: <7faeac1b-0b7a-a820-16a5-330b82d12e01@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 3 Oct 2024 14:17:57 +0800
X-Gmail-Original-Message-ID: <CAC=S1niQQi_m+GB_CoZr-PTgyxVNCa_uwgZw+vGqgE-E5FBnCw@mail.gmail.com>
Message-ID: <CAC=S1niQQi_m+GB_CoZr-PTgyxVNCa_uwgZw+vGqgE-E5FBnCw@mail.gmail.com>
Subject: Re: [PATCH 2/9] arm64: dts: mediatek: mt8188: Add PCIe nodes
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, jianguo.zhang@mediatek.com, 
	jian.yang@mediatek.com, jieyy.yang@mediatek.com, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_231837_742070_2222AAF2 
X-CRM114-Status: GOOD (  22.78  )
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

On Wed, Oct 2, 2024 at 8:42=E2=80=AFPM Macpaul Lin <macpaul.lin@mediatek.co=
m> wrote:
>
>
>
> On 10/2/24 19:41, Fei Shao wrote:
> >
> >
> > External email : Please do not click links or open attachments until yo=
u
> > have verified the sender or the content.
> >
> >
> > Add PCIe node and the associated PHY node.
> > Individual board device tree should enable the nodes as needed.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 62 +++++++++++++++++++++++=
+
> >   1 file changed, 62 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8188.dtsi
> > index 10195a4e4e9d..9431f3c5c228 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> > @@ -1763,6 +1763,53 @@ xhci0: usb@112b0000 {
> >                       status =3D "disabled";
> >               };
> >
> > +             pcie: pcie@112f0000 {
> > +                     compatible =3D "mediatek,mt8188-pcie", "mediatek,=
mt8192-pcie";
> > +                     reg =3D <0 0x112f0000 0 0x2000>;
> > +                     reg-names =3D "pcie-mac";
>
> It seems the property 'linux,pci-domain =3D <0>;' is missing?

I'll add that. I guess the fallback will assign a dynamic ID to it
(likely also 0), but explicitly having a static domain ID is never a
bad thing.

>
> [snip]
>
> > +                     };
> > +             };
> > +
> >               nor_flash: spi@1132c000 {
> >                       compatible =3D "mediatek,mt8188-nor", "mediatek,m=
t8186-nor";
> >                       reg =3D <0 0x1132c000 0 0x1000>;
> > @@ -1775,6 +1822,21 @@ nor_flash: spi@1132c000 {
> >                       status =3D "disabled";
> >               };
> >
> > +             pciephy: t-phy@11c20700 {
> > +                     compatible =3D "mediatek,mt8188-tphy", "mediatek,=
generic-tphy-v3";
> > +                     ranges =3D <0 0 0x11c20700 0x700>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     status =3D "disabled";
> > +
>
> The power-domains property is missing.
> It should be 'power-domains =3D <&spm MT8188_POWER_DOMAIN_PEXTP_PHY_TOP>;=
'

I dropped this as the binding check was against it, and I thought it
was a mistake because other tphy nodes don't seem to have a power
domain either.
And now I noticed your tphy binding patch in [1] so that explains,
except that I still can't tell whether there should be a power domain
for a given tphy node...

Anyway, I'll fix this one. Thanks!

[1]: https://lore.kernel.org/all/20240926101804.22471-1-macpaul.lin@mediate=
k.com/

Regards,
Fei


>
> > +                     pcieport: pcie-phy@0 {
> > +                             reg =3D <0 0x700>;
> > +                             clocks =3D <&topckgen CLK_TOP_CFGREG_F_PC=
IE_PHY_REF>;
> > +                             clock-names =3D "ref";
> > +                             #phy-cells =3D <1>;
> > +                     };
> > +             };
> > +
> >               i2c1: i2c@11e00000 {
> >                       compatible =3D "mediatek,mt8188-i2c";
> >                       reg =3D <0 0x11e00000 0 0x1000>,
>
> Thanks!
> Best regards,
> Macpaul Lin

