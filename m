Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935B2EE57CF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 19:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3x34o9ccfmgr+Yc5/Xm+YmpddZXSeb8HJ9VjzD4S6cE=; b=GICdWe8v8DFEZSkWXIFAFh6OfX
	Ka8VHyv46e/jnnqdDHahOCxkfSQLamV7SdlEdg3edNz0buB7ZpuAluz0qAIUynl13anPdoCKe3eQ1
	fkg/QBWWUk6LeS9FiYAEZyIbAGME4FxTbFWl5awVnDYuiIC7OmbwWsPJxLs+gCZaQ+reESne58iz9
	3iS5QJZWTR8HR70ETjiasfWuLeyVr1Xf8iSFui/zT5U+Uz6XEeJf4BnD0T6hkTb69lITVKDdNrNMQ
	X30ctioKv1Su111DNI0J3NhU8Sytly8rI8fPKt89pVpqraXXjp+UIj1JCJV8cmKxSDjLk/lf+YNfW
	ecFJKIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soSr1-0000000AjYk-45d5;
	Wed, 11 Sep 2024 19:18:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soSpx-0000000AjPp-3SEv;
	Wed, 11 Sep 2024 19:17:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D2365C03EF;
	Wed, 11 Sep 2024 19:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C82CC4CEC0;
	Wed, 11 Sep 2024 19:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726082228;
	bh=3x34o9ccfmgr+Yc5/Xm+YmpddZXSeb8HJ9VjzD4S6cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaOyqbUtFT5BXaPw53avIWqv+U+o7o3dUt27/Pua04UYM0YZ1iJQ/WOVWiYt2rSaW
	 VA5wluQlEkAHAq6oY1mXmYtmqTOPFvWx9VfDZB9KRmyvMNoeCSb4ozXjT8SrMwVaX8
	 Ot1EmkJh9sHHeLi9kr4bxvCAyeUJg5JosKmD4LhGbVKxJDIqOQyYojrCrbI7m2qtot
	 CpisDR0f9567Q2CvRddlBnPCtu9klu49Kr6kFhqlLLJlBh815pIfOvonbECf891CaC
	 jiVhfAtG+v1WeZBW70gXqhsFgsbKjkrhiPQv3HVWkke944yZCyoB6rqCx6BhLZLAdk
	 kx6GwtLeN8kZg==
Date: Wed, 11 Sep 2024 20:17:04 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: clock: mediatek: Drop duplicate
 mediatek,mt6795-sys-clock.yaml
Message-ID: <20240911-train-carnage-f19405590f8d@spud>
References: <20240910234238.1028422-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kx11F4IBYxbm4SiO"
Content-Disposition: inline
In-Reply-To: <20240910234238.1028422-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_121709_927573_3BF5C4F2 
X-CRM114-Status: GOOD (  11.50  )
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


--Kx11F4IBYxbm4SiO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 06:42:37PM -0500, Rob Herring (Arm) wrote:
> The compatible strings for mt6795 clocks are also documented in other
> schemas:
>=20
> "mediatek,mt6795-apmixedsys" in clock/mediatek,apmixedsys.yaml
> "mediatek,mt6795-topckgen" in clock/mediatek,topckgen.yaml
> "mediatek,mt6795-pericfg" in clock/mediatek,pericfg.yaml
> "mediatek,mt6795-infracfg" in clock/mediatek,infracfg.yaml
>=20
> The only difference is #reset-cells is not allowed in some of these,
> but that aligns with actual users in .dts files.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--Kx11F4IBYxbm4SiO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuHssAAKCRB4tDGHoIJi
0uDqAQCgJaSn0aIreDVI8iXzweTSUXhnaVeVmWq1uBIOFi4VuQEAuIB5sxXIZXZR
4zajWaprYZit0ZrBumAPqpkI8wjf3wo=
=W+In
-----END PGP SIGNATURE-----

--Kx11F4IBYxbm4SiO--

