Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEFDC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 03:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3M0ahcucwkH0tN3bsgOODuE/WxCd4fTP7xaR2lgdxY=; b=ECBj7eacFGqi5j
	d0TPjSL5xcKzHdY59nW556Cdk0rqUbBaWHyNycgrWtSYnVEHuMEOmFqlcqHWH3g3uHrzKn4J6MSeF
	EYU57eEpkp3rbUFqAh6Es6tpDqqSfn314LD0MNlIVf1aA+pLAwsc3gXPZrgCUWUtsO0d1JrGV9zQf
	Uz7FjHk4wV1mRL909jpLHyd6OeQ4yNkmeFCw3PeT7qPYMjylcTDOI+NJTOfoFVMf71aWt/WDYRJDJ
	WetI2BD556esFuV9ohSJDbcFmt/iCUduOlNKM45qzrAQs5EaBX4NvLFlJQ7KlbSyJFbJv15Tc72Sc
	HZME0BXlQaGx6WkNaHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncIX3-008zPl-2I; Thu, 07 Apr 2022 03:10:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncIWy-008zN4-4M; Thu, 07 Apr 2022 03:09:57 +0000
X-UUID: b99e9323bf2f4c2da47d6ddfe5e4d0fc-20220406
X-UUID: b99e9323bf2f4c2da47d6ddfe5e4d0fc-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1027606463; Wed, 06 Apr 2022 20:09:51 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 20:04:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 11:04:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 7 Apr 2022 11:04:10 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [RESEND v17 2/7] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC
 binding
Date: Thu, 7 Apr 2022 11:04:04 +0800
Message-ID: <20220407030409.9664-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
References: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_200956_217383_6DBB049B 
X-CRM114-Status: UNSURE (   8.83  )
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
Cc: David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, postmaster@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, John
 'Warthog9' Hawley <warthog9@eaglescrag.net>,
 linux-stm32@st-md-mailman.stormreply.com, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, CK
 Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 moudy.ho@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the SoC before, such as mt8173, it has 2 pipelines binding to one
mmsys with the same clock driver and the same power domain.

In mt8195, there are 4 pipelines binding to 4 different mmsys, such as
vdosys0, vdosys1, vppsys0 and vppsys1.
Each mmsys uses different clock drivers and different power domain.

Since each mmsys has its own clock, they could be identified
by the different name of their clock.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 6c2c3edcd443..f71c8dd07bf9 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -31,6 +31,7 @@ properties:
               - mediatek,mt8183-mmsys
               - mediatek,mt8186-mmsys
               - mediatek,mt8192-mmsys
+              - mediatek,mt8195-mmsys
               - mediatek,mt8365-mmsys
           - const: syscon
       - items:
@@ -65,6 +66,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
   "#clock-cells":
     const: 1
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
