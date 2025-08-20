Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0350CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnRtL0mJnAXo6RKnAbHz4UZe7fbv6cMDcPHXS2xQHck=; b=nsvupdACDsb/lkS8mYk9XEF9e/
	6IXslwfAL1Vr89Uw4D6ngvK4Y8/3Ll1+Ny6PWQaYXR6mf42w4Ezkn6Zlm2iIhFGxI5wEXH6mSJB8i
	pVQ551Z5z82s6cVawONMNxoh0D53w9WOEqEAE34Q1HqpW8BRtZ8LwceFyeQEZZtkNbcjYUNBmozKC
	pj4eFvV82Mt9p7CiKyymD3BZtcYtkOMU7YEU63zI5lkztH80yR57TQNsWUeliHMq+YdGHM+xjrdVa
	CDrRHXCTdEx3hiBMbAjCNKoO/o+pwyOoDBWQTwy7CzBUT+EM55KXz661gTlkWDuIGgy6X1EA09m9e
	5F6QZiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohoM-0000000DXoR-3uFT;
	Wed, 20 Aug 2025 12:21:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoheq-0000000DWRQ-1IGr;
	Wed, 20 Aug 2025 12:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RnRtL0mJnAXo6RKnAbHz4UZe7fbv6cMDcPHXS2xQHck=; b=eUpwcvjhxv/5IxFiCI21R9jvKR
	1Wo9RV2KUxJMofw6/2kcDSQe3FVHIiUbOKu32FenuS0EEWcTOMYiTtlti1lqzEbBn2NvsYpgIBu7T
	5azNXKYlylrRhGUOXN2gJzMVN1iBX7ow+hXwAo64XHU7PqqVznkMpLynBuJL8QryK3AyWgD9/g3vk
	YDYG9q3Oh8ciW1W4FYvCNh9e7PzFN1Le/XAzk+QwwcgUoltIVc4Fzun6GmrfJgmGoRjOXsDKo5NAz
	9vyBAeN2CxBML+vdMmO0xX1YI3Fu7hNTGhMe196sh+eOqFNo/+VuTmynCqdpWL7DDVBw6SFtU0/zE
	a4/Mf8IQ==;
Received: from mail.grinn-global.com ([77.55.128.204])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohen-00000000Jo4-0Yhy;
	Wed, 20 Aug 2025 12:11:11 +0000
X-Virus-Scanned: by amavisd-new using ClamAV (16)
Received: from mateusz.int.grinn-global.com (f90-187.icpnet.pl [46.228.90.187])
	by server220076.nazwa.pl (Postfix) with ESMTP id 603A21BDE37;
	Wed, 20 Aug 2025 14:11:05 +0200 (CEST)
From: Mateusz Koza <mateusz.koza@grinn-global.com>
To: angelogioacchino.delregno@collabora.com,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	marcin.czarnecki@grinn-global.com,
	b.bilas@grinn-global.com,
	mateusz.koza@grinn-global.com,
	andrew@lunn.ch
Subject: [PATCH v3 3/4] arm64: dts: mediatek: mt8370-grinn-genio-510-sbc: Add Grinn GenioSBC-510
Date: Wed, 20 Aug 2025 14:09:04 +0200
Message-ID: <20250820120905.993189-4-mateusz.koza@grinn-global.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820120905.993189-1-mateusz.koza@grinn-global.com>
References: <20250820120905.993189-1-mateusz.koza@grinn-global.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-NA-AI-Spam-Probability: 0.44
X-NA-AI-Is-Spam: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_131109_337149_FEEDD6A3 
X-CRM114-Status: GOOD (  13.57  )
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

From: Bartosz Bilas <b.bilas@grinn-global.com>

Add support for Grinn GenioSBC-510. Based on the commit introducing
support for the Grinn GenioSBC-700, this change adds support for the
Grinn GenioSBC-510, a single-board computer based on the MediaTek Genio
510 SoC.

More details about the hardware:
- https://grinn-global.com/products/grinn-geniosom-510
- https://grinn-global.com/products/grinn-genioboard-edge-ai-sbc

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mediatek/mt8370-grinn-genio-510-sbc.dts   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 7383d75d8041..729d786b1236 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -102,6 +102,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk-eth.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-grinn-genio-510-sbc.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-grinn-genio-700-sbc.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts b/arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts
new file mode 100644
index 000000000000..117ea694cda3
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Grinn sp. z o.o.
+ * Author: Bartosz Bilas <bartosz.bilas@grinn-global.com>
+ */
+/dts-v1/;
+
+#include "mt8370.dtsi"
+#include "mt8390-grinn-genio-som.dtsi"
+#include "mt8390-grinn-genio-sbc.dtsi"
+
+/ {
+	model = "Grinn GenioSBC-510";
+	compatible = "grinn,genio-510-sbc", "mediatek,mt8370", "mediatek,mt8188";
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 1 0x00000000>;
+	};
+};
-- 
2.43.0


