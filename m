Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99805C25B75
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 May 2024 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iqv6x/ghbzUOX83DTvSQ+4xvQ/d9I2EOAPbwfRk/TA=; b=a/r/BuiAtNIi3sFgjvSM+3Ikm8
	5VvwwCSyQmGdUPn1PxbwT9HlzDyuWjU1wx0RuwFl7XLs9leCx1a1cgrg1OGA0cCGBLYPgqRenmjTI
	qmKBOoW80R4a2cz0lIzioFgG+ooPWWQl7I8Ai0yy/YbH9+g/DcJ2ZF9yt5Ms0Jw0jeZVx4W0eIqpV
	yqFRI0iF62ykkdFrCKSg7b7WnCBeSM0KCMM7oHdIqM+bms2oOyIEh2j3+NP2qX7S5nhUK0lqxwT5m
	/63B1atSvPb4U+SmsQb5yQJfAnHXOde5Iq2JOQS9RqK4p2Mb0+j2qsX7EQ6iyfU+lci8nuBD4Jasm
	vz90lF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBF7w-0000000Cp0s-3fsJ;
	Sun, 26 May 2024 14:45:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBF7G-0000000CoTR-3Uv1;
	Sun, 26 May 2024 14:44:56 +0000
X-UUID: 801c2f3c1b6e11ef82c84f6416ccf2f3-20240526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5iqv6x/ghbzUOX83DTvSQ+4xvQ/d9I2EOAPbwfRk/TA=;
	b=jhJyZkhK9j4XP7X1dsdHIBLH0fG+zBK+5WztohqyA0H7XVw5vqwdo3cAh06WFZZdAJLY9AwWtXPcEyB7IpM+wGJ62/sYDDrwMb2F6FBuQdbA7FsdbWJ6B5YRA9Pk05+QRgXFmDZed4eu3W76Lb1LDnn+RMfXhNzWdK6gi0IsWFU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:6157c8bf-a1ea-4597-b39c-a8b6b29af111,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:e0a85384-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 801c2f3c1b6e11ef82c84f6416ccf2f3-20240526
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 930129126; Sun, 26 May 2024 07:44:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 22:44:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 22:44:44 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH RESEND,v6 2/8] dt-bindings: mailbox: Add property for CMDQ secure driver
Date: Sun, 26 May 2024 22:44:37 +0800
Message-ID: <20240526144443.14345-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.815100-8.000000
X-TMASE-MatchedRID: OXh+vcntO3AXSulpnju2H23NvezwBrVmgYy8y+HaPlZOCtCDJNptxlkx
	R/OK+HA0Qv/RxZk9D1F8EK4uBc8FBrM5yFdOCNfRJLZygv5HzOXt/okBLaEo+JIuII6CcB9zTr4
	Kjlf+TXdryn58a4qF0HVUSbHuxOT/JogLSXP5a/d0BEBFOTiHn1sChor7BLiNzsQ8iRVyD45ZoZ
	UwtnkREuLzNWBegCW2wgn7iDBesS15zdAzex5xZi7QVrcw6a2RkF3QJQiIzo4J/ae5Bj5hUe1+s
	HjxVjEGRUQ1pOGS5K+UTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.815100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8BC45171C859439C88226BB04643934A9F8341B3FAD9BAB923E5E34DB624BF5D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_074454_936715_62A53C18 
X-CRM114-Status: GOOD (  14.65  )
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

1. Add mboxes property to define a GCE loopping thread as a secure IRQ
handler.
The CMDQ secure driver requests a mbox channel and sends a looping
command to the GCE thread. The looping command will wait for a secure
packet done event signal from secure world and then jump back to the
first instuction. Each time it waits for an event, it notifies the
CMDQ driver to perform the same action as the IRQ handler.

2. Add gce-events property from gce-props.yaml to define a
secure packet done signal in secure world.
There are 1024 events IDs for GCE to use to execute instructions in
the specific event happened. These events could be signaled by HW or SW
and their value would be different in different SoC because of HW event
IDs distribution range from 0 to 1023.
If we set a static event ID: 855 for mt8188, it might be conflict the
event ID original set in mt8195.
So we define an event ID that will be set when GCE runs to the end of
secure cmdq packet in the secure world.

This can reduce the latency of software communication between normal
world and secure world. In addition, we can also remove the complex
logic after the secure packet done in the secure world.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index cef9d7601398..6e5e848d61d9 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -49,6 +49,10 @@ properties:
     items:
       - const: gce
 
+  mboxes:
+    items:
+      - description: GCE looping thread as a secure IRQ handler
+
 required:
   - compatible
   - "#mbox-cells"
@@ -57,6 +61,8 @@ required:
   - clocks
 
 allOf:
+  - $ref: /schemas/mailbox/mediatek,gce-props.yaml#
+
   - if:
       not:
         properties:
@@ -67,7 +73,7 @@ allOf:
       required:
         - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.18.0


