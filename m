Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D77C10F1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cD69ICcj5UxBlb9k5M5IBUdciufwch/ZUuxho43dmes=; b=g7biTM9avw+Yr0/QcwMW5WjfTv
	Gya8rU66Hhytp97r5ItAbADlpA2m2EeKzEAPl9b3SiSo6ux+Srgbx3FQuhBSJ4SokrCtRsXRiF5e5
	9wBvwztCTKPjeSWHTmVfZ3OaNBq8HKk053P0NQW/f+qzJ2o8Ogf2bDwSuvIN+zPGRUhPO2Au42UQz
	WUsnAMjF3aSbw7Zz6zfqewwHjKdTQnxFjDLpWHa+FMIRWdiV0IOIjq+dXJT1vMcO1uqT+i0hVln5h
	kvegp9EIoamUkNMQW6m6EgyQKGMgj3I263KKKC2cpRni37M19J3a6CBxfTl2O/Heb5qO9pajadqti
	/j3hVa2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s57Jm-00000002BQp-1ksp;
	Thu, 09 May 2024 17:12:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s57Ji-00000002BPd-2E8e;
	Thu, 09 May 2024 17:12:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C216661D93;
	Thu,  9 May 2024 17:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC76C116B1;
	Thu,  9 May 2024 17:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715274745;
	bh=cD69ICcj5UxBlb9k5M5IBUdciufwch/ZUuxho43dmes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmcaWCvuTAwE0V4qjpfxETVLf9F2J5Qmo/FtC5jp+UKUhl7ySNG+KBuESwaKd3yHx
	 hwlj3vg4jK5L29lUClun8XTp1MBptH3DqI3fQOYU5LB6WPwNXmJJdG1sBnmXZHYMtc
	 9a0pBF/T3T+7v4NHsR/vhDDcrpf+EOZ84GZu3omNfQ6oUWsXj2jfSJvHCvtQCNe1fD
	 xiy8BfpxUK4Bpx87LS9zq2Aawbe5Yg0a5UgUOrep5IMpXY6EYtjrby6r+UmQlocOB/
	 FuIX50e64Y6TFUkRLzjRMEbeeNj/aDtcezYQ3/FdEi9TnDCLTu3t9qxcCKODyIc5um
	 02IRTZl6oQRUg==
Date: Thu, 9 May 2024 18:12:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add BananaPi
 R3 Mini
Message-ID: <20240509-petroleum-game-3f1fce762eca@spud>
References: <20240509152157.10162-1-linux@fw-web.de>
 <20240509152157.10162-2-linux@fw-web.de>
 <20240509-velcro-march-6878a4ee1f73@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VuTyzBpp28zUKDaK"
Content-Disposition: inline
In-Reply-To: <20240509-velcro-march-6878a4ee1f73@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_101226_647596_B4C28519 
X-CRM114-Status: GOOD (  11.57  )
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
Cc: Pavel Machek <pavel@ucw.cz>, Michael Turquette <mturquette@baylibre.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org, Rob Herring <robh@kernel.org>, Tianling Shen <cnsztl@immortalwrt.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--VuTyzBpp28zUKDaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 06:09:21PM +0100, Conor Dooley wrote:
> On Thu, May 09, 2024 at 05:21:56PM +0200, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >=20
> > Add MT7988A based BananaPi R3 Mini.
> >=20
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

btw, subject here is odd. s/dts: // :)

--VuTyzBpp28zUKDaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj0D8gAKCRB4tDGHoIJi
0sISAP4yfgcGwbSR0//UJHU/u1e/KT1zyw6C6I2NV5mGn9AR3gEAktdYhKOWv4G3
nLBkdVhjppQAPXsK4/uD936eZspTQws=
=DOFJ
-----END PGP SIGNATURE-----

--VuTyzBpp28zUKDaK--

