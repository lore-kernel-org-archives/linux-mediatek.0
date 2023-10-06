Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A42E81E17
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 16:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Q6q2BZn8S1gYL3ykwuhsswjzibW+++H2QyAFeMywrk=; b=WykWObf051f8ee5OG8U9xFcz7z
	6xX+9h9xnXRtqbIk4FLjN3j6By3xx+WZeBafDoaOmKzUkguI927+uWgi0KMzduhNzQO5KN4KTzHdQ
	/QosxJIrFz/m9XPUDos1oWhL7EVhysISIGx3LnO5lkI+d6lxNOZkGcOWFS4bJEv0cz4EA0PceF0vU
	KuM5sDYg0Eskh+2rK2yvg/Mu2kty9KO3bTtIPm4pTrWOy9keHIp1OhYVBcoe5bhbOkIqs/fhdiNwZ
	ZPrPa+KkLDIeg9q2W0BzGmHrOqMytUI/yHwwIfXdiQghH9JggO4eLG3HxyoKD7BIzc2Ju2dKwkWVY
	GHhCc7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qonVF-006A5C-0O;
	Fri, 06 Oct 2023 16:16:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qonVA-006A3C-0w;
	Fri, 06 Oct 2023 16:16:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8FF49B829EF;
	Fri,  6 Oct 2023 16:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89291C433C7;
	Fri,  6 Oct 2023 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696608982;
	bh=nn2PakBIGbgtsjEPpxAO4jVlLqjVjHADYSnUr1qUXew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFkTvMoc5xPxQnjGQFbbukgR7nGvQnaMUmIi8cIFrTDFwzZVKr9iEZ8kf9UwtmkqS
	 JjVmj8vB0ZE3TTOhwWGNB1o+JGF1B090dzJEdIgroxf4E0ngIgy808gaNyUPH5DIJl
	 J26870g4clx/9i8PyhovxrsBJET6ud3yGuLTEpzfK6WP1sXVcDOKmAYFwmPgx7Hx42
	 TgUnvqo/j6K5BNN2TivJ1Z+rTg5nraUATk/swrNf592B9syT+5kdlaHuidRWPb9A8x
	 eVXAhvs+zO1q6xgZPse0VgS1i3yG6J3XpznXuO3teSMIwX7oX5V6lQddll6CHRjwHj
	 1rUD3xOytS4kg==
Received: (nullmailer pid 4022504 invoked by uid 1000);
	Fri, 06 Oct 2023 16:16:16 -0000
Date: Fri, 6 Oct 2023 11:16:16 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Komal Bajaj <quic_kbajaj@quicinc.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Sascha Hauer <s.hauer@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andy Gross <agross@kernel.org>, Hector Martin <marcan@marcan.st>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org, linux-rtc@vger.kernel.org, linux-mtd@lists.infradead.org, Vincent Shih <vincent.sunplus@gmail.com>, Christian Marangi <ansuelsmth@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, Kumar Thella <sthella@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Anson Huang <Anson.Huang@nxp.com>, linux-kernel@vger.kernel.org, A
 ndrew-CT Chen <andrew-ct.chen@mediatek.com>, linux-arm-msm@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, Keiji Hayashibara <hayashibara.keiji@socionext.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Lala Lin <lala.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Richard Weinberger <richard@nod.at>, Sven Peter <sven@svenpeter.dev>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH V2] dt-bindings: nvmem: move deprecated cells binding to
 its own file
Message-ID: <169660897594.4022464.17777045780008018792.robh@kernel.org>
References: <20231003064018.7502-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231003064018.7502-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_091632_591849_B0929BB0 
X-CRM114-Status: GOOD (  13.40  )
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


On Tue, 03 Oct 2023 08:40:18 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Support for old NVMEM fixed cells was deprecated in favour of
> "fixed-layout". It's still part of the nvmem.yaml though and may be
> unknowingly used by new bindings added without much of analyze.
> 
> To make it more difficult to accidentally support old syntax move its
> binding to separated file with "deprecated" in its name.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Fix path to nvmem-deprecated-cells.yaml in amlogic,meson6-rtc.yaml
> 
>  .../devicetree/bindings/mtd/mtd.yaml          |  7 ++++-
>  .../bindings/mtd/partitions/nvmem-cells.yaml  |  1 +
>  .../nvmem/amlogic,meson-gxbb-efuse.yaml       |  1 +
>  .../bindings/nvmem/amlogic,meson6-efuse.yaml  |  1 +
>  .../bindings/nvmem/apple,efuses.yaml          |  1 +
>  .../devicetree/bindings/nvmem/imx-ocotp.yaml  |  1 +
>  .../bindings/nvmem/mediatek,efuse.yaml        |  1 +
>  .../nvmem/microchip,sama7g5-otpc.yaml         |  1 +
>  .../devicetree/bindings/nvmem/mxs-ocotp.yaml  |  1 +
>  .../nvmem/nvmem-deprecated-cells.yaml         | 28 +++++++++++++++++++
>  .../devicetree/bindings/nvmem/nvmem.yaml      |  9 ------
>  .../bindings/nvmem/qcom,qfprom.yaml           |  1 +
>  .../bindings/nvmem/qcom,sec-qfprom.yaml       |  1 +
>  .../bindings/nvmem/qcom,spmi-sdam.yaml        |  1 +
>  .../bindings/nvmem/rockchip,otp.yaml          |  1 +
>  .../bindings/nvmem/rockchip-efuse.yaml        |  1 +
>  .../nvmem/socionext,uniphier-efuse.yaml       |  1 +
>  .../bindings/nvmem/sunplus,sp7021-ocotp.yaml  |  1 +
>  .../bindings/rtc/amlogic,meson6-rtc.yaml      |  1 +
>  19 files changed, 50 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-deprecated-cells.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


