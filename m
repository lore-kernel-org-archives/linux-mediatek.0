Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FC2C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 May 2024 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:Mime-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8oK9gFYZNPK8JjkQaEUib/TlJXrHwdRQFsXpehmfQo=; b=e1CWHGeEHirg/bp9JeOV3Q6pJT
	61t45u8R1edUWrgWv3onkzwKzCeCEt8PBgBcMCnHr6tR4sJrW9WP0Do+jxOLhnF8xBHASeSZ3dUyP
	6z16XhGRVPPIqUjobdW0pzEvknSF1aOz85fL2YIZeC6NEiTXe9h0/P1GmyjNPi7GrULiztastNwhL
	gkGkpX38j0HqiRU9dd7/9twmdEYVcEd4cCw/EglRnPFpWfVe/jsfj/4552Pg9eMOQvmGziVGGKlrF
	Es2+P4F3v+ncbjVDGOE1nCi3Pn7w0ytMDA5o2SnPgF9v10rHv9yoLCtDPxXiTeYFbgAcVyNcRF3M9
	3RmXMNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2A3Z-00000009gSO-1E0t;
	Wed, 01 May 2024 13:31:33 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2A3U-00000009gQf-0uUa
	for linux-mediatek@lists.infradead.org;
	Wed, 01 May 2024 13:31:31 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D7A51411E9
	for <linux-mediatek@lists.infradead.org>; Wed,  1 May 2024 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714570279;
	bh=c8oK9gFYZNPK8JjkQaEUib/TlJXrHwdRQFsXpehmfQo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=oxCQdFTtQhG9tOtVfZ7VTu7oupcXNvpxRK91LOOnA3CtloGmCaC15xPhLxDM4Eux/
	 qhZ5CeTXAN337oRF53S5UJ6uo/fQ2IWXPKIgu0mM69RI6QKHnJbLwtA4zfnpf9Tr8R
	 EasLBjqltjLiXR8s2xU9cgLuhGFOog5uAufzbICIXkDFhu/v6qTW9QEzCLaFsr5Rkn
	 RAiwWTzlytxQ4te9a1NwCCGiC36zIf/+5Ligs260ieh/+f7hfnYQ6DxXGkRlMISawx
	 VTW1BH7f0eH7vbgpqV62FmrO1r0OSbxpuIm5RfxYG8etuAUMcOcj/dOggknPHtktE0
	 hvkp4TrDFNh3A==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a592c35ac06so85262166b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 01 May 2024 06:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714570278; x=1715175078;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8oK9gFYZNPK8JjkQaEUib/TlJXrHwdRQFsXpehmfQo=;
        b=lEivW/2pCHFSQ+jXsaz3RFRvnCoXxYbP9E38qzXfHUUWCqCM6ZNorMzh8Tp88mNLQi
         ZnvcK0k/44NjK04MRwOvPa2UClkXyeTUOU+JiKggTqgfjfvspDyixSiTnA3sSyBthW4R
         whSsGXD0tUygA1uRK6QcDz80yBKB+vRSqEfZA6wKZp9fbQHpGWfrBacukl9kgFxj1u/T
         ip6lx69VVUDs/j2VhJXymK7ZjkpxIgzPRSq+8cdo97M+aDfyGv+yLRnWV2wp5pfxVgUC
         cc55UQKr2YRF2IrBu1LAx9VDxj1xXlxQ/+9NTGXNjusaI6w7Zgm9/XuWmuR+llwkwoFn
         eoag==
X-Forwarded-Encrypted: i=1; AJvYcCXQAdKfIHGYFnewAI/G55QBHxaMVTbkWPfOmxRFYsdl7RI8SF9Ar+bPfsGhlII081p8dxiUUGtkKbpnNw9geq1xurR935PqyFRAuWk51WPIBorT
X-Gm-Message-State: AOJu0YwXiSgXmNkYQzwgvKU6I0cnumQb1YKxT2qMdprSKAuHy4ugln+6
	UiUzat5K1cDXInYeSZq3UOfsV7uVXIdqV7rT80LLGnTVROEKSqWgddDsQGIO7Y9HUFImrcv8zhJ
	v4LX/G0hr4ngSn+3MrsJ8fDQZv2nf146mu7OWXGTLJxF65uF/j4wZnZnD73TXIRiwzVa6r2Br0q
	dCKkzx1HTSekQ51/NFG1JjRCoeuagkGV+LdXtJXAWL+Z3U+kksCkUclOYrzCw1
X-Received: by 2002:a2e:a7ce:0:b0:2df:8ce6:96cb with SMTP id x14-20020a2ea7ce000000b002df8ce696cbmr955445ljp.8.1714570258113;
        Wed, 01 May 2024 06:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYT+qTSOE1Kr9KmhXevsjrdrGfobx9Pel64hRtY96pMsR8tg00NtEJfiVi5E4mSMS1jyTIKo1grrZjSHhuefw=
X-Received: by 2002:a2e:a7ce:0:b0:2df:8ce6:96cb with SMTP id
 x14-20020a2ea7ce000000b002df8ce696cbmr955417ljp.8.1714570257684; Wed, 01 May
 2024 06:30:57 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 May 2024 08:30:56 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240501-pinctrl-cleanup-v1-5-797ceca46e5c@nxp.com>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com> <20240501-pinctrl-cleanup-v1-5-797ceca46e5c@nxp.com>
