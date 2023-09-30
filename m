Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A10E77371
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Sep 2023 12:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHWk/74ar992Q4pJYw65UYejOLcEeirhE3P4juzJat4=; b=G+Lw93yFD0Z+P0xiN+ftM6G1yc
	O2ZRhkJH0yuy2PL7eQK0g55+r4CtPy+/ZUqXvhhpNJWzQlUtT1Q35tLH+foVapN+cHOyfWSo2ahFC
	urx7HYkvSuuiQ92IdldH4ge9ZqFYW9eAtCK8QJLhXGwpYtjIVMao3c8rb+i3dGnk54gvW+OF4mBnz
	ws3b01ycXzBZWp+lvIQuG8NGF2u96g8/ofsuzEtIDPchsH17SBc1MFMztPedqbmtFtldzgUthDhDR
	n/w90YTT8y/+LJ4lqoGJ8FPEtvCPv5f7kCHafHxRqF7+qepEW0N1bJWGxuSehyDjGEI7AAv42HtQM
	9TdbP5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmZX5-009YBn-0q;
	Sat, 30 Sep 2023 12:57:19 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmZX1-009YAV-0e;
	Sat, 30 Sep 2023 12:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
 s=s31663417; t=1696078630; x=1696683430; i=frank-w@public-files.de;
 bh=1cQ3HuKXIF1mPThFuYOTsPaNKR1Gk3qp55at/3uFCBc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EEoUSAh14u3J5l5foG6CeiigJBfxBKsr4oZ4oE9NfEzWUGpQnOEjVDivg6pyKrWx6nX2Cpfzm6j
 brqBoptdJjeUsaJK9nSjoPkbCpv2Qd2LOcIQJUH6ZEvCfiKn5JFuxBBonzpuSa+VcPrjvNzZe+Dbs
 8mwOE1PeZPiZEtZnZz02N44X7LAZdNygfIwC240YoL5vXgXbguVnfAGo/Ispt28QMFdSz9BiVqyNm
 ZGqlzxNfc6Nyz4oDE3PCLIr46K1YZSCREWMRvgk7UUKlVoWQwXvc8EY6ymYDGU9bSsvA0YLC7rDZF
 z6CXM7vdi6oM0U+7YNdHxAQRlfNvGdSpQKwQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.152.33] ([217.61.152.33]) by web-mail.gmx.net
 (3c-app-gmx-bs36.server.lan [172.19.170.88]) (via HTTP); Sat, 30 Sep 2023
 14:57:09 +0200
MIME-Version: 1.0
Message-ID: <trinity-3fe161a2-70f1-4619-be28-199ea6201668-1696078629921@3c-app-gmx-bs36>
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Frank
 Wunderlich <linux@fw-web.de>
Subject: Aw: [RFC v1] arm64: dts: mediatek: add dtbs with applied overlays
 for bpi-r3
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 Sep 2023 14:57:09 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20230916083214.7059-1-linux@fw-web.de>
References: <20230916083214.7059-1-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:xgVUp3hQ4hSWgQi6tyM4GTOL7nnTaeGiONOEAMNzVr2x3MXSwA99wM2JIyElwhlptAxSU
 PcVlSycFEy138pXjcEUXubl/pKh79GpplV2t3SUbXwuBxOE9Zg9FoMqu7vAf1xQfKW7xY0g18aH9
 YCVJjEYvgap3NV2sJk/tlMy2tWmFks5dplS5Sd63W8Q6ykY8VoJHBy2MMhwIQouVbrVEKX0gu70k
 7edc2VdoC1khbHlxR8BTG0shUzp2eljfa2hZfOS/sLApETTOMH33rm8/a6nb7SI+g1zWjIj9iRkI
 dg=
