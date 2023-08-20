Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25ACAEE49A6
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Aug 2023 15:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SsbtKnqEZS1SBS/BTwtYQes3zVkGyGBksUmpnFniAzM=; b=U6mWD1HWIk3RdE
	eK1gOQoakEjwjSfACggbU9KYiznHZ1Qg2FvJTFVHMRzOp3JIV98suegIZp0MCVtkhcnKAQ5eZ5wq/
	FivHOAjw1/7O9B5WXRGDwysZmIPMK6c9W4i0yV24Ycu3XaCzzDKbj64vzg3RuU6zqzcN2vZJjhTZ+
	1UuSLv2rElxGrvTYtpEwQycJB4zfsbHG4IT/+nYmgFYqI1lkoe/O5ohZkYVffaTq4eMXqoEj19xW5
	KD71B3l++ybUy95eybFydYLSG72QsyaFOspQDUEatVWBEHU+QZqPfalFxz4N4av89PEIff6FOnJQC
	jFjOKZVLe3Hrl4mtzn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXkPJ-00C6uq-30;
	Sun, 20 Aug 2023 15:32:01 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXkPF-00C6sH-34;
	Sun, 20 Aug 2023 15:31:59 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 574CE5FA81;
	Sun, 20 Aug 2023 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1692545513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SsbtKnqEZS1SBS/BTwtYQes3zVkGyGBksUmpnFniAzM=;
	b=l28ZjGGRxA5usxJSSUCcuQvQ7eQvPtZIwgHBByGOmuaT2HIhcbulcN37G/BI8a/I6nWCj9
	1QTDhBJv6zVQRwsOPIABFI/LZ9hOujh/4zWdZ4uVFnnt3Si5Drbfolatd0fTFM5Vky79iL
	tNQesKw2oC1/IGRH5nkVDgOkLWES5Hg=
Received: from frank-G5.. (fttx-pool-80.245.78.65.bambit.de [80.245.78.65])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id AC639406E2;
	Sun, 20 Aug 2023 15:31:52 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v1 2/3] arm64: dts: mt7986: change cooling trips
Date: Sun, 20 Aug 2023 17:31:34 +0200
Message-Id: <20230820153135.42588-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230820153135.42588-1-linux@fw-web.de>
References: <20230820153135.42588-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 146a06ab-4984-4ce9-abad-c731e52ad8a3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_083158_166527_FB8E17BB 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add Critical and hot trips for emergency system shutdown and limiting
system load.

Change passive trip to active to make sure fan is activated on the
lowest trip.

Fixes: 1f5be05132f3 ("arm64: dts: mt7986: add thermal-zones")
Suggested-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 207510abda89..36d8945400df 100644
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


