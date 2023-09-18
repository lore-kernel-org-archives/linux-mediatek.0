Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558C7C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 19:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AA6HVejvp6awQg2Gak+WLVNYgMCN9kZXJeFcHSpn1pg=; b=eMFN2X3qLpjvitistLR/pfBTYf
	TBFzRK/kEaM6dk2NgreGIuFWvV67DDxLmDB0MuDZ5jdhOKMfI/659tTWRVSSCa2GhLFfY0f5Hz6t6
	hjJwBMO9Y2/0YQ4GRcf+mLrmvv/kKPTbFfekK50CnRJP3PI67joDWl4xkK+ThPPG7JCkComZ+iScd
	blKY0jBYpR3uV/wUd367qeGEloIhz1n1QXGeaf0jJJknGYG5TGqWY7mu1bbodUzzXSXEX6gCgEWmN
	IlUa21EPJEP1wu38QasuEzsd+t41y05epjLEuxcaGYZYCPpSMXQssuLsj2XCjNkb7aJe1REXnRzSc
	KPmS8u9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJpM-00GAXM-2e;
	Mon, 18 Sep 2023 19:22:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJp3-00GAGS-0B;
	Mon, 18 Sep 2023 19:22:19 +0000
X-UUID: aa58cbe2565811ee9b7791016c24628a-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AA6HVejvp6awQg2Gak+WLVNYgMCN9kZXJeFcHSpn1pg=;
	b=UjuJAZnubSKjPRkABlZbxC8bLxZbt3JuBVyz4it1V4ZLNW0+Vn4oZ2lYjJH/JIMcvl6kOF4+QcMVzQ5JnEt7hXvIzbgfrY3YkmRx7402GZt/gz96och22+ymM8QcM0Mi7gKNBbdVv3qTC1Rfsk/pTURZwYXxUZ+BFVTLwS8qvD4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:2245fe00-5be8-4da3-9be6-f7be0c240c01,IP:0,U
	RL:0,TC:0,Content:38,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:38
X-CID-META: VersionHash:0ad78a4,CLOUDID:2933d7ef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aa58cbe2565811ee9b7791016c24628a-20230918
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 829643286; Mon, 18 Sep 2023 12:22:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 03:22:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 03:22:06 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Elvis Wang" <Elvis.Wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 01/15] dt-bindings: mailbox: Add property for CMDQ secure driver
Date: Tue, 19 Sep 2023 03:21:50 +0800
Message-ID: <20230918192204.32263-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.597900-8.000000
X-TMASE-MatchedRID: iSQL5szRvdEXSulpnju2H6wxbZnudyr7ELbqrOgWzyfOxDyJFXIPjpM5
	rPAxB6p1j6kCfX0Edc5fvtuIsaf1ZSpMHNWH39YQXSKcwPTzq/J5y+Nu7/EOOgv/nTOPQovs3k1
	HMnSDPkfLqCJZs0VuwMJTJNWmePeVNyl1nd9CIt0URSScn+QSXt0H8LFZNFG7bkV4e2xSge4egJ
	CKnUjm4eHgAk/GRGDANamVZCBGTM1A7arqKflzisWFcyN1Agmm
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.597900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7A111DE7BC234BF0F37F0DC80E0B29F8EB7F0415BBC63A13F4559B242582EBAC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_122217_097883_28273A22 
X-CRM114-Status: GOOD (  13.27  )
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

Add mboxes to define a GCE loopping thread as a secure irq handler.
Add mediatek,event to define a GCE software event siganl as a secure
irq.

These 2 properties are required for CMDQ secure driver.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../mailbox/mediatek,gce-mailbox.yaml         | 30 +++++++++++++++----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index cef9d7601398..5c9aebe83d2d 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -49,6 +49,21 @@ properties:
     items:
       - const: gce
 
+  mboxes:
+    description:
+      A mailbox channel used as a secure irq handler in normal world.
+      Using mailbox to communicate with GCE to setup looping thread,
+      it should have this property and a phandle, mailbox specifiers.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  mediatek,gce-events:
+    description:
+      The event id which is mapping to a software event signal to gce.
+      It is used as a secure irq for every secure gce threads.
+      The event id is defined in the gce header
+      include/dt-bindings/mailbox/mediatek,<chip>-gce.h of each chips.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
 required:
   - compatible
   - "#mbox-cells"
@@ -71,20 +86,23 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/mediatek,mt8188-gce.h>
 
     soc {
         #address-cells = <2>;
         #size-cells = <2>;
 
-        gce: mailbox@10212000 {
-            compatible = "mediatek,mt8173-gce";
-            reg = <0 0x10212000 0 0x1000>;
-            interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_LOW>;
+        gce0: mailbox@10320000 {
+            compatible = "mediatek,mt8188-gce";
+            reg = <0 0x10320000 0 0x4000>;
+            interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
             #mbox-cells = <2>;
-            clocks = <&infracfg CLK_INFRA_GCE>;
+            clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
             clock-names = "gce";
+            mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;
+            mediatek,gce-events = <CMDQ_SYNC_TOKEN_SECURE_THR_EOF>;
         };
     };
-- 
2.18.0


