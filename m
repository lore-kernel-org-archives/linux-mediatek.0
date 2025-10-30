Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FC9CCF9F0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Oct 2025 19:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRAsw0Jvy30LSQZn/ZsjAXFfZkS7Dgm4QYXlwV0+OL4=; b=Bi/INwxrsq/UAtTWfAldXH1S4s
	06KhMhFLfrSahGWseYlrARVGne0MNPq3ALG2nUrOEvwNHKtXgY7vKEGfr8QwMOpUKh0GVAPJjt/9R
	swR/ACEkFExQDR17kDtB/6iYZJ4UDvElrLvXUkfoSV5J3iHWTJ2ePRqE6rPUfIXGx3LNFMU1pyeFr
	wI/VnvALw7AiCXoJuCUvN4O5kc3f49XrpEXn3vSbcaXZw/ZRjQOWBY3hXIoL/oZ25cvBJr3DCV7v4
	/gtrM3ZuBwZsYeocWVmUG4bvzL1ZKrrCBq3chQouBBElpGUoRhCG/BNk3ucJke50LJMXIt0vNj/bC
	2vsIWBdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYME-00000004gDg-44vy;
	Thu, 30 Oct 2025 19:30:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYMC-00000004gCu-3aQu;
	Thu, 30 Oct 2025 19:30:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8586603C5;
	Thu, 30 Oct 2025 19:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED54C4CEF1;
	Thu, 30 Oct 2025 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761852647;
	bh=NRAsw0Jvy30LSQZn/ZsjAXFfZkS7Dgm4QYXlwV0+OL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ebvt9yUu8m6PsKLurYOqqCnVWud9FvHyc/A3AN2f/4EJ3cps8JYgmLc0XkPB3Olyt
	 9n8mjSePLWgCaUG0kU/2WZi/zd5V9HyVWeCxPIAnp9xrCyoEEm1fHg1jgxljTZMHN/
	 ehiuaTBlLV2H4+lcYXaMNGuC3LTwZXiI07JsRGy6cZYsxSglExgabAR3SYCHwXEJUb
	 U1VP9To7+sN4eaN1F/isowHDHxri82nEUUt/EROBckHTw7A18nl+95bBPiW+MfINj4
	 j/LtizuQdJHgYv8D7/2DvhPbj6hv5q+9xvAMNL3/g4B/2SX3Mc6pzXpv+9TlYJZGoC
	 OL2quRY9rUaLw==
Date: Thu, 30 Oct 2025 19:30:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Jack Hsu <jh.hsu@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, srini@kernel.org,
	ukleinek@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
	chunfeng.yun@mediatek.com, wim@linux-watchdog.org,
	linux@roeck-us.net, sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com, andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com, jitao.shi@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 02/11] dt-bindings: iio: adc: Support MediaTek MT8189
 evb board auxadc
Message-ID: <20251030-deftly-lent-0588c4e910b1@spud>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
 <20251030134541.784011-3-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZN1lBKxxaIlgYPSc"
Content-Disposition: inline
In-Reply-To: <20251030134541.784011-3-jh.hsu@mediatek.com>
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


--ZN1lBKxxaIlgYPSc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ZN1lBKxxaIlgYPSc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQO83wAKCRB4tDGHoIJi
0kDdAQCPf+4uCaqPObbOK6bxqVafljn62RS/VLsXnr57gJhBUgEAlKxfisQruqi1
UdsEXXfBl/WLLQq9XvKlMn++N69iBws=
=Rorn
-----END PGP SIGNATURE-----

--ZN1lBKxxaIlgYPSc--

