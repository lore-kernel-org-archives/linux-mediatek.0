Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA016C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQX8ZQWdVr1CtInDutwJkDzeAsKhPsyMRRPX8IC+jw4=; b=cKEHsHzWXK5Nd1
	TuJ3jXgnt4il34DjhQgZwDLUZ7nPYkoe8Vyk5hY24blyUJK1N5NNoJC33CWcb8/H3Q1lPa1359+rd
	B0fNZSKvm9BXbULgU5+VsSGVxKfaCt6albBiLE8iZNXK1sIxnGZkaQ79Znkrd5pSgq6+RT9gA+prs
	sHGtkBdAm0zrGFpavx3M3RLnHS5DDPjTamxlMSdHPcQjl7AKCxFZafWxef1F/4dSHX6BtTTYBCet7
	G+Eas7my5Ej1WG4e4v/CooSF6EvaAEWi4Bhv3siGwj7AeTVJ5SXIKYjI0INu42GphpqaZIhlY4qin
	9DIqbygUNwLgSsXy8F9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvgUY-0027GY-SU; Fri, 10 Dec 2021 14:03:18 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvgUO-0027C0-Hb; Fri, 10 Dec 2021 14:03:10 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso9662624otf.12; 
 Fri, 10 Dec 2021 06:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=qFj8K3WFpcuS6IdcgSs6T2eGLRNYj7TpTJrIpVhra44=;
 b=3K5IU1sK0X5r5w2Xzy/v5iq9nVvwjdxuadCoe06FFIGbLlamjwK15Hu7mtkAv6x62i
 GdqzDet9C0atqEKP+oEDOAP7qyoaR7SZn8Tl6oFN7loylq3OgV+jUmRHKHJckuZEBUmc
 eEdjTgy7UwqkU/BrQPAKTi7B8R/Z8kspZBgoKHBEdK9EBld/vGObBNNqqHxjY514VwA5
 tI8GXwFTdehdF+Dvr4ag9HR9cpjWdpL9aiXiChTi54hPeBQbf6U9XOIugnX+/ztdIr7e
 JLvVGHo2REtk6R9Tcixx9TZ9WcujRkBbgHR/equWvhk7LeKo/3cD1lCYEe12QOYEM9lc
 H4lQ==
X-Gm-Message-State: AOAM533uIjMSevN9wiib3oD3ZO6puJnL32RKWvINYeJm+4bFAprUucCB
 uQozkskftsGLNiapo2hBPQ==
X-Google-Smtp-Source: ABdhPJxGA9LwgjCGvSQm44Ms90YQCfR3aM+imwu+hZ7RRERaZQjBVA7pPuzIZen5MPrjMTwZuS9PoA==
X-Received: by 2002:a9d:1b0f:: with SMTP id l15mr10945246otl.38.1639144983324; 
 Fri, 10 Dec 2021 06:03:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y192sm673672oie.21.2021.12.10.06.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 06:03:00 -0800 (PST)
Received: (nullmailer pid 1252262 invoked by uid 1000);
 Fri, 10 Dec 2021 14:02:56 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, srv_heupstream@mediatek.com,
 macpaul.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 dkirjanov@suse.de, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, davem@davemloft.net,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org
In-Reply-To: <20211210013129.811-7-biao.huang@mediatek.com>
References: <20211210013129.811-1-biao.huang@mediatek.com>
 <20211210013129.811-7-biao.huang@mediatek.com>
Subject: Re: [PATCH net-next v8 6/6] net: dt-bindings: dwmac: add support for
 mt8195
Date: Fri, 10 Dec 2021 08:02:56 -0600
Message-Id: <1639144976.235371.1252261.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_060308_631771_03C6BB2F 
X-CRM114-Status: GOOD (  10.59  )
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

On Fri, 10 Dec 2021 09:31:29 +0800, Biao Huang wrote:
> Add binding document for the ethernet on mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.yaml          | 86 +++++++++++++++----
>  1 file changed, 70 insertions(+), 16 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1566168


ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref'] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not contain items matching the given schema
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: Unevaluated properties are not allowed ('compatible', 'reg', 'interrupts', 'interrupt-names', 'mac-address', 'clock-names', 'clocks', 'assigned-clocks', 'assigned-clock-parents', 'power-domains', 'snps,axi-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,txpbl', 'snps,rxpbl', 'clk_csr', 'phy-mode', 'phy-handle', 'snps,reset-gpio', 'mdio' were unexpected)
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
