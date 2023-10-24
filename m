Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABA3C07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTENRnFDH/MiSBA8uB23f0CHV3Zm50OBvimHwqLqTLY=; b=c5/x29ums2UCFBNVcCtpzQCwts
	S/AP4W+X6NXg7aI1rbZgcquhZsZ/gdrM7uG8ckGxVdZJFJgviM/fcdqpX2sX0GWrNU3zDhsPi6ghb
	ezNKecEd2sBih6gWu7E6prK+xHGhioCxxnQ7cl0IIpTv6QUxiDZ4pCd36/TNRtME+WAHEExPW0f+p
	XIXSSnrRtb3umhPPTka2YW4ueYnVHcC9TSoL3HRMztiauDGnL2RU2T8hv3kHzWasPhlUq/h0TmufC
	w03AVtK4+WtU9xgfQcfUcWcl2vmjkv9rAe+9/kRLmSqAL7WXbAgW5OY8Yu4RIOuMph/ivBRyfojHT
	4H6vKGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvILH-00A7aG-1A;
	Tue, 24 Oct 2023 14:25:11 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvILC-00A7Xk-1Z;
	Tue, 24 Oct 2023 14:25:08 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5845213c583so1504672eaf.0;
        Tue, 24 Oct 2023 07:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698157503; x=1698762303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTENRnFDH/MiSBA8uB23f0CHV3Zm50OBvimHwqLqTLY=;
        b=tFA1u1k3glBZNnGOWSd+SPPdVpLS39aSzJQezUHquaZGusfDbkGuII5h+0GrC74z5B
         X78eyzsDrcMEyrNxUT7RzTShB5itOHAl9QU1jT9d2OOZEuG6g7nGOtH/3BTu7Rgmi/Vc
         eCP/0OeKts7HeFC49NLBElgdsab4MKWy/iRwWzYGGAR89B92kGzZvcIFZEzXLZn57/Mx
         ZHCFcOWonzB4evPspSeAoVWf4Fr5e6tk+llpdJ2H9zQQz8b6e8L1otxlCSxDmEy1r/vE
         n9kH0NdAcBf7n5zWdbZyCQ61gu0TRDJrOkwBhpwe37Dy7wPrhyhZfy6HbZZgjZFyIN01
         jDxg==
X-Gm-Message-State: AOJu0Yzy2BjgeB+K4tfND1VUAeWhTo5U4mW9GF6AeB0LbnjQKimokywm
	52d1F0VmAqrnn4mfjiCPCQ==
X-Google-Smtp-Source: AGHT+IFi+wUzpHfgZ8zfKt641YNAo4P94oG7imu28ijkctLr8rSHz5f9MF1hyEAgXwXwercbvcmRUQ==
X-Received: by 2002:a05:6870:1f0c:b0:1e9:bbfe:6457 with SMTP id pd12-20020a0568701f0c00b001e9bbfe6457mr15080276oab.6.1698157502801;
        Tue, 24 Oct 2023 07:25:02 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k7-20020a056870d38700b001e9a7280a30sm2187892oag.0.2023.10.24.07.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 07:25:02 -0700 (PDT)
Received: (nullmailer pid 3693654 invoked by uid 1000);
	Tue, 24 Oct 2023 14:24:57 -0000
Date: Tue, 24 Oct 2023 09:24:57 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Vincent Shih <vincent.sunplus@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>, 
	Komal Bajaj <quic_kbajaj@quicinc.com>, Kumar Thella <sthella@codeaurora.org>, 
	Keiji Hayashibara <hayashibara.keiji@socionext.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] dt-bindings: nvmem: move deprecated cells binding to
 its own file
Message-ID: <20231024142457.GA3684864-robh@kernel.org>
References: <20231003064018.7502-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231003064018.7502-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_072506_532232_EBDD6C15 
X-CRM114-Status: GOOD (  15.34  )
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

On Tue, Oct 03, 2023 at 08:40:18AM +0200, Rafał Miłecki wrote:
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

You missed allwinner,sun4i-a10-sid.yaml and at24.yaml 
(arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts). Maybe we want to 
fix the latter case because at24 will continually have new users.

Rob

