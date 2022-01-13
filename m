Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D10C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 15:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThvpFTxysxHtNDohcclhfaS3Z3QRpOs6WhPslkga/pw=; b=GS3QmWplR8/BU0Lp0CugCbNOag
	FUyYMVDhtB5VGfT5VxDA+KN0VWZN8dGg0smSNLhQwBwfXN8ml9558uQ6CUiH1YkL7wqZXZR8dl+yF
	wOwET+sQOxsqq3qKPS2/nMzoHBIjiio+hVtGAcUlTfbsHZ5kWF1zfdXKHu4J90K0zWuzv7j8ofuk8
	zsnFHzT9Dq7vja+hj7XNuNNrS8+4AoZZsARiNjDt5P0rBYytT+xFm1vNPp0F1Urf1S703tEhX4U4L
	11QTuX8UjFSKpJvRNKyH72bZ1qcz4dkP8xPdBDoywTcPjizWypZSjsTiTvNy8Suee6By0uctTnkW9
	g5ezRtIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82Ha-006PSA-Jc; Thu, 13 Jan 2022 15:44:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82Gs-006P6O-NL; Thu, 13 Jan 2022 15:44:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4A7421F45F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642088653;
 bh=OCoO1qcOvbTSRnl8cd3s4VLrF0+nSIp3C4F6axnFvE4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hsYI0QU8kAEuHKcWn3ygTE6VlGWOluTXSPxAG10x0EfTk8xP/aPZdqBXt3qK4W8Ml
 rceQtiuf3bRX9VlepakMKRs9MSJnsNg+585JsW1WLe92vTGLmMBPn397qbf5btoP3y
 EmD/TIkY5531qS8GGM9vjfXTA71dhsi7GJ1ebWj73I+MW9k16hRjQ51x8Wg5OoyOSF
 GPCIEXc8oA7FHLuiOXcaQZQSJANTVsxFsbz94T215pZv8P6RDeK7eVpeD7n/fq4QU8
 53Eii705xxn0RpbtXLhOgFmQ72DVjdbon6GUg3NVJb5iYk6FRcB/2SivSLFdSbhkmx
 LDEY4dqU+RZvA==
Subject: Re: [PATCH v3 2/7] dt-bindings: memory: mtk-smi: No need
 mediatek,larb-id for mt8167
To: Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, lc.kan@mediatek.com,
 yi.kuo@mediatek.com, anthony.huang@mediatek.com
References: <20220113111057.29918-1-yong.wu@mediatek.com>
 <20220113111057.29918-3-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <65919fad-3fbc-728d-4f14-5490b59e30a9@collabora.com>
Date: Thu, 13 Jan 2022 16:44:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220113111057.29918-3-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_074414_974326_AE8A6EFA 
X-CRM114-Status: GOOD (  12.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 13/01/22 12:10, Yong Wu ha scritto:
> Mute the warning from "make dtbs_check":
> 
> larb@14016000: 'mediatek,larb-id' is a required property
> 	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml
> larb@15001000: 'mediatek,larb-id' is a required property
> 	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml
> larb@16010000: 'mediatek,larb-id' is a required property
> 	arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dt.yaml
> 
> As the description of mediatek,larb-id, the property is only
> required when the larbid is not consecutive from its IOMMU point of view.
> 
> Also, from the description of mediatek,larbs in
> Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml, all the larbs
> must sort by the larb index.
> 
> In mt8167, there is only one IOMMU HW and three larbs. The drivers already
> know its larb index from the mediatek,larbs property of IOMMU, thus no
> need this property.
> 
> Fixes: 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to DT schema")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
