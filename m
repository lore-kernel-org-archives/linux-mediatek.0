Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9CBC25B47
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fN/MQV6dwt8BvtYNvMR12qWNERnV7Wj49zgD8ObeVA=; b=FtkPPOG73CKf1r
	JDh2w3omzmRxKVfqS+SaLjgkbTDTYtqhGG3aO3mKtBscmXbmUmrjcvJpF4ZWBaQRwEAPppGxvQ39H
	DphmSFEm0VZU4pNfzQofjPSBKz9p5S+T9Xe6wcAH+lxaKubWzalwjffCMqC4UxO6hnAh6iln+QOZR
	EaGjnIDyjV5ep9jKJDM+7KH4jP+lOHzXYNUk63ISAOt6eAK1ESKEhcZEr+NLAyAdSre+ycwYrLSCD
	O+9OVMO3xkw5G8rec3gwz68rDSwQY/ZemChV7f/19LyMhoRx/gSdv3IHyDJc61Ij4xVt1wX2G4hVI
	3KuiIIBJ1XbLDfTt0kYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvhNP-00Ckx4-2L;
	Wed, 25 Oct 2023 17:09:03 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvhNB-00Ckp8-2S;
	Wed, 25 Oct 2023 17:08:52 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id D58D61025C5;
	Wed, 25 Oct 2023 17:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1698253725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9fN/MQV6dwt8BvtYNvMR12qWNERnV7Wj49zgD8ObeVA=;
	b=VtFrx0zcDRKK20SYDAD7XyFziUjVNDiy8fI2lqOyiXFo2zn/v/Lb4HySL4Nm7AzyvioUHH
	Qp6MFraRa39+17LVkKPqEraI6BEs5NNdcq3KuxV73pdSZS0R3BqtJ7WWG9QlOUXmE6pZ4a
	LkWnawYUAcSUKkekMCnOaROufBtkM3Q=
Received: from frank-G5.. (fttx-pool-217.61.159.50.bambit.de [217.61.159.50])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 2AB493608ED;
	Wed, 25 Oct 2023 17:08:44 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/5] arm64: dts: mt7986: change cooling trips
Date: Wed, 25 Oct 2023 19:08:30 +0200
Message-Id: <20231025170832.78727-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025170832.78727-1-linux@fw-web.de>
References: <20231025170832.78727-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: eafcfba0-3d01-49d2-bf58-32026e9a4c7d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_100849_983119_A5826379 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Eric Woudstra <ericwouds@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add Critical and hot trips for emergency system shutdown and limiting
system load.

Change passive trip to active to make sure fan is activated on the
lowest trip.

Fixes: 1f5be05132f3 ("arm64: dts: mt7986: add thermal-zones")
Fixes: c26f779a2295 ("arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts")
Suggested-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- squash patch for bpi-r3 as suggested by angelo
---
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 10 +++++-----
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 20 +++++++++++++++----
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index f9702284607a..b876e501216b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -152,16 +152,16 @@ cpu-active-high {
 			trip = <&cpu_trip_active_high>;
 		};
 
-		cpu-active-low {
+		cpu-active-med {
 			/* active: set fan to cooling level 1 */
 			cooling-device = <&fan 1 1>;
-			trip = <&cpu_trip_active_low>;
+			trip = <&cpu_trip_active_med>;
 		};
 
-		cpu-passive {
-			/* passive: set fan to cooling level 0 */
+		cpu-active-low {
+			/* active: set fan to cooling level 0 */
 			cooling-device = <&fan 0 0>;
-			trip = <&cpu_trip_passive>;
+			trip = <&cpu_trip_active_low>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 77ddd9e44ed2..fc751e049953 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -614,22 +614,34 @@ cpu_thermal: cpu-thermal {
 			thermal-sensors = <&thermal 0>;
 
 			trips {
+				cpu_trip_crit: crit {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+
+				cpu_trip_hot: hot {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
 				cpu_trip_active_high: active-high {
 					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "active";
 				};
 
-				cpu_trip_active_low: active-low {
+				cpu_trip_active_med: active-med {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "active";
 				};
 
-				cpu_trip_passive: passive {
-					temperature = <40000>;
+				cpu_trip_active_low: active-low {
+					temperature = <60000>;
 					hysteresis = <2000>;
-					type = "passive";
+					type = "active";
 				};
 			};
 		};
-- 
2.34.1


