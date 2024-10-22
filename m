Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A6CD2CE01
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 16:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXmuUPiQcLz+780hmXGCePZV8Zms9N6D/etwg0bzehM=; b=vNg+kvT8EPcTlFKMUretUu4z12
	OaWC2E1ZuKqOqmE+4eHH1obJBsavClN5eLelN9OUgcg0UXYUJd6plEZ8VmPjZb+P9c3EsU7rwWq7K
	EhI0IkFZCyBvDAzfoVhagL4YBiEsg1xHTvCTQOJfp5D0NKDuyJYFMRfaznJS8KdoyeyBRgHkfOmzQ
	XM6Dzu/TFpQsTKFB50x+ILtkVe1Okxwoamh7BRbcOmKpRAWeZVvzwPiRuylpHY0y40jpHQpzu0GLp
	yP0O5N8vy5kyGdNzQWqO0Dz8Gs0645Nkq1vyOMHsvmVKxF4dLM8lzq/GUAiXxJQFt15FVIpbRzcWV
	TYdHvMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3I4I-0000000BXHS-13rJ;
	Tue, 22 Oct 2024 16:49:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Hmy-0000000BTMw-1xAN;
	Tue, 22 Oct 2024 16:31:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6A8DBA441EB;
	Tue, 22 Oct 2024 16:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9B1C4CEC3;
	Tue, 22 Oct 2024 16:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729614679;
	bh=KVLjpT7ZX9iWAD/24xl4Rm7ljfOUWX5ZNEqXbQPnM3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dXREBZhnbOCRyRJEiURpCXE06H6GgDVmaDwtKIv+czCXlz1h/52ulbmftS6fG+Tnx
	 dCqMNvASD8vVoYHQuGjLuqnhuKgGT8YDa0kOiJrDe35i2qr8Xh7/WrZmIU/bQIj1Ja
	 u30hBzV0fpl90CzpENJ2z/BI6VyMbl71Yerxkvgzd8zsB2t35BZoH4heOmmCy9BY8Q
	 0x7oCYfVw9yi5tpbQnalxiSW58VaD+NMdTcur4P28wR9wzlnUBUAaesH5UAqDhbsnn
	 XyVe6/bHCA3EvoAZYBCp7ayqhIy3gaKahLp8UPxoMAOTZ5y32gz4Kr5ULC1fgxFVw+
	 XBDrdYm83U25Q==
Date: Tue, 22 Oct 2024 17:31:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5/6] regulator: Add driver for MediaTek MT6328 PMIC
 regulators
Message-ID: <8b4814d7-15da-4c0d-8d6d-0707a8c2eb74@sirena.org.uk>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
 <20241018081050.23592-6-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="33tXnPvbLYFDgAR7"
Content-Disposition: inline
In-Reply-To: <20241018081050.23592-6-y.oudjana@protonmail.com>
X-Cookie: Surprise due today.  Also the rent.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_093120_589002_14D750E2 
X-CRM114-Status: GOOD (  14.11  )
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


--33tXnPvbLYFDgAR7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2024 at 11:10:47AM +0300, Yassine Oudjana wrote:

> +static int mt6328_ldo_table_set_mode(struct regulator_dev *rdev, unsigned int mode)
> +{
> +	int ret, val = 0;
> +	struct mt6328_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	if (!info->modeset_mask) {
> +		dev_err(&rdev->dev, "regulator %s doesn't support set_mode\n",
> +			info->desc.name);
> +		return -EINVAL;
> +	}

If the regulator doesn't support setting modes it shouldn't have any
mode operations, then the core will take care of handling things
appropriately.

Otherwise this looks good.

--33tXnPvbLYFDgAR7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcX000ACgkQJNaLcl1U
h9Ce+wf/ZIulqT3K3IhJ+KVWRcq3tjdhPl/Mej1+R59I03LxzaQpb8o43HQxSAxe
SU0os389dSUkyF+kdhdT9f6YnIbW+vKIYPS38wU/5vfJN83xndKz8fBXDIxypF+W
p9CnJwD0oQdITaqwTv3R5hfguCOZjh4YZLOgF4lLnhrxE5n3xHTAd3xaDK8gFhDb
3igU5G1wWXv1t4bo88lF+fVeV/UvAllmm/cMimxvkDXpC+0rVwyVE+TMXZ6+70j0
HzjxF8MNukQREubLvlekRPkCKzcNJ69HTiMYsDNN8YEf2YNWgbfzTJIap31+vm1U
wiwCOzsm/3hF/CDv5/gVqprY892Ehw==
=zs8D
-----END PGP SIGNATURE-----

--33tXnPvbLYFDgAR7--

