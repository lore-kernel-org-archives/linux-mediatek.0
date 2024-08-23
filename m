Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E58C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NPDHG3m4+AVu1KBw0bB5y/vOo09Al9JNdt3OSSrp3w=; b=kHvnDAY+/g/ghUFKHdMDwRDg23
	/ZdAfG6TRu4PerHYF/kdSLW5VzjFCH9pmZQT+w9jVmYznf9xWsOodqGcYkMyl4n3OcKzM1RO7Fx0i
	V/rIh1ZTvS/AFiYpTB9fQzov2I0F9z9skQdLhrVUdgZ3fkyhSlJDOrXeyMJBZCZs/YrxtbMac58Sa
	+Ihh8NyMmEWriAyHe2ZQNvk9YpTRfeGOFnErfOi0zrtDUNYk81FHav5gBa7Yrg0VJ9LzC09iyEcZj
	5FosGjObC2lEBnsOkkasMcACq7T0/z5XFgmwKJGoaBXAwxU76qIeHELpgiFiHp8phZGsYRq3CDMLN
	lIOtbX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWxs-0000000HVnB-00ED;
	Fri, 23 Aug 2024 16:16:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWvu-0000000HV6w-1Wx5;
	Fri, 23 Aug 2024 16:14:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9F8F9CE1189;
	Fri, 23 Aug 2024 16:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF945C32786;
	Fri, 23 Aug 2024 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724429675;
	bh=+NPDHG3m4+AVu1KBw0bB5y/vOo09Al9JNdt3OSSrp3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EUT5Cev+71UA8itbQWCqA+02XUn7kfTK/aH6tyAkpXFEqA+FKPmJgfeTdGbk6QoKt
	 25tK71D66Q6p9hx4bysQbjB0O8bZCTW3ajlXFtXUufEp7tQ3Z8QjJYDBnqoj+B0jll
	 fLeo5m4aJOJ8vHOmbF3CuOPbZr+nJ/xi/aAgV//HebaRpATml1aoZsEge3FT0KcQg0
	 tS4cjW8KaCpgJB78gCsQb/qpbQQBiKOZrd/8PIWrVoTTo0nU4JV5VvbK0qRwGXn/GC
	 gUrZCfIIzszEjzSiHzrcO1/N5GYMQClKtr8NtOTcglqf10YXHDOPUuHpI/Lu+M2Mf1
	 jdYx9UamcDLqQ==
Date: Fri, 23 Aug 2024 17:14:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, ansuelsmth@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <20240823-darkened-cartload-d2621f33eab8@spud>
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="G0rf1eYjjAWuMMFU"
Content-Disposition: inline
In-Reply-To: <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_091438_597793_5FB86274 
X-CRM114-Status: GOOD (  20.91  )
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


--G0rf1eYjjAWuMMFU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
> On 22/08/2024 18:06, Conor Dooley wrote:
>=20
>=20
> Hi.
>=20
> > before looking at v1:
> > I would really like to see an explanation for why this is a correct
> > model of the hardware as part of the commit message. To me this screams
> > syscon/MFD and instead of describing this as a child of a syscon and
> > using regmap to access it you're doing whatever this is...
>=20
> Can you post a link to a good example dts that uses syscon/MFD ?
>=20
> It is not only pinctrl, pwm and gpio that are entangled in each other. A
> good example would help with developing a proper implementation.

Off the top of my head, no unfortunately. Maybe Rob or Krzk have a good
example. I would suggest to start by looking at drivers within gpio or
pinctrl that use syscon_to_regmap() where the argument is sourced from
either of_node->parent or dev.parent->of_node (which you use depends on
whether or not you have a child node or not).

I recently had some questions myself for Rob about child nodes for mfd
devices and when they were suitable to use:
https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.org/

Following Rob's line of thought, I'd kinda expect an mfd driver to create
the devices for gpio and pwm using devm_mfd_add_devices() and the
pinctrl to have a child node.

--G0rf1eYjjAWuMMFU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsi1ZgAKCRB4tDGHoIJi
0iA4AQC6wzm9QmxRgTNQzwzzkpYkzocP0r/W4CO1B2CMCIfV5gEAjPb/AwA8Dmi+
droBgJwkvUX5eDP8JBmPYCbc5/KtkQo=
=W4P9
-----END PGP SIGNATURE-----

--G0rf1eYjjAWuMMFU--

