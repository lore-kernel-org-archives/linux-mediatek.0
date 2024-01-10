Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332A3C4707C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 16:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59+le7fXjctIPbpN9qB4BCB8QpLgl+kvZFwrdOVqGm4=; b=VueqsqxJm3gnuddgutclP0mAPh
	EFzUG9Obna8xo3LBgiY6fKDAY/FYdEowquw1xejf5ur+oEL7BGzKG2vBNTQ2Rg8zZdniBAEPupkzv
	BbJiPuhMCS2v1b+03Bn/LDQUoykwJGv2ti+YANkKZZiWUC+Xih4gw49iYlm3bkJLJuh9MKCYups4+
	jMqFQqafvu1SuVQd3Vtf59USjUBm23D6pIsjbZ5Ee9jMLICCvJFlf3k+Qluxni+USxR4KZH/2xgEK
	GV8TH+tYTf8JHD4gYzcp0JltiJ13yIgoCby99F1i/ZRB+pRi4rvqWKVRmyET2t3nV6oei5AkqkxBg
	BLQTdPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNb4o-00Cmdy-0G;
	Wed, 10 Jan 2024 16:05:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNb4k-00Cmcf-25;
	Wed, 10 Jan 2024 16:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 09063B81DD5;
	Wed, 10 Jan 2024 16:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FF9C433C7;
	Wed, 10 Jan 2024 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704902704;
	bh=59+le7fXjctIPbpN9qB4BCB8QpLgl+kvZFwrdOVqGm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0Nh8JmSeLh/gTbSgK2b8WTCaIEeipH7goasBhQCrfZRmSBahEj7Ky+DgX3NKgGY9
	 XmMx0nZ48ovzcOigjXBme91g0Flmneme/+y8Qq3/scWgw7C4pAq7i5AmjZU7FkFuiO
	 DHpMk91c0Dnv/NF0jVcLrOwtsVFeUJHovwkCSyLBGpX85CtJ0eYMHlHEfRwNIqrkhC
	 Gh10IjhW7kGVzJzIXkqKEXxHUEQfn01/05HGM/fE9vnioT2NkjFONmYLfW10uVjAGX
	 7ejdWnX5AEX+aztvzw0Z3hCwdNjAdIJE8B5f5XbmRGnxEMEjuJaC9KtQLlfE+rSVdI
	 4viU2fkU8tuew==
Date: Wed, 10 Jan 2024 16:04:58 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: arm64: mediatek: Add MT7981B and Xiaomi
 AX3000T
Message-ID: <20240110-commend-scrunch-847e224918c6@spud>
References: <20240110095118.25598-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nFyTv1x5d4o5hpfV"
Content-Disposition: inline
In-Reply-To: <20240110095118.25598-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_080506_837853_4E52395A 
X-CRM114-Status: UNSURE (   9.40  )
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


--nFyTv1x5d4o5hpfV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 10:51:17AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> MT7981B (AKA Filogic 820) is MediaTek's dual-core ARM Cortex-A53 SoC.
> One of market devices using this SoC is Xiaomi AX3000T.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--nFyTv1x5d4o5hpfV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ7AKgAKCRB4tDGHoIJi
0m1ZAP9HShIib21NY/hwAr4GUciP78tQnAWEozG/x6/G0PZt9AD+KcxphqD4ptPZ
d2WQOFJ3JjaujTk+7/mNVeIdBsQMDA0=
=2AMC
-----END PGP SIGNATURE-----

--nFyTv1x5d4o5hpfV--

