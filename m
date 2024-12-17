Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FF0E7716A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2024 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLH7B1/fsQT4OqgVuCSBjfAK93rVJz4M8MFDc9eGBSg=; b=jyN2uiIVL4IhvG
	O2diyBeltck5oPCjVM/Rr4ajbZ1DYr5Iqn7qROfGuh/KlutB++iwJM9I8yQGEwBNOckpMhKhe17+4
	MKrXlFND47tu8p0AglujOpnBQdCaYaEPYEoKn/S5yXkTKILqlsWhgFedKQBFmhMT5H1KqFKwsexCm
	3pY5SHPsn/GhBUYK4mPReIUoewr29kTQxVybctBNOI4kvb47Iw4PRix/1LYrhEDJ/OHT5Yip+2I1f
	/I/NsBOJlVKxQLPoHLigrFdQaYR177O0eccxAM+eLcqlEXRuK5E7SnLD36R56je66nTqjha+bhS5e
	6n59XTUHDxBnW+LahKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNU1I-0000000Cx3E-1yst;
	Tue, 17 Dec 2024 09:37:36 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTdX-0000000Cr6D-15zn;
	Tue, 17 Dec 2024 09:13:04 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id ECEBE3FF69;
	Tue, 17 Dec 2024 09:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1734426782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BLH7B1/fsQT4OqgVuCSBjfAK93rVJz4M8MFDc9eGBSg=;
	b=spfzf9on6yBnt+qXCLEOOLvFZ2pWEjF3s8soA0YcCjnjby8a0yOCphApl9OVh/Jhpky2U0
	zDNedWIR8OShaofpOy240GMRk520GS7V8iD+dgGxOOs7EBD7tLcOHPoI4ln9pORoK38hGj
	+S26IuUgZ2/BiySyMk6JJacKivxsrSo=
Received: from frank-u24.. (fttx-pool-217.61.150.187.bambit.de [217.61.150.187])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 30CF91004DD;
	Tue, 17 Dec 2024 09:13:01 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 14/22] arm64: dts: mediatek: mt7988a-bpi-r4: Add thermal configuration
Date: Tue, 17 Dec 2024 10:12:28 +0100
Message-ID: <20241217091238.16032-15-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
References: <20241217091238.16032-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: d0e1eb62-cc28-4aa9-9dcf-a8ff22252987
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011303_435767_D54550B1 
X-CRM114-Status: UNSURE (   8.20  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add additional thermal trips to Bananapi R4 board.
SoC only contains the critical trip.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index df53512c6890..8a320d9da443 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -28,6 +28,34 @@ reg_3p3v: regulator-3p3v {
 	};
 };
 
+&cpu_thermal {
+	trips {
+		cpu_trip_hot: hot {
+			temperature = <120000>;
+			hysteresis = <2000>;
+			type = "hot";
+		};
+
+		cpu_trip_active_high: active-high {
+			temperature = <115000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		cpu_trip_active_med: active-med {
+			temperature = <85000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		cpu_trip_active_low: active-low {
+			temperature = <40000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+};
+
 &pio {
 	mdio0_pins: mdio0-pins {
 		mux {
-- 
2.43.0