UI-OutboundReport: notjunk:1;M01:P0:CDsWDlRXma4=;LEkD/j2srMmq1++2T1jhrjSf2gn
 xkcr3IsPqJi00BwGAkNQWWRlvG6HeQ0Z1L44RqAxgM8chUkCsyAwNy7lLUvtOyrLAYTJjSGqM
 J2i0f1lIw5TCUlCv4lWg7bfV3opi2vpSlF7tXOoLF3tYmjvMimiYIsSQHfHinqGy6RjN93o3w
 ULtq9XJlL0XekO84MPCz9zL4UdE3LBvzdwJaee/5mNNo0LflhSZy51FenkLdrSrzqvNQnZS61
 31ysYxnyvFhO87i2+w/j+81u0sZNc3Ihd9rd8rGWJPOAWdm+gF9QcTmI7dCUxb1nMR0fgEg2C
 JImM3A/2DWcdeAhI0bdbNiDkjKCaqB2vQj0uO6+SSdYf1IxOh28QJWM1Mnaa0SvvVMppzoYO/
 WmixOHvzJ4KdiZEDUAf0HWXrTifMPIto61HrNhHMx6Z08TlEfgs0Yu5T2Eb2ztt98HUa0BAL2
 L58ejJFT2eZZuZm3Iw4q+f0/XxnqaIf+WrrYiYJUN7XGMXO0l5anYajZ51zZ0FHP0Y1Eg3Ido
 ZAL6A8PAeOnuGS5qxkbwffF9BKE8ovg8ffpDlcDrJQ9lEBDy1AyHoaI4bMAJmjRVlMV9mafN2
 F+fmBrcY8zlfKGj/a67IGNw9PJcFsdwKxWwaStG6X9FgVibZ0ERk4okRtaffxoFQ8OrmJZ4jV
 ivLAsnUvheHox04gQVjbtiKo9rYxUuMrb3s7+ffcLk9Phj5NYbOOd2z7OQW2yPbxYJt7MmfiC
 VFMsKrRWq0KypWlSRF2uN4JbBHq3jiQiW2m0MmS/ySTKYPmsyfF6TT1/VbHEYMhG5s/1u1djf
 h6RINiOAp9DXQkp5AwdQiTSxp7rWv5aa1YJOEa9c2QTD4=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_055715_549810_62A6631D 
X-CRM114-Status: GOOD (  12.84  )
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

Hi,

just a friendly reminder...is this the right way to go?

regards Frank


> Gesendet: Samstag, 16. September 2023 um 10:32 Uhr
> Von: "Frank Wunderlich" <linux@fw-web.de>
> An: linux-mediatek@lists.infradead.org
> Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Matthias Brugger" <ma=
tthias.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delr=
egno@collabora.com>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozlow=
ski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.=
org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
> Betreff: [RFC v1] arm64: dts: mediatek: add dtbs with applied overlays f=
or bpi-r3
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> Build devicetree binaries for testing overlays and providing users
> full dtb without using overlays.
>
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> based on discussion here:
> https://lore.kernel.org/all/CAL_JsqK_3xxD0DFwipXO85P=3Dq=3DEYjUdjE1_8g1M=
Ktvw3vVzx5A@mail.gmail.com/
> https://lore.kernel.org/all/CAL_JsqJSi=3DkJSix=3Df3787ULZnaCy_Y26Phdhy5y=
9fat_vkDuUw@mail.gmail.com/
> ---
>  arch/arm64/boot/dts/mediatek/Makefile | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts=
/mediatek/Makefile
> index c99c3372a4b5..18be027bf6b4 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -13,6 +13,14 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi=
-r3-emmc.dtbo
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand.dtbo
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor.dtbo
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd.dtbo
> +mt7986a-bananapi-bpi-r3-emmc-nand-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb=
 mt7986a-bananapi-bpi-r3-emmc.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nand.dtb
> +mt7986a-bananapi-bpi-r3-emmc-nor-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb =
mt7986a-bananapi-bpi-r3-emmc.dtbo mt7986a-bananapi-bpi-r3-nor.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nor.dtb
> +mt7986a-bananapi-bpi-r3-sd-nand-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb m=
t7986a-bananapi-bpi-r3-sd.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nand.dtb
> +mt7986a-bananapi-bpi-r3-sd-nor-dtbs :=3D mt7986a-bananapi-bpi-r3.dtb mt=
7986a-bananapi-bpi-r3-sd.dtbo mt7986a-bananapi-bpi-r3-nor.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nor.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-rfb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986b-rfb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8167-pumpkin.dtb
> --
> 2.34.1
>
>

