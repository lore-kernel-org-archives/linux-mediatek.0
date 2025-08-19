Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB2CCA0EEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Aug 2025 20:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SW5RXsaoTZMO3L7MVmnLPWOD9kCXxsSPjnjHmdPSzNY=; b=dPxL8z0/CEyMiANI2IJjAV2FfA
	WH/hsnULEe6OlqPpo7Ak5HqhhXSqvI44QaVZo0DAkpoTJs2YbkeTUpPqOjp8If/qrUiLbi5BYJsdI
	Ja6uU74hL3+txWADiLAfVwhEVlJjP0YLspD2Q0ZfNa6PM+WuVxpGTI0GpetCbqJUsGYwJi6S/SgFa
	w70wvrNvmhIDgXoCQpKZFNPpicWAFzR6vX7nCEw5yqYv/6vGOrcVILsW6xBmeiSRKIJdFM9EzthhD
	2EHEwcWM9im+3I27hNxyY3bXgz14dZ6jgxwMJtrnUL2mbla3IdpdMB6FFtAMBfZbYNf5msfCz0GNF
	uuRj0iZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSZd-0000000BUuo-2H2t;
	Tue, 19 Aug 2025 20:04:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQPp-0000000B9kM-0282;
	Tue, 19 Aug 2025 17:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4814F60209;
	Tue, 19 Aug 2025 17:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD40C4CEF1;
	Tue, 19 Aug 2025 17:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755625592;
	bh=SW5RXsaoTZMO3L7MVmnLPWOD9kCXxsSPjnjHmdPSzNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/MoSGe8mNFWOhu9UdrTSL++yd9XMX6sovN4043gu3uwz4apOiMsXHefG8XYx2ASz
	 u6+TxltcwXEwNGWnlB5kA4tPDg1sPrxsiLGb8ve9xbUfRcaQvS4yAKMi4Mple/LhrB
	 neOuh9LLLBVEcKzcWHujXx3G4BXu4OVHWjX7P6Dtm3fw/0IMPsiH7hebGiOPemLT9C
	 69/+3/OXQjRyift62vVSXHni/PQ7Jvlxx8SMruy3CbgQY9TK57wllHzIpwpWCqCVWp
	 3x/V93tSursuW7++1vXF47LXvhzoaM42daQC82k4lESPwVWl2iVpvAkKsDgVOAZ0X7
	 FNE0yhWhpr60g==
Date: Tue, 19 Aug 2025 18:46:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Mateusz Koza <mateusz.koza@grinn-global.com>
Cc: angelogioacchino.delregno@collabora.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	marcin.czarnecki@grinn-global.com, b.bilas@grinn-global.com
Subject: Re: [PATCH v2 4/4] dt-bindings: arm: mediatek: Add
 grinn,genio-510-sbc
Message-ID: <20250819-cilantro-likewise-c05598130f86@spud>
References: <20250819130231.181571-1-mateusz.koza@grinn-global.com>
 <20250819130231.181571-5-mateusz.koza@grinn-global.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M1EmyOgt2pNN1sUX"
Content-Disposition: inline
In-Reply-To: <20250819130231.181571-5-mateusz.koza@grinn-global.com>
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


--M1EmyOgt2pNN1sUX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--M1EmyOgt2pNN1sUX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKS4cwAKCRB4tDGHoIJi
0txiAQDk/OW0DYIQ0yHsK6fT+9/UbqkFjCUTxVBCmoBai01fQQEAtO9abF18VjHJ
9moXkwimE1EOng4bPEsfg1pzhQXi5Ac=
=Znqv
-----END PGP SIGNATURE-----

--M1EmyOgt2pNN1sUX--

