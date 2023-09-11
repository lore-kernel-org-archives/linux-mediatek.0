Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A726EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 19:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40YUYTyq8ShKP+zDpF2iiX4zl/d4l28paTUGNG+FPEE=; b=vroNPXL6OamQJw
	IjtePhrcU3vV6f541xzj8qaBEOHoIHvt1VPNdnklGHjmI5lPNlJ0BDt7T2RI3DoCLvVUAh2IAIWv/
	HT9enM4IjpwVlzklHYkQqHgZBNq1+QPJca5XH/OapCj5mP33YlOQ/IlZeiiHEt27ZAeo5VcI9fKxl
	CQF+FfOnbdHHK6wygddeuwbDOdwQYc7mhsvdFq6Regv0yBpEvtEjb9ZFjsIY5Qk3dmxNX81GGKnc7
	Zrt55ue5+esdbgWJymFvJ/DMYNfJMY5UwEG/ryZdhq4MUejCZqeK+7K94XSHxyZB6cGw7mSNcwG6G
	nxR2/VMBGuw4YFn0v2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfmx6-001EZK-13;
	Mon, 11 Sep 2023 19:52:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfmx2-001EYF-2x;
	Mon, 11 Sep 2023 19:52:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DE4D0B818AE;
	Mon, 11 Sep 2023 19:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9101FC433C8;
	Mon, 11 Sep 2023 19:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694461918;
	bh=G21JeuejQT7napK47qwQ3mWfWxYoI1kT9b4AieRElDA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QnbBQSmG4K+ogWEIYsFEXIYAOGDJKNxTAsekutOUwMnMc93ordqLOYJZcyknL4Y/J
	 lJ+bUy+jzaBfm7gyRWZxLa7OSFJFWNHC9Xr33SFNnicwGNqqseqKhexfzqT4B/SXkA
	 8yJnTCVzIcvZPSO+3h3/IjoyEKtRnwgpGGgYE5PaOy13ZuiDWP9kX9wYUd4jI/flXy
	 vkgDum9Kh+6oXussXeaHM88Ohk/xXUtX+/iU3AGkWrDLxXbo1+uMzqWJw34r5Mss3A
	 CPUo04lpc+QT3DP2yplseLYc1VuU6A6xKJMJJK8J1Ry8kYeN7uisTGp8FXn1VezyN1
	 1tcgztIj203PQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-502153ae36cso7755630e87.3;
        Mon, 11 Sep 2023 12:51:58 -0700 (PDT)
X-Gm-Message-State: AOJu0YyytSZ7NJp16LEgEC7e90X/05qOLVR4P3zx3XeOtTgBUM934MfM
	RJl8K75DaxObrWPTGolRyGrmrflLI6j5v1r5Ew==
X-Google-Smtp-Source: AGHT+IH5pf2sDl25rbz7w518Lh3YTl7THtqx7rSMbkIlLFoE0f3fSzHpolKm+Cb4RC/Jb0STKAIDjyLn35REO3cEScA=
X-Received: by 2002:a05:6512:33c8:b0:502:a56b:65f7 with SMTP id
 d8-20020a05651233c800b00502a56b65f7mr7434456lfg.16.1694461914773; Mon, 11 Sep
 2023 12:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230901072730.13571-1-linux@fw-web.de>
In-Reply-To: <20230901072730.13571-1-linux@fw-web.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 Sep 2023 14:51:42 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+f9bq5Mab9m1pzDeiw304TMeNDmJk+ofG6M8J9QD3cvQ@mail.gmail.com>
Message-ID: <CAL_Jsq+f9bq5Mab9m1pzDeiw304TMeNDmJk+ofG6M8J9QD3cvQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: mt7986: add overlay for SATA power socket
 on BPI-R3
To: Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_125205_254695_CE424F47 
X-CRM114-Status: GOOD (  18.24  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 1, 2023 at 2:27=E2=80=AFAM Frank Wunderlich <linux@fw-web.de> w=
rote:
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> Bananapi R3 has a Power socket entended for using external SATA drives.
> This Socket is off by default but can be switched with gpio 8.
>
> Add an overlay to activate it.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile         |  1 +
>  .../mt7986a-bananapi-bpi-r3-sata.dtso         | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-=
sata.dtso
>
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/=
mediatek/Makefile
> index c99c3372a4b5..822d3e36d3df 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r=
3-emmc.dtbo
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand.dtbo
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor.dtbo
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sata.dtbo

The requirement for overlays is they have a target base dt in tree and
that you apply the overlay to it. All these existing overlays have the
same problem which I pointed out when you submitted them. Please fix
the existing ones before adding more.


Rob

