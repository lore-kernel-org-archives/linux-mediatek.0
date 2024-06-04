Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A3EC25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 12:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57Ul8I/66cZKZuPDNU1UlSfI517rXLOqGCB2B3UYuv8=; b=xxxv+wwx3IS59/OMDZTLmPrIUY
	m2P04YfbXV8G/ERE3yU0aYb5AcXI8kYYN9EPBQj0uTNQvD/11B9SP0lc/0xT2tUhukk+BpdjglLtj
	vPmsmcA8oK/D/GE/lQnH2Ab8+2h2NMbekQkSjAR9aIHNMoDa9Kv/v6GcsApX8+k0ePOlVn+PtxNKS
	uUxm1BGPKsBRkAc2D2oTNHEbkMQtmhQRKFLzHc6UaeWQ27TDvBk6Pbh64eGkD8QJQYeaz5eBCWWFD
	x3aHTtD9l19WkZSuOwzjEfv47HExj15itCFZB1Oh8vtpQWSEiWDmxDLDqJNkuos3hVTrdH6SdLQb/
	fyP+fUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETXX-00000002Ku9-0jKn;
	Tue, 04 Jun 2024 12:45:23 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETXS-00000002Ksg-42mV;
	Tue, 04 Jun 2024 12:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717505117;
	bh=E0za82wH+riKSrkW3okeafFzOvq6hMFAmSi0fUjeKEE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o4cjE1McS9mpp5GD+Q/oBe2XCS2yuJ6i5JW9sI17vwR1gV3i/NnXK8ku2bj7QqWEV
	 +v5PuMI+k81OyilqjFXk9JCzeA42RUeKpiUlWgoVfe5GeFiZcchQFtbYINc/Ki8gc0
	 hwsmozZ0s5qIHgvADblwgOArYAdBrAiUHKwJ6lfVziVQzmgNcA+TP5TWXbRzHuR8iA
	 lPbb6LD9UmvNyV9noz82fRm4txB0aOBZV0kGMyCiFbUTP3QTrk/GOlKpODP1avp6aZ
	 ThWTUsyfkwyZJtfhrwTRxnlWtysCUFrbklhzVeVqwoDiHEbuBayoNJ3tY9hHVbPT/P
	 Nzry+gyOb5Iag==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1499C37821A8;
	Tue,  4 Jun 2024 12:45:17 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20240604074916.7929-1-zajec5@gmail.com>
References: <20240604074916.7929-1-zajec5@gmail.com>
Subject: Re: [PATCH RESEND] arm64: dts: mediatek: mt7622: fix "emmc"
 pinctrl mux
Message-Id: <171750511699.334676.15228989792130052568.b4-ty@collabora.com>
Date: Tue, 04 Jun 2024 14:45:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054519_151429_92132821 
X-CRM114-Status: UNSURE (   6.22  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 04 Jun 2024 09:49:16 +0200, Rafał Miłecki wrote:
> Value "emmc_rst" is a group name and should be part of the "groups"
> property.
> 
> This fixes:
> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pinctrl@10211000: emmc-pins-default:mux:function: ['emmc', 'emmc_rst'] is too long
>         from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000: emmc-pins-default:mux:function: ['emmc', 'emmc_rst'] is too long
>         from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
> 
> [...]

Applied to v6.10-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7622: fix "emmc" pinctrl mux
      commit: 0175890e2b71cbd2afdda85578475bf6a626dcd8

Cheers,
Angelo



