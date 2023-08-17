Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4A9C2FC14
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrdWqzz5c35nltCqn7UvKCYw+Wj4xfhvovAV+IU4c8E=; b=tJrolHRRjVg95vXuDANwoS7KgG
	aPwhwcIf8eb+2iMjuDABRy+W/5LIhy/ekD4zU1vqazji6KxHGsOggweKaPwm9Ey7FBQksP9F9j8PU
	Lzp28K94M8L3yjR/++5zho9nI2wXajufsF+4abmqraNKyeAutqfuTp62Xj615QcBgxxmN80EBsUOb
	P9z46Enq6rQps95MTalRQtpnsQsEZ8TvKEOmrZRPRZGqqZ3YIc+kpwHGUIlQVDSFOwFeTxsBD70vV
	+nGwTVURQS1tyfdsPkTQt2lyS0M6GeMx1hbEn8kuxRD9Ad/BGKvSD5RZtuIHL118L5ZpQgZjHPLiu
	sdYn5Z8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWa1I-0060xS-2f;
	Thu, 17 Aug 2023 10:14:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWa13-0060r2-2E;
	Thu, 17 Aug 2023 10:14:11 +0000
X-UUID: c9fdb70e3ce611ee83ed1395ce914268-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BrdWqzz5c35nltCqn7UvKCYw+Wj4xfhvovAV+IU4c8E=;
	b=duSAhLqu41zsnNaqWPv3kMuBAJ5OxpcBQq2lp+iW5c3guiLe4jwxcpXuWXlzznuRuRC+w6XNDBWLoKZvkMKuR5cyIRJ/LKTuwREs/rXiiBOvkBuLuPku3OHzw/iFLZzUnpF7S2cLugoG+hq62FI/bQdmTASoPlD6pCooPCVm/G8=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.31,REQID:a66ec1bd-5a65-4591-afe9-a8bedf17ebc8,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS6885AD,ACT
	ION:quarantine,TS:120
X-CID-INFO: VERSION:1.1.31,REQID:a66ec1bd-5a65-4591-afe9-a8bedf17ebc8,IP:0,URL
	:25,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:120
X-CID-META: VersionHash:0ad78a4,CLOUDID:c4dbe012-4929-4845-9571-38c601e9c3c9,B
	ulkID:230817181402QMC7LIE4,BulkQuantity:1,Recheck:0,SF:28|17|19|48|38|29,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD,TF_CID_SPAM_ULN
X-UUID: c9fdb70e3ce611ee83ed1395ce914268-20230817
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 513434395; Thu, 17 Aug 2023 03:14:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Aug 2023 18:13:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Aug 2023 18:13:59 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Mars Chen
	<chenxiangrui@huaqin.corp-partner.google.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v4 5/6] ASoC: dt-bindings: mediatek,mt7986-wm8960: add mt7986-wm8960 document
Date: Thu, 17 Aug 2023 18:13:37 +0800
Message-ID: <20230817101338.18782-6-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230817101338.18782-1-maso.huang@mediatek.com>
References: <20230817101338.18782-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_031409_739948_32161AF1 
X-CRM114-Status: GOOD (  12.25  )
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

Add document for mt7986 board with wm8960.

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../sound/mediatek,mt7986-wm8960.yaml         | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
new file mode 100644
index 000000000000..09247ceea3f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt7986-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT7986 sound card with WM8960 codec
+
+maintainers:
+  - Maso Huang <maso.huang@mediatek.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt7986-wm8960-sound
+
+  platform:
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        description: The phandle of MT7986 platform.
+        maxItems: 1
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        description: The phandle of wm8960 codec.
+        maxItems: 1
+    required:
+      - sound-dai
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt7986-wm8960-sound";
+        model = "mt7986-wm8960";
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+
+        platform {
+            sound-dai = <&afe>;
+        };
+
+        codec {
+            sound-dai = <&wm8960>;
+        };
+    };
+
+...
-- 
2.18.0


