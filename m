Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CF8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 15:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtPIwk2yDrwCk1/rQrD+W3DsJF2ste51df9cCxMoQR4=; b=3+hSEA/Asag9piLm62baL8+Hz1
	jg6J5sEXvGq8QBHDEa75DyghTeeT33E42AJ+eTVy2Uc7ls06POgw8s4aW/9GMgiu648T3SARjVDzR
	wQtAIPCTcX3a4k6sGig2lRYFKxtsRWDN7Pj/mbBwR8ZdW5kOdd6IszjWBCeswPww70brdwRdIAGEA
	0B4YEm6CIkdWzdy/K8mip2DB0Y08nh6/HkkYvrqCVbqMh+vb4V7gRL44PvsOjS7Qkq26yM4ia4Dy5
	AxEcYm7cYdr+N7mOa+gew45rfc9nChebAHGo+z5bnPzu7iQptKfXD5KObBMy2Qs/5KyuU+MBYOGf+
	UfqVUYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82HL-006PJO-GT; Thu, 13 Jan 2022 15:44:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82Gp-006P5f-Qh; Thu, 13 Jan 2022 15:44:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C463E1F45F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642088650;
 bh=3vGVtVzMAhUmYM5YjA6CBnjnlY+uoAIkrXPjo/Gg1GI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Y3KiLojbdjd1lJ/W6NH25Ji0/8OF+E0IkH2Onn7bsAkaEmfjjj02nAY4kSZ1Y+UfI
 94A10jPfHgHlRBJxERt9+viTwuzR18mGLHnUCR/AagKfPO0o5pjAOCuGfow+b1lvuh
 Tlqzq/MQ7aSujocogRWsgNxbGeKDIKUrDut6cpXRIX+Iu5lPFzeks0tonky7C5Aols
 jvJNgrMEYmM1YpqbBnlf0uCEx8OpLuf6K7nTFBuxoYOi9Yw4tYRfG0q6TgPFUQEljs
 uq/4C0kDkcrUAP2QL3QVr6lBpx6fjW3s8Qp9k+X1bwnUajHOQIHeY/DpHMYNyYHylI
 WY+a95p3pxwrQ==
Subject: Re: [PATCH v3 3/7] dt-bindings: memory: mtk-smi: Correct minItems to
 2 for the gals clocks
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
 <20220113111057.29918-4-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <dbaf0fa5-4900-a59d-b05d-a138464a4f39@collabora.com>
Date: Thu, 13 Jan 2022 16:44:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220113111057.29918-4-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_074412_082668_E0A71140 
X-CRM114-Status: GOOD (  12.23  )
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
> larb@14017000: clock-names: ['apb', 'smi'] is too short
> 	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dt.yaml
> 	...
> 
> larb@16010000: clock-names: ['apb', 'smi'] is too short
> 	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dt.yaml
> 
> larb@17010000: clock-names: ['apb', 'smi'] is too short
> 	arch/arm64/boot/dts/mediatek/mt8183-evb.dt.yaml
> 	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dt.yaml
> 
> If a platform's larb supports gals, there will be some larbs have one
> more "gals" clock while the others still only need "apb"/"smi" clocks,
> then the minItems for clocks and clock-names are 2.
> 
> Fixes: 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to DT schema")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
