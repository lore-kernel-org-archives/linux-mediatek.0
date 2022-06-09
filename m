Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F543C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 11:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8qBMGspvcfzMGPp/AitgKC73yzx4ZEnOS2ijJR4x6o=; b=Fl96EqI84qWKZD
	r7xleLHkF41BrmJw9I8zRcoGnmeoFZHKA02QqiW2X34j9xzLjQ2zWnzHY9MNM9qt5om4UP7/b3GL0
	WHO3RgzbGIQUM+eEfqUpWUC4NU3JusVg6Z4RqPCC5eQ/j7A2HBeYjc0jSbGBhkVw28JFvmU2IRw8P
	enVCFoaFUmuN1klNeJCq75ANtMfDrU50YTp6Hy5JKlrRXvMYvMuRZ6ssxKV/IwDFbL/eI4GAdgRLB
	ovwE3EIrVLLV+Ra9j9UnLhxk7Qc9yYikii3dODpo/zHRzjPIswpcfYSBqvWEq0VsBybfTleqSY54y
	s70iTI+pvnORdetiRQqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGJ9-001IWV-Rd; Thu, 09 Jun 2022 11:26:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGFx-001GPm-UU; Thu, 09 Jun 2022 11:23:19 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0DD1C66017D9;
	Thu,  9 Jun 2022 12:23:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654773796;
	bh=GnHMwvr2PGLR5LnLK/1iIyzgGmJgc+VanVTE3O2+b9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NU2GGvfsDHSfrMIg27Q7f7HV7XK1TPBAhm2miP0l7eER6HU2/tUBOR6S8ixsH20V5
	 3EKkoKME/czKHjO0ezkxQ8IwetM+XCtdPtZskM+n3WMkSPQpKHBeaGGoXwSZELf4yd
	 eS/s1E8FDN3UT+Q3fnzZNGGGbktGK39/e3Lqm5o9w7GBmXdNIp1F/8Qy9/ODlSSSfL
	 vov1k22hcu6EcWYjAndIvs9ck5smjmVb35E3nb3D4SUWBRZ7r61nKrQm1CmYQ3gbx5
	 17zRZzu4AEVmsx3/qXG0N3cxntgLexPI0PP7uikJjrI1OA4wgXju/5/XhX/OHNQ0EE
	 wig6+WxUx8tEA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 09/10] arm64: dts: mediatek: mt6795: Add pinctrl controller node
Date: Thu,  9 Jun 2022 13:23:02 +0200
Message-Id: <20220609112303.117928-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
References: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_042318_164793_0108CA64 
X-CRM114-Status: UNSURE (   9.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a node for the pinctrl controller found on MT6795 but without
configuration for any pin, as that's expected to be done in the
machine-specific devicetrees.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index db1f24b3b9a9..f52800e287ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -13,6 +13,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pinctrl/mt6795-pinfunc.h>
 
 / {
 	compatible = "mediatek,mt6795";
@@ -198,6 +199,19 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 
+		pio: pinctrl@10005000 {
+			compatible = "mediatek,mt6795-pinctrl";
+			reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
+			reg-names = "base", "eint";
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 196>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt6795-wdt";
 			reg = <0 0x10007000 0 0x100>;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
