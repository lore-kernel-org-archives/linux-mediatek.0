Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0BFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 23:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDehEjJqj+lFi4RVmiekMtrcxmys2GZOIkGY6IHMP1A=; b=2LNrgyBHJKtBif
	RNDL0E+GLwBNhmAR7Sc5wezhLudER81j/CE1zt6tjVBxX5CJC6OCsTfqi91Tm0db/5XsNvWevDF59
	aKdFj2WAOc5Z0JA0061jiRToPfn7Pc2Je5AZhjjgtGlQmQGtM+c4T7n0ek4zgrIMQB732pzNqQSQD
	TzD969WnAKLpy4PuQ4Krn3HVIbJ/TIDm2HYK/gEZLGhRFBYeDnHZaIqXR8H8OV4R43TZxtZ8xcd9h
	KQWy83ybCgSIPsOEspaQqXioy0fvAWYINdnhui8o7dols9D82K91SKfGvmCH0hF2vTSUq6pqzYgZ3
	GtuY5lZWOSCtBI/5uiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtI4h-00H9D5-TA; Fri, 03 Dec 2021 23:34:43 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtI4T-00H96z-5i; Fri, 03 Dec 2021 23:34:30 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so5341237otv.9; 
 Fri, 03 Dec 2021 15:34:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=GE0Zk+eX8sZDvupP4sJ6Ohc20e/z8kxjxl7o4izocKY=;
 b=pb7lT5JiqA/oO3bTaFjP8HPbcXiONji19MgzuXGADs6LoiUrU+3WB8dDah9ZHPEIVA
 2DpAXff1+cT7TOcW7JOvxWpXM8dGLs9ch7oK3yQ4Nwxbwx/7Ugocu+XOV/rhgTT+VnND
 Bco3pl4Cg5KEyJYnwEaYYBOhYfZQ45WYK6GFkjJA23bkCW6g4dXgYye3hgC1ef5zBzLX
 9yUGihvutC6w7xT/uEzuVAK2Wjibd6TvP1R2ASPCw4KPsPWFdSf42+fbHiBVXSBd2e3A
 l9fbTfM7fOav+5LlrxGlLpJ6tpfJuzQ1TiWahqH03LJWn+rAJ5kRz3fx/s3Jn7AdVtce
 jq0w==
X-Gm-Message-State: AOAM531OEM5VsEsX6KoMaKm+/k3FKeJsfNrm0VOLDKO/kNRZChjBudRW
 6G9nWnilmRNrbWirVikEOw==
X-Google-Smtp-Source: ABdhPJy3PCupkz+n/wmG78XL1Oz6xk1rXf5k7wFa5WXphozZiozk+A42lWVF0CAkCDKJY7uEHFyW9w==
X-Received: by 2002:a9d:2486:: with SMTP id z6mr19250720ota.210.1638574468140; 
 Fri, 03 Dec 2021 15:34:28 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c41sm939822otu.7.2021.12.03.15.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 15:34:27 -0800 (PST)
Received: (nullmailer pid 1043011 invoked by uid 1000);
 Fri, 03 Dec 2021 23:34:15 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 dkirjanov@suse.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 angelogioacchino.delregno@collabora.com, davem@davemloft.net,
 macpaul.lin@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
In-Reply-To: <20211203063418.14892-5-biao.huang@mediatek.com>
References: <20211203063418.14892-1-biao.huang@mediatek.com>
 <20211203063418.14892-5-biao.huang@mediatek.com>
Subject: Re: [PATCH v4 4/7] net-next: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
Date: Fri, 03 Dec 2021 17:34:15 -0600
Message-Id: <1638574455.270026.1043010.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_153429_239897_C26143E5 
X-CRM114-Status: GOOD (  13.30  )
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

On Fri, 03 Dec 2021 14:34:15 +0800, Biao Huang wrote:
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

Full log is available here: https://patchwork.ozlabs.org/patch/1563125


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
