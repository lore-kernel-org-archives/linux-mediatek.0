Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD7BC021B1
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2025 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uzh1JZII0+rs/QTFKIZkFkkjKU4Rv24CssQQiCbSDFc=; b=vplp7LADRpHIxYRRptWLsVMGJN
	aZBlVsEOLAZX7pRoUyANfl38TBP4e54LZ5e4c3XMze5pODyoFvNWN8Hldz0PynbE0lQQKXvlYa+so
	ZM8vusLL2dZM0LJt9paX0u1xxdnZQcOQct7BD3qkpATvKmbDgiv5QgBmJHhZR//chhw141WTX9uP/
	zZ5j2HSf8vyG+yqf55VOKyO0uTkNAgFlRTcAWB872nwFnb7lgi8AZIPNJqLj4bmxtiU9gXV70etTJ
	GRC/1+VSxZWPdQRqWfknra+VOmmtEdROg8FPctzrLldv5olJj3dbzU/F0sEDnBCiZ9L2+VdQRWchl
	Z86y2gpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfoZ-0000000BesM-0k62;
	Wed, 19 Feb 2025 08:52:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfcD-0000000Bab9-3RfD;
	Wed, 19 Feb 2025 08:39:35 +0000
X-UUID: 078caa9eee9d11efa1e849db4cc18d44-20250219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Uzh1JZII0+rs/QTFKIZkFkkjKU4Rv24CssQQiCbSDFc=;
	b=GAZu8z7ndRtKb7AhrI0konYnwdLMSB2GZ+zIx/6h1av7wYprNIoy1yPzbcHWCOLp9hVOXV2tgUEtBhJmIgPZdqIH0+qnF4pY4Y5w62SUcSNqDFc4UNPw5lgR1HMWzU0cZwZI9MK5IQfqAz1BGISDwDkJkVWBdXKy4p8nObZr+dI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:ac4e8b98-58e8-4b74-8596-d0f9fa1f07b9,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:56d850b5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 078caa9eee9d11efa1e849db4cc18d44-20250219
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1890488093; Wed, 19 Feb 2025 01:39:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 19 Feb 2025 16:39:24 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 19 Feb 2025 16:39:24 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Golle
	<daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
	<SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon
 Horman <horms@kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, Sky Huang
	<skylake.huang@mediatek.com>
Subject: [PATCH net-next v2 1/3] net: phy: mediatek: Add 2.5Gphy firmware dt-bindings and dts node
Date: Wed, 19 Feb 2025 16:39:08 +0800
Message-ID: <20250219083910.2255981-2-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250219083910.2255981-1-SkyLake.Huang@mediatek.com>
References: <20250219083910.2255981-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_003933_862638_02D0FF96 
X-CRM114-Status: GOOD (  16.52  )
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

From: Sky Huang <skylake.huang@mediatek.com>

Add 2.5Gphy firmware dt-bindings and dts node since mtk-2p5ge
driver requires firmware to run. Also, update MAINTAINERS for
MediaTek's built-in 2.5Gphy dt-bindings and change MAINTAINER's name.

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
 .../bindings/net/mediatek,2p5gphy-fw.yaml     | 37 +++++++++++++++++++
 MAINTAINERS                                   |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/mediatek,2p5gphy-fw.yaml

diff --git a/Documentation/devicetree/bindings/net/mediatek,2p5gphy-fw.yaml b/Documentation/devicetree/bindings/net/mediatek,2p5gphy-fw.yaml
new file mode 100644
index 000000000000..56ebe88b8921
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/mediatek,2p5gphy-fw.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/mediatek,2p5gphy-fw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Built-in 2.5G Ethernet PHY
+
+maintainers:
+  - Sky Huang <SkyLake.Huang@mediatek.com>
+
+description: |
+  MediaTek Built-in 2.5G Ethernet PHY needs to load firmware so it can
+  run correctly.
+
+properties:
+  compatible:
+    const: "mediatek,2p5gphy-fw"
+
+  reg:
+    items:
+      - description: pmb firmware load address
+      - description: firmware trigger register
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    phyfw: phy-firmware@f000000 {
+      compatible = "mediatek,2p5gphy-fw";
+      reg = <0 0x0f100000 0 0x20000>,
+            <0 0x0f0f0018 0 0x20>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index de81a3d68396..42ec8b8d03bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14716,9 +14716,10 @@ F:	include/linux/pcs/pcs-mtk-lynxi.h
 MEDIATEK ETHERNET PHY DRIVERS
 M:	Daniel Golle <daniel@makrotopia.org>
 M:	Qingfang Deng <dqfext@gmail.com>
-M:	SkyLake Huang <SkyLake.Huang@mediatek.com>
+M:	Sky Huang <SkyLake.Huang@mediatek.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/mediatek,2p5gphy-fw.yaml
 F:	drivers/net/phy/mediatek/mtk-ge-soc.c
 F:	drivers/net/phy/mediatek/mtk-phy-lib.c
 F:	drivers/net/phy/mediatek/mtk-ge.c
-- 
2.45.2


