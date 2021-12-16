Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3526EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 14:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o17v6i7Gu1ojPvp4eEMhMAxVayFism5nIKLf7fVWhSY=; b=gJ2maabb/xV4TJ
	mCTs4J6BdSK8PM48B+53fDHol/v+KP0glWF99BXEd0YlpbC1msVN6WsjTDfLt9/mFx+JnxQtcQ2N8
	f9JsPtFo8dxiuQzarQ0AnDaQJPmDLH4zfC5tcyC1FqVpsmbj+m6UrTtTBnmg0PH9LYC5v1Qg0ThrF
	SkTjtg6SKLcz3Jz3wUPf4H18vYbNvx2oH/PWhIfgc0N6G+KPdwOMyLinqJV9mmWPIjuq0xgxRGegG
	/Pijhlr8McA/dG1cWVgwns+ikiAZBEj58Q/YzS+9i6hwxS5E/FjWHaGofCl/uZItdbW/oT5Bgrknl
	eiQtmDu6QEYweNWUyYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrLS-0061Wi-MX; Thu, 16 Dec 2021 14:02:54 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxrC0-005y46-9t; Thu, 16 Dec 2021 13:53:10 +0000
Received: by mail-oi1-f171.google.com with SMTP id m6so36583853oim.2;
 Thu, 16 Dec 2021 05:53:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=6fkUBesEK+ljm2rlPJZWtYPxz7Qh1jlpFH5iXSMcGv8=;
 b=QJfbZHbWe2GPSVVqeZmvb4QZL4V6PyvFmqc5mO9SpK6Jwhs1oM+vcxK3wE5PW6vDlh
 aehM4CfCA6gWz3FY0dROnn3tbuDY9qFAJFfd24MV0Fh6z9oUzWff03gQ6FBEa4yTSTlG
 wAP3CbhjlxFIvi0YIWF6H7LSUSUkxfxlAabssn4dAEguA5SaI2X+7nkTg8ZEO9rndgg5
 d3am2zP4GWojFJ/nV5mHBhFRQyCgM/Y6AZEk1ITwRw6JME86xi2Kfybxx12QcrcnVee1
 mYECUt9BizfCvJCJudRI5gtfQ/U8IS1gHuMKDNkeXxUm9Jh6smKFy3GxyuviI/waYzXO
 qAqg==
X-Gm-Message-State: AOAM531KLMrt2EwU4U3/BFJeSfPhfhgoQ5AN5R6KXZC6o5CWQfsdvGcL
 JkfWUhfF/mZSZ3DBr43YUA==
X-Google-Smtp-Source: ABdhPJw5upVfoScoQm9JMcGvL7W6litpwZZt9iGYREg40ouAGdsEx1RNm5o/nQz8hQBdqefWZlPU/w==
X-Received: by 2002:aca:c650:: with SMTP id w77mr4205603oif.8.1639662787205;
 Thu, 16 Dec 2021 05:53:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i3sm1041907ooq.39.2021.12.16.05.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:53:06 -0800 (PST)
Received: (nullmailer pid 4004891 invoked by uid 1000);
 Thu, 16 Dec 2021 13:53:03 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, macpaul.lin@mediatek.com, davem@davemloft.net,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, dkirjanov@suse.de,
 Matthias Brugger <matthias.bgg@gmail.com>,
 angelogioacchino.delregno@collabora.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
In-Reply-To: <20211216055328.15953-5-biao.huang@mediatek.com>
References: <20211216055328.15953-1-biao.huang@mediatek.com>
 <20211216055328.15953-5-biao.huang@mediatek.com>
Subject: Re: [PATCH net-next v10 4/6] net: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
Date: Thu, 16 Dec 2021 07:53:03 -0600
Message-Id: <1639662783.037495.4004890.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_055308_397468_CC6F8A9A 
X-CRM114-Status: GOOD (  13.18  )
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

On Thu, 16 Dec 2021 13:53:26 +0800, Biao Huang wrote:
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

Full log is available here: https://patchwork.ozlabs.org/patch/1568901


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
