Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3549ACDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qg819PeaIaXIquSaDniEPuZ9yLpqV66mI/xzM9l2AAw=; b=1icsmGQTWMBmRirZgC5qPNheTR
	MhzNBpD/t0myd3qxDdfZK4JH5kl3sS2GJ+FGrU8O8kL8TTwjX+zgfifK6NZt44+YKHOFuo0QbgCJH
	3M5z9gKvpC5Qf4Rhq2US837n/BbXDNzB/C+doV4FkLG3O7RoNw+Rg1D/1PtcWrxrcy8dnIuoK19Pc
	YuiHkDlCZ6u1Eysa44VlM1FFZP5nbgMjxKdHXvuYbB5VZypmNd+0uDT5Rt/nJEF9d9P2tBidBprhw
	J7JtilmgHvUVXe9DtFHJmRGIQ0eKHzLVlAqLMjl8LfQwLilnFDUw+Bwwo4eW3ohPA9yHETcsUveZE
	ysX2k0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGt9-008WE7-1i;
	Mon, 16 Oct 2023 06:15:39 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGt6-008WCb-3D
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Oct 2023 06:15:38 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50305abe5f0so5324891e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 15 Oct 2023 23:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697436934; x=1698041734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qg819PeaIaXIquSaDniEPuZ9yLpqV66mI/xzM9l2AAw=;
        b=KMy4+AD+keOsCSmnmLtl53+M40H+0FpRo8qqlgbMhHjMVLWpgzKktoH3ymX9Wgr4nC
         G0sTw4v+hKk+caoaZWstdjw5FK61CWF8ut4E/d4jHlQdyiKBxr8T1++6bxRwXWgr8vL/
         OGIkua4tiFs3HXLuxFx9XBiPlJeitbmAQ44Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697436934; x=1698041734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qg819PeaIaXIquSaDniEPuZ9yLpqV66mI/xzM9l2AAw=;
        b=XshC8Vz3K7j8AEiDL+YIwGQxFhWoC0iL0a3X4zPQSEmvO4x0gd2GP7JIun2nOn5g2u
         zg0Xr48IQP5uGZEJtk2WjyExhlhwJfGpCZc2iAe/0fMVAFd1ufsUcMCWzMAzwovJ1K3m
         kYj9ttucZT6jTrKxIGUoHY1rH8JKQnbuwJ2P8PIvAQI3iQjK0vV8MKthJL5wNJhZQsdp
         NwLoTXsx9lXuyBjHcRIauQQyyE+C6xmj6yciGhZx1ZR+ljLbk9ZbHgeYQp92cJ7A5h6A
         C3WvV/NXGT9mGep5iLXfZ5iyZB8IMh6oNHZrE+ilZhy+UId6Ick+Px1QjKb17MlHsfIw
         NYZA==
X-Gm-Message-State: AOJu0YwhehewOLEweTWP6iSwrgutuX3BxsvrM7e/kqyukXDH3ENe9ZJG
	++eO+SWRR0wKjiV6lmos4SbqgyGJJkuv0733UyquWw==
X-Google-Smtp-Source: AGHT+IHFJQLwa1QowtCkE7wJpqnOvB1ap/SQuAj0GtJU7L2ROkhL11U6w6x/le7hptA3fdVbUJyPewrXhBpLR7HkWuA=
X-Received: by 2002:ac2:482c:0:b0:507:9a66:3577 with SMTP id
 12-20020ac2482c000000b005079a663577mr6552198lft.5.1697436934207; Sun, 15 Oct
 2023 23:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231012230237.2676469-1-wenst@chromium.org> <20231012230237.2676469-3-wenst@chromium.org>
 <20231013-washer-mortally-b27c196ac50f@spud> <CAGXv+5GF7HfQSOg9c=G+c4DPUW24Ax7LX4raTynDbE3xc8iCdg@mail.gmail.com>
 <20231013-panic-vaseline-350c10e7d585@spud> <CAGXv+5EmLDWi3Lnca1vPft=9z9Cp2L2ee08in_b_21hipf9ieQ@mail.gmail.com>
 <20231014-proud-levers-eb03f30a0a9a@spud>
In-Reply-To: <20231014-proud-levers-eb03f30a0a9a@spud>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Sun, 15 Oct 2023 23:15:22 -0700
Message-ID: <CAGXv+5F-x9m2WYZm-YLaxqio=VnfKkL26gLFbayJctBEJrSM6A@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel /
 Tentacool Chromebooks
To: Conor Dooley <conor@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_231537_086493_0E25E792 
X-CRM114-Status: GOOD (  41.35  )
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

