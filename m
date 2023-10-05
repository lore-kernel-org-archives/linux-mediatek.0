Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D321E8FDC3
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 10:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4R1yxQ+lsPOel1SUNppT1oE7uQC2OHUl1BSlR8Y/zY=; b=sqHP22ZG0LdMTqQxxzTup0enJe
	I9T6j51J1C/CdJMc9F8Pk6tLK9ECfehNZz4RgNUVxR/yJc4AGHN4kG3PfyL/h402gt9Biq8EXDA1K
	bstbE6gZwPW2cwfR3n4gcXgmknImBiZLfkTuYt/g9FzSdq0OgJ8BvmuRk/uKRdFnVEIPRVroMhAoA
	83jr+0YRsa1uBdpSLBwVfNllCuCoVltArq4pF2K55ZxRFHZ5U5ldGlSwA4IKU2Cgrf7gmvhvAnye6
	6uyw5Ex2FmTpanT0BtHDzREj0v9eODgBqHlZd4V6JK0Pu/dEDr6SvpN58yS55RPE5Lxik0zQQt9G6
	H3LkEspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLBO-001qWd-19;
	Thu, 05 Oct 2023 10:02:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLBH-001qTb-2a;
	Thu, 05 Oct 2023 10:02:09 +0000
Received: from i53875a3c.versanet.de ([83.135.90.60] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qoLAi-0004BA-Lx; Thu, 05 Oct 2023 12:01:32 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Vincent Shih <vincent.sunplus@gmail.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Christian Marangi <ansuelsmth@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>, Komal Bajaj <quic_kbajaj@quicinc.com>,
 Kumar Thella <sthella@codeaurora.org>,
 Keiji Hayashibara <hayashibara.keiji@socionext.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] dt-bindings: nvmem: move deprecated cells binding to its own
 file
Date: Thu, 05 Oct 2023 12:01:30 +0200
Message-ID: <2829805.88bMQJbFj6@diego>
In-Reply-To: <20231003064018.7502-1-zajec5@gmail.com>
References: <20231003064018.7502-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_030207_846478_6114A84D 
X-CRM114-Status: GOOD (  15.45  )
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

Am Dienstag, 3. Oktober 2023, 08:40:18 CEST schrieb Rafa=C5=82 Mi=C5=82ecki:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Support for old NVMEM fixed cells was deprecated in favour of
> "fixed-layout". It's still part of the nvmem.yaml though and may be
> unknowingly used by new bindings added without much of analyze.
>=20
> To make it more difficult to accidentally support old syntax move its
> binding to separated file with "deprecated" in its name.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
> V2: Fix path to nvmem-deprecated-cells.yaml in amlogic,meson6-rtc.yaml
>=20

>  .../bindings/nvmem/rockchip,otp.yaml          |  1 +
>  .../bindings/nvmem/rockchip-efuse.yaml        |  1 +

> diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/=
Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
> index 9c6eff788928..a44d44b32809 100644
> --- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
> @@ -49,6 +49,7 @@ required:
> =20
>  allOf:
>    - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
> =20
>    - if:
>        properties:
> diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml =
b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> index c5403e149080..b80fd8d1ae5b 100644
> --- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> @@ -11,6 +11,7 @@ maintainers:
> =20
>  allOf:
>    - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
> =20
>  properties:
>    compatible:

=46or Rockchip OTP and Efuse bindngs:
Acked-by: Heiko Stuebner <heiko@sntech.de>



