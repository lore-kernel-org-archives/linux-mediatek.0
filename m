Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DBAC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9d70W1N8IWso38j5R86Q9smni+KJdSOjwb5kcDftgRU=; b=ceAByS6/zffvkL
	+TP6V/vxdL50vENwINQBHEqWQ8x94gJcUbP6rzPXfaKjcuB+kHDbTxXkS87ypJZtGMb2mPer7VK3i
	/9AnlROJUzSbcrDZS7hlGgq8K+yrCA52LVONz+un7GYrG6bMmWBQhro86ef7uXyM0yiFopzz3iS5i
	zIBsCK6IGCSIVW1heAUMdwBMCK5FabW9J7Nka/UEA26UJmzDB+mbMW8/3Zns58l0FJY1hfZFEL5RX
	8A2W8SNtygkj1QVt6pG+h29V2mbYKTCSyALvftnCGvzrAhGXOGlN1G8dIFzFyJFE/M/VoNHam30Op
	/SZfRpkq9hmRci+yuddw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxUqU-0010sx-3X; Wed, 15 Dec 2021 14:01:26 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxUqF-0010mz-Un; Wed, 15 Dec 2021 14:01:13 +0000
Received: by mail-oi1-f179.google.com with SMTP id bk14so31778145oib.7;
 Wed, 15 Dec 2021 06:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=v2N2/2aRl0uDViM7Eo18ZEycm6qiJCN1cJkIyTdCyMk=;
 b=HzPqTA0reB88CdQN8Acmww9QmItR0QrIUWvobB7/9pjYmk9laB2rUQrxpnAz1wEevn
 1v9cBI4xq3+lmqKV5iKej1w+lcr0mNTHTB70LF2oQ0fozTVoIn6Irt25DG+f9tyYhGot
 4OsgP59kiUDcm+EwDpwD7XqH0r/QwDRzgttfrUcQttiIRGKMQGi6d996UiENNbMSa8wD
 nIsN4y01bTy4G+k9gBxVL2lkJ4CcyCwJkhperwY3E2nZ6DWbdra/QsffLsW/Dvp+Yyii
 slSDFAualgvJnE00pawkg647qM75oolO7f4kIA1f0HdJJSE/i6BFRF5bLIEb9o8EY0u6
 jxNA==
X-Gm-Message-State: AOAM532jthLBEwhw/cNG1JVfJxyQG1Eyqjm1Iv/uKT5f2Vu/5xSam/MB
 rph3NgnNPmPDBQ9Ssvxmow==
X-Google-Smtp-Source: ABdhPJyLHls0NqIbXlFT86l7QPNmz2Nu39/Akl9ZcQh7M1EkHj/vb600jTYN0BNbCBgWUtj6wv4pJQ==
X-Received: by 2002:aca:2319:: with SMTP id e25mr38548861oie.164.1639576869775; 
 Wed, 15 Dec 2021 06:01:09 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b1sm447272otj.5.2021.12.15.06.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 06:01:09 -0800 (PST)
Received: (nullmailer pid 1207416 invoked by uid 1000);
 Wed, 15 Dec 2021 14:01:07 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 davem@davemloft.net, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, macpaul.lin@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 dkirjanov@suse.de, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211215021652.7270-5-biao.huang@mediatek.com>
References: <20211215021652.7270-1-biao.huang@mediatek.com>
 <20211215021652.7270-5-biao.huang@mediatek.com>
Subject: Re: [PATCH net-next v9 4/6] net: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
Date: Wed, 15 Dec 2021 08:01:07 -0600
Message-Id: <1639576867.892685.1207415.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_060112_025572_ABFE3F81 
X-CRM114-Status: GOOD (  13.06  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 15 Dec 2021 10:16:50 +0800, Biao Huang wrote:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> And there are some changes in .yaml than .txt, others almost keep the same:
>   1. compatible "const: snps,dwmac-4.20".
>   2. delete "snps,reset-active-low;" in example, since driver remove this
>      property long ago.
>   3. add "snps,reset-delay-us = <0 10000 10000>" in example.
>   4. the example is for rgmii interface, keep related properties only.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
>  .../bindings/net/mediatek-dwmac.yaml          | 155 ++++++++++++++++++
>  2 files changed, 155 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1567987


ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref'] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not contain items matching the given schema
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: Unevaluated properties are not allowed ('compatible', 'reg', 'interrupts', 'interrupt-names', 'mac-address', 'clock-names', 'clocks', 'power-domains', 'snps,axi-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,txpbl', 'snps,rxpbl', 'clk_csr', 'phy-mode', 'phy-handle', 'snps,reset-gpio', 'mdio' were unexpected)
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
