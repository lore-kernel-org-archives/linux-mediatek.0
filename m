Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A92CC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 15:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtKmInfvvXLuX9FjOPuZcypEVAmbMoQUI//+Js4u4jk=; b=LkklZNSFnnivMXA1Ip+7s8+U5X
	m8yxahv+zUJMOTcJuCYUzUbcE1dk0oM5FSxhh0xbG7HQ0rX2r0OmafosjH6rZv9hJj7UKUMrtwzXn
	UY5dYMfTy4sPRmh88JGZEpCCEY2esvrKegpY4WUti5L/3Bv8N35vQ9ECLNwfjOLuR6g/NxsJZud3z
	k7knjGncwnzbjf/2ffVGvug8RcK4yeIuo0plVhF+LmcD0NvyTm7XCmbPYYt60OziuQZh4ixJmrivP
	tRqZkBSCYrYW10+eISCkPHSQ1ZUUF2g+jLWeYiXMC3MnoDZj41D3GVh4lDShZliN+WsXjTxGHeECX
	OadTLomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw2B-0000000CehA-35O1;
	Thu, 11 Apr 2024 15:08:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruw25-0000000CebV-2YM7;
	Thu, 11 Apr 2024 15:08:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F3D05CE0E3F;
	Thu, 11 Apr 2024 15:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B28C113CE;
	Thu, 11 Apr 2024 15:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712848085;
	bh=LtKmInfvvXLuX9FjOPuZcypEVAmbMoQUI//+Js4u4jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n5aismU0vXber0p51QIM8mdivnNrkHImcg300Uaw/WmMEWrp3KqD529jG5qdbqjjp
	 UG9ceR5/+wz/mILsqt2hVjHluUXe2Behelh8xKrt8HtD1zrL9DG/3BPcLEbnN499/y
	 ywksKJri2Ftmtokp+1y9617wCTkrzjz2KAqOYTWtyk0c4zBitJC7SjPBSfnbrAhOGe
	 RjbftPe8gc8X8eH1nZZp3FWzTTvAGegXY7wjGS3l54WIrAgWxD4pdj9/V7naqAhzzG
	 qMILzRQ5klHGUmJrYGgb1sl5Yrz/3progW69ozjN7MqI6KS7iBSQBaXyjVmeaKYWB0
	 hfVyuO6bR2krw==
Date: Thu, 11 Apr 2024 16:07:59 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-scsi@vger.kernel.org, alim.akhtar@samsung.com,
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	peter.wang@mediatek.com, chu.stanley@gmail.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, lgirdwood@gmail.com, broonie@kernel.org,
	matthias.bgg@gmail.com, stanley.chu@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/8] dt-bindings: ufs: mediatek,ufs: Document MT8195
 compatible
Message-ID: <20240411-cost-subsiding-2b99ade956ee@spud>
References: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
 <20240411114300.169055-7-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y+fy7khI6h2d52aa"
Content-Disposition: inline
In-Reply-To: <20240411114300.169055-7-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_080809_918052_428F527F 
X-CRM114-Status: UNSURE (   8.27  )
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


--Y+fy7khI6h2d52aa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 01:42:58PM +0200, AngeloGioacchino Del Regno wrote:
> Add the new mediatek,mt8195-ufshci string.
> This SoC's UFSHCI controller is compatible with MT8183.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--Y+fy7khI6h2d52aa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhf8zwAKCRB4tDGHoIJi
0tFHAPoCC8Edra9DDj9qJuyLaXU+Uk2JdEUGbsBA/PVWegEknQD/XQwlh9pqIMzw
ZUU44BE3klW5g2qrJHtbKf8NW+GnbQs=
=AFco
-----END PGP SIGNATURE-----

--Y+fy7khI6h2d52aa--

