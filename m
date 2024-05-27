Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962BDC25B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 09:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1UfYEsLGokpLQhZdZnJqMvIQxIW+25ZqN5KV10/pss=; b=kgvvQJUEw6JX6Xorwif+hgd+dQ
	GKZMks+C+tfPrn6fKzWnNYibZzW2cQ1IxB5JMIhGJf1imCweORYTnXIro3g3YOXEKo68qa7ksfUY6
	w6wDpCBCdfEBKAoL7ydL8zJ3FKG31p6n9nK+226uIxktp1jeqo8BpCPF9a4iLQSJ9ElTBYZfJK71p
	z/u6Rpl8zDz1Urzh0ky+w90vMqz9h5taPwJ8UO4zSYk54oQYoSLLwdjmvUR3GVbpvBjFdaxYtYBn+
	jfCK+1ARxgpfJ+jYarLa4VxGUXLguMzTbKolE6TFX4GMPN+gO0ThdxLJRW39SDARsB8crwGJ9tSuy
	6pfxr8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWpT-0000000ESsb-0KCl;
	Mon, 27 May 2024 09:39:43 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWp1-0000000ESaT-0msK;
	Mon, 27 May 2024 09:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716802753;
	bh=Q2u/g27bjls/di+Or+gNHb/H3YwXTAj8oy8HXh0H9UE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ur6wXGsn0VGcFITfHnFT9w6tExhutj/M+wRTnG0nmsRXNaBRKDDzB/oYD1kREnvGQ
	 Ml0yjmKmIzQ/4adS0XKlkG2uLDADAe7IbwJqDCRtnQWPhMI5JkTvTi+Cu6R9KL/UTh
	 3+WLWJo0v2rSOXEVzI9ACsuIx02PywDf5dMLhuLYhkq3657tx0rI65DylIL5GJSUTq
	 7TmbpsaTyp+mxZEaX9QU5ekEDWMqMLGC3P2sL9PKu3eQhDOch6FZiRB3UPKndxMUl/
	 82VIT2MVuAU0rFqvuYEuh/m46K63z1PyTIyHFib0fWfu6+zG7YYxk4LkdzEuD91p9D
	 JbFSe2dZJuR2Q==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 079973782113;
	Mon, 27 May 2024 09:39:12 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mandyjh.liu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	jpanis@baylibre.com
Subject: [PATCH 2/5] arm64: dts: mediatek: mt8188: Add Global Command Engine mailboxes
Date: Mon, 27 May 2024 11:39:05 +0200
Message-ID: <20240527093908.97574-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
References: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_023915_461083_D417C441 
X-CRM114-Status: UNSURE (   9.36  )
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

In preparation for adding multimedia nodes and power domains, add
support for the two Global Command Engine (GCE) mailboxes found in
this SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index b4315c9214dc..06fa3b862c31 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mediatek,mt8188-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/mailbox/mediatek,mt8188-gce.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h>
 #include <dt-bindings/power/mediatek,mt8188-power.h>
@@ -413,6 +414,22 @@ pwrap: pwrap@10024000 {
 			clock-names = "spi", "wrap";
 		};
 
+		gce0: mailbox@10320000 {
+			compatible = "mediatek,mt8188-gce";
+			reg = <0 0x10320000 0 0x4000>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <2>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
+		};
+
+		gce1: mailbox@10330000 {
+			compatible = "mediatek,mt8188-gce";
+			reg = <0 0x10330000 0 0x4000>;
+			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <2>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
+		};
+
 		scp: scp@10500000 {
 			compatible = "mediatek,mt8188-scp";
 			reg = <0 0x10500000 0 0x100000>,
-- 
2.45.1


