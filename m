Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E78C48297
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 17:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssE/qkoLZ5mAgT6pFPq/GkLAGw2DNaFgPRYiIoTzYvk=; b=wx0uE8zvwdTeo1hQlRnFXeTnWf
	CE2XXC2U0fSCxQvm05H+5jDstw1syf8sbBbDp8sB9ggro9dniEv9zZZi+aXnmRt9UIRP3TU/O6Lrr
	hqJ7phV8l5xnq4DaszctJo+ObyVvnwAnbc1sBt808UsF+O047AewjujNhHTG6pgRo0sZ/lQj+GAxf
	II/K4cBb6EisyJyg/WJDyi4UymwNsBT2Wq43tWYb/n+cgXpBkKKft2LEJOO5nslfgRk1oNFRGDxr5
	CeWSv8oq0lC57fyK0n97gggbg6GoimS1/uFkWQKXBTXsuPsgV8K6kwWvn41kdE7iNXQ4wJ3W/Ryg3
	C7Vn1GMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYUkR-000000007vg-1YzY;
	Fri, 09 Feb 2024 17:33:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYUkO-000000007vD-2iMI;
	Fri, 09 Feb 2024 17:33:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 057056211C;
	Fri,  9 Feb 2024 17:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA33C433C7;
	Fri,  9 Feb 2024 17:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707499987;
	bh=1XYzzZb1vCasixfs09H2e68sWjMWNg0oBmQ78FPc+ks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqaoQHPZg3IiS027w3h5nnY88F2KRuo1GHsTBznrYloL4oI6fPRKHJdAp9/Yr/jCl
	 VCQpaXPiDZhmX3raswrmjZ4RVU9JZ+Nv7jQ9YtQLZitFXtSyNElBGhBAJZ4i1LAEpy
	 PNYtW8Eeq4P1IrgBBra0qvR7RDCupFZnbWhNAGQt7t3kUrKd+I4FpExZmKp8q2C1t1
	 +3ECsJGDN5O5r//a8dgw4YLwEeDmfd78NQfpePppJCru5s9C566oNhXIpue5EvAi3a
	 bRqMwY3bbZkuNdNSiu8+rGOPXxWgVThBWkwRG78JXThUpVXdP82eNluLz8Ndf9tQfL
	 a6TFTJ1fhO4TA==
Date: Fri, 9 Feb 2024 17:33:02 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] dt-bindings: media: convert Mediatek consumer IR to
 the json-schema
Message-ID: <20240209-dweeb-spending-40fe58e644cb@spud>
References: <20240209085616.1062-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="64QFRJ2df7LTNsQc"
Content-Disposition: inline
In-Reply-To: <20240209085616.1062-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_093308_748846_7BC00D96 
X-CRM114-Status: UNSURE (   9.90  )
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


--64QFRJ2df7LTNsQc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 09, 2024 at 09:56:16AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> +    ir@10013000 {

I think I prefer "ir-receiver" as the node name, but not worth a respin
IMO.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--64QFRJ2df7LTNsQc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcZhzgAKCRB4tDGHoIJi
0mkeAP49FDBNyOPSTkpBPA2ae5q078viRBKaqvGD3zvqUjUYTgEAjAQGf5apYIg6
uELmyDDlroF4SBmZe+mnR4zgJtRQoQw=
=Hqka
-----END PGP SIGNATURE-----

--64QFRJ2df7LTNsQc--

