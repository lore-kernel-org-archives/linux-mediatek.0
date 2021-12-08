Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE283C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 13:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3k+Oe9Ms3T+HWxR7F6hbuJ+jC0b0OHSxvlXJuXHu1k=; b=IE/+2IfmO2AK/H
	vYucCikdL/st8pwr1ffv28tS1uVIGiIXYhI5YLfb20WwnRPP974u/PMbGWF0TM8mMvvKWVpbNcY3Q
	c5YidFi2yORVB5MqSRh/OmTXAia651jTdpQ8CXwlPxJVV/rKw/GHDm4ihFC93MNa9ngNzUvq7CwKW
	UQLiRJMWK/e4TVixuz3VwINMq+23K0euHk0sj4wlDz5EHFTAND7rEBW4+EaUctJq4PimbiQHNgUqz
	Uz9/utbHPf2tce631f1cP1ksAcJ2KU9zsBBwyKvRU3IW/vVI9yKMZ6GA4yikJ+19a0c9JV8S1ZedF
	Sp4oB+Q5euspO2htvg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muxFN-00CqL2-BW; Wed, 08 Dec 2021 13:44:37 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muxFJ-00CqJY-I3; Wed, 08 Dec 2021 13:44:35 +0000
Received: by mail-oi1-f178.google.com with SMTP id t23so4216667oiw.3;
 Wed, 08 Dec 2021 05:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=2FBGOv0PegNkvtOMGaZYa1BsopYp6ezUI2k+MFWsRkg=;
 b=K5hL83R/DTp3nVfGaX+5utmJHGG08Q9d7TrxbSwwnDInH2qTIoVsGDoX6lVyebp/ag
 U8fh3TplM5W11shqBST9JuTyO47PBsDyYjtA7/MEv7MDh9GQJm5s+0/KbCFYyXPSTP8V
 zMSU6g/GuHIYWcuOIoZGs6jrHj5QMW44FpEXvPsqKcAvj2Q3IzC0z4zqUCOsl6RO5vvp
 053QwPVS7nB046TvWL72dueZz3tZmBUQIbtsVNKEzoa861sdMwgKvan3sg2NpxIMGsaE
 tfh4odk5fAzv/DtRk1oFXlyMCzsEUeAKv3ynSvjPRdhMW5JZSDRZI4CtCto/rbNZHHKX
 oQhA==
X-Gm-Message-State: AOAM5305LC+J8j7huESobwSUhGYos6inxEuMg1bfgEjW+v3nNNI6wHr4
 C77DBCFA1yXIK1FV/oruXQ==
X-Google-Smtp-Source: ABdhPJy4QOKFBXVt9kjHp3l6spBp74LPhwun2A8oRCnVjLpYafUk8Begm5tyq5EWMDExu9pfz3il7Q==
X-Received: by 2002:a54:4402:: with SMTP id k2mr11425020oiw.141.1638971072200; 
 Wed, 08 Dec 2021 05:44:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 109sm477713otv.30.2021.12.08.05.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 05:44:31 -0800 (PST)
Received: (nullmailer pid 3857740 invoked by uid 1000);
 Wed, 08 Dec 2021 13:44:28 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macpaul.lin@mediatek.com,
 netdev@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, davem@davemloft.net,
 Rob Herring <robh+dt@kernel.org>, srv_heupstream@mediatek.com,
 dkirjanov@suse.de, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
In-Reply-To: <20211208054716.603-5-biao.huang@mediatek.com>
References: <20211208054716.603-1-biao.huang@mediatek.com>
 <20211208054716.603-5-biao.huang@mediatek.com>
Subject: Re: [PATCH net-next v7 4/6] net: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
Date: Wed, 08 Dec 2021 07:44:28 -0600
Message-Id: <1638971068.792969.3857739.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_054433_628414_CE8FF73A 
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

On Wed, 08 Dec 2021 13:47:14 +0800, Biao Huang wrote:
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

Full log is available here: https://patchwork.ozlabs.org/patch/1565082


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
