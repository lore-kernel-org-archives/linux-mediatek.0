Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF37C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 20:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9TsVviuOODJWqPa0qVN9YfAyBsPjmf84LKhNhzNHe4=; b=IyBujNM+2HM0byAbBOsiXbDrgA
	EYAJv9+ELXc053ctqIAZoGnjVe7EmV+5l6F1H4xejQirmQf24vtsUV3yF+wFo1GJVcsf1wyxhzI9r
	3NweHKPgTYZti36dYRDABjIYHHfnpDM8fBhlCwKVVc7cgDt1QaB745kcdK1Ov2R+Ju56L4MLv32Vr
	qqXgHjZ70vroKi7agXDs7b/oS96RJG2Nq4siPjFTlSZ9moi5YsQq+Ihya895cY55aapwulKAs/pVK
	YFHQ17cXps4ocMf6fvQos+9t4Whq4WzLRMYW+ywTOnHVI18gbais0h1H2UX79QQ063kYVqyiXwdMi
	+sACZ8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK3HK-001IOR-Uw; Mon, 23 Jan 2023 20:18:54 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK3HH-001INB-Vk; Mon, 23 Jan 2023 20:18:53 +0000
Received: by mail-oi1-f182.google.com with SMTP id r9so11397937oie.13;
        Mon, 23 Jan 2023 12:18:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9TsVviuOODJWqPa0qVN9YfAyBsPjmf84LKhNhzNHe4=;
        b=XSlOwUepSGMoKDF32vZCW8aE2p6jj60tYeluqO3N6Ecz3B1SCHV1K3X5rijOmKP+Ik
         mgwlfx2TfpWalXuTFhxIqjVdghsgH+YJs9tkjHG7xdm/pZWHSqveHm0Yh9knYFOinQbU
         uD48RQD1Yn3rFTTOTYR1hSDTnc/OxdRUMjiLneyhYtf3tl7O26sd9i69F0YLdQ+Bt7Jk
         UgLoLdUqpPMp1/tI9nirOrYreAla2tL/SnQ/X7CTPWQH7JRLGMPN9m1Td6mL709u7PkK
         BpFMPmEjf6PhAkX4wa7SOgZRAZX8fBg1+9pYMPuMGV4UrEJ0LYDgI+JbYDlq5TIljfZ2
         M4HQ==
X-Gm-Message-State: AFqh2kpS8r40df9lJit7P2cxTYqsTAE5ld04eAy6x0N9HzcHXTGErMNf
	V4hb7kBL2/AaC1Ua3TbDig==
X-Google-Smtp-Source: AMrXdXt5T2+J150uc85qX/a/e7OoRAT8w8CmhGAUYbfvTzt6sNah2y7/iS9iRApYVIYYdn6OfeHWPg==
X-Received: by 2002:a05:6808:280b:b0:36e:c24b:85f5 with SMTP id et11-20020a056808280b00b0036ec24b85f5mr5096100oib.22.1674505131237;
        Mon, 23 Jan 2023 12:18:51 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g16-20020a9d6490000000b00684e09b43bdsm105528otl.13.2023.01.23.12.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:18:50 -0800 (PST)
Received: (nullmailer pid 2455776 invoked by uid 1000);
	Mon, 23 Jan 2023 20:18:48 -0000
Date: Mon, 23 Jan 2023 14:18:48 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?B?77+9ZXI=?= <povik+lin@cutebit.org>, 
	linux-mediatek@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-sunxi@lists.linux.dev, 
	Bjorn Andersson <andersson@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Long Cheng <long.cheng@mediatek.com>, Green Wan <green.wan@sifive.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, linux-tegra@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Palmer Debbelt <palmer@sifive.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Hector Martin <marcan@marcan.st>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Peng Fan <peng.fan@nxp.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Chen-Yu Tsai <wens@csie.org>, Amelie Delaunay <amelie.delaunay@foss.st.com>, devicetree@vger.kernel.org, 
	Olivier Dautricourt <olivierdautricourt@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	- <chuanhua.lei@intel.com>, Rajesh Gumasta <rgumasta@nvidia.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dmaengine@vger.kernel.org, 
	linux-actions@lists.infradead.org, Andy Gross <agross@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Stefan Roese <sr@denx.de>, linux-riscv@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, asahi@lists.linux.dev, 
	Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Paul Cercueil <paul@crapouillou.net>, Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: dma: drop unneeded quotes
Message-ID: <167450512824.2455711.11173604781836638882.robh@kernel.org>
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_121852_048656_A3EE20DE 
X-CRM114-Status: GOOD (  10.25  )
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


On Wed, 18 Jan 2023 19:01:43 +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml        | 2 +-
>  .../devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml       | 2 +-
>  .../devicetree/bindings/dma/allwinner,sun6i-a31-dma.yaml        | 2 +-
>  Documentation/devicetree/bindings/dma/altr,msgdma.yaml          | 2 +-
>  Documentation/devicetree/bindings/dma/apple,admac.yaml          | 2 +-
>  Documentation/devicetree/bindings/dma/arm-pl08x.yaml            | 2 +-
>  Documentation/devicetree/bindings/dma/dma-controller.yaml       | 2 +-
>  Documentation/devicetree/bindings/dma/dma-router.yaml           | 2 +-
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml             | 2 +-
>  Documentation/devicetree/bindings/dma/ingenic,dma.yaml          | 2 +-
>  Documentation/devicetree/bindings/dma/intel,ldma.yaml           | 2 +-
>  Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml    | 2 +-
>  .../devicetree/bindings/dma/nvidia,tegra186-gpc-dma.yaml        | 2 +-
>  Documentation/devicetree/bindings/dma/nvidia,tegra210-adma.yaml | 2 +-
>  Documentation/devicetree/bindings/dma/owl-dma.yaml              | 2 +-
>  Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml         | 2 +-
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml             | 2 +-
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml    | 2 +-
>  Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml      | 2 +-
>  Documentation/devicetree/bindings/dma/renesas,rzn1-dmamux.yaml  | 2 +-
>  Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml     | 2 +-
>  .../devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml         | 2 +-
>  Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml   | 2 +-
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml     | 2 +-
>  .../devicetree/bindings/dma/socionext,uniphier-mio-dmac.yaml    | 2 +-
>  .../devicetree/bindings/dma/socionext,uniphier-xdmac.yaml       | 2 +-
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml         | 2 +-
>  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml      | 2 +-
>  Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml        | 2 +-
>  Documentation/devicetree/bindings/dma/stericsson,dma40.yaml     | 2 +-
>  30 files changed, 30 insertions(+), 30 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

