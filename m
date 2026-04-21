Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96ABF8FA90
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pm67qKOM3Exkx05WtLYkzfFidvA4Ig/U45KGlldfDxA=; b=S8Lr1weTwX0Q1Ep+/opZVStiE9
	1WzIgLPFBh+IrBK2ya5bue2U8aMSixyL8365p/eWGAMcjIGrbRpYRPLY6Xe9yaMaBVxKoisJd8LmW
	2c0BEvoFtxz0cXyPnT7UofsaCD0nStA1Hy+HeXrftJZtWrdKHAgdKVybghgC4CKMHR7gJ9ichb2sx
	JLz2ka6dSKU9uFwbjNUivYiO9P7vrJ0MvF7Gfqg6aVD1ajRnyQb952qjWf6Hv/PJa6EuABGNS2VKe
	dnyQkWx3Ad06NdT29p6R66/82spmUYq/3mczOfalhalGMhMxdjcj2MrqerB5daS2YsFyOdNkl9HLg
	G4gD+PYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDJD-00000008qid-31da;
	Tue, 21 Apr 2026 15:46:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDJA-00000008qhV-1W52
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Apr 2026 15:46:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so56570015e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2026 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776786398; x=1777391198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm67qKOM3Exkx05WtLYkzfFidvA4Ig/U45KGlldfDxA=;
        b=EnHBhdFUKSF9zzwG5mrwwE4HKThYSYfBl8UD+qZXWPebzJ2F7PM+OhiiWSuNE+YoUK
         05cvvSJqquvCZiJTYgQgPJwJudUBwfJskBGYhzMmBkGyjYL0zO/p0zorofr9pEWLrLH0
         Xf+oMY8NlXkDpj9JV5nh7tlrOt0LDnZHIVpep7YoZ3XdgulMfPaTZ8ZmC7Qw1oQuv4LM
         qiWTGFaZRLf58oWqVe9KHpW6aFsEgCCTCSIW90QwrmdfVlVNlEjombFqH3h/KsqThyoI
         ePKzdglnrKISsbyEvLTq41k6Xg/CHNvrOOYAKgCBeY3iIESgUl+T4jOnGmvSmwljhj+6
         IUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786398; x=1777391198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm67qKOM3Exkx05WtLYkzfFidvA4Ig/U45KGlldfDxA=;
        b=Ul8XKuNbP+5s/Un7IMIpuSQY4+VwzNGcVRazgZjh9yrusjo7oOcvbkb/S/3Hs72ws1
         jbojtofNANdWAJL8SHSAb75SJnaxFfKFB4FGwpAxF2ilKK4bhMki0nLK4LAotHKTh8IB
         hTDQr3BpK/y86HRf4bsU6S9tYlPtU8NAjhECPGq85bATuMO93LZpkIeQSQCafmb2OSPP
         h+TZC0n1FLP4+Hfwk5DAAHmMiYZTOzN7HSvkk75RXJjZHuHlrvwKj/krsfvBkwhYQuNH
         LX6NqMy4JPJnqQo5big5LWGPXJFVHqp7JA6hsBDmFkS6K51XOAz50XGaPBqBmlf476HJ
         F0tw==
X-Forwarded-Encrypted: i=1; AFNElJ97yRIKZyJYNtLb3sWUwhy4S1xXHuerGtyRED0YPJASns6ThwEzqH5LTiBQZRlDv4IuzGmXJPZMTY97hTC1RQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Jh7X67wYmGvP4x42AAPskb74g0G8BFe/52qgOM69M9vYCyn0
	tWGg8WRUJv/0iQumCqwDZAVG8IX3SDVsGtpAM2OGHZZo/Y0n/kvvRx4L
