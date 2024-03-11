Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157F8C5475B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtzMvH4RKGw+lusOUgxI15uUupyuHjm5gygT3sYbz44=; b=AVrak6vlCrHZ7psx6qk+Fi4Uxf
	YlQvEv61XFTeaFjMoyhP9JUYrYgxGHqa9IH7KNdDTaCzKhxw8bmrB/Z/RbdAeNwkN8MDykdsC2WIH
	EIx6NcVDsrbKs9z3PyIzqUOuqNrY/VT5x9TjieAYDL1U/rKF3xuhuGBCk0lA9qB1tbqYZRWJtreRN
	f4U4IQBMS/MP+Q+xGqDbiynWeMbKWkMAQnaBxcO+NY9RUQt5apnQp+FCmAztKfU8k1UmikD/13WU0
	Tv33F8Cr53rhGFqwJUVSaJWQtfK8Ck8Rjs17ap5+r5h6zFh6aKKqXCIyv8GlJ4oA3Y9YSStHJe9J6
	1bOLE20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjbHL-00000000fgj-3EXa;
	Mon, 11 Mar 2024 08:45:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjbHH-00000000feS-1Ej8;
	Mon, 11 Mar 2024 08:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A94160C36;
	Mon, 11 Mar 2024 08:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B7BC433F1;
	Mon, 11 Mar 2024 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710146697;
	bh=JZieu3zU1s4uVfTI4Zgzi+WlM1F7Ie9p1d0FIqjXRiM=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=LeZgrurtAo7JrdGrtriPGahn3+EwF9D5tkRERDVUbBZT5H6+Yo8LTDZrNVkhu467U
	 ykHgsNjHJsPg9lO+YNLDbw2PaWEZeb1S0BqZ94lpcemTbdthHbs1kTktCJTMvBsI/5
	 dL9mcoKhvN354OKZaoJ46P9sU59p1Jy1+NOsZ8uZtU77mEmKq/tRzcunIri3e7afE5
	 n2QVReGPsX3a2pbxLbuteTwNFKRTm4EC+YPJLjx0g+yig+OzYbxOR996UISrK9DoS5
	 RNznzAd+NmQQ0XK9HfF5S7hPgm5NhdgEA4HcmCuypGq3W2BITYLdmJtIPCbOvqeiNy
	 YBWG5Xj+rMl/Q==
Content-Type: multipart/signed;
 boundary=86841d8504dafca0128a03728b2bfca24996893b0da9c247055c8de47cf4;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 11 Mar 2024 09:44:44 +0100
Message-Id: <CZQSEKZ288OL.205CBK4EC7G2J@kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: add Kontron 3.5"-SBC-i1200
Cc: <devicetree@vger.kernel.org>, "Sean Wang" <sean.wang@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
X-Mailer: aerc 0.16.0
References: <20240221155905.1217340-1-mwalle@kernel.org>
 <20240221155905.1217340-2-mwalle@kernel.org>
In-Reply-To: <20240221155905.1217340-2-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_014459_443699_FCFF3F17 
X-CRM114-Status: GOOD (  24.21  )
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

--86841d8504dafca0128a03728b2bfca24996893b0da9c247055c8de47cf4
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Feb 21, 2024 at 4:59 PM CET, Michael Walle wrote:
> Add basic support for the Kontron 3.5" single board computer featuring a
> Mediatek i1200 SoC (MT8395/MT8195).
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Any feedback on this? Should I repost after the merge window or is
it fine as it is for now?

-michael

> ---
> v3:
> - add vsys regulator
> - correct the LDO input of the mt6360 regulator
> - add missing interrupt-cells
> - no underscores in node names
> - dropped regulator-compatible everywhere and use the correc node name
>   instead
> - reordered mmc0 properties
> - split mmc1 pinctrl properties, add no-mmc
> - removed all MTK_DRIVE_8mA
> - add i2c0 and i2c1
> - add comments for spi and i2c busses
> - add firmware-name property for scp (this should probably go into the
>   base dtsi?!)
> - add missing tpm compatible
> - renamed thermal zones to something more meaningful
> - add correct bias-pull-up to (some) i2c busses
> - moved reset handling into the PHY node, also added a compatible string
>   for the PHY.
>
> Mh, my memory is hazy, but IIRC I run into the same problem which was
> discussed on netdev some time ago. That is, the PHY driver cannot be
> probed unless it is taken out of reset. Which will only happen if you
> probe it. And the workaround/advise was to use the compatible string in
> that case, which is unfortunate.
> Just wanted to point out, that it is *not* the same as snps,reset-*
> because the latter will work just fine without the compatible. I'll
> go with the compatible for now.
>
> I did *not* add the vbus to the USB ports, not even on the front port.
> That is because of:
>   dependencies:
>     connector: [ usb-role-switch ]
> and we just have a simple USB3.2 USB-A connector, no dual roles. IMHO
> that is a bug in the driver, which should handle the vbus supply as
> optional.
>
> v2:
> - none

--86841d8504dafca0128a03728b2bfca24996893b0da9c247055c8de47cf4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZe7EfBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvuK8QD/UWncUk5POfZLlmd3CHTLcee2U3Na43dg
L/gT99njMMsA/0NaR+3lRjSoxExN2TN5WFbjChnjUOGtaN5B5CkV2VoL
=KYjX
-----END PGP SIGNATURE-----

--86841d8504dafca0128a03728b2bfca24996893b0da9c247055c8de47cf4--

