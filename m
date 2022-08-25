Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF283C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 06:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aUWpRgHtNV4o5Os9E2A3UPYhpEU1YCs0RcI9qd2YUws=; b=r4ER1ofwF6BhcnEv1krMCNhHH+
	Qk8NohjD0pMuJC+iOKvLMo6YQjsap3BwnRo8DVpioLhn0OOzJQQL9M4ZMs5jrvN6lzG6Oi+yJtXLd
	3jLnBwGla3iHg32r+xZeLXmrhRfmaxI/c56cJuDByQJO31EhTOdRNrIGg7aS0JbddONwYvvl3ciI5
	op4r2B70CDRSUnqp6CWGJydjQdJcZ0xwK74cNqJocsBDE8tket4xBxJE5VqizqgOjZKa8jK/HuznC
	olkBAd9m2fzAg2/D7zlZfy3JAxIkaXe58T1cjJv6YnE50G7IR2ITQAl8MbAoyerH8x0Itq8t88Ord
	Ic5Ej24Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6Uw-007xIG-FA; Thu, 25 Aug 2022 06:37:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6Ur-007xE8-Hg; Thu, 25 Aug 2022 06:37:49 +0000
X-UUID: 08befde43c36479d92872418d024a535-20220824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aUWpRgHtNV4o5Os9E2A3UPYhpEU1YCs0RcI9qd2YUws=;
	b=sCM5Eht3nH7SqAM7eG/cCXGiL3NqlBpryBguiKPHxkffvUcPe1anDiIgDLSd36JrR9XlhpvLbsW2QMQjyUmGUIW1A4+0s/uppNHGqVSovGUi0SH7GqW2ohUiLhozU4UrN2dEPGJxMmrJHx6Hfwdl6NLF9vu0lhWqWL7sFH39J94=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:f373db1a-d0a1-4f1c-abdd-e69faa415b81,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:c0340f20-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 08befde43c36479d92872418d024a535-20220824
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 890671744; Wed, 24 Aug 2022 23:37:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 25 Aug 2022 13:57:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 25 Aug 2022 13:57:00 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <hsinyi@google.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH] dt-bindings: arm: mediatek: mmsys: change compatible for MT8195
Date: Thu, 25 Aug 2022 13:56:58 +0800
Message-ID: <20220825055658.12429-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_233745_653334_9A4FD3C9 
X-CRM114-Status: GOOD (  10.71  )
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

For previous MediaTek SoCs, such as MT8173, there are 2 display HW
pipelines binding to 1 mmsys with the same power domain, the same
clock driver and the same mediatek-drm driver.

For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
2 different power domains, different clock drivers and different
mediatek-drm drivers.

Therefore, we need to separate these two different mmsys hardwares to
2 different compatibles for MT8195.

Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 6ad023eec193..bfbdd30d2092 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -31,7 +31,8 @@ properties:
               - mediatek,mt8183-mmsys
               - mediatek,mt8186-mmsys
               - mediatek,mt8192-mmsys
-              - mediatek,mt8195-mmsys
+              - mediatek,mt8195-vdosys0
+              - mediatek,mt8195-vdosys1
               - mediatek,mt8365-mmsys
           - const: syscon
       - items:
-- 
2.18.0


