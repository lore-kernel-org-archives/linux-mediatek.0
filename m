Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3E2CA0EFC
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 10:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9B46RjCnvIYgOjmNBN6IsO3QwW3ATnjcWB9o16GdieI=; b=rMp9Scw6palt02nqbKunrrblcR
	l/Ulvaq77UbEWlTzp9mr76+BiK0u31RSWmTtNyqMqmDVywQTuXXfwDSxgqJ5mjfakv2MLeo4iOXEb
	RYSMw7wHkRVtZHCW5gPGPkw029rYX7tCH6m87LVwShU5u0v6uRvPfHBa+Xb+fUCAbd3zRQhFyA/Rv
	QkpizRreSU4vD7pm4mD8SGBzO8HbDoFd54jkRnuxgWi6J3dfMs/YPBiyKH+QGdpt5xeuOuIhAovql
	qOiUwHRzdO+Xyl+nGb/l+phIz6QWb4kfnR2WBZ/BU/ssXBKPqzM7xQDxjknKGP/yDxWGs8E1uj9jh
	VDjMDKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjzIE-00000005umD-3ytp;
	Fri, 30 Aug 2024 10:55:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjzI0-00000005ufS-32Xw;
	Fri, 30 Aug 2024 10:55:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 721EDA446BB;
	Fri, 30 Aug 2024 10:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94486C4CEC2;
	Fri, 30 Aug 2024 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725015335;
	bh=WiGHYqQ3xuBvbimQ4RqLRQywBEUVEijfKbSvmrPedj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qi3JE0Is0KSULRu+fHNrtUz2DyqQgaeXzDIGycaqMRW3M7Y/EmT74mQyMS1sU87ye
	 KGHIO83AP2PCPYyko+OIe6/mL6Etc4gb50kgEXVnW44Jlgm4tbn1buj1W8bzD/KSLD
	 6GewoEWUoTFR+KOqysHF5g6WwYgbUjR+EBsMOFlbl98oe6ypzCBfVVm1F54opEwSRV
	 UKvGLSTh1yj5MB40y7PBMKurc1+3ciV1yhYI+krxr6XAwidltjcF481DWyTFhk4J37
	 Z22rXE0rcEep5BGKVYla/u3JntoVAz2YK/uEvvumgssZleJ7IBxFKGjOHeNUWluFxn
	 fkbiwEMm4C+rQ==
Date: Fri, 30 Aug 2024 12:55:32 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
	Conor Dooley <conor@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <ZtGlJBORZaFm_77K@lore-desk>
References: <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com>
 <Zsj8bmBJhfUdH6qT@lore-desk>
 <20240826-kinsman-crunching-e3b75297088c@spud>
 <CAA2SeNJ2Gi+3Za+jvAVqqbx7xEGLqkDBkJ8vL=pA=ZbKWOfp=Q@mail.gmail.com>
 <CAL_JsqLBGwgX=PeCqP8+iFj6uvAO4O_dTvz7x1c+T1Kz+-q-QA@mail.gmail.com>
 <66ce1b04.df0a0220.a2131.6def@mx.google.com>
 <qro6jbupm27vvulymb4ckn7wm6qbvrvnydzjyd42metarlh2t2@hxdzvff4jdus>
 <66d187f1.050a0220.3213d8.ad53@mx.google.com>
 <2c9aafdd-000b-4e8f-b599-4f57e7eb0ca7@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IYN2kXd47Q+edkfX"
Content-Disposition: inline
In-Reply-To: <2c9aafdd-000b-4e8f-b599-4f57e7eb0ca7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_035536_911730_77C77892 
X-CRM114-Status: GOOD (  26.28  )
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


--IYN2kXd47Q+edkfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[...]

> >>>
> >>> Hi Rob, thanks a lot for the hint, I hope we can finally find a solut=
ion
> >>> on how to implement this.
> >>>
> >>> In Documentation the block is called GPIO Controller. As explained it=
 does
> >>> expose pinctrl function AND pwm (with regs in the middle)
> >>>
> >>> Is this semplification really needed? It does pose some problem driver
> >>> wise (on where to put the driver, in what subsystem) and also on the
> >>
> >> Sorry, but no, dt-bindings do not affect the driver at all in such way.
> >> Nothing changes in your driver in such aspect, no dilemma where to put
> >> it (the same place as before).
> >>
> >=20
> > Ok, from the proposed node structure, is it problematic to move the
> > gpio-controller and -cells in the pinctrl node? And also the pwm-cells
> > to the pwm node?
>=20
> The move is just unnecessary and not neat. You design DTS based on your
> drivers architecture and this is exactly what we want to avoid.
>=20
> > This is similar to how it's done by broadcom GPIO MFD [1] that also
>=20
> There are 'reg' fields, which is the main problem here. I don't like
> that arguments because it entirely misses the discussions - about that
> binding or other bindings - happening prior to merge.
>=20
> > expose pinctrl and other device in the same register block as MFD
> > childs.
> >=20
> > This would be the final node block.
> >=20
> >                 mfd@1fbf0200 {
> >                         compatible =3D "airoha,en7581-gpio-mfd";
> >                         reg =3D <0x0 0x1fbf0200 0x0 0xc0>;
> >=20
> >                         interrupt-parent =3D <&gic>;
> >                         interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> >=20
> >                         pio: pinctrl {
> >                                 compatible =3D "airoha,en7581-pinctrl";
> >=20
> >                                 gpio-controller;
> >                                 #gpio-cells =3D <2>;
> >=20
> >                                 interrupt-controller;
> >                                 #interrupt-cells =3D <2>;
>=20
> No resources here...

ack. iiuc, all the properties will be in the parent node (mfd) and we will
have just the compatible strings in the child ones, right? Something like:

		mfd@1fbf0200 {
			compatible =3D "airoha,en7581-gpio-mfd";
			reg =3D <0x0 0x1fbf0200 0x0 0xc0>;
			gpio-controller;
			#gpio-cells =3D <2>;

			...
			#pwm-cells =3D <3>;

			pio: pinctrl {
				compatible =3D "airoha,en7581-pinctrl";
			};

			pwm: pwm {
				compatible =3D "airoha,en7581-pwm";
			};
		};

>=20
> >                         };
> >=20
> >                         pwm: pwm {
> >                                 compatible =3D "airoha,en7581-pwm";
> >=20
> >                                 #pwm-cells =3D <3>;
> >                                 status =3D "disabled";
>=20
> And why is it disabled? No external resources. There is no benefit of
> this node.

This is just a copy-paster error.

Regards,
Lorenzo

>=20
> >                         };
> >                 };
> >=20
> > I also link the implementation of the MFD driver [2]
> >=20
> > [1] https://elixir.bootlin.com/linux/v6.10.7/source/Documentation/devic=
etree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
> > [2] https://github.com/Ansuel/linux/blob/airoha-mfd/drivers/mfd/airoha-=
en7581-gpio-mfd.c
>=20
>=20
> Best regards,
> Krzysztof
>=20

--IYN2kXd47Q+edkfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZtGlJAAKCRA6cBh0uS2t
rFzQAP4mYUCwg1JRcirltoinC6e9pS7gd5QYY6CO37on5nvrvQEAnfzJf6uwCbLw
wY4Eg/KVWSaHIB8anfeZPF6f9L4DyAc=
=nxyD
-----END PGP SIGNATURE-----

--IYN2kXd47Q+edkfX--