On Sat, Oct 14, 2023 at 6:40=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Fri, Oct 13, 2023 at 11:19:16AM -0700, Chen-Yu Tsai wrote:
> > On Fri, Oct 13, 2023 at 10:55=E2=80=AFAM Conor Dooley <conor@kernel.org=
> wrote:
> > >
> > > On Fri, Oct 13, 2023 at 10:29:25AM -0700, Chen-Yu Tsai wrote:
> > > > On Fri, Oct 13, 2023 at 8:11=E2=80=AFAM Conor Dooley <conor@kernel.=
org> wrote:
> > > > >
> > > > > On Fri, Oct 13, 2023 at 07:02:28AM +0800, Chen-Yu Tsai wrote:
> > > > > > Add entries for MT8186 based Tentacruel / Tentacool Chromebooks=
. The two
> > > > > > are based on the same board design: the former is a convertible=
 device
> > > > > > with a touchscreen, stylus, and some extra buttons; the latter =
is a
> > > > > > clamshell device and lacks these additional features.
> > > > > >
> > > > > > The two devices both have two variants. The difference is a sec=
ond
> > > > > > source touchpad controller that shares the same address as the =
original,
> > > > > > but is incompatible.
> > > > >
> > > > > > The extra SKU IDs for the Tentacruel devices map to different s=
ensor
> > > > > > components attached to the Embedded Controller. These are not v=
isible
> > > > > > to the main processor.
> > > > >
> > > > > Wha? Given your ordering, is a "google,tentacruel-sku262144" a su=
per-set
> > > > > of "google,tentacruel-sku262145"? If not, this compatible orderin=
g
> > > > > doesn't make sense. I can't tell from your description, and the
> > > > > absence of a
> > > > > items:
> > > > >           - const: google,tentacruel-sku262145
> > > > >           - const: google,tentacruel-sku262146
> > > > >           - const: google,tentacruel-sku262147
> > > > >           - const: google,tentacruel
> > > > >           - const: mediatek,mt8186
> > > > > suggests that there is no google,tentacruel-sku262145
> > > > > device?
> > > >
> > > > AFAIK all four SKUs exist. And as far as the main processor is conc=
erned,
> > > > they look completely identical, so they should share the same devic=
e tree.
> > > > As mentioned in the commit message, the differences are only visibl=
e to
> > > > the embedded controller, which fuses the sensor inputs.
> > >
> > > Then it makes very little sense to write a binding like this.
> > > If this was just for the 252144 SKU, this would be fine.
> > > For the other SKUs, there is no way to uniquely identify them, as
> > > all four of google,tentacruel-sku262144, google,tentacruel-sku262145,
> > > google,tentacruel-sku262146 and google,tentacruel-sku262147 must be
> > > present.
> > > Given that, why even bother including the SKUs in the first place,
> > > since no information can be derived from them that cannot be derived
> > > from google,tentacruel?
> > > There's something that I am clearly missing here...
> >
> > There are incompatible variants of google,tentacruel. This is why this
> > patch has four google,tentacruel based entries. Of them, two are Tentac=
ool,
> > which are clamshell laptops, and two of them are Tentacruel, which are
> > convertibles.
> >
> > Within each group there are two variants: the second variant swaps out
> > the I2C touchpad controller. These two controllers use the same I2C
> > address but use different compatible strings, so it's not possible to
> > have them coexist within the same device tree file like we do for many
> > other second source components.
> >
> > So the relationship looks like the following:
> >
> > google,tentacruel --- Tentacruel --- google,tentacruel-sku26214[4567]
> >                    |              |
> >                    |              -- google,tentacruel-sku2621{48,49,50=
,51}
> >                    |
> >                    -- Tentacool ---- google,tentacruel-sku327681
> >                                  |
> >                                  --- google,tentacruel-sku327683
> >
> > Also, the devices themselves only know their own SKU ID. The firmware
> > will generate a list of compatible strings like:
> >
> >   google,tentacruel-rev4-sku262144
> >   google,tentacruel-rev4
> >   google,tentacruel-sku262144
> >   google,tentacruel
> >
> > and try to find a match in the kernel FIT image. The method we currentl=
y
> > use is to include all the applicable board compatible strings.
>
> Then it seems like what you need is something like
> oneOf:
>   - items:
>       - const: google,tentacruel-sku262144
>       - const: google,tentacruel
>       - const: mediatek,mt8186
>   - items:
>       - enum:
>           - google,tentacruel-sku262145
>           - google,tentacruel-sku262146
>           - google,tentacruel-sku262147
>       - const: google,tentacruel-sku262144
>       - const: google,tentacruel
>       - const: mediatek,mt8186
>
> What you have at the moment just seems like a hack because you want to
> stuff all of these compatible strings into a single dts.

It is. And it works OK downstream. The reason we want to stuff them in
one dts is because the firmware will not generate the fallback to
sku262144 as the scheme above suggests.

Having three or four identical device trees just with different board
compatible string sequences to me seems a bit redundant, and it does
end up bloating our FIT image a bit, which impacts boot time.


Regards
ChenYu

