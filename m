Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D573C5321E
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 21:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixKbmYGvhS5FjpfqpbEqorB5o9aAg2wHzCFmxTDCiA8=; b=VpHYqhDQNMMkoe/o2HqrrKhPG2
	y7H78dhTfZ/edud04csx5X8yxg1cO6DS23mUSfWVNGcoF9saORbuy81iMzQb/vrmsPw+YgFpuFvKg
	5TCM3gf+6ApDBIBL90OF2LBAG+D26DFZVrzlxcueOq0r0I4dkGd7hL300QNbJs7mCW01nMhGGvb7J
	v4QZqtkq/FWpm2G0BqOGxg1Ui3fOqdp+GYZwZa0qElCOBdsMpfByT+ELugGhdi8CWR5ziktkeJsW4
	plV0sPF3X68jxggrbTgY1CmG1BmiipFpXVVFIVDfXhLgwsWxiJQcyMTb+Zqu+QHVKf3cU1d+1Q33h
	AsaxS+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shbfy-00000000hEw-1eD4;
	Fri, 23 Aug 2024 21:18:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shbfB-00000000hAw-3eZk;
	Fri, 23 Aug 2024 21:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 989FF613E2;
	Fri, 23 Aug 2024 21:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA0DC32786;
	Fri, 23 Aug 2024 21:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724447858;
	bh=5vp3IopamqzyJfcMcKJMpVOvlvO8s/jVJqB3/inrE14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LixhdjOa+jatyNAkpqH2J44yHTLFT4cJcS86pPKY79wsQCnWjhNB8elz/Is1MFfrW
	 s0jAn6GXEMppILVvT4Fy/0J8bHr0jH0aeQzVi9u3yZYX9VdDA1F+aK0jFsR/o9ApIM
	 nwApemyIe+gVoG6obgLB/VoFyzRICBmyFT6a3d68nHXjG3JXcqg0VMDqt4w0fkox2P
	 UJKxhHMD/jcWIovJKht+UiyjZzhuJrc+3vWiaGXW7BBOIbkwS43n1VzsOlZltoDrjN
	 0cx4POjuqoe7c0Y1Ex9Bo5f6ezopTiyj6WZKFC9/JDwd1btGcHrhpIbphxoCso0WVV
	 sUPBV49rjFAPw==
Date: Fri, 23 Aug 2024 23:17:34 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Conor Dooley <conor@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
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
Message-ID: <Zsj8bmBJhfUdH6qT@lore-desk>
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
 <20240823-darkened-cartload-d2621f33eab8@spud>
 <66c8c50f.050a0220.d7871.f209@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FjTXgr77T+PgRI1H"
Content-Disposition: inline
In-Reply-To: <66c8c50f.050a0220.d7871.f209@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_141742_066191_96802F27 
X-CRM114-Status: GOOD (  38.21  )
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


--FjTXgr77T+PgRI1H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Aug 23, 2024 at 05:14:30PM +0100, Conor Dooley wrote:
> > On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
> > > On 22/08/2024 18:06, Conor Dooley wrote:
> > >=20
> > >=20
> > > Hi.
> > >=20
> > > > before looking at v1:
> > > > I would really like to see an explanation for why this is a correct
> > > > model of the hardware as part of the commit message. To me this scr=
eams
> > > > syscon/MFD and instead of describing this as a child of a syscon and
> > > > using regmap to access it you're doing whatever this is...
> > >=20
> > > Can you post a link to a good example dts that uses syscon/MFD ?
> > >=20
> > > It is not only pinctrl, pwm and gpio that are entangled in each other=
=2E A
> > > good example would help with developing a proper implementation.
> >=20
> > Off the top of my head, no unfortunately. Maybe Rob or Krzk have a good
> > example. I would suggest to start by looking at drivers within gpio or
> > pinctrl that use syscon_to_regmap() where the argument is sourced from
> > either of_node->parent or dev.parent->of_node (which you use depends on
> > whether or not you have a child node or not).
> >=20
> > I recently had some questions myself for Rob about child nodes for mfd
> > devices and when they were suitable to use:
> > https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.org/
> >=20
> > Following Rob's line of thought, I'd kinda expect an mfd driver to crea=
te
> > the devices for gpio and pwm using devm_mfd_add_devices() and the
> > pinctrl to have a child node.
>=20
> Just to not get confused and staring to focus on the wrong kind of
> API/too complex solution, I would suggest to check the example from
> Lorenzo.
>=20
> The pinctrl/gpio is an entire separate block and is mapped separately.
> What is problematic is that chip SCU is a mix and address are not in
> order and is required by many devices. (clock, pinctrl, gpio...)
>=20
> IMHO a mfd is overkill and wouldn't suite the task. MDF still support a
> single big region and in our case we need to map 2 different one (gpio
> AND chip SCU) (or for clock SCU and chip SCU)
>=20
> Similar problem is present in many other place and syscon is just for
> the task.
>=20
> Simple proposed solution is:
> - chip SCU entirely mapped and we use syscon
> - pinctrl mapped and reference chip SCU by phandle
> - pwm a child of pinctrl as it's scrambled in the pinctrl mapped regs
>=20
> Hope this can clear any confusion.
>=20
> --=20
> 	Ansuel

To clarify the hw architecture we are discussing about 3 memory regions:
- chip_scu: <0x1fa20000 0x384>
- scu: <0x1fb00020 0x94c>
- gpio: <0x1fbf0200 0xbc>

The memory regions above are used by the following IC blocks:
- clock: chip_scu and scu
- pinctrl (io-muxing/gpio_chip/irq_chip): chip_scu and gpio
- pwm: gpio

clock and pinctrl devices share the chip_scu memory region but they need to
access even other separated memory areas (scu and gpio respectively).
pwm needs to just read/write few gpio registers.
As pointed out in my previous email, we can define the chip_scu block as
syscon node that can be accessed via phandle by clock and pinctrl drivers.
clock driver will map scu area while pinctrl one will map gpio memory block.
pwm can be just a child of pinctrl node.
What do you think about this approach? Can we address the requirements above
via classic mfd driver?

Regards,
Lorenzo



--FjTXgr77T+PgRI1H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZsj8bgAKCRA6cBh0uS2t
rBjaAP4/vfGhFiS/vj9sssUIoNRlFJhijxXzvU5sMMqyl/kc1gEA62j6BqYh+DWk
hSTa7/6R9VZ5ok2v7Tl/oNzGhIOadQM=
=C0OQ
-----END PGP SIGNATURE-----

--FjTXgr77T+PgRI1H--

