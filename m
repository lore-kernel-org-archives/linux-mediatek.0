Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B78C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 21:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ds1uWo+x8dLTwb+pOu9wYnAIjnjKj8wYXFb8TgcM+lo=; b=DDD2aLeDVG+TL5NXnpPW05l97x
	GKm9NotlHn/FodVlbGVJuj4Ih8q6ec3arac7UWEb7xW+GHUC00b1m/BtoUwzK7RkOxOLtGPOiu2TQ
	Yp1fRqtxQQ0FcXHt2OHZgpq7Pw9VR6/a4Hv2vXJPGWUHb0QKbu6c7ddmwcMLyt2rM190MA9Ie1B1J
	p+CQ6ILQS/GUSt/HT7C+Cq/04yaClpXrqcgJg9fQxvVqDeA/HGrcSB5pNB+5enb5vMwQJyecDA8SG
	DnQiiku17q7+holVycVpVkWn6U2ZvwYXmn6omyzvqRh1Pq6yipU+CsqXFMLjNuU5Q031y6CmCHZX1
	b0kOyrmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow8qM-0089qt-2G; Fri, 18 Nov 2022 21:24:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow8qB-0089k4-La; Fri, 18 Nov 2022 21:24:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 69631B82527;
	Fri, 18 Nov 2022 21:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181BCC433C1;
	Fri, 18 Nov 2022 21:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668806638;
	bh=mtZwhXDF+3XRcueQS8GYk6YH7EKVzSJYMCs2J1Z9w3A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UVFQhAZqjkOPybZV3BjmP/iJkMwmr9Lxh0+VR7QSw3/urHqQsWdMq2Rv7RdzsiX9m
	 +L33+3ggJZIy93hnHyXZJGm6SQsEaRO5gLPM3IoqcS44rBZUyz60+yS49Ec3N728yf
	 oOFZlciWKy/Obldz0p/lby3+IgHP781G53t/Zmyrj+VvfNIQcXyNco8jGBg6BQf+fw
	 96vyJzDAG5KvORkuZAPrT94bFCEPoPuJy10/g5HUBzbc+sQt/OjavPnC2hcXZF+6Gn
	 scLP0yKZxzi01EWTWFpq50uqMbYrBDp+YMEtpLknZdaTLcKgVzSGmaiyv0p7xhp30j
	 eg7oBw1yYcrDw==
Received: by mail-lf1-f44.google.com with SMTP id d6so10220635lfs.10;
        Fri, 18 Nov 2022 13:23:57 -0800 (PST)
X-Gm-Message-State: ANoB5pkGOJFUK2eZeoW4c1c/ndRyU2Z17XXue9v2AjAoPouGgk6bZo6X
	CAIwMrE49+B7kTlHnBF/5JjzhMgPgOEhNrccrQ==
X-Google-Smtp-Source: AA0mqf7ABgqeOepd4ak9gVR8kmoWpiHBAjzq5UkfrGYgfyqi7atqrFjpIs7BhnC8Tf0F/GS6aAb0ind9WjfasW4imEE=
X-Received: by 2002:a05:6512:1291:b0:4af:eabf:3c57 with SMTP id
 u17-20020a056512129100b004afeabf3c57mr2774151lfs.449.1668806636064; Fri, 18
 Nov 2022 13:23:56 -0800 (PST)
MIME-Version: 1.0
References: <20221106085034.12582-1-linux@fw-web.de> <20221106085034.12582-12-linux@fw-web.de>
 <5ece2b19-cbc7-5ecf-c29a-8f0258f260f4@gmail.com>
In-Reply-To: <5ece2b19-cbc7-5ecf-c29a-8f0258f260f4@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 18 Nov 2022 15:23:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJzM9y4pbN9UQpNENm9fB7-jGcch6n4w98eBuidL9rNsw@mail.gmail.com>
Message-ID: <CAL_JsqJzM9y4pbN9UQpNENm9fB7-jGcch6n4w98eBuidL9rNsw@mail.gmail.com>
Subject: Re: [RFC v3 11/11] arm64: dts: mt7986: add BPI-R3 nand/nor overlays
To: Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_132404_024004_0CD91434 
X-CRM114-Status: GOOD (  20.29  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Wunderlich <linux@fw-web.de>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 11, 2022 at 3:16 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
> Rob, Krzysztof,
>
> On 06/11/2022 09:50, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add devicetree overlays for using nand and nor on BPI-R3.

Overlays are necessary because ...?

> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile         |  2 +
> >   .../mediatek/mt7986a-bananapi-bpi-r3-nand.dts | 53 +++++++++++++++
> >   .../mediatek/mt7986a-bananapi-bpi-r3-nor.dts  | 67 +++++++++++++++++++
> >   3 files changed, 122 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dts
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> > index e8902f2cc58f..d42208c4090d 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
>
> Do we allow the inclusion of overlays in the kernel?
> I don't think so. I see there are some dtbos for some freescale platforms, but I
> wasn't aware that we support that. I thought it is all about dtsi includes.

Yes, we do.

> @frank In any case we would need to apply these overlays to some base board to
> create a valis dtb.

Indeed. The build system supports this and it's a requirement (though
not easily enforced) that overlays apply to something. It works much
like how kbuild combines multiple .o files into a module.

Please rename to .dtso though. I copied you all on the PR I just sent.

Rob

