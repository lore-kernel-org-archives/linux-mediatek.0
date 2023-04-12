Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EDCC77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdnYKbf9/+W6WfCaMt9jMOWnB7v+S/jmGr08LRfvZz4=; b=ZnfDtFd46w2FVC09+s5i571tO5
	xxTCO28LLsFyUWra9JoACoabK+rk+rBCocT1wdGxGKuGRB+gCeX67snpW6sqoMphnzhDdwv9l8c9v
	Waqjh3bRPcmp8FV95i+KzWvc6MsNWJ++hOICXePHDM58DWFYhzazTdP16YoYDQdPZZQV1nXQfgKdl
	UahSOF6drvRJeV0aH8t9aol6V+IFgrOp9bPnOk2+wAgbw91TZp9v1TgO36qr74thYIjw8p5bNEtWq
	Jpo8pFmvIioOtVbunim+W4KMqsg3s5Ivywa1Gx8quPjJaZVhj3oT8K8FKILJZxyMEa8Gn1AVUogjX
	wH+B9EUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYe0-002nqg-2B;
	Wed, 12 Apr 2023 11:28:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYdk-002ncK-03;
	Wed, 12 Apr 2023 11:27:54 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F7C06603214;
	Wed, 12 Apr 2023 12:27:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298869;
	bh=6Azvcn4i0Hycg0xDnvRheRJ+soYYO+v1kBon9Mg6Dyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DrLbBoxkdz6ThJrt/c0Qxsir2AKyllHvXERWqJregc/3Ce0deMgfYXYzn62NK5ABR
	 JzwrpTqb0fsOT2izOuJPyv600oPn6JzxZ/OERDoL1n1kByF5T0Tb2uRWQiFIp/vsi8
	 rmJc00mOMM351G2ENBwfjk8VzYJl6YJ/BIVMY+2BO8ucRR6o/cu7XLQA93DlW9rtQ4
	 JY4zZ/gXADUViX46yeHWNFn7DyZBn6/c4okYDoSWfvxW+5TY5c7VRgGVdEJ2gvodIq
	 dL+i1U6iTPV0vxz8nhPmo8AxSMRJlehg0mRtWxfuvj5RlEgcfllulJxsdVeKaK8qy0
	 MpDkSw2kIjE2Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	xinlei.lee@mediatek.com,
	houlong.wei@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:15 +0200
Message-Id: <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042752_203021_F1839CC7 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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

Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
the same parameters as MT8183.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/mediatek/mediatek,dpi.yaml        | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index d976380801e3..803c00f26206 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -17,15 +17,20 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt2701-dpi
-      - mediatek,mt7623-dpi
-      - mediatek,mt8173-dpi
-      - mediatek,mt8183-dpi
-      - mediatek,mt8186-dpi
-      - mediatek,mt8188-dp-intf
-      - mediatek,mt8192-dpi
-      - mediatek,mt8195-dp-intf
+    oneOf:
+      - enum:
+          - mediatek,mt2701-dpi
+          - mediatek,mt7623-dpi
+          - mediatek,mt8173-dpi
+          - mediatek,mt8183-dpi
+          - mediatek,mt8186-dpi
+          - mediatek,mt8188-dp-intf
+          - mediatek,mt8192-dpi
+          - mediatek,mt8195-dp-intf
+      - items:
+          - enum:
+              - mediatek,mt6795-dpi
+          - const: mediatek,mt8183-dpi
 
   reg:
     maxItems: 1
-- 
2.40.0


