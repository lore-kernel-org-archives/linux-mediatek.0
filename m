Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E69C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e74Rpl3kly0MZG+mhNu7kf9pjdP7luUXY+8TywSsq9c=; b=gan3cQr+ODL7syMHz/cPAVVMVP
	qpjYyBXXQ02AcVdddP4JHZZZAKGcuhjRadWIRmWAsIwLiMx2smy+CEjC4yLa6NT1+jHCLkelUqF5c
	4zNERfdugyHaaVNQdJC7hfpzzdR9TX9hpJSX3uni1E/WRcoOwLW9mrjgBjxBoXHTTzRT6OoZTDoxa
	1OJZIcmY8wa+9aOX9FjcZnTIkxmDQTQTS0RWEuumnDRRWWKSfYQzIJRalj+VQL/vbC70Q+IQJs37W
	UYxbt6jxFlz4G2y7xMjU/m0eI8+tejk4cQeniApKO2uOVZU30r4hmbCdxm2P/WTfFlp+8ohtmMFYL
	01wQPYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYfy-002pnr-1Z;
	Wed, 12 Apr 2023 11:30:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYe1-002nqH-14;
	Wed, 12 Apr 2023 11:28:10 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CC6AD6603293;
	Wed, 12 Apr 2023 12:28:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298888;
	bh=YwKUdOVKZZzufL6XAsjNHZkwVMbtCnbLx+vv25vZV7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ThQsw1AyvAaKbhdVCeXKcuOhCjk4B3E8RVURtjINGdM3o3KF7OXl1HlCihY8BZbRn
	 E2/NgcXGbmGeIonXpL+opqEraPvZ/DZ3zGgVnj9FxcvG5iNmEdK7yjqz2LFuO2vc5g
	 TS+RjQ2Dr3vStagSaSZdES6eM7238BU0OJf5Nh8oLMpUFlMwgEI9lmR91/uyDLpqin
	 8/2i4Z8Z03+aTffVbZYDNxHDc3vq8x7gtGXf5jKWCzANNxzghLSXhjJMkMBO0pdxur
	 0pUzph5yMDkbZmw4zwTzhiwlqUS7IsEZs6IYtvwAO/WLWCEopm3p7XYAnQrkHvLClO
	 VMFxq4GIS4W2g==
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
Subject: [PATCH 16/27] arm64: dts: mediatek: mt6795: Add support for the CMDQ/GCE mailbox
Date: Wed, 12 Apr 2023 13:27:28 +0200
Message-Id: <20230412112739.160376-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042809_531091_57B0ACFE 
X-CRM114-Status: UNSURE (   9.68  )
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

In preparation for adding multimedia blocks, add the CMDQ/GCE mailbox.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 090400d7fd61..99cc4918e6ba 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/mediatek,mt6795-clk.h>
+#include <dt-bindings/gce/mediatek,mt6795-gce.h>
 #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
 #include <dt-bindings/power/mt6795-power.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
@@ -401,6 +402,15 @@ fhctl: clock-controller@10209f00 {
 			status = "disabled";
 		};
 
+		gce: mailbox@10212000 {
+			compatible = "mediatek,mt6795-gce", "mediatek,mt8173-gce";
+			reg = <0 0x10212000 0 0x1000>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg CLK_INFRA_GCE>;
+			clock-names = "gce";
+			#mbox-cells = <2>;
+		};
+
 		gic: interrupt-controller@10221000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.40.0


