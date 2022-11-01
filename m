Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767F0FA373D
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Nov 2022 06:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kA5JNRTKDV1dAItHbDmK5oovg/tPz2PC0c+hpfEzm2c=; b=deaD3hB2mqfb2KInlUgRUu+b7Y
	f8UfY1xRbvTaqpFae+mD4Ol4v7Uzdow1L3P+qPTeWT9hGwB1nahUktfxTqGd/6/XUfiTmplg2wJPq
	TMDz/AUOa8/pqIKg/cUJ28yIojddMV9LZbJwTDCiZnWUwcSGA+gytIwqb5voP5gWNfVCfKywOiOfS
	TzNd1+l6aO/PZ74iH2ppLhjIk9GhKDk8YVR5QnSzA7i7/sg1jXuTnsSOLs4fHkevO7GHXy8awZMk+
	W7JtDmPsATWTxFngAfDFSaAYu5OKoOo2ERikhEHqeqTIzSJRfFB3SpU9twFL7KueXtMWv+Zv/PB45
	5pNJfSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opkVf-002O2C-8h; Tue, 01 Nov 2022 06:12:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opkVT-002O00-Fl; Tue, 01 Nov 2022 06:12:16 +0000
X-UUID: 8a2466c994c5412dbf37b08987575b91-20221031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kA5JNRTKDV1dAItHbDmK5oovg/tPz2PC0c+hpfEzm2c=;
	b=sCWJbizksz+qi5+bJn5rAGUPje8tRQ9RHy4Cytoaqy3AccI7HU02K8QBYYRp3UgxBmlyNR+fyXdzNnOXloSM3wPqMQAczE4hnGy9++i1l0wwc5ePChFDLF12/5F3/ApTwaRjKC7NkbAB6RDhbtVI1PMOyuYnUWARxjEpZaJbkIk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:08191369-11b3-4016-9790-a4a0714709da,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:0c743e81-3116-4fbc-b86b-83475c3df513,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8a2466c994c5412dbf37b08987575b91-20221031
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 440183185; Mon, 31 Oct 2022 23:12:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 1 Nov 2022 14:11:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 1 Nov 2022 14:11:39 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, Yaochun Hung
	<yc.hung@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 1/2] dt-bindings: dsp: mediatek: Add default clock sources for mt8186 dsp
Date: Tue, 1 Nov 2022 14:11:36 +0800
Message-ID: <20221101061137.25731-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221101061137.25731-1-tinghan.shen@mediatek.com>
References: <20221101061137.25731-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_231215_549955_7183740C 
X-CRM114-Status: GOOD (  10.92  )
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

Add the default clock sources used by mt8186 dsp.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
index 3e63f79890b4..4cc0634c876b 100644
--- a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
@@ -35,11 +35,15 @@ properties:
     items:
       - description: mux for audio dsp clock
       - description: mux for audio dsp local bus
+      - description: default clock source for dsp local bus
+      - description: default clock source for dsp core
 
   clock-names:
     items:
       - const: audiodsp
       - const: adsp_bus
+      - const: mainpll_d2_d2
+      - const: clk26m
 
   power-domains:
     maxItems: 1
@@ -82,9 +86,11 @@ examples:
               <0x1068f000 0x1000>;
         reg-names = "cfg", "sram", "sec", "bus";
         clocks = <&topckgen CLK_TOP_AUDIODSP>,
-                 <&topckgen CLK_TOP_ADSP_BUS>;
-        clock-names = "audiodsp",
-                      "adsp_bus";
+                 <&topckgen CLK_TOP_ADSP_BUS>,
+                 <&topckgen CLK_TOP_MAINPLL_D2_D2>,
+                 <&clk26m>;
+        clock-names = "audiodsp", "adsp_bus",
+                      "mainpll_d2_d2", "clk26m";
         power-domains = <&spm 6>;
         mbox-names = "rx", "tx";
         mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
-- 
2.18.0


