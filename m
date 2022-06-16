Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49236C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 09:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbLyFqggWYsN7B2BnDaVJChaS3wuSOVJPLhsXlQtKSI=; b=t1bYo7B2WtUdOO5UTouEjRsT0Q
	Nw20IrGccu2rFKHH2i4+7w7H7dZMQRGruwXc2ieX8uTTHjiZFy+YA8DkPA4KEDWulacU3Z7z0TUSV
	3FiZ+Um+iqIvFsy0yxRKe9aGfj1IRvc7TpWqUedXY1XDTwTiFPwog3zKSufwwLDtmUxi/YDft1m0w
	RnFXRYlT4pyuhHtajES3oIFoHMlrMcQtXmXxbxBVlikyC2OOU05QhAz00G3wABVDI7n+8RBL1iQeM
	1nBO3/bPSDVZmajM/qsB3CPtswU+NDJpTsXgDFbqdGWaNHWjxvYIE4KGiv49trXNYyREkGB8Nqu4P
	EPrrSUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lbq-001d42-RR; Thu, 16 Jun 2022 09:16:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lbI-001ct5-14; Thu, 16 Jun 2022 09:15:42 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 24F6A6601748;
	Thu, 16 Jun 2022 10:15:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655370938;
	bh=gJIq5i68TKUOwxVpKAAfI902+ncCSdgSVx7YzwK/gjU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OxwjmYypgUCNFmRdi1M+QZpF7N0B9L6OsNLTrEbuSNle+Ss3+d4CTMJkVGOaD9kdg
	 eCSQoKdXUybbrduHSRI92XTO25dvw/UKOFSYHcJiLrpEKG/Xi9xQOA0CY5Ot9Oiurb
	 qfUoSZjVr6q4PBP7+qzA0qt2acXw9/TFYdIqGIv3i+XwAOkUHvUi/snna0zAC0/Hcl
	 NISpDQUhZyeB03kyUwnHb87CP+x5rDos0R8xNo1xSyiK5FsBQbb+nw/PW/bMZkxgLI
	 MlphmcMrlGpGSrxHFO5YfI7UN5lgiDztGqL/2jZNLO+ogMe8t8q0zvJJb81Eh32ole
	 Klvf81TxXlX+w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johnson.wang@mediatek.com,
	hsin-hsiung.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: mfd: mt6397: Add compatibles for MT6331 RTC and keys
Date: Thu, 16 Jun 2022 11:15:30 +0200
Message-Id: <20220616091531.12646-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616091531.12646-1-angelogioacchino.delregno@collabora.com>
References: <20220616091531.12646-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_021540_243741_F8610E1B 
X-CRM114-Status: GOOD (  10.46  )
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

The MT6331 PMIC provides many sub modules: regulators, audio
codec, LED controller, keys, RTC and some GPIOs.
It is always paired with a MT6332 Companion PMIC, which provides
thermistors, WLEDs (display LED backlight), secondary AP cluster
regulators, modem clocks, battery charger and fuel gauge.

Add the necessary compatibles to start implementing the basics.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 293db2a71ef2..f637bee2f3eb 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -29,6 +29,7 @@ Optional subnodes:
 - rtc
 	Required properties: Should be one of follows
 		- compatible: "mediatek,mt6323-rtc"
+		- compatible: "mediatek,mt6331-rtc"
 		- compatible: "mediatek,mt6358-rtc"
 		- compatible: "mediatek,mt6397-rtc"
 	For details, see ../rtc/rtc-mt6397.txt
@@ -52,8 +53,10 @@ Optional subnodes:
 	see ../leds/leds-mt6323.txt
 
 - keys
-	Required properties:
-		- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+	Required properties: Should be one of the following
+		- compatible: "mediatek,mt6323-keys"
+		- compatible: "mediatek,mt6331-keys"
+		- compatible: "mediatek,mt6397-keys"
 	see ../input/mtk-pmic-keys.txt
 
 - power-controller
-- 
2.35.1


