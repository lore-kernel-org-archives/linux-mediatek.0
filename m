Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394B2CD5BA6
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 12:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxyJWn5AYiOanBXZZzW2T/M+TWSK4u5UpGE6w2pjHxM=; b=wANPEDWTY5QfcmS3jTDqRV9ufs
	KMsrXU8Wf8PVlRiDVjlM54HSAe72PC87rRg91Mtyt6Js+DMGLEkoIabtomlHmBUbQKLNUEdfyVDLH
	rSyWSbuVFtviRNMdAn9bCkoFRvwBX5ZSl39P1UinKrQekT1uC5UF0jc2+pQmXjAfyj1mkJOTWQQLV
	uTPJteMar4RA0e3CbREQqy2bTni5S3hoPiSsYWxDOWFXehjbAx3uwZNN5C5feVPDVBl3ObMD3G6rE
	1TE4zAnDY+aNmWk27R65lrjuexbAjru4idX94NK8qVl3gEpSH0L7mHy3agFmN1JHlb7tkPigBbg0O
	Y8KMBw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZbb-000NbN-07;
	Tue, 19 Sep 2023 12:13:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZbW-000NaO-2t;
	Tue, 19 Sep 2023 12:13:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 887B61FB;
	Tue, 19 Sep 2023 05:13:54 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 715A73F67D;
	Tue, 19 Sep 2023 05:13:14 -0700 (PDT)
Date: Tue, 19 Sep 2023 13:13:02 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Peter Rosin <peda@axentia.se>, Sudeep Holla <sudeep.holla@arm.com>, Jesper
 Nilsson <jesper.nilsson@axis.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Paul Barker
 <paul.barker@sancloud.com>, Michal Simek <michal.simek@amd.com>, Heiko
 Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm: dts: replace Bananapi with Banana Pi
Message-ID: <20230919131302.26c30a31@donnerap.manchester.arm.com>
In-Reply-To: <20230918074122.73265-1-arinc.unal@arinc9.com>
References: <20230918074122.73265-1-arinc.unal@arinc9.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_051323_120002_898773E1 
X-CRM114-Status: GOOD (  19.60  )
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

On Mon, 18 Sep 2023 10:41:22 +0300
Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com> wrote:

Hi,

> The brand name is Banana Pi. Replace any mention of Bananapi with Banana
> Pi.

So in general this looks fine, and the comment change is surely a
no-brainer. But I was wondering if changing the model name is something
that should be done, as there might be someone relying on that?
And if we go there: "git grep" finds a number of boards using "Bananapi",
and some others with "BananaPi", so I guess those should be changed then
as well?

Cheers,
Andre.

>=20
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus-v1.2.dtsi | 2 +-
>  arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus-v1.2.dtsi=
 b/arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus-v1.2.dtsi
> index 235994a4a2eb..ef532494fc9d 100644
> --- a/arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus-v1.2.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus-v1.2.dtsi
> @@ -7,7 +7,7 @@
> =20
>  / {
>  	/*
> -	 * Bananapi M2+ v1.2 uses a GPIO line to change the effective
> +	 * Banana Pi BPI-M2+ v1.2 uses a GPIO line to change the effective
>  	 * resistance on the CPU regulator's feedback pin.
>  	 */
>  	reg_vdd_cpux: vdd-cpux {
> diff --git a/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts b/arc=
h/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
> index a37f3fa223c7..7f0948074945 100644
> --- a/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
> +++ b/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
> @@ -10,7 +10,7 @@
>  #include "mt6323.dtsi"
> =20
>  / {
> -	model =3D "Bananapi BPI-R2";
> +	model =3D "Banana Pi BPI-R2";
>  	compatible =3D "bananapi,bpi-r2", "mediatek,mt7623";
> =20
>  	aliases {


