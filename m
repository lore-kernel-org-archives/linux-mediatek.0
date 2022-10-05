Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0041EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 15:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/0T5c4cm0zeLKRVoyxDfN4hxTfGU3bJiIR/653y+uU=; b=ws0n6d6ljvHOas2bAI47B8g6YD
	dD2jr4SMkGR5V9QYhRnkAFKdIvTfDZ+y8+8ry/2DZJDs19uabDt00JBoNHSOZkP2HIeyBYuToxYys
	hVwc3cVvV42plAzCNNfwF5PDP4fo4s3/Z4O/lWXgNKaWvqe2oLl5RoRPOh4poeAGyNEmNQdQTv0WE
	v1gwP4upS7jDfGIc5NMc5zaYdYvASmp/1+vHf+uDxxJ2emx+z5ZN82Im+V0zJRX/wO7iS7S1SNykr
	O29347zvH32xZrpIstS6XciOmv+zaZ/FSRe/F85GNZur3P5stMgbnHtp17TfqTW20c93cquRKlfk7
	XIIAMWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og61r-00Em5d-El; Wed, 05 Oct 2022 15:09:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og61a-00Em0L-9x; Wed, 05 Oct 2022 15:09:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D703E6173F;
	Wed,  5 Oct 2022 15:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D912C433D7;
	Wed,  5 Oct 2022 15:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664982569;
	bh=t+Sxcbjds/CH5MY19al2gz2FR5p9mkdz/6BYz2fXlU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GEkW8fKbRTjT2keR2zgUqFVMVniZajgccILAJDNGPN9q1zLxzeoJyXaM2GIYjdARI
	 Ozed+h8b5er4/cHkEcb795e1xmsc9XDtHevgs0ue8OSaKwGLM8cA5/JpFzdJxbmXy0
	 9Bc7kbL6nYDMWWatiSpq6tJ+5ULIn+oG0rPpHF+vrJU+BpC6bFPYVGrbsTYSwiHapL
	 vGhSmvbXtZbOhghP1YDe1rdxdUkO70YFxGM3tvXLWKktvgPTRlr79XAL0wRbrXM+IP
	 knxKwhSWILClq9WetEPyGBjaH4geInJdsonp7TW36QptFF8/jgWrcjhX+vyb2BS6Xo
	 uBOSEsIkk1kJg==
Date: Wed, 5 Oct 2022 16:09:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v2 4/5] regulator: add mt6357 regulator
Message-ID: <Yz2eIslwcXKNaOfi@sirena.org.uk>
References: <20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com>
 <20221005-mt6357-support-v2-4-f17ba2d2d0a9@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ePzzjg1bOlGADoWy"
Content-Disposition: inline
In-Reply-To: <20221005-mt6357-support-v2-4-f17ba2d2d0a9@baylibre.com>
X-Cookie: Poland has gun control.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_080930_405724_B051C151 
X-CRM114-Status: GOOD (  14.31  )
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


--ePzzjg1bOlGADoWy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 05, 2022 at 04:57:24PM +0200, Alexandre Mergnat wrote:

> +static int mt6357_set_voltage_sel(struct regulator_dev *rdev,
> +				  unsigned int selector)
> +{
> +	int idx, ret;
> +	const u32 *pvol;
> +	struct mt6357_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	pvol = info->index_table;
> +
> +	idx = pvol[selector];
> +	ret = regmap_update_bits(rdev->regmap, info->desc.vsel_reg,
> +				 info->desc.vsel_mask,
> +				 idx << 8);
> +
> +	return ret;
> +}

There's a bunch of other Mediatek drivers doing this and multiple
instances in this driver, the helper should really be factored out.

--ePzzjg1bOlGADoWy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmM9niIACgkQJNaLcl1U
h9Dhhwf9EYMAixn0Ds9CE5Jhseu04EmZqy92PGrOBlm9jhRXA4+ZGnFamrEUyk6k
4LfHqEtFGXX7XUsH4OHsp2pJ19RHvzMMPGUAIyKf5IX8wbliO/8HnGy3L/K6a3Bs
mQqG+YisFR1zOlyvZNklAyNXUrGM+uXOniZPpVxH2TOpWUb1rRdEVn4wmsMNZscp
L3dMjRwyW+sqipIIkhInS1IqM7DCy82Kf4cYR4HFUPtD/MDRlY5fCyk65WErjZme
l2jebnqqmEvrWJNrJVN7SJU3LLBr8bdZtLCeLnIwsihBxvRdYTPOPzTllmFr10ZH
wddR1vLT2rhRPqblO03xX3vjGckx5A==
=Y+8N
-----END PGP SIGNATURE-----

--ePzzjg1bOlGADoWy--

