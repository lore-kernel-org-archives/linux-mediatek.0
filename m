Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFE0C67861
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 08:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZaqI36d10QGf6jW7rTzen5eoFQOAfbyQimxfbM5pROI=; b=dKqHWwE2EInpcX
	pbM/1AQ93mW7A/U2AUMKdzdcnOsDx36wMU+pUQI/Z19HVp8PbC4uYBmRfC4GBXwcdpBJImda5GQI1
	7QkOBF9wfZQR/Ce+WOY77eoMEGHIz7bOZeq2ftrCTtTmjhB59dgf0W5ohVHRuul5yoyVmXFJCaq3S
	yU8/+03gXN80w8/tDOS07/ILZ9oqB3hdvZevA2cuGLaNf58WTsKrDz/Ys2fEL6FDrWUxpBL06rygY
	uyshY7y6FrFAriaFo2SiDrgCb3/hfcm8423YkClAgSxlfOgGEOHKOD2T+WgvU3C4jStBIx+KCoo59
	EsT9A34jhQjLWinZY83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseWj-00000005qJo-45xF;
	Fri, 05 Apr 2024 08:02:21 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseWh-00000005qHp-2TmN;
	Fri, 05 Apr 2024 08:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712304138;
	bh=sVI13Nt7Fp//lImiaOTziIE4cX0l5nWa4MyNYpW6L2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kSmhNO5hcDDTMff4yRpdTdu3N94W9LIAWso6pYMHabIlEqdyZZyCWZdipyK/VyDtl
	 egDYzJcbP5pGXSfhJxRDZUz9D8bb2T0CP2YjYk+a4XUSO3cH2ywztiYMxBl11z43le
	 EvfntqOZ9Slc8Kac6vPVZ3Nv0SEetM+xLG97KMoONEcxlNEWHfEpNuj4fLgvcxazUU
	 PE0J4exObd5XV3XgOQEc3mdm3VfoJXXmlkdNo46hRpznrqGPZ4Z38S8kZsqrM25OvV
	 LyPWrkgkKNeF3ggPcpyLftt8AHPpRoztiiJl+hF9po4CfqABcyaCr6kWk1ciy2TazY
	 0F6p2eVqoZGEQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E1B28378212F;
	Fri,  5 Apr 2024 08:02:16 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt2712: fix validation errors
Date: Fri,  5 Apr 2024 10:02:10 +0200
Message-ID: <171230386964.52006.15929846137869479168.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240301074741.8362-1-zajec5@gmail.com>
References: <20240301074741.8362-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_010219_808538_A7A66E60 
X-CRM114-Status: UNSURE (   8.81  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 01 Mar 2024 08:47:41 +0100, Rafał Miłecki wrote:
> 1. Fixup infracfg clock controller binding
>    It also acts as reset controller so #reset-cells is required.
> 2. Use -pins suffix for pinctrl
> 
> This fixes:
> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: syscon@10001000: '#reset-cells' is a required property
>         from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,infracfg.yaml#
> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: pinctrl@1000b000: 'eth_default', 'eth_sleep', 'usb0_iddig', 'usb1_iddig' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
>         from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
> 
> [...]

Applied to v6.9-fixes/dts64, thanks!

[1/1] arm64: dts: mediatek: mt2712: fix validation errors
      commit: 3baac7291effb501c4d52df7019ebf52011e5772

Cheers,
Angelo


