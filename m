Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0D3C47DDB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Psx3hXEnUdT3wJcX6Rik+iN7Pj8TKoDaOwnAy0vzvkk=; b=QEcb52f5a/8OZ+2St6X1lF8zh9
	GPDuj00oK3UXKbjM4EgZPsbb6aBsXDawdfzYwCX9/rJl/VMaVQT1413oo/GraaVtHA0r01oKZeSIf
	ZpQOqDjUconbY797MEb0+cHuO54ra3Z9OOiE63oEgT4ewG/eGlffGYLVxK6dAPYSSWnXJXJYjdqwZ
	sFEsvwaB4O0lYpU9WQT6FrcDlMpu3TvUXCSvbCnYgqWimd/5ub5RShXXhCbjG/OzxEcBjCUXEZDcB
	Fri+3r2kBfkdn5udsIWHJQe9VpqD9D/yNXgb9dWpRkjtGRgA+7qMfa6AJdF/ERZCbXkamBm9VdnoQ
	PLmIeIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIWT-00000003fJV-09fX;
	Fri, 26 Jan 2024 09:29:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIWP-00000003fHL-2JKa;
	Fri, 26 Jan 2024 09:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1706261354; x=1737797354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nKBYb8AiFMDEoSH6ix/SA0rKwkG4+NOIJo8+mqHka+k=;
  b=gBIi99q+1SvAMx8XKrLduRuYlD8zdJjYx860s4ka9VZDzOI+WX3NVnJ8
   8E8c4zZUr1+jssqc874yVmlG8GaEfx77GvoOzDNz8pec1d8MktUVRltw8
   jFx0JT/2OOzcBt8jN6matfa4Imgk1QfQG0GTDs661Dy5xKZmeMtCVIyLr
   d4c467haFuWKEqAh/c2LM+BCoCFOD2fT1HbZlFf5tmkVkp0JwcWrjbhY9
   U7TyyZDnTpc+FfNzLMl6ePPaZt2YPzZIuAsb6O2pF5Az7tAWLrJyLCpWU
   3r3dKmTjKylQkOcz14CaqpbK8lXzH8XvqomRjzzJXGt0FcAflTr7IfwrM
   g==;
X-CSE-ConnectionGUID: DXk/349nTLGQJU8P3BOkdw==
X-CSE-MsgGUID: uxq0XLC8Q4qT3IJ/CM0bvA==
X-IronPort-AV: E=Sophos;i="6.05,216,1701154800"; 
   d="asc'?scan'208";a="15343956"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jan 2024 02:29:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 02:28:30 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 26 Jan 2024 02:28:27 -0700
Date: Fri, 26 Jan 2024 09:27:50 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <chunfeng.yun@mediatek.com>,
	<gregkh@linuxfoundation.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <linux@roeck-us.net>,
	<heikki.krogerus@linux.intel.com>, <cy_huang@richtek.com>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mt6360-tcpc: Drop
 interrupt-names
Message-ID: <20240126-shut-gusto-1da71fd410be@wendy>
References: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
 <20240119-eldest-discharge-e2d3812be0a9@spud>
 <12b7b339-498b-45c1-bc5e-05e07660aefa@collabora.com>
 <20240123-procurer-jumbo-ebbec485505d@spud>
 <4fdbc3d8-3d44-4c2c-aae6-daa0b431e1c9@collabora.com>
 <dc9773aa-690f-47b5-b60a-a79c1e2dbaf2@linaro.org>
 <abbc1135-6d32-421a-baea-123a9f761362@collabora.com>
 <20240125-disdain-delivery-ff3bf246bbe1@spud>
 <20240125-elective-sermon-32dc2cba79be@spud>
 <27070454-09e6-422b-95f0-5d674735426b@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7Cd24lZZUOXWuHuK"
Content-Disposition: inline
In-Reply-To: <27070454-09e6-422b-95f0-5d674735426b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_012913_624681_709B7047 
X-CRM114-Status: GOOD (  12.11  )
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

--7Cd24lZZUOXWuHuK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 10:15:54AM +0100, AngeloGioacchino Del Regno wrote:
> > | required:
> > |   - compatible
> > |   - interrupts
> > |   - interrupt-names
> >=20
> > It looks like it is a required property after all!
>=20
> Apparently my brain's binding had
>=20
> required:
>   - blindness
>=20
> :-P
>=20
> Yeah, I have no idea why I didn't see that, sorry!

Possibly because your patch never removed it from required in the first
place, if you only looked back at that, and not the binding (or Rob's
bot's report), I can see how you could miss it.

--7Cd24lZZUOXWuHuK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbN7CAAKCRB4tDGHoIJi
0s1AAP99lEEN3Rs36ZLVjjD7+MTaVanX2HF/Wf0i0gDwQVdu0gEAnmQlWcC9h9ni
yidZUPY+ZpGMidClS9ob3KGIc+iQ3AA=
=3mBr
-----END PGP SIGNATURE-----

--7Cd24lZZUOXWuHuK--

