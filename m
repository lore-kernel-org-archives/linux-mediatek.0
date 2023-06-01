Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0E3C7EE31
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 13:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPga4xJ9fX4R6oGWXFxxw+iAomdjFcXHo3LmyH8CFxI=; b=CFJ4yS3Yjh888UDpFrbu3/YnU8
	a0rZIQikOYWOn0FTy2PxMdnNQNwGbveUHLRi0ylB61G1KU+5827/O6kI0GKztHVwHp5qIXhPbzMX8
	bW//FUY1wXBJZHIpBCU+5U2slgAhU1tB35H4ZV9k1uMIiOAMYmzS58DbnEhsUssfe0T79JbaKqT9L
	/KM4gDQPQ1bagYRlxBq3so9nyIBvpvsrbRFc0/LA4wbEVyBZ2TbOv74N/QKYP6asJfQw7C28XHhwG
	42yVIZUKyrH1BPkDZ60R/0m2S4mCG/H/IepuL37wtsokJ0khCn3lVz53nN6cBqP8qe0m8QVj98Ycn
	JtI3MQMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ibj-003iuF-2u;
	Thu, 01 Jun 2023 13:44:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ibe-003iro-1w;
	Thu, 01 Jun 2023 13:44:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA76C6453B;
	Thu,  1 Jun 2023 13:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DABC433A4;
	Thu,  1 Jun 2023 13:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685627085;
	bh=q6w4UUDjOmOOezIJ0otzADnOnzbMQRuEIJyRnoatvfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KL+9vHOICSZeUlx4L7ytO0wuNrH/rOWgGlc6ATUHpY9KIUFIRL9s5W/lB/1eRaVrk
	 +G+YsHCFcUspFilEYonT5Vm4NHn1Wm5cOQmRUOm5qEZwFaUkrPH28pvPctqYWeuYtF
	 XaLre8ws8zN1UAjO7VSiyakQ0j9Wcm02aK6ng7Fn1v0lW+os/XxyT+Lt7t4RClTV/W
	 qZsM7Gibgru0dz2mNKn71IAPc3r//1kEzxqZkTKNXeeIBFYb7JU+34yZHl8tXQnluU
	 8wl9V6Rp65gbjDXBJpB3X5FyI/tPnxFf/qH18ML6XcLoLPICXQOVUuaTUTAr4MFFZK
	 URWzjzitA4caQ==
From: matthias.bgg@kernel.org
To: rafael@kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	Amit Kucheria <amitk@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: mt8173: Update thermal node
Date: Thu,  1 Jun 2023 15:44:25 +0200
Message-Id: <20230601134425.29499-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601134425.29499-1-matthias.bgg@kernel.org>
References: <20230601134425.29499-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_064446_775345_35E7457D 
X-CRM114-Status: GOOD (  15.14  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

Following the binding description, update to use
thermal-sensor-cells = 1
While at it also fix the node name of the CPU critical trip point.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

---

Changes in v2:
- fix node name of CPU critical trip point

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index c47d7d900f28..d760776e3daf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -270,7 +270,7 @@ cpu_thermal: cpu-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <1000>; /* milliseconds */
 
-			thermal-sensors = <&thermal>;
+			thermal-sensors = <&thermal 0>;
 			sustainable-power = <1500>; /* milliwatts */
 
 			trips {
@@ -286,7 +286,7 @@ target: trip-point1 {
 					type = "passive";
 				};
 
-				cpu_crit: cpu_crit0 {
+				cpu_crit: cpu-crit0 {
 					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -766,7 +766,7 @@ spi: spi@1100a000 {
 		};
 
 		thermal: thermal@1100b000 {
-			#thermal-sensor-cells = <0>;
+			#thermal-sensor-cells = <1>;
 			compatible = "mediatek,mt8173-thermal";
 			reg = <0 0x1100b000 0 0x1000>;
 			interrupts = <0 70 IRQ_TYPE_LEVEL_LOW>;
-- 
2.40.1


