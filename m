Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC00BC77B73
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJ0eM390SUMaG3alItfW2Szi/4FK8rXN+T4f+bTA7fg=; b=cvCzr0V0ibfScwjrDnFAM8cFdc
	y7QB/T5WefsRK5UfFJzxh1Z5SB5OyxkCASND7KLN9O11u1RCyy5OOo2B2HS8dUGDaVqTwgi0Bfm1f
	RockbOXBk8Cu6SRNOgZqW0OYPoKEM4qzm+IlRGaX20paoZnmgFvWNuPnWrz4XjzNAYGLjOktU5GPK
	jy1IbBJmk4xyR9JWd3k8sTvgnly+xyLRrEHp57JfW+uCNfEum1tpE/a0PeGanVhyD4b98X6HsJ96L
	xqC5neCjvBk0Ql+P3PLUzq7mJccRL8Dpmb/qcxkhU+xGgOoN+xshzUaWD5/ta77BHOQbEzuRbZY0x
	Z5I1x3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q40u9-00EKvP-1D;
	Tue, 30 May 2023 15:04:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q40tg-00EKjP-1W;
	Tue, 30 May 2023 15:04:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E96E63219;
	Tue, 30 May 2023 15:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181E2C433AE;
	Tue, 30 May 2023 15:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685459067;
	bh=QnEoh+X+SgNcIBxD5KzNnV5xmRN1TrKhb2ZElCWGT+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E3jWOhPweOzR2ItjP8ZU+908Aay1KcouvnvGiVgboQaHDLkc0/4LNgMeFKx4X94T/
	 Gp4aM6Fv0bxhFIuCsdWeqHbtcuIBymKu4iv0saqyg7A7J4Dx4hypkXKRKe9/nPQU3e
	 ZZ0WCXNWC8FHoTBGTALmgCKcCrhhuZcRKuhNGjzMBkbkMpRyuGofpNZQTjMnaA3rql
	 UAwIsY/DFwamgl6nb2/h0D7KwTV5axTLimNDik/dAq3qkq4OgmUOykOmxkl0/qoFqh
	 7Hsmo23aIkJ7CQgMwh/CqLsFhKR3IZwEx+EwjRBA0eDRUt8kRy4dODFixGHdZ07yrx
	 BsTXkPms8MBsg==
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
Subject: [PATCH 2/2] arm64: dts: mt8173: Update thermal node
Date: Tue, 30 May 2023 17:04:13 +0200
Message-Id: <20230530150413.12918-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530150413.12918-1-matthias.bgg@kernel.org>
References: <20230530150413.12918-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_080428_544714_BE14889F 
X-CRM114-Status: GOOD (  13.95  )
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

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

---

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index c47d7d900f28..44c553bddd46 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -270,7 +270,7 @@ cpu_thermal: cpu-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <1000>; /* milliseconds */
 
-			thermal-sensors = <&thermal>;
+			thermal-sensors = <&thermal 0>;
 			sustainable-power = <1500>; /* milliwatts */
 
 			trips {
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


