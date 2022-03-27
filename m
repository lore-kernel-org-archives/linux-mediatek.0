Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948EAC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 23:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5yxffuYVOU+RYd6/fGZbQ7ca/dpbSD6tY0KYNlQzuc=; b=L8vMSNXhnc+WIX
	gkmmJwVf3sbPnnN9brOtOCWhuLQDx2EHsWOyqoFHWGLQ1232ztnMxMS0ZUBtdhxF3IobaAVUoMlI9
	y1O6QldWvm6o8ufjN9k+lT8aywBge+5tUUmbJ8cJX8yL5zr/mfR9I4bcuUUzPAnY2pE5auVwVpWg7
	F6m726t7TNpNiYgJoc3Wr4zxhAn6IV+17opxDtmYasjLMzCJqOBfW/21fyBJEO+xPSn/1e/UFJXqP
	COWvc9di/5XcHjk8e/pnX0pSzc3PIBRL/hAaLR4ekcjEIqJmvRwk7srETbj9MG39pqWY7hQslU+pX
	uvbs3kfoBCQ1KdAnqVLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYcZh-006otk-7y; Sun, 27 Mar 2022 23:45:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYbZH-006UrU-Q9
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 22:41:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id h4so17875530wrc.13
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 15:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eywd7FmH0eN0jrnWKgGdeR6AnFImC306XiX8oFPZwAs=;
 b=0r7A+Lg3dNKCPPbFiM+r2Qb3aWcF/p0TOhmyZ6fCihniTMpFEzKZY5YjYdsNTSAWqN
 PbIOYJQJQGdEkdV8sp8l3JBhwGeBtqFwUpJ+1QeYuCz1b1wRy4SiIbO3Emgxg/KnDiSk
 CiBOc5wGNfUwm6kxi3rSlwPV9GLoA6LojVJ8C5DoDvdw16bG4t+phKcX8xJGA5nh8o3p
 gA/Mc8yiLl633Fcxtld3vxHXvEhzxQVlb8rSLMYG4QWMhvCZwJMR1dkzQr2M0tvIcm6u
 DdQKBHdBDHeYvCXLr+mE3qAVoJ/8zWnxQEcQT9AOhtvxeW8nibWa2VC1ygUqee3lqp9q
 cvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eywd7FmH0eN0jrnWKgGdeR6AnFImC306XiX8oFPZwAs=;
 b=T7Rg2B1sa6yES4PEMjplkRir8GV76TDJqg/qGqsL4njzEgjG6Pc7WgiQB3wGDSO23p
 ROfv3rz1ySRZkJfl7sab672ndAS/F0RKb3P2VRLGz5TwluwLAuLLUpMiZTEIF15pNBrt
 sED6v2P+BIKmVwiEbdElViwkC2ZrSvQy+3Sl1VgMQYcmhthYdaMpLbr+qK1C1OXZuIvb
 m8ZinXrhb+G0FnJpkJQBrc80eLueoS9ubAxkF7gKmSjkwlKNSr4BfRfbTCpDVX8no90T
 3kZB9cchuszxMI0ByTKzwAVdT1KLKEofiyCEFoDmVxcgd/oayrO3d8pQ2WN4zScrVs6+
 x+VQ==
X-Gm-Message-State: AOAM530ZzKw+HlXGc93fEpyGD+wtaNjDF4l80SUbajytd8S6AJ763DS5
 jUaI/hbTfPdpcnr4yR8zlGD1AA==
X-Google-Smtp-Source: ABdhPJwVdJKuEHZkpHZx/kesrNtcrmsj08nZDeDz/JbXf7iTCc+i8rplDDOSSsSGAP4YKrlt21K5og==
X-Received: by 2002:adf:e987:0:b0:203:d6f6:71f3 with SMTP id
 h7-20020adfe987000000b00203d6f671f3mr20128642wrm.82.1648420862352; 
 Sun, 27 Mar 2022 15:41:02 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:01 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, markyacoub@google.com
Subject: [PATCH v9 03/22] dt-bindings: mediatek,
 dp_phy: Add Display Port PHY binding
Date: Mon, 28 Mar 2022 00:39:08 +0200
Message-Id: <20220327223927.20848-4-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_154103_880116_2C7BAA9C 
X-CRM114-Status: GOOD (  11.70  )
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

This phy controller is embedded in the Display Port Controller on mt8195 SoCs.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 .../bindings/phy/mediatek,dp-phy.yaml         | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
new file mode 100644
index 000000000000..1f5ffca4e140
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2022 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Port PHY
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  Device tree bindings for the Mediatek (embedded) Display Port PHY
+  present on some Mediatek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-dp-phy
+
+  mediatek,dp-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Display Port node.
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - mediatek,dp-syscon
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    dp_phy: dp-phy {
+      compatible = "mediatek,mt8195-dp-phy";
+      mediatek,dp-syscon = <&dp_tx>;
+      #phy-cells = <0>;
+    };
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
