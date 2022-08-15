Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF065C00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s4Kcd+rkVLrqPY1boQicbU5RlczH2V6/bPYBfFWQSeE=; b=jkVe8w1IUoafzuCnv1IjjmFMIs
	suh9uZHawDsE2QN3AiIgx4PhDpXxA5BL/keh7KJRpDNWpk2lR/KDisgqk2wUPMUfVdNpAPDPbcASG
	LXQ/keKJUH7dCSEfozIMgxwBcrMDH/cLjpy1aBK/0bNzoKP1DzQ0Alc+rkjdp+OGqvLsk/C7eAIMo
	HLN/mxVtSHRyewld7LLk7jv+9EiMuVSEEUZ4+cBCT5FOW6qQj8b4HIYwff7Gd9XqjzwGpGsQ15Ngj
	UucZwIQUF5M9nRzm+6FM6EIKPaNfZtcl0trQHOzTZ3PBjJr7NO1Fu29qT+PrnnvQ4FfDe0Bn0y8KG
	6ifKsyxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNZTe-00GInB-JE; Mon, 15 Aug 2022 12:45:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNZTX-00GIgh-6E; Mon, 15 Aug 2022 12:45:48 +0000
X-UUID: 80bdb6df36e540889da325f5fed94197-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=s4Kcd+rkVLrqPY1boQicbU5RlczH2V6/bPYBfFWQSeE=;
	b=riBDeLO6akDi87eLDQLW+JtKQOQ4YOkDiNl79meC37C3ZZPl8ZmDXkMdEs78Es+jHHIem5o2OrnwSj90YGx4Z0banJ+GBdDEr7M+2LhPfSkbzxe1/v9zzsu2p8mezCgH0059xVLNAF1BBMsHmU9Ri7lFGqnKxAt93NUZTBs0Qgc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:2aeaadea-daf3-4643-8686-e97a27a2f7ce,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:3d8acc9,CLOUDID:baecb59c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 80bdb6df36e540889da325f5fed94197-20220815
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 5885247; Mon, 15 Aug 2022 05:45:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 15 Aug 2022 20:25:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 15 Aug 2022 20:25:04 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Guodong Liu
	<guodong.liu@mediatek.com>
Subject: [PATCH] dt-bindings: pinctrl: mt8186: Fix 'reg-names' for pinctrl nodes
Date: Mon, 15 Aug 2022 20:25:03 +0800
Message-ID: <20220815122503.2768-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_054547_318938_8C248C58 
X-CRM114-Status: GOOD (  10.89  )
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

There are 8 GPIO physical address bases in mt8186, corresponding to the
items of 'reg-names' with the pinctrl driver. but the order of
'reg-names' is not correct. The mt8186 pinctrl driver would get the
wrong address, causing the system to restart when regulator initializes
. we fix 'reg-names' for pinctrl nodes and the pinctrl-mt8186 example
in bindings.

Fixes: 338e953f1bd1 ("dt-bindings: pinctrl: mt8186: add pinctrl file and binding document")
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
---
 .../bindings/pinctrl/pinctrl-mt8186.yaml         | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
index 1eeb885ce0c6..604445e390a7 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
@@ -41,12 +41,12 @@ properties:
       Gpio base register names.
     items:
       - const: iocfg0
-      - const: iocfg_bm
-      - const: iocfg_bl
-      - const: iocfg_br
+      - const: iocfg_lt
       - const: iocfg_lm
+      - const: iocfg_lb
+      - const: iocfg_bl
       - const: iocfg_rb
-      - const: iocfg_tl
+      - const: iocfg_rt
       - const: eint
 
   interrupt-controller: true
@@ -232,12 +232,12 @@ examples:
             <0x10002200 0x0200>,
             <0x10002400 0x0200>,
             <0x10002600 0x0200>,
-            <0x10002A00 0x0200>,
+            <0x10002a00 0x0200>,
             <0x10002c00 0x0200>,
             <0x1000b000 0x1000>;
-      reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
-                  "iocfg_br", "iocfg_lm", "iocfg_rb",
-                  "iocfg_tl", "eint";
+      reg-names = "iocfg0", "iocfg_lt", "iocfg_lm",
+                  "iocfg_lb", "iocfg_bl", "iocfg_rb",
+                  "iocfg_rt", "eint";
       gpio-controller;
       #gpio-cells = <2>;
       gpio-ranges = <&pio 0 0 185>;
-- 
2.18.0