X-Gm-Gg: AeBDietX82RMVscv+gC5TvQSjkbeRR/6wIe+cBVNbHzAyMXYiqLJ8BAy/yd2qYuW90I
	YK67ZYdHJhVEF7fvdpJ8JznsdV8O71DLN9XtIkkWLsPPd5JRzpVdGQ3RpbUV/VWiX9C7TSc9tVI
	fVeBNjGKUlPJ8cZF4ZXiOmtSeFqamsxW9AJzcd6M1rNfCAQv5PV+S7LIi/07GPpmauaJfof9hzQ
	6D2w5CzYwYMTcfki6Ap72OLH81jq11GXthZUvdkQ+sISocwyfrCex8X2s5JPi8sQYRHc5Ppkt71
	WOIRbxIR/BhkBu2dHb29YKcvmXfmd5xFuQCX5KHQeqGyiv+fBFGGEYKsk45nb+BWd8ILdYVqVgy
	gMJ7m+bxBCuHGWADmZ1t4yMnVf5vLcfyF9hDG5mIoHgZmDieBGkMeI2LuaL/5RsLNwxfW2oEvM+
	4AAZAe/KOpVWu/YxDfGeBhTOZVJHzJZQ==
X-Received: by 2002:a05:600c:4ec6:b0:489:1f98:71e3 with SMTP id 5b1f17b1804b1-4891f987487mr114165495e9.28.1776786397946;
        Tue, 21 Apr 2026 08:46:37 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c318636sm174759655e9.7.2026.04.21.08.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:46:37 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] ASoC: dt-bindings: mediatek: Convert mtk-btcvsd-snd to DT Schema
Date: Tue, 21 Apr 2026 16:46:07 +0100
Message-ID: <20260421154619.227039-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_084640_453135_A017910A 
X-CRM114-Status: GOOD (  14.59  )
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

Convert the mtk-btcvsd-snd.txt DT binding to DT Schema format.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Changes in v2:
- Fixed issues from make dt_binding_check
- Set myself as maintainer for the binding

 .../sound/mediatek,mtk-btcvsd-snd.yaml        | 60 +++++++++++++++++++
 .../bindings/sound/mtk-btcvsd-snd.txt         | 24 --------
 2 files changed, 60 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
new file mode 100644
index 000000000000..1ec50c7611df
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mtk-btcvsd-snd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ALSA BT SCO CVSD/MSBC Driver
+
+maintainers:
+  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
+
+properties:
+  compatible:
+    const: mediatek,mtk-btcvsd-snd
+
+  reg:
+    items:
+      - description: Register location and size of PKV
+      - description: Register location and size of SRAM_BANK2
+
+  interrupts:
+    items:
+      - description: BT-SCO interrupt
+
+  mediatek,infracfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the infracfg controller
+
+  mediatek,offset:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Array of register offsets and masks
+    items:
+      - description: infra_misc_offset
+      - description: infra_conn_bt_cvsd_mask
+      - description: cvsd_mcu_read_offset
+      - description: cvsd_mcu_write_offset
+      - description: cvsd_packet_indicator_offset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - mediatek,infracfg
+  - mediatek,offset
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mtk-btcvsd-snd@18000000 {
+      compatible = "mediatek,mtk-btcvsd-snd";
+      reg = <0x18000000 0x1000>,
+            <0x18080000 0x8000>;
+      interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_LOW>;
+      mediatek,infracfg = <&infrasys>;
+      mediatek,offset = <0xf00 0x800 0xfd0 0xfd4 0xfd8>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt b/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt
deleted file mode 100644
index 679e44839b48..000000000000
--- a/Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Mediatek ALSA BT SCO CVSD/MSBC Driver
-
-Required properties:
-- compatible = "mediatek,mtk-btcvsd-snd";
-- reg: register location and size of PKV and SRAM_BANK2
-- interrupts: should contain BTSCO interrupt
-- mediatek,infracfg: the phandles of INFRASYS
-- mediatek,offset: Array contains of register offset and mask
-    infra_misc_offset,
-    infra_conn_bt_cvsd_mask,
-    cvsd_mcu_read_offset,
-    cvsd_mcu_write_offset,
-    cvsd_packet_indicator_offset
-
-Example:
-
-	mtk-btcvsd-snd@18000000 {
-		compatible = "mediatek,mtk-btcvsd-snd";
-		reg=<0 0x18000000 0 0x1000>,
-		    <0 0x18080000 0 0x8000>;
-		interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_LOW>;
-		mediatek,infracfg = <&infrasys>;
-		mediatek,offset = <0xf00 0x800 0xfd0 0xfd4 0xfd8>;
-	};
-- 
2.43.0


