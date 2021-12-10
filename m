Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B901FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 14:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z33wMemcoEQWRE4uvoiihiN6UnNTkV1DfM6Y5gakNn0=; b=WWa/AD7Vi/lGoD
	PDn1wWD1MR9uHnHW48ww45a2GLcQ/WjKZId3gCSpGj6nnwnrq1MeVU8oFaAwnLaqo2OT5mH38ORK2
	wQzF+YU9nQO6h+e2+hyoXonMlkD/58yM7jPUCQ/PL6Xx5e/GvhNHORyabZhc0G9PodLEQOxhRizOl
	ic9ziolSMCWW+X8jZEj6SWWAwMWjqkm1K/yFeF5LMCw1sl0HhRf1AvhA2V35/XeE+ObOyLTg9EI4q
	vDeut+WiKyvC0VBem2IDbIaAT4ZlssH5E1SgC1KPaqTWcssOYXlvLGRuVKVB198ULebGu9tCycXHQ
	Hj/6eCQRiQ1kIufzUT7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvgUx-0027Pl-8f; Fri, 10 Dec 2021 14:03:43 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvgUP-0027Cf-Rj; Fri, 10 Dec 2021 14:03:11 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so9638127oto.13; 
 Fri, 10 Dec 2021 06:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=k7EaRnob3zOEquu+wkUbm05857jqaStaszAJkkyFu8I=;
 b=wlQ6tBe7OnhRvZxq4R0CDVkpxUvQ84wO6Xs6KUuVk7AmRow7mvVIKu1/XneH3jsK65
 62hwKWBOWP8EztAfDsgK+2VvtwjdWk6pLoGXSDmR3vCu/mt7747sbLE6L2DDG4sfVq+V
 Xf6HMFShJBzLOxw0Gidll608O1egZL3ANilBTCT840V+3nQa3luumYZa3hR1E/Pm85T3
 6Iley1WJJd5XY7KXA55/1e5PAb5csK3VEjpBTSEzpcwBbMxYozix2YS3ti12aDeqrlwP
 jv3llWqFyH3iOGrEkIGfVUI+iCRMOrL5BxdnW4jAbP9l+yrFVBAnsaTNhjuv/qYXYORP
 KTTA==
X-Gm-Message-State: AOAM532r8a5dEa4UskOe+ZoD73E66uBOrUOKeQ7N/VRXwXXpT76HInbA
 TR2tyGxsD9JMcMWGtO93nw==
X-Google-Smtp-Source: ABdhPJw8097NeWY7msvS0XSMdwLw1NEYFR27r4qN30zbTRskT35vsrks871Xs7VoBvqNOAmesE3DHQ==
X-Received: by 2002:a05:6830:18b:: with SMTP id
 q11mr11543396ota.113.1639144985532; 
 Fri, 10 Dec 2021 06:03:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t14sm554859oth.81.2021.12.10.06.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 06:03:04 -0800 (PST)
Received: (nullmailer pid 1252259 invoked by uid 1000);
 Fri, 10 Dec 2021 14:02:56 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: Jose Abreu <joabreu@synopsys.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, davem@davemloft.net,
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, dkirjanov@suse.de,
 linux-mediatek@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
In-Reply-To: <20211210013129.811-5-biao.huang@mediatek.com>
References: <20211210013129.811-1-biao.huang@mediatek.com>
 <20211210013129.811-5-biao.huang@mediatek.com>
Subject: Re: [PATCH net-next v8 4/6] net: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
Date: Fri, 10 Dec 2021 08:02:56 -0600
Message-Id: <1639144976.227854.1252258.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_060309_932042_8ADE6187 
X-CRM114-Status: GOOD (  13.12  )
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

On Fri, 10 Dec 2021 09:31:27 +0800, Biao Huang wrote:
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
>  .../bindings/net/mediatek-dwmac.yaml          | 156 ++++++++++++++++++
>  2 files changed, 156 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1566169


ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref'] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not contain items matching the given schema
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: Unevaluated properties are not allowed ('compatible', 'reg', 'interrupts', 'interrupt-names', 'mac-address', 'clock-names', 'clocks', 'power-domains', 'snps,axi-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,txpbl', 'snps,rxpbl', 'clk_csr', 'phy-mode', 'phy-handle', 'snps,reset-gpio', 'mdio' were unexpected)
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
