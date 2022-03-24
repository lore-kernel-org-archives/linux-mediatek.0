Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7E8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 05:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkHcVJkT4IDIKN91UvqTJ30Sip8iKgTSUoDBIE/q/FA=; b=ET3D+GxpCFRMDm
	FLBxmUOjFenAO50Ry10DEJZQDQ751Mlmw8LtjD5qfW8JMU+CCkQybaAT5VCqww6CslDyIYRGkxr6e
	IMzeU3iKr5pJ/yr5poMphUhKhco11bjl9f28Ys901odglHHaVEI7Cgt6b6c8sPb+9c3Oi9tcSWIgZ
	0xzbjuhpsMzUxzehWPFzTOb/XxowG1c9Eyhu8Z3byP5DcquMFgmh/R5opX6Peo8zaZO8/dMop7D7j
	316y8QbQ561ltyMZTn+ic8XM6Bhl7vgV4nVo2yyXCTDazH7TDYwzPDK6SoTRx3gcgfycaDN9YtV92
	a3jfUd3hAGfpcww+q7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXGTC-00Fi9w-M9; Thu, 24 Mar 2022 05:57:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXGT9-00Fi8x-Nv; Thu, 24 Mar 2022 05:57:13 +0000
X-UUID: 8d2b797ca7294d8cbe62d1687de2d9ee-20220323
X-UUID: 8d2b797ca7294d8cbe62d1687de2d9ee-20220323
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 585988897; Wed, 23 Mar 2022 22:57:03 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 22:57:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 13:57:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Mar 2022 13:57:00 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <trevor.wu@mediatek.com>
CC: <aaronyu@google.com>, <alsa-devel@alsa-project.org>,
 <angelogioacchino.delregno@collabora.com>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <robh+dt@kernel.org>,
 <tiwai@suse.com>, <tzungbi@google.com>, <yc.hung@mediatek.com>
Subject: Re: [PATCH v4 3/6] ASoC: dt-bindings: mediatek: mt8195: merge mt8195
 machine yaml
Date: Thu, 24 Mar 2022 13:57:00 +0800
Message-ID: <20220324055700.28736-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220324053851.27350-4-trevor.wu@mediatek.com>
References: <20220324053851.27350-4-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_225711_799170_D49E2C08 
X-CRM114-Status: GOOD (  10.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Because the same binding components can be shared by all codecs
> combinations, we only reserve one binding file for mt8195 machine driver
> and rename to a generic name.
> 
> We use compatible string to separate different codec combination instead
> of creating a new binding file for new codec combination.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
>---

...snip...

>diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
>similarity index 87%
>rename from Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
>rename to Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
>index 8f177e02ad35..04953f5b44a4 100644
>--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
>+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
>@@ -1,10 +1,10 @@
> # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> %YAML 1.2
> ---
>-$id: http://devicetree.org/schemas/sound/mt8195-mt6359-rt1019-rt5682.yaml#
>+$id: http://devicetree.org/schemas/sound/mt8195-mt6359.yaml#
> $schema: http://devicetree.org/meta-schemas/core.yaml#
> 
>-title: Mediatek MT8195 with MT6359, RT1019 and RT5682 ASoC sound card driver
>+title: MediaTek MT8195 ASoC sound card driver
> 

I also tested:
'make dt_binding_check DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml'
and it wotks fine.

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

> maintainers:
>   - Trevor Wu <trevor.wu@mediatek.com>
>@@ -14,7 +14,9 @@ description:
> 
> properties:
>   compatible:
>-    const: mediatek,mt8195_mt6359_rt1019_rt5682
>+    enum:
>+      - mediatek,mt8195_mt6359_rt1019_rt5682
>+      - mediatek,mt8195_mt6359_rt1011_rt5682
> 
>   model:
>     $ref: /schemas/types.yaml#/definitions/string
>-- 
>2.18.0
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
