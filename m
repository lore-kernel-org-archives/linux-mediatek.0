Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED07E7D0CC
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 05:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UoH4W3986fDzxNI5gGh01oTwLD5puh/l8B+NZqmUkdE=; b=LbQUENMnPwQrY1
	bRxnBrTed5yS2WLamXxVoi2NN7JZ34z9yu/GCHLpoeTxw+dlMmVnOeyWvR7rxDfXru5jv1dtATbkQ
	39Z1uuMfI2LR7vU90t6DftVdbEhZ6pHvxD9AuYguieHHje4aRRMOf06Ljuxdav45o1UIDrkkxxqdA
	aPB/Z+K+bYyU+v9hEsikcGwzwXKdINuAE6OeK86Afs5p7Uhc+MbNK85BV69TrHycJ9aMErl6AptxP
	ayMEsYyz5eE08AgYh63o7xPLmiOEReUGogpgVIJ+FSrodTOSgYTYjfAORYsEyIDp80furx9IA7Le1
	MvEOxW91ZRwnw8E00YrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZ3q-007xdS-1K;
	Fri, 22 Sep 2023 05:50:42 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZ3g-007xXc-1I;
	Fri, 22 Sep 2023 05:50:33 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 574835FAFC;
	Fri, 22 Sep 2023 05:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1695361827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UoH4W3986fDzxNI5gGh01oTwLD5puh/l8B+NZqmUkdE=;
	b=Z27W9aaUiUcLJfBEEMIP/D5/ub8RhY31duqvE/rHZAwtGA7V1kEqTHc3r/2gBJ/R26Vqo+
	JUDYNOB3+Q1gmGW/cmPrlefKbY1U+38S0kbsHg89d5+sTcQTwCjq/NyxPg/Xoloo3PvUq2
	q3DSPOM2DChvt4gDwxJbvYgfS2gDUv0=
Received: from frank-G5.. (fttx-pool-217.61.149.125.bambit.de [217.61.149.125])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 567E540625;
	Fri, 22 Sep 2023 05:50:26 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/4] dt-bindings: thermal: mediatek: Add LVTS thermal sensors for mt7988
Date: Fri, 22 Sep 2023 07:50:18 +0200
Message-Id: <20230922055020.6436-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922055020.6436-1-linux@fw-web.de>
References: <20230922055020.6436-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e5a5378d-0ffe-43d2-843a-7836791bd6a3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_225032_599947_001195C7 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add sensor constants for MT7988.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2:
- new patch (moved from driver code to binding header)
- give sensors more meaningful names
---
 include/dt-bindings/thermal/mediatek,lvts-thermal.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
index 8fa5a46675c4..8c1fdc18cf34 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -7,6 +7,15 @@
 #ifndef __MEDIATEK_LVTS_DT_H
 #define __MEDIATEK_LVTS_DT_H
 
+#define MT7988_CPU_0		0
+#define MT7988_CPU_1		1
+#define MT7988_ETH2P5G_0	2
+#define MT7988_ETH2P5G_1	3
+#define MT7988_TOPS_0		4
+#define MT7988_TOPS_1		5
+#define MT7988_ETHWARP_0	6
+#define MT7988_ETHWARP_1	7
+
 #define MT8195_MCU_BIG_CPU0     0
 #define MT8195_MCU_BIG_CPU1     1
 #define MT8195_MCU_BIG_CPU2     2
-- 
2.34.1


