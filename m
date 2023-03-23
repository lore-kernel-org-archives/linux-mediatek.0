Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1D7C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 19:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLv+OdWP2/q4icqUygxqdKy5WVqm1CK1qz/X+1uMQ6s=; b=1SyvPwWbn7XBYc/cDrxH67INO0
	EKpzc3nojrp9CuGIJRiG7PJ0r8K7/yv9JSd19/cqn85Pg0PJZck8BkyUYpw2W+2kgDZYhwZ2VC+kH
	MvFhObVf5RLhHHfvOkoQEFPOgsLI3vMYV2ypX79J8ti5eJTJoS0M94znddY76hfIylBGUt0OYJc/G
	XKKnyoupLWjSfSLYVLMRAE0QluARrIuBw9w0sJohLA10yHFnUotHTxEwA8v8wrerPtOwZRPk/uERZ
	oWKgxrCijWoa6RRDZNeKiUpk3WdGuyClNPR6MEZqTJvardTM9nxk9LYuA1GydFcyhEtdU5cvBnnGC
	Jm6W6M7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfQC3-002mzX-1r;
	Thu, 23 Mar 2023 19:01:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfQBz-002mxU-0L;
	Thu, 23 Mar 2023 19:01:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso1890084wmb.0;
        Thu, 23 Mar 2023 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679598098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLv+OdWP2/q4icqUygxqdKy5WVqm1CK1qz/X+1uMQ6s=;
        b=cu5m+OlbboTOC7NIqSEcp8iW3kmX+jLP0i9ZshSDb0YwwsjhG1UnGQihGdnCsHvzxT
         E5fzMruGiyGXORVsaVQVBbyi7036u7U5L4qTaq5l56LuyOE9nazVT64HJCGkSLuVN93r
         1B4AKbmo7E/IH5irUJwFpldHtDZ0+Orn/pNa9BAq9838vXVb3y7SkxG89vediufY01gv
         iT/xH+JDL/vm8bbKhZUAcxrvBAsVgYJLNDWRSp5CWvQ6mQIAPqudwQWWgSduywYWAvd6
         ICah9KqPXqaujDhUvMUhzr0TOCO/Cv+vmxBx11QIL752t6GbzmIoKJBQf+QxYLTe/Kgd
         cVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679598098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLv+OdWP2/q4icqUygxqdKy5WVqm1CK1qz/X+1uMQ6s=;
        b=blAgajoCs/BC5Lo+e3pTdEdp8M+rTzSQpZgQu+cv2yFUd5SymSHXByFGF2rtfoTD79
         6ZhzBCq/i7wx6lMbxWr/g+IfBmwBVIF0b7XkeaEXTmnrhm5EcdGAOw6N5Hy9nTqVqBmg
         0i7/raXaIfhXwufcgAhvH/TRswGgds9C3vl0ZZZaj8eveVh6qxwzSD2In9GiRoSwh/Ox
         1NwZJKsqncOKxH9W9tHXfPYZ0oykTTp0IuvxxJUYlWAxet1J2M/95eySipqIv4hf9O9z
         Vf5T7Y9F//RMy+HF7NHAsPdQR8IUR3V0HX3TWNkcboZxm8Dz2gYZYTWCH6cJb5Ukrxt+
         O60w==
X-Gm-Message-State: AO0yUKUtAw1Oxro4Ai1oMNPoa745h8H1rEPSRGBiI8pLZ8wYV5MARNtC
	xrxsJyl0tx/xAVHrsIu5/wU=
X-Google-Smtp-Source: AK7set+rYnmeyHLDI8kRSWajUorF8AQNiBslvOhL1B8d1ZJbljrj8VFTESbYvCOCBRF9m/MSyyRPaw==
X-Received: by 2002:a05:600c:22d4:b0:3ed:b56c:9496 with SMTP id 20-20020a05600c22d400b003edb56c9496mr523314wmg.31.1679598097756;
        Thu, 23 Mar 2023 12:01:37 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id x11-20020a05600c21cb00b003ede3e54ed7sm2724420wmj.6.2023.03.23.12.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 12:01:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Yu Chen <chenyu56@huawei.com>, Binghui Wang <wangbinghui@hisilicon.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Robert Marko <robert.marko@sartura.hr>, Luka Perkov <luka.perkov@sartura.hr>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Vincent Shih <vincent.sunplus@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-can@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: Drop unneeded quotes
Date: Thu, 23 Mar 2023 20:01:34 +0100
Message-ID: <4814446.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230320233955.2921179-1-robh@kernel.org>
References: <20230320233955.2921179-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_120143_226456_BA0D3D68 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Dne torek, 21. marec 2023 ob 00:39:52 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/phy/allwinner,sun50i-h6-usb3-phy.yaml          | 4 ++--
>  .../bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml         | 2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  .../devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml      | 4 ++--
>  .../bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml         | 4 ++--
>  .../devicetree/bindings/phy/amlogic,g12a-usb2-phy.yaml      | 4 ++--
>  .../devicetree/bindings/phy/amlogic,g12a-usb3-pcie-phy.yaml | 4 ++--
>  .../bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml    | 4 ++--
>  .../devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml     | 4 ++--
>  .../devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml | 4 ++--
>  .../devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml   | 4 ++--
>  .../devicetree/bindings/phy/brcm,bcm63xx-usbh-phy.yaml      | 4 ++--
>  Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml    | 4 ++--
>  Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml   | 4 ++--
>  .../devicetree/bindings/phy/hisilicon,hi3660-usb3.yaml      | 4 ++--
>  .../devicetree/bindings/phy/hisilicon,hi3670-usb3.yaml      | 6 +++---
>  .../bindings/phy/marvell,armada-3700-utmi-phy.yaml          | 4 ++--
>  .../bindings/phy/marvell,armada-cp110-utmi-phy.yaml         | 4 ++--
>  .../devicetree/bindings/phy/marvell,mmp3-hsic-phy.yaml      | 4 ++--
>  .../devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml    | 4 ++--
>  .../devicetree/bindings/phy/phy-cadence-sierra.yaml         | 4 ++--
>  .../devicetree/bindings/phy/phy-cadence-torrent.yaml        | 4 ++--
>  Documentation/devicetree/bindings/phy/phy-tegra194-p2u.yaml | 4 ++--
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml     | 4 ++--
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml   | 4 ++--
>  Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml | 4 ++--
>  .../devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml     | 4 ++--
>  Documentation/devicetree/bindings/phy/qcom,usb-ss.yaml      | 4 ++--
>  .../devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml       | 4 ++--
>  .../devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml    | 4 ++--
>  Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml  | 2 +-
>  .../devicetree/bindings/phy/sunplus,sp7021-usb2-phy.yaml    | 4 ++--
>  .../devicetree/bindings/phy/ti,phy-am654-serdes.yaml        | 4 ++--
>  Documentation/devicetree/bindings/phy/ti,phy-gmii-sel.yaml  | 4 ++--
>  Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml | 4 ++--
>  Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml  | 4 ++--
>  35 files changed, 69 insertions(+), 69 deletions(-)




