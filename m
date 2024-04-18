Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C6FC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 09:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/kcHq9PisAG8/UoRU68zlecBo1etsQ7a/AZ4KXF+k0=; b=YSyeqKfU8bgiQoot985WVjaF9z
	9RuOQuUMqs6uIyjTq3eDCMamdXJBFVGzYD5NVWLDw+3ygKYEOW88QfTXkm96aVYTn/kWpnvnTeEZz
	JLz0wfXKeQppn7SLuhWAbb0VbVVgGKO+mvUOjAq/KxL4NvYkbFrJekrI+vJS00/xaN092PFFVG9Qp
	SQzws8in6XxUWTR0qr0OC+m29skGmQwzDMw/UwuM5xSwVnG9hbZQsWINlJ0uQdH4L6Bw1JXSzoPyh
	BHG9AwNwWVKnT0DJ1HEYvpuhk+LIYcRhcPKeapTG7zvfStqP/Mw5k7iu36+8+7ms2dh0PSVPqf4VT
	aLTJq3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOHF-00000001fGZ-3ETC;
	Thu, 18 Apr 2024 09:41:57 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOGy-00000001f4Y-0MvG;
	Thu, 18 Apr 2024 09:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713433298;
	bh=hXAnEQDzLDk7jyZTMyhyJqlEHGWmSpcvS6neyL4VIL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xwwGNteNuiw1dYiES74icGsqldsWmi7ZWEEDwaru7xLJcaj9veNlfSRTu2bUm5fD0
	 W7jwIGZFe2/yjj6lv0q7OWH+sFColWHQ4SiEDuB47QlutP0Ha+B0tP+ol/XKiGazM5
	 oON/EORdOcTjHdyll5rkFgVouVWrx8oigw4c5BLTrt+QfOnqADqziqWRHr4K+lpD+F
	 p8YbWLvZ8RNf3caoFqbnF5TPN3unBKgiH4H8IovvTPFQU7oT6cOkNxlMao/KMND7jM
	 m+0A7kFFJt3P9f2U2gabOl//GUpqIG/+gjuOasN642u6ytOJVRdeBY9hltXKQI9eBO
	 wXkTL15CI8SFQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 84FA837813E3;
	Thu, 18 Apr 2024 09:41:37 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: djakov@kernel.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	keescook@chromium.org,
	gustavoars@kernel.org,
	henryc.chen@mediatek.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	amergnat@baylibre.com
Subject: [PATCH v4 1/7] dt-bindings: regulator: Add bindings for MediaTek DVFSRC Regulators
Date: Thu, 18 Apr 2024 11:41:28 +0200
Message-ID: <20240418094134.203330-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240418094134.203330-1-angelogioacchino.delregno@collabora.com>
References: <20240418094134.203330-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_024140_314724_0F768F6E 
X-CRM114-Status: GOOD (  10.90  )
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

The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
are controlled with votes to the DVFSRC hardware.

This adds support for the regulators found in MT6873, MT8183, MT8192
and MT8195 SoCs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek,mt6873-dvfsrc-regulator.yaml     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
new file mode 100644
index 000000000000..704828687970
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6873-dvfsrc-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek DVFSRC-controlled Regulators
+
+description:
+  The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
+  are controlled with votes to the DVFSRC hardware.
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6873-dvfsrc-regulator
+      - mediatek,mt8183-dvfsrc-regulator
+      - mediatek,mt8192-dvfsrc-regulator
+      - mediatek,mt8195-dvfsrc-regulator
+
+  dvfsrc-vcore:
+    description: DVFSRC-controlled SoC Vcore regulator
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+  dvfsrc-vscp:
+    description: DVFSRC-controlled System Control Processor regulator
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+anyOf:
+  - required:
+      - dvfsrc-vcore
+  - required:
+      - dvfsrc-vscp
+
+additionalProperties: false
-- 
2.44.0