Mime-Version: 1.0
Date: Wed, 1 May 2024 08:30:56 -0500
Message-ID: <CAJM55Z9RuobAMR4EaevhTPRsJe3vuruV7-_DTQYpH_w8_azkcA@mail.gmail.com>
Subject: Re: [PATCH 05/21] pinctrl: starfive: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_063128_648451_0D58C724 
X-CRM114-Status: GOOD (  19.25  )
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

Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 27 +++++++++-------------
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 18 +++++++--------
>  2 files changed, 19 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 6df7a310c7ed..27f99183d994 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -480,7 +480,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  {
>  	struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
>  	struct device *dev = sfp->gc.parent;
> -	struct device_node *child;
>  	struct pinctrl_map *map;
>  	const char **pgnames;
>  	const char *grpname;
> @@ -492,20 +491,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>  	nmaps = 0;
>  	ngroups = 0;
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npinmux = of_property_count_u32_elems(child, "pinmux");
>  		int npins   = of_property_count_u32_elems(child, "pins");
>
>  		if (npinmux > 0 && npins > 0) {
>  			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: both pinmux and pins set\n",
>  				np, child);
> -			of_node_put(child);
>  			return -EINVAL;
>  		}
>  		if (npinmux == 0 && npins == 0) {
>  			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn: neither pinmux nor pins set\n",
>  				np, child);
> -			of_node_put(child);
>  			return -EINVAL;
>  		}
>
> @@ -527,14 +524,14 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	nmaps = 0;
>  	ngroups = 0;
>  	mutex_lock(&sfp->mutex);
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npins;
>  		int i;
>
>  		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", np, child);
>  		if (!grpname) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pgnames[ngroups++] = grpname;
> @@ -543,18 +540,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  			if (!pins) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  			if (!pinmux) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			ret = of_property_read_u32_array(child, "pinmux", pinmux, npins);
>  			if (ret)
> -				goto put_child;
> +				goto free_map;
>
>  			for (i = 0; i < npins; i++) {
>  				unsigned int gpio = starfive_pinmux_to_gpio(pinmux[i]);
> @@ -570,7 +567,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  			pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  			if (!pins) {
>  				ret = -ENOMEM;
> -				goto put_child;
> +				goto free_map;
>  			}
>
>  			pinmux = NULL;
> @@ -580,18 +577,18 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>
>  				ret = of_property_read_u32_index(child, "pins", i, &v);
>  				if (ret)
> -					goto put_child;
> +					goto free_map;
>  				pins[i] = v;
>  			}
>  		} else {
>  			ret = -EINVAL;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinctrl_generic_add_group(pctldev, grpname, pins, npins, pinmux);
>  		if (ret < 0) {
>  			dev_err(dev, "error adding group %s: %d\n", grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinconf_generic_parse_dt_config(child, pctldev,
> @@ -600,7 +597,7 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		if (ret) {
>  			dev_err(dev, "error parsing pin config of group %s: %d\n",
>  				grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		/* don't create a map if there are no pinconf settings */
> @@ -623,8 +620,6 @@ static int starfive_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	mutex_unlock(&sfp->mutex);
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> index 9609eb1ecc3d..4ce080caa233 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -150,7 +150,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	nmaps = 0;
>  	ngroups = 0;
>  	mutex_lock(&sfp->mutex);
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		int npins = of_property_count_u32_elems(child, "pinmux");
>  		int *pins;
>  		u32 *pinmux;
> @@ -161,13 +161,13 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  				"invalid pinctrl group %pOFn.%pOFn: pinmux not set\n",
>  				np, child);
>  			ret = -EINVAL;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn", np, child);
>  		if (!grpname) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pgnames[ngroups++] = grpname;
> @@ -175,18 +175,18 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  		if (!pins) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		pinmux = devm_kcalloc(dev, npins, sizeof(*pinmux), GFP_KERNEL);
>  		if (!pinmux) {
>  			ret = -ENOMEM;
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = of_property_read_u32_array(child, "pinmux", pinmux, npins);
>  		if (ret)
> -			goto put_child;
> +			goto free_map;
>
>  		for (i = 0; i < npins; i++)
>  			pins[i] = jh7110_pinmux_pin(pinmux[i]);
> @@ -200,7 +200,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  						pins, npins, pinmux);
>  		if (ret < 0) {
>  			dev_err(dev, "error adding group %s: %d\n", grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		ret = pinconf_generic_parse_dt_config(child, pctldev,
> @@ -209,7 +209,7 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  		if (ret) {
>  			dev_err(dev, "error parsing pin config of group %s: %d\n",
>  				grpname, ret);
> -			goto put_child;
> +			goto free_map;
>  		}
>
>  		/* don't create a map if there are no pinconf settings */
> @@ -233,8 +233,6 @@ static int jh7110_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	*num_maps = nmaps;
>  	return 0;
>
> -put_child:
> -	of_node_put(child);
>  free_map:
>  	pinctrl_utils_free_map(pctldev, map, nmaps);
>  	mutex_unlock(&sfp->mutex);
>
> --
> 2.37.1
>

