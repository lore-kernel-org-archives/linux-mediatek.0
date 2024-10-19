Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3C9D3DEA7
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Oct 2024 05:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6hLQCbuTUDl9Yc3yHCmu1QaWLKKG/c+9FTM9eBCZtg=; b=SfHTwOkOMzjdHc/4dNOQZrqZ9c
	T44lpii8ILP5njsl3aEy0W7qXAptIb0xp8OEsMNHh6nZ5NPhjl414caHOgkCnOpqOgEARNYKVeRDr
	HHYfzj3P/pA+3h6Ro9HOvvvN+XMBRQyxF12r6S1+ZzzsA/i/YSisDUcltkk0675ZLW2jnN/iVaVLq
	vtrDqhMx4MYV7NK9cjYP7vzo5ZAWjzTM6k9/h62ZISq5TNPkoxrJ5VfCvystEOs/OV5jK05g70sNt
	iASZCO3uiX45IV59zInIeF1lFPJS1rJZQwHd2YGPhv/rXrHYQtbPlM2OAwo8Yv1DqAexCfl3H94W7
	jhqeFV6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t22TU-00000002cub-2O39;
	Sat, 19 Oct 2024 05:58:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t22S1-00000002cmi-2bcO;
	Sat, 19 Oct 2024 05:56:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC8615C3A54;
	Sat, 19 Oct 2024 05:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5E9C4CEC5;
	Sat, 19 Oct 2024 05:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729317390;
	bh=b5b4LY3dZKio27Rh7DTB+kLmPwIAeyavRYt/eXrOWjs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=b8zSQrzX3j48lS9xgwwlNdaleIZeuC9FGNWAcOS6yg+fNeAWgvJzxkV4/QKGYLVMZ
	 CRFG9QebUF496vvbdOddO2quSYDrBm7WzENbPXE6irTqtdmmZl4HRZzKwc/uAKwns8
	 udFBU55QVuEaej6ppKTDg+JFsopQEwx0fbeIV0mwDcpu7PyYi0IVwJMWB4Oel9QWdh
	 If/tuEqkD34A1FRXVSR7HkPd7Qu+lvo0fWrJYPVGr0cdnNxJntaiROfxlYd72Rd9ec
	 AtQ2LliDUlRBQj07tO6CxcHwXr8IGRX1J4J4dpjyrVbNLT9IZzIROzccSnFi0oSbM3
	 E4SKGvsMCy7Dw==
Message-ID: <c0afdf9f8c9773ef83274cb119d14c90.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241018-clk_bulk_ena_fix-v3-1-57e8bb82460c@collabora.com>
References: <20241018-clk_bulk_ena_fix-v3-0-57e8bb82460c@collabora.com> <20241018-clk_bulk_ena_fix-v3-1-57e8bb82460c@collabora.com>
Subject: Re: [PATCH v3 1/4] clk: Provide devm_clk_bulk_get_all_enabled() helper
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kw@linux.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>
Date: Fri, 18 Oct 2024 22:56:28 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_225633_732620_E9C7CE57 
X-CRM114-Status: GOOD (  11.56  )
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

Quoting Cristian Ciocaltea (2024-10-17 16:17:29)
> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index 82ae1f26e634572b943d18b8d86267f0a69911a6..0d0fe364b66a8590d5e7c63dc=
6c1e70c59d53e89 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -230,25 +239,27 @@ int __must_check devm_clk_bulk_get_all_enable(struc=
t device *dev,
>                 return -ENOMEM;
> =20
>         ret =3D clk_bulk_get_all(dev, &devres->clks);
> -       if (ret > 0) {
> -               *clks =3D devres->clks;
> -               devres->num_clks =3D ret;
> -       } else {
> -               devres_free(devres);
> -               return ret;
> -       }
> +       if (ret <=3D 0)
> +               goto err_free_devres;

Please don't use goto so that the diff is minimized.

> +
> +       *clks =3D devres->clks;
> +       devres->num_clks =3D ret;
> =20
>         ret =3D clk_bulk_prepare_enable(devres->num_clks, *clks);
> -       if (!ret) {
> -               devres_add(dev, devres);
> -       } else {
> +       if (ret) {
>                 clk_bulk_put_all(devres->num_clks, devres->clks);
> -               devres_free(devres);
> +               goto err_free_devres;

		return ret;

