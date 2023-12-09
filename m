Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA666C4167B
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Dec 2023 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjfYm1ScheoAdKBvIPU+eCDQE4zi6HJjD8gDI09GdgE=; b=4na1R/dcmN/viUo+10oUMAclFW
	RMMMp7XyfNkZio3EzlqPkBKGK+6pMg3mQRi1IBkhWv4E1Thcjllol5jwh/IMXQVhUmFv4GqI/nZgp
	BETS9oNJd5wXlN6Dc/JabuWbX/5pB4AXC5BkqV88C0fxQjrfArjUcE21alFNhUIxl0ophKK6qPUF0
	W1Ldsm3OBKzwK67a8PrAtDkX3IPogY23RXu214Oq7C0mHDJHqrh6myxaIdcZbNuRMlQMqqW50IC+5
	zUIPpNq1eV2NnXLSOtBgfk9D+IyaSXua/Rc4c2wL4Q1LkLmAwCz/4v9J0eirYc3m34IGSpbQHftFb
	mSsw4dJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBykm-000DTR-0g;
	Sat, 09 Dec 2023 14:56:28 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rByki-000DSM-06;
	Sat, 09 Dec 2023 14:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1702133775; x=1702738575; i=frank-w@public-files.de;
	bh=D6qGzJbAE3IekvYtYZMMQTUiMOGnZivTZsLCuiZEJvc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=LBg12C2XesUHeSlIbmgIAsX0WJy9e6DmwKYiATW69JKbEaabOyiHvN8e2HrX1rhx
	 UQCy+11mln25K28tE2UBE77OzzQprFSREJHyK5APXsBlp6Kpl8sdNz1iQA9jPdRFE
	 BGPgDBxeBEbN3Gtm6+RtxSZ1rn2DauWlP/KIZolsLv6yY9D+HFEaAF5IAGEAgD9KU
	 r5F4gykb42OpA68z6MKjnqCnpTrbJRDBEjoyN6ENKzlzZBZuuJmmUglslXsRPYoU5
	 RbT27OxreeRvpnezl6YpSPKtqcs9u96zMs5LtqCFniaPY9A5GXgO5YYsSsXhh27T8
	 lihXEFgOCuRBT55VhQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.113] ([217.61.153.113]) by web-mail.gmx.net
 (3c-app-gmx-bs23.server.lan [172.19.170.75]) (via HTTP); Sat, 9 Dec 2023
 15:56:15 +0100
MIME-Version: 1.0
Message-ID: <trinity-a61f3152-8b44-4efb-9176-cc00a9449e63-1702133775512@3c-app-gmx-bs23>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>
Subject: Aw: [PATCH v2 4/5] arm64: dts: mt7986: add dtbs with applied
 overlays for bpi-r3
Content-Type: text/plain; charset=UTF-8
Date: Sat, 9 Dec 2023 15:56:15 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20231025170832.78727-5-linux@fw-web.de>
References: <20231025170832.78727-1-linux@fw-web.de>
 <20231025170832.78727-5-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:67/yvG/QGyj1824NIYWBlc23AcsRVaHZRZKmp4DEMf72W6R7TW9ID4uLAhXgudmEESmb8
 1332h6S8D+vLTrRyXnr1m7JAFI2U/+GGR9Ims94DzUBd8W3Qk2eRaiUdR/qvKBh+r+ESZfCW0qf5
 VFS27VSIQ9vuivJRra6sNcGB1pjaD1nGrYd2eo1jWNWTJba1P0FeZlv8iQEfo2BHTXf317tNtaIe
 wrhD7mNAqtktm2RlZrpRUOcDIK542yKlU6VmKhTXhzaNw62Kb5aDfP2qPiD6EiT3WTkVKLvpHgaZ
 jw=
