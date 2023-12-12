Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9E4C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 05:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/kRQnlrmzAaEgbJW/nHYsdkLSYAXxTeBfYcPh2ZwjE=; b=gdIFclTX3BNWpyN1dOYgBirc3S
	HBsCau0tsxcQ+Br3IAPOES/XLv5MfrJSNpE1VPOcXeZkdK1+X0jW4/1iAEWyoQ/+VZDnrLDqT1EO4
	TKEToUv7evkTyDpkEYhl6efbu0wk9y/aoPMMlUyD79mgTqEw4aTgCV05eC0wkxHkep+YnetqTIL98
	jTQBw3hnB6i1PmhhIaIqY9LYF+Qt/zqvjNbMfIlgyPTbfGQYquVqLNxZ6aLkXQP7eYAesJNK/OGCj
	3LERzVffGzNKm9g3e/p1B+WKAlIWa+EvEap5CpFokOpdOYCUDzrr/1AGDxdcpnT5WB0d8FDQSDkjC
	xKoC8dvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCvYf-00Aogf-2t;
	Tue, 12 Dec 2023 05:43:53 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCvYW-00Aoaa-0d;
	Tue, 12 Dec 2023 05:43:45 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6d9dbe224bbso3868812a34.2;
        Mon, 11 Dec 2023 21:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702359823; x=1702964623;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G/kRQnlrmzAaEgbJW/nHYsdkLSYAXxTeBfYcPh2ZwjE=;
        b=oBuD0Nxl/3btvzZXbIU/jriHjuxa7nq3e5jT0cG2En6zXNCo+jICEWXvkSvKcD2Ylt
         DyEBF1zrSLv4FwzBG9p+XUKnL+ZR8QaXL8dIrvEXoe/wmWSS0sLlB8XVRL048sl9qcv1
         RVelMZ+KbZ14AkXqwEp7ouGy1ZMjDxHl8r906dfE9hSU2h4LFitWht/X/dNu1gzgXJcy
         VPWb3Y5as4Jn1uAXs8I6F1fb9aQr6aEIL4O+8J+6Jobh4IJ0oxAN55awM4oZz8ALkFjh
         zh3xYe9mj52I2Svwl7sd13T3LDffT1ns8DO4zJO+AT2fBudBHJko7pamqO/MoQ62d3bZ
         LOyw==
X-Gm-Message-State: AOJu0Yx+uwEo4oa5wgJlcCS1u0l0HZxKFULl64vDR7PZqk/YWvFqbIzh
	dWN0JgOvehiCReplNwAscHnplZIR2Q==
X-Google-Smtp-Source: AGHT+IHfJVsFVCXlkAo5HjVP5AjAq4xIe1OLORfTZofd6AI7iHeRszHF1WOfLlCCf48/2Or6Rr6kNw==
X-Received: by 2002:a05:6830:20d9:b0:6d8:49a1:c52b with SMTP id z25-20020a05683020d900b006d849a1c52bmr5865800otq.27.1702359822924;
        Mon, 11 Dec 2023 21:43:42 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r6-20020a9d7506000000b006ce2fce83cbsm2071485otk.25.2023.12.11.21.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 21:43:41 -0800 (PST)
Received: (nullmailer pid 39734 invoked by uid 1000);
	Tue, 12 Dec 2023 05:43:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Vinod Koul <vkoul@kernel.org>, John Crispin <john@phrozen.org>, Andrew Lunn <andrew@lunn.ch>, 
	Rob Herring <robh+dt@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
	devicetree@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, netdev@vger.kernel.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, Qingfang Deng <dqfext@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <5859da6629b8b6c100eca4062dd193105bf829ba.1702352117.git.daniel@makrotopia.org>
References: <cover.1702352117.git.daniel@makrotopia.org>
 <5859da6629b8b6c100eca4062dd193105bf829ba.1702352117.git.daniel@makrotopia.org>
Message-Id: <170235981509.39662.6730294984307830032.robh@kernel.org>
Subject: Re: [RFC PATCH net-next v3 6/8] dt-bindings: net: mediatek: remove
 wrongly added clocks and SerDes
Date: Mon, 11 Dec 2023 23:43:35 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_214344_239462_5063A3F4 
X-CRM114-Status: GOOD (  18.21  )
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


On Tue, 12 Dec 2023 03:48:10 +0000, Daniel Golle wrote:
> Several clocks as well as both sgmiisys phandles were added by mistake
> to the Ethernet bindings for MT7988.
> 
> This happened because the vendor driver which served as a reference
> uses a high number of syscon phandles to access various parts of the
> SoC which wasn't acceptable upstream. Hence several parts which have
> never previously been supported (such SerDes PHY and USXGMII PCS) have
> been moved to separate drivers which also result in a much more sane
> device tree.
> 
> Quickly align the bindings with the upcoming reality of the drivers
> actually adding full support for this SoC.
> 
> Fixes: c94a9aabec36 ("dt-bindings: net: mediatek,net: add mt7988-eth binding")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 32 ++++---------------
>  1 file changed, 7 insertions(+), 25 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.example.dts:18:18: fatal error: dt-bindings/clock/mediatek,mt7988-clk.h: No such file or directory
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.example.dtb] Error 1

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/5859da6629b8b6c100eca4062dd193105bf829ba.1702352117.git.daniel@makrotopia.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


