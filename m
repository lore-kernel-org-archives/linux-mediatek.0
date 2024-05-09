Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA575C10F1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wFFlTnc55xfpgjhlPdcqsCb7nESgiO72PfzTtTnZX0=; b=uqZQUhxClL87wSTAulJ55IibHk
	PrpsmJpAlmxHcjoOwwmKXNghI1uxEOyFT5R3EmtWl6xw56rMoNQ+gLo5pDiljK2cJepFK3LD5H7op
	q/tCZP1X8I+GXD+cFGMcTwoVpaP7MNL1clhgw3O3CcQ1QfCDbtJy8WnI7nrcYkpHYLyc8lMaMWokD
	PTzsG0PAeYPMUVEA5GTqw+2E092dZIeuDMbogRQY83bFTfQWigClHWc3EZYaQfdOc+UMRjfa+Rav3
	Il+eod7fsMxAnIPkEhqPsNbqIWLlqlJastQlw41nJrPczUH6/DJ2uYHusuHf/NzoItOjbbHC+xSx3
	H6XGxNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s57H4-00000002AxM-2xzy;
	Thu, 09 May 2024 17:09:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s57Gz-00000002AtB-22CC;
	Thu, 09 May 2024 17:09:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2DCC461D79;
	Thu,  9 May 2024 17:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B45C116B1;
	Thu,  9 May 2024 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715274567;
	bh=+wFFlTnc55xfpgjhlPdcqsCb7nESgiO72PfzTtTnZX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HX1F+zCxhba2xkkS+/jxIRRSMCzSSUwEJxHOGHh7Yk+LVsZqozmdJHCZjYvt56RC8
	 AzEqRzXcpUMp2enG4vEFF6oZ79h54xD22MHdOUwQHHx4Sthb65ym8ollnjiPEccj0D
	 UP496q/8KBg0TlBI72oGGAQV+Plim21lrfBxA/mCDkyWneGKtb5Qx4gey64lFVRKHw
	 thc6gPwlrMC04+y7f+4+SM93YrIVW/ngC9E3FZvzDwWs8rVuKpSLxUb3uUwhZlc8JK
	 cqoAIFpWcw1IzEoUztJl5Ux1l6O+cze5uLsuI/Dph8BLDu4XkDzHT3d4aBj5oSFcEd
	 yu2Iuw8r5OiWA==
Date: Thu, 9 May 2024 18:09:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add BananaPi
 R3 Mini
Message-ID: <20240509-velcro-march-6878a4ee1f73@spud>
References: <20240509152157.10162-1-linux@fw-web.de>
 <20240509152157.10162-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1UDgLFyYubxOZ98P"
Content-Disposition: inline
In-Reply-To: <20240509152157.10162-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_100937_744670_2462125A 
X-CRM114-Status: GOOD (  10.01  )
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


--1UDgLFyYubxOZ98P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 05:21:56PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> Add MT7988A based BananaPi R3 Mini.
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--1UDgLFyYubxOZ98P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj0DQQAKCRB4tDGHoIJi
0luUAP0frxkua/Bw7NrNmTdtW5/WNrwwxuYa9/Wu69VhqSV8VQEAhbmO5/rayKXx
LwEsbLqjtjgZ+ORX0KXmqU1etJV7pAk=
=t38o
-----END PGP SIGNATURE-----

--1UDgLFyYubxOZ98P--