UI-OutboundReport: notjunk:1;M01:P0:n4Mli8OCP/A=;paVJoseyvdJGmqsY+yOptuRgGU8
 h3tdspQA4pqiwxfdwHZ4hQCjKBIoe73Qvl2kgreb4UvnmL7xUY7dDxLAKP4hQR73KYh/ZpH6d
 nkoGBfo6PvzSH3CbUVYzbjdwEnlZm5K4F1u15icpK0ZGwhFBvme924WakKK4lZxK2htsxnGAw
 kIMBDJ7L8NmePKz+YuzodaDFiYh5agILuQUUPb0rKKnxwPekN1x/S5sBUyoWbg6BBtNnNT6u4
 VQwZf43z65r54pMgOKUcABf1uE1ix9Soif/N7WkNTWNeDK+PzKz4hQim/BzKIafTrNQePiymB
 fymX3x3G62yCz1LYnUXqTmvnMVW6jdstV72V9SAvtkY6lmW7XCsmCzFScDeE+ayXwkafKadzq
 Wx3nYf1hnu7fPPAtCk4sfYh/mqC0Z3tUH28c1HfN3fzSEEFXtUQdtWVFOw4XHqR3/X3qAVSgW
 kos75rIR1AOmEav2oxbPqdGIS3447zmdd8xBsPyUz5dHWQGs3iKmny6fJkME/i9FLiKYTOGs+
 az4f+ybpmSc8xrLGmA2F2LkyIyC7qk/dYKQ22YB426evzQFIhzJrQzO8HCdfKprOoAQtRTsYq
 4EJSqQheHyTrigy46uVMLeJmtAug+wXQo19CNAQw4wNSCAkvyjlDR+irsjJm3bWghOwcCFPzb
 HtJVsoBcJuZMgzffXlmYGVSciF435DHJ6vWAkeA5b86zpKzfSSsVHPFSDVuq5QRH9/94Dvdrq
 2Pr1CZJo/Zn7KqbgLlmSRmTHXzkhoCxdWyzXRVnRCvwndH2QzxyDHThamcZk+kbIjLvEec6bA
 YyVpmyznP7hi9WaHQXwTjZJwi9oO9tXrfcWyTa178Ah1E=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231209_065624_460939_7BBE03B0 
X-CRM114-Status: GOOD (  12.40  )
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

Hi

Parts 1-3 are applied here, but how to proceed with this? to add further d=
evicetrees like
for mt7988 we have to fix the "broken" dt-overlays first.

i want to keep to build the dtbo to allow dynamic apply in bootloader, but=
 they should be checked in
compiletime too and full dtb should be created for users not wanting to ha=
ndle overlays.

regards Frank


> Gesendet: Mittwoch, 25. Oktober 2023 um 18:08 Uhr
> Von: "Frank Wunderlich" <linux@fw-web.de>

> Build devicetree binaries for testing overlays and providing users
> full dtb without using overlays.
>
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> https://lore.kernel.org/all/CAL_JsqK_3xxD0DFwipXO85P=3Dq=3DEYjUdjE1_8g1M=
Ktvw3vVzx5A@mail.gmail.com/
> https://lore.kernel.org/all/CAL_JsqJSi=3DkJSix=3Df3787ULZnaCy_Y26Phdhy5y=
9fat_vkDuUw@mail.gmail.com/
>
> v2:
> make full dtbs multiline for better readability
> ---
>  arch/arm64/boot/dts/mediatek/Makefile | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts=
/mediatek/Makefile
> index c99c3372a4b5..24eeba0703ce 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -8,11 +8,33 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-x20-dev.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-rfb1.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-bananapi-bpi-r64.dtb
> +
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc.dtbo
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand.dtbo
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor.dtbo
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd.dtbo
> +mt7986a-bananapi-bpi-r3-emmc-nand-dtbs :=3D \
> +	mt7986a-bananapi-bpi-r3.dtb \
> +	mt7986a-bananapi-bpi-r3-emmc.dtbo \
> +	mt7986a-bananapi-bpi-r3-nand.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nand.dtb
> +mt7986a-bananapi-bpi-r3-emmc-nor-dtbs :=3D \
> +	mt7986a-bananapi-bpi-r3.dtb \
> +	mt7986a-bananapi-bpi-r3-emmc.dtbo \
> +	mt7986a-bananapi-bpi-r3-nor.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nor.dtb
> +mt7986a-bananapi-bpi-r3-sd-nand-dtbs :=3D \
> +	mt7986a-bananapi-bpi-r3.dtb \
> +	mt7986a-bananapi-bpi-r3-sd.dtbo \
> +	mt7986a-bananapi-bpi-r3-nand.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nand.dtb
> +mt7986a-bananapi-bpi-r3-sd-nor-dtbs :=3D \
> +	mt7986a-bananapi-bpi-r3.dtb \
> +	mt7986a-bananapi-bpi-r3-sd.dtbo \
> +	mt7986a-bananapi-bpi-r3-nor.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nor.dtb
> +
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-rfb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986b-rfb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8167-pumpkin.dtb


