Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A519C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQ+TWSaOKdcOzuSmNf7mMGWPrEUHCOUfLMCeLYasEjI=; b=XxbY9zxBjdu2sxojEeSSpcamWC
	LwDM37//h6GgA0Prh9x7ya5FHfXcYfi996eBspv/GTiGaSV8+GaZANrpnap0x357cUzY6rCF0uS8p
	qE2OeuUe/NDByzcJ6nrg1Nds0B11v1PzXhH1LV8NdtcEIdETZYXtq3T+tCv9YAOUDxsxB3YgKLwFS
	/ILeT72gPAinYrZXWAahPIW7IJGCwH18v7VbFYSI6o3v9o5a+4vtpNjzQPzW7XWiifJGR+lOk3+tJ
	iFEtPbnYRpFKvLX/fjhfkjRajgGDqv9no5TtxImyQX/GBBOVKPBvCG/GP0v9fUxHQlQ3dhVfyg1SL
	I3I3Zm6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns3t3-00CyWJ-DK; Fri, 20 May 2022 14:45:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns3so-00CySi-5b; Fri, 20 May 2022 14:45:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 05FF7B82BFE;
 Fri, 20 May 2022 14:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8C1C385A9;
 Fri, 20 May 2022 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653057934;
 bh=eyy20eLaoZHHhlcdY5b3GARHaDk/Ynm0A8xek9N7alE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hmtDN6rzpqT+fYQz7hSlNwVBz6PdgaCRI/+fJz0yhqebalgYoTqztGhfml4F5z/XW
 gs67hODZJYg7mmnma+XHmFxHpsoU24dDBPX6Ryslvk4ir075rW0zF3LS7fKUzlg8Tt
 8XbL1UbUZTCMK/JkbAWRdsAXAhq/iC5E9b01q4tAhBjTSNBcsKg0XfeK7HXhwBOsoi
 QUI1RzLfxraasVYNWRBQxspfvrbtit1S8xkfcQ4XDe77dNw2qIPogeoEUOJfRoCYRP
 Tu/TCg7LwF7BjrwIgHVkXJAJvYsmjICk3xMhO2CtF7Mqtbj75oFSVNcXC0n0Cbfttd
 LYWcH0eTSLc/w==
Date: Fri, 20 May 2022 15:45:29 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] regulator: Add driver for MT6331 PMIC regulators
Message-ID: <YoepiTUfdhkYByo7@sirena.org.uk>
References: <20220520133305.265310-1-angelogioacchino.delregno@collabora.com>
 <20220520133305.265310-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220520133305.265310-3-angelogioacchino.delregno@collabora.com>
X-Cookie: Happy feast of the pig!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_074538_529205_2E729A49 
X-CRM114-Status: GOOD (  18.44  )
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
Content-Type: multipart/mixed; boundary="===============3516698269099770250=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3516698269099770250==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p7DW/tPgeQFzSu9V"
Content-Disposition: inline


--p7DW/tPgeQFzSu9V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 20, 2022 at 03:33:03PM +0200, AngeloGioacchino Del Regno wrote:

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022 Collabora Ltd.
> + * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + *

Please make the entire comment a C++ one so things look more
intentional.

> +static const unsigned int ldo_volt_table10[] = {
> +	1200000, 1300000, 1500000, 1800000,
> +	1200000, 1300000, 1500000, 1800000,
> +	1200000, 1300000, 1500000, 1800000,
> +	1200000, 1300000, 1500000, 1800000,
> +};

So the top bits of the voltate selection field just get ignored?  Might
be easier to just write the code to not include the top bits.

> +static int mt6331_get_status(struct regulator_dev *rdev)
> +{
> +	struct mt6331_regulator_info *info = rdev_get_drvdata(rdev);
> +	u32 reg, en_mask, regval;
> +	int ret;
> +
> +	if (info->qi > 0) {
> +		reg = info->desc.enable_reg;
> +		en_mask = info->qi;

If the regulator doesn't have status readback it shouldn't provide a
get_status() operation.

> +static int mt6331_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
> +{
> +	int ret, val = 0;
> +	struct mt6331_regulator_info *info = rdev_get_drvdata(rdev);
> +
> +	if (!info->modeset_mask) {
> +		dev_err(&rdev->dev, "regulator %s doesn't support set_mode\n",
> +			info->desc.name);
> +		return -EINVAL;
> +	}

Just don't provide the operation for these regulators then.  That'll
mean a separate ops struct but that's fine.

--p7DW/tPgeQFzSu9V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKHqYgACgkQJNaLcl1U
h9CxpAf8Dcb0LgYJswtynhjrPmCXq5dYmagsB3EUxbEJcZXLX4uvOC2xRrQ8qv1F
COwjJwhrHEDaeQGrX0LjxykTeI3RGn4fZGaIOgXtPrqAxETrp25ihtDuIU90LKAr
cWrj82iP0HLYuKvPlkUh1uWlSMZ6vGh2WsJHhpNUIvZHd6swxslp3AXbS5L3hiTz
K8Vq+Vw0TI800vnGy2PysQVb9bM5C7XUtnDOdyrYUl8PEDuJdnuLwiKNF+wZ1WpB
R9ieqffSRUpsFsbJlWueKBcB/8UcHLJ+joI5/SYiL28Xz2fyM6ICUf6tHTARD++r
JM7ueL0Tht/hfeIyuPT987jU5lqPJg==
=7pHa
-----END PGP SIGNATURE-----

--p7DW/tPgeQFzSu9V--


--===============3516698269099770250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3516698269099770250==--

