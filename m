Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEE8C27C79
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 16:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JAWJpDzmpr0BQoqiQMfikwtE07tNC448jmHVaAC/oQ=; b=PajQdGcPrTQQLJVh6Frxvd2M2W
	VPW55n4u+tgi+L/WslDdD52jM3ybKEPvr0z/5i0Klr6fo1XFa+cBzWJK/ySx9bZIAJWdD0Dl8pwVS
	3mJn6p4zBD667ytSxDgzIna4K7Ylll8wJitpaxoi0Cz8MdyX9Rc/DmzAPO+KCbHVhN17sAyGTEGV2
	lIs6k2B9Jd4h1x5BIhf2p5NK9qZB+TEggfJjSlSoD5S2LTMWxwio/h/jUpVhgayrtbcHAxO7EyhpE
	uxMjp765LKtuRYm9IV0G5+Ix5dQQ/UR7iCX7qbXANrIKtR8U9DXjtMpTic7sc45YI7lcEMjfKn3Oc
	XhXY5MyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFVv-0000000BoHZ-3xPn;
	Mon, 17 Jun 2024 16:47:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFVi-0000000BoAP-0Wa8;
	Mon, 17 Jun 2024 16:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2JAWJpDzmpr0BQoqiQMfikwtE07tNC448jmHVaAC/oQ=; b=qOGCHUbkvYO9pppcdn1y/G09Po
	5fbFUBFi4h4/XFEJExgFL56bcK67+MbxNa2IJqY98jqWLlveqQ0uCuyg/1acMevnlNgUEeyHX2QBa
	3ApQbhxrnb8cUw+ughnXxYk8o8Gdhsh+OulvrqF6BZGtN935NetNb7+uwK6leOhp8s68s4d6DEIHc
	6bf/6ry55zFhjPJgxzwsasHxawPhfTsAcVMQlOSuPmXFEhcqoZ8gOVAoaqkodENn1PQTylr833aHM
	3AwtcjfHGDar2OrZGfB9DEWlWDG1Y8hLr8V4zphDeBDFKVNoLx8LaZSX++/OCrMs3uCWFvfry6fnE
	n7+DKucQ==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFVe-00000006Wr7-2nUl;
	Mon, 17 Jun 2024 16:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4DD73CE125D;
	Mon, 17 Jun 2024 16:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D27DC3277B;
	Mon, 17 Jun 2024 16:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718642824;
	bh=2JAWJpDzmpr0BQoqiQMfikwtE07tNC448jmHVaAC/oQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5/Gm9TB6EUMMm6OKz0GAexrMi9CBJz/6yDk0Efj0QokaqaljiXEjxphj8oEvAs/+
	 OPHEf2j8A1hc1smGI8IfvBajWdOO1Efb5bLUTcd9uII4S4wpyQv23kYWXmjzhkwQ3h
	 Vs9vHxWkOqupPmdHY33bavNvo+9tTxaG4Zr0ozGYze7Kdi3kunDVPgyHPZ7ABXfG3n
	 bd8qAAny2AoQ7M1xg9Ej6xOCvwhX777+pNqfgNP8JNQAimanG5Fu5UE3kLzfsvdLXG
	 b6ODKSxpIiW9gT+BdVgT7fyE3FYJL8xj7oadXWNNb16m0BCyVHFgzowliLKy7HSedR
	 wI6wst5hHjQhQ==
Date: Mon, 17 Jun 2024 17:46:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Nishanth Menon <nm@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/7] dt-bindings: soc: intel: lgm-syscon: Move to
 dedicated schema
Message-ID: <20240617-multitude-referee-998504c2ca87@spud>
References: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
 <20240616-dt-bindings-mfd-syscon-split-v2-3-571b5850174a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QRkbanEbbdMctthM"
Content-Disposition: inline
In-Reply-To: <20240616-dt-bindings-mfd-syscon-split-v2-3-571b5850174a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_174711_110469_CD9DCF27 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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


--QRkbanEbbdMctthM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 03:19:23PM +0200, Krzysztof Kozlowski wrote:
> intel,lgm-syscon is not a simple syscon device - it has children - thus
> it should be fully documented in its own binding.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--QRkbanEbbdMctthM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnBogQAKCRB4tDGHoIJi
0ggiAP9We2auCjrUjnhLFnKXvxXv8sjQJRX/4KcNbM5fjg1MtwD7BiR7qMm2RWeU
Tk9/riWUz3g8JSUboHqvq9hxmrc/Bg8=
=rN+C
-----END PGP SIGNATURE-----

--QRkbanEbbdMctthM--

