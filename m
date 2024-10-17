Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5F4D3C52C
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 19:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6ijqNMYS5pR8FPmxtldft3WEVLW6jLANOjODJlO0IE=; b=M4WHyiKEQYrmgHoIZg+iP6WCVv
	V8DDcCFCM8voqxdBSOG2Cel65WPZ1FmhW8iVYG8utx+B3nQI+I1lPyrvFNtnbHGB0XY4LF1iHBLiV
	DdZEwHZtTrbEOKREjrf/HVb4xAOgOXNI214b/I/+3NeTXs7qYKDpw7hJOmdSmp8+w1hvFw1YDn8lf
	ZSj88V+uRJO5oZyynOl657uqABNzxREWxbc0a4zN699G8h6QcWiIiMakP5iPQ/FRGEZUGUvFqGHqE
	RbHTiMFNr9WM8dNcXupZo98wpDWRdzzWSeA1REg/4c5qOCknwNjCSaoGyXAkjTDC7y2rMs1DFQjJ7
	SWg1VOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1WSM-0000000G4B8-0VV9;
	Thu, 17 Oct 2024 19:46:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1WQs-0000000G43x-1Tul;
	Thu, 17 Oct 2024 19:45:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29A145C61EF;
	Thu, 17 Oct 2024 19:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C588C4CEC3;
	Thu, 17 Oct 2024 19:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729194313;
	bh=psIFTuXuseD2WW6j6T3TcBYpbsekC7/1uzW9/8EknCw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PSqchSS7uwi7mlbtwy+4OMoPLCw3Mz2QYvruFaNFiaijIflbUUGHzwVN4Lx6jDGk6
	 /8kMkJamzUqb5RkoyDdK3w3nCV4Zc706jos/rYxDOM9ydLTCE3E1pBYVJQSOOP+srb
	 VRF/gllrmrSFqMWW+ZtaIQCQuvdJaCeRqQFDrCpGCjCpMuGKVImn/FDulfvTvh/DdO
	 6RH2hWeVLjtONIwHKtxCAz69CD3v/WUZoz7oI9oD+wdnrm43D4bfRic6j3oU30kaw+
	 REZToRFVO2nML1M0m/uwKYWkdQ8+NGtBmtBr5wx5127W+OHK704bNA9KHHN4uOKVCy
	 HVUsNIOxLbPbg==
Message-ID: <347771679b3ac765de3f79c26f3d3595.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240926-clk_bulk_ena_fix-v2-1-9c767510fbb5@collabora.com>
References: <20240926-clk_bulk_ena_fix-v2-0-9c767510fbb5@collabora.com> <20240926-clk_bulk_ena_fix-v2-1-9c767510fbb5@collabora.com>
Subject: Re: [PATCH v2 1/4] clk: Provide devm_clk_bulk_get_all_enabled() helper
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kw@linux.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>
Date: Thu, 17 Oct 2024 12:45:10 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_124514_509783_A318444C 
X-CRM114-Status: GOOD (  19.71  )
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

Quoting Cristian Ciocaltea (2024-09-26 03:43:20)
> Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
> clocks") added devm_clk_bulk_get_all_enable() function, but missed to
> return the number of clocks stored in the clk_bulk_data table referenced
> by the clks argument.  Without knowing the number, it's not possible to
> iterate these clocks when needed, hence the argument is useless and
> could have been simply removed.
>=20
> Introduce devm_clk_bulk_get_all_enabled() variant, which is consistent
> with devm_clk_bulk_get_all() in terms of the returned value:
>=20
>  > 0 if one or more clocks have been stored
>  =3D 0 if there are no clocks
>  < 0 if an error occurred
>=20
> Moreover, the naming is consistent with devm_clk_get_enabled(), i.e. use
> the past form of 'enable'.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/clk/clk-devres.c | 34 ++++++++++++++++++++++++++++++++++
>  include/linux/clk.h      | 24 ++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
>=20
> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index 82ae1f26e634..4203aaaa7544 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -250,6 +250,40 @@ int __must_check devm_clk_bulk_get_all_enable(struct=
 device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enable);
> =20
> +int __must_check devm_clk_bulk_get_all_enabled(struct device *dev,

I'm not super excited about the one letter difference in the function
name as that's likely to lead to confusion for someone.

> +                                              struct clk_bulk_data **clk=
s)
> +{
> +       struct clk_bulk_devres *devres;
> +       int ret;
> +
> +       devres =3D devres_alloc(devm_clk_bulk_release_all_enable,
> +                             sizeof(*devres), GFP_KERNEL);
> +       if (!devres)
> +               return -ENOMEM;
> +
> +       ret =3D clk_bulk_get_all(dev, &devres->clks);
> +       if (ret <=3D 0)
> +               goto err_free_devres;
> +
> +       *clks =3D devres->clks;
> +       devres->num_clks =3D ret;
> +
> +       ret =3D clk_bulk_prepare_enable(devres->num_clks, *clks);
> +       if (ret) {
> +               clk_bulk_put_all(devres->num_clks, devres->clks);
> +               goto err_free_devres;
> +       }
> +
> +       devres_add(dev, devres);
> +
> +       return devres->num_clks;
> +
> +err_free_devres:
> +       devres_free(devres);
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all_enabled);

Instead of duplicating can you make devm_clk_bulk_get_all_enable() use
the devm_clk_bulk_get_all_enabled() function but not return the number
of clks all in this patch? It will make the diff much more readable that
way.

