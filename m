Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6076CC52D73
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 16:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dJTfmCaQH/epAduChi8xwoktHuAwN3wVsejcEpvwnM=; b=dWKVRTnDpWGzst8YPtdKmpgEkT
	08UjNnthIdAvrv6x67UICiVQA7T/GA9p5QeSmqeupegxsfDrymMT1u9CfOqjjKwNbHB6mg8rOovMi
	lFb2jBCTqt8UNpAHiclgesrv3DGY5PNkTHVE8nHrUBGQZmL8IwzKswpbxgINZMtXbzAe4nK/d/tUJ
	yM/ZJAq2j6sJRGCfbEEFkt995OiOa3c6djL/Ym5Fge8iqgrdgnlg94PWZ3nnAYZUkrquXv3qzNtws
	GyJXmRcrJpNPmGMCGAiH4DvTwyw3UYfqIlVQnJEna8lq3ZOYj1Ugey1kAYMmL6FZXSEkatAsRLcM5
	v4dhPcdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbjtl-00000005kVw-01gN;
	Wed, 07 Aug 2024 16:52:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbjtB-00000005kKS-0s02;
	Wed, 07 Aug 2024 16:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 24043CE0F99;
	Wed,  7 Aug 2024 16:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECCAC32781;
	Wed,  7 Aug 2024 16:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723049510;
	bh=6dJTfmCaQH/epAduChi8xwoktHuAwN3wVsejcEpvwnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c94AEnm1qcyepy0DA0Rfla6DAsg4n1jhEeg8qAJ5vW2rNajHgyHWJwLAjORmeOMfw
	 7m/Iz31lnm8hyAIcDM1hfrKt6A/+69tXQX2g3HSMNwwaBerNuukDVhqWShKtdS1lEs
	 CDlujBo6gmnH4D3Hm0otg7Hxnn2f0jeeRKR771D4uLlj2ban06ozu3rB1nN/l7yWQn
	 pSTUgP5vJjkemsUy9rBZxBUBMDv/kMZDrIcdwuPrKZS7Z2kowUkw9yWCEVPzjvEtaR
	 NKVa8V390mULJ6M16RIWPax9uQBejrpgE4+FbSIXtksNm3X4UXzbFEyUK7ZkLDgYiP
	 OsiAONdhym/RA==
Date: Wed, 7 Aug 2024 17:51:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
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
Message-ID: <20240807-magnolia-oboe-9e8e960390c8@spud>
References: <20240807091738.18387-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7E3aEdg7zXxKTcFJ"
Content-Disposition: inline
In-Reply-To: <20240807091738.18387-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_095153_448891_6D50C0FD 
X-CRM114-Status: GOOD (  10.21  )
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


--7E3aEdg7zXxKTcFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2024 at 05:17:38PM +0800, Macpaul Lin wrote:
> Convert the MediaTek MT6397 regulator bindings to DT schema.
>=20
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

An ack, not a review, because I didn't verify the regex.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--7E3aEdg7zXxKTcFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrOmIAAKCRB4tDGHoIJi
0ncGAQDFsDxp44VjZJxJhmVJVIxzpmhH0HGlbIs7Gb4nF+GptgEAlU8xS2U8ajFv
iWSuq2RK14cHc+RkiPuqmmByh77f8gY=
=RHlF
-----END PGP SIGNATURE-----

--7E3aEdg7zXxKTcFJ--

