Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CE8C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 22:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aun0C9qV6YJNK0y8IYWDwu6TzoJxNI1uGH6VUWDp41s=; b=whbj45wvoU9HSPVhTddFAtv/Ku
	fTi7Em8E6W0Id6FO6Silg4wVizu94wZoCUY8EOu4/4W36i102J59jPP6NSs9fr7DHC2gyGi0kx/j0
	R6MVirIVyq2U7+J7dyVx8cGE8r23EE0kSPP0VbEjzERu7bRx87gZYteruohMFYUUDd4bWE7cwaQGN
	FjOMXybkivPyOdpT3RSC5f7cjlyeUExsGt3uJtDwSCH7KzPojTnIKhWNeFwffHli5GmNuov9mb80v
	95dfv1ieur7M0k68M49IVrPAuKy+3ExLOsvcENDl6pW6Dsc/prVAqBs4Fx5UXCyca0ypTQyOAJvjK
	e+lnQj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbomS-00000006PHK-2K1O;
	Wed, 07 Aug 2024 22:05:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbols-00000006P8d-0Yvb;
	Wed, 07 Aug 2024 22:04:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F535612A4;
	Wed,  7 Aug 2024 22:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499CCC32781;
	Wed,  7 Aug 2024 22:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723068279;
	bh=Aun0C9qV6YJNK0y8IYWDwu6TzoJxNI1uGH6VUWDp41s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WD8LeQVAow1IdNnHwQBI+fkkL63wGuHbzaEJ0nXnuhL+yy7RdNJjlGaTdYy4rDM1R
	 +dNgRJc4cW/QXP0gSUmvZYylu3Z6H/IVZalPLGCHMJ+tB/kTSKVtgquyvedXjsFyzx
	 mb8AHYz2gq/QMPpaGRQ1bix2fJhe4Sw/AyzgM2W6LLenZRRZLCBlweMY4e30RytCO0
	 JApEm+f7IHD2QrdD54FF6vi/2WxjNjofsfHBcfqDpDfmRYzHrAGutIFHXf4+sR3j8w
	 hRWKrpGPD+sq7dpcFG79TxV1R7StPrMVCrl4I7ZqlccwSJXcjEScMp/7ZBuAVYl8LE
	 fQHKhO0lJT+YA==
Date: Wed, 7 Aug 2024 23:04:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Sen Chu <sen.chu@mediatek.com>,
	Jason-ch Chen <Jason-ch.Chen@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2] dt-bindings: regulator: mediatek,mt6397-regulator:
 convert to YAML
Message-ID: <ZrPvb_bT2ty-1V6-@finisterre.sirena.org.uk>
References: <20240807091738.18387-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lDZc6TitRszOoInN"
Content-Disposition: inline
In-Reply-To: <20240807091738.18387-1-macpaul.lin@mediatek.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_150440_260126_04E253B6 
X-CRM114-Status: GOOD (  10.90  )
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


--lDZc6TitRszOoInN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 07, 2024 at 05:17:38PM +0800, Macpaul Lin wrote:
> Convert the MediaTek MT6397 regulator bindings to DT schema.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--lDZc6TitRszOoInN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaz728ACgkQJNaLcl1U
h9D9XQf/eyGOxW1JkZAZL8CPVJKE1FXgdauk+Ue+UfyKHYdK6d+eRgfwjidtCKbE
XDGKNI6EvMUzOR6n6VAYFSwJUOUcM5ErhW0JQbIWMlCWNbTxrMFvJAP8cx5LiNR2
Ioms1PcpbZb+UTBQR4iR+W3KVBGeSvmIyhfkO4u0NtVT3TNPaofupAQJDx9esf3Z
L5S5VLcR5P3hJ1bcugw1lhJNx4LF3a0bNunfJWRcKS0hQIkiSTjeRM7qcqMrIGfI
vxLuBoP0+dW7G2JWdVZhWkjzDzAAyMvYlODNeHJjyrwyqwn9S8cQrEI0R3YALYs1
r0GXGFxti79tGxYpqb3pwMJgZ6+lKA==
=AjE1
-----END PGP SIGNATURE-----

--lDZc6TitRszOoInN--

