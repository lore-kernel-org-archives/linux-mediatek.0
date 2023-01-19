Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9570DC004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lVOvMoIQ2x2Wf6zy8frHnpB0eXV9ve1xBd2DqHKd8Y=; b=PYCYn/RyTUAYHEt+6aEatAOImv
	SH2OQ0BgqRypfghSWK83zM5kpY8eS58Rdz3qXKUIUa+Oc6qF75xmabOhu95wClhXVyzzTps5snPWs
	pQK2vCkRheDnbsQWbnZi7QYV19Rhv/hogwy4EeFvrxa+NGOKMfFZBReWKkxD+zYHfuMDl8dl83XTe
	s8N/AyzAYZoQxqLNMUdBqjl+uanOIx650mMqujK+tD0vROTBqGFXCnyPsrr7HVxBi9HnKMtvRce1w
	T57esdWkcnNlSksEOKrYIp6dj2YlFM72VQeod6I6Ri//fh7DVfMuT22fBwru73FE/HRuI+mjLvQAO
	84a4W7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXjV-005xYL-Rh; Thu, 19 Jan 2023 16:25:46 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXiR-005wxT-7N; Thu, 19 Jan 2023 16:24:40 +0000
Received: by mail-lf1-x12e.google.com with SMTP id bp15so3939886lfb.13;
        Thu, 19 Jan 2023 08:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8lVOvMoIQ2x2Wf6zy8frHnpB0eXV9ve1xBd2DqHKd8Y=;
        b=a/g9O4xy606aS7gTGUOYByXG9qF6KTMWOZA30DBpya3y/ma8wWSWbZ0GhEnw/5Dd56
         SwWKUvve09j1o3F73iD1XSqxXcz9bXivs5oPpAd58vaExY7Ut/gg8J5SySYtOKeJp85Y
         xmSrmvNHPLNYd+qGYEno2szmpyk9kL3REN4AGFML0pKUuvB9xnBoYaDYyqhUn2RKO/PI
         lFHQZLGbsqrirm06txrQIW/ebbIiz59ba6eAsRY5KjrWXIZ73jywqljunaP/ghJHB5A9
         uKyEtu3Zvgig66EC5x+MjGQiTGePO5AKzyatccaZUr2ktzAcgc0H0B/UBMut22jZ1DsG
         EBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lVOvMoIQ2x2Wf6zy8frHnpB0eXV9ve1xBd2DqHKd8Y=;
        b=Oi2w/VVeQVpiliNeSeOsz/ngHEi3vU+7ZJOxfuF8DEtt5tJDLsTt80bgu4bualRz6q
         N/fIUfXNsngz9a/sQyseiY4GKNkHow85OBJgy6L5waFnGezWtyk81d5OLtnb9UWCs5f1
         EhlLzUzP9jxdvL7/gVrwsNVlLM7i5rZNqwRB6QMGcEc3tELULIlhOz/N1/g0eVSCn1Z2
         4WQ9rSVpMaJ6LFOIn2rgR/+fWwnE5ZbsTEJ7uLlpTCcA57IlEBVXCvcLEazNosvBQZPR
         hmnkgx0gu6CM/bv6c+Qg8eTm0F9treByelgep/EnxgB55MLe/Xt4KE4Lj57nXDONppv7
         xaYA==
X-Gm-Message-State: AFqh2koUOPUXr2v/GzqcxnyyHh/ZbZVv7JWyUTKgTB9kv0YiRb1wx3Mz
	qR3Z+SVYpvxBigPRr/0fK40=
X-Google-Smtp-Source: AMrXdXv7/blNpjVnMJiMaPKfEdqpiTFTh3jtjnRI+SUuGsVsK9TsgKmt9RRC03LAK7v7xiQAHH0RHA==
X-Received: by 2002:a05:6512:25a5:b0:4b5:7338:e2c7 with SMTP id bf37-20020a05651225a500b004b57338e2c7mr3358360lfb.53.1674145476128;
        Thu, 19 Jan 2023 08:24:36 -0800 (PST)
Received: from mobilestation ([95.79.133.202])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b004cb41b43c25sm5884147lfo.197.2023.01.19.08.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 08:24:35 -0800 (PST)
Date: Thu, 19 Jan 2023 19:24:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Han Xu <han.xu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Li-hao Kuo <lhjeff911@gmail.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Parshuram Thombare <pthombar@cadence.com>,
	Leilk Liu <leilk.liu@mediatek.com>,
	Gabor Juhos <juhosg@openwrt.org>, Bert Vermeulen <bert@biot.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Marek Vasut <marex@denx.de>,
	Birger Koblitz <mail@birger-koblitz.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Anson Huang <Anson.Huang@nxp.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Erwan Leray <erwan.leray@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/2] spi: dt-bindings: drop unneeded quotes
Message-ID: <20230119162431.mepdze3xibqjgwsi@mobilestation>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_082439_472900_58AD33CD 
X-CRM114-Status: GOOD (  13.67  )
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

On Wed, Jan 18, 2023 at 06:39:31PM +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[nip]

>  .../bindings/spi/snps,dw-apb-ssi.yaml          |  2 +-

[nip]

> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index d33b72fabc5d..a132b5fc56e0 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Mark Brown <broonie@kernel.org>
>  
>  allOf:
> -  - $ref: "spi-controller.yaml#"
> +  - $ref: spi-controller.yaml#
>    - if:
>        properties:
>          compatible:

For the Synopsys DW SSI bindings:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thanks
-Serge(y)


