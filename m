Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D54C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 15:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLEryBnzfJNF+hr1zUBjNEe0/wtZnkWyU0RvN5DQ+ZA=; b=UTnH1x/A8u175M
	tSmfbFEUVlNVJvrkhgu7gM4orNyA4dkz5cRqDkDJ5aEt2ec/oLd7Qbr5XeJsGXVlTk4J/D9KGXtkK
	z+FQgpkTGlGqWzNnbJ7vK5P5IqFMqQ5RPAtHD1WDkh7QHiKpa08Vfner4PgnBBJ+S/wbNYL36ukjD
	6fC/Runl86NY2HTcR1I/77f+jAxeBHjUhJuZAJ3umAHmlxzRYIG/fBGvK7+rbk1h/W9gqdrjV/wuo
	rCmys4CsMfWC/FUB9SJfqrOI/Fav4rKi9QCpPVxIE43mkswEztpfxdq4Z5tHhNscwS69//6enPBBN
	RySi09r2Nl2xgUgIEXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mucAR-0098hj-A3; Tue, 07 Dec 2021 15:14:07 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mubv6-0093dl-ES; Tue, 07 Dec 2021 14:58:18 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so18312439oto.13; 
 Tue, 07 Dec 2021 06:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ISwB/Cqr0g2fR9Rv1ZPSZGA/iwpQtfwdBswG+ia19pY=;
 b=WmNKG3OEVP5HjNF73tTVmgXHjokSn+Zq6NAKEPxQX9dPqm5mmAJhHCn5WVVpzLBgvX
 LnCthGsQm5F3hSACuFK5ZTler04HvrDNlVvKp4ky7QdlCk5iNwB7N+bK6X7np3lX6/CZ
 69GuVNX0Yrhbi/mRF18SMj2bSRjZ/3/cluDac5McRuRJAh86lDoq7kWb0jvKWqLHkyo4
 fC4E6abtVIP94PoLW9E7GEX6NaKpY+IhXX6uEKrIcCJPfVvEN1QoXaN46Gf4NNUAF8Hu
 3pCX4vXGZGoY0ccYC3QpB67HKashnaPsnQNKvXQWcND9rTuJekHfcKyXMwC0NRWiPGfy
 eTdQ==
X-Gm-Message-State: AOAM531CHkuGZfKdNss3p0dsxLT5rUx8K2CRP9SR9FxkkkC4qYsytfXS
 nSe86B3SjdpCcNDdbPt7ug==
X-Google-Smtp-Source: ABdhPJzWbIjQ5ndnddb4GSl+z61bTtoUDb/1KYBoxAMiY033kVvOuMdyLuS3XWH3MrvukZoClyRG5g==
X-Received: by 2002:a05:6830:2643:: with SMTP id
 f3mr35971443otu.187.1638889094869; 
 Tue, 07 Dec 2021 06:58:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g4sm2719201oof.40.2021.12.07.06.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 06:58:13 -0800 (PST)
Received: (nullmailer pid 5806 invoked by uid 1000);
 Tue, 07 Dec 2021 14:58:10 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 davem@davemloft.net, netdev@vger.kernel.org, dkirjanov@suse.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 angelogioacchino.delregno@collabora.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, macpaul.lin@mediatek.com
In-Reply-To: <20211207015505.16746-5-biao.huang@mediatek.com>
References: <20211207015505.16746-1-biao.huang@mediatek.com>
 <20211207015505.16746-5-biao.huang@mediatek.com>
Subject: Re: [PATCH v5 4/7] net-next: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
Date: Tue, 07 Dec 2021 08:58:10 -0600
Message-Id: <1638889090.734543.5805.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_065816_534812_E9EA0E0F 
X-CRM114-Status: GOOD (  13.74  )
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

On Tue, 07 Dec 2021 09:55:02 +0800, Biao Huang wrote:
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

Full log is available here: https://patchwork.ozlabs.org/patch/1564459


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
