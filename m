Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203A6D2AB2B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2024 12:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBdI6EjJp8UowrmiaGoi2Fq0w1WX7yePH0/G5CJ86tg=; b=n1zQOjDKefS9eU
	e6EXzqb99GOn6N8DPmtEoyfxAECP3+rVhLRTun9Qx/fu2jGP2fZHrksEQ5fLbe/nu9gCadhaSYv9h
	x7U+6CWKphNUgPnPHL7pQqZ3KKZ3YhtLgZqAh76DUbTT8DFNeU/e72oXpEggqvUUztL+AkPSYWY+I
	JDXp0AISEiitGv9RmQMkm9dtPHdPT/XPHPfENjlR4NB9io9dNiff6SGRZCWn/XVFFCAE8bMDx+I7P
	ph3TbnMjWgybuabIXjA1JP458L9pt88D+XuQoWzyajp6347+nku0YGjsgM9CN7NziFSJawt8Ykycg
	MSFfSAqwIoqmGwJQAdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ktg-0000000EJzj-34DX;
	Tue, 29 Oct 2024 12:00:28 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jdg-0000000E49T-0pZQ;
	Tue, 29 Oct 2024 10:39:53 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 002E84052B;
	Tue, 29 Oct 2024 10:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1730198390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBdI6EjJp8UowrmiaGoi2Fq0w1WX7yePH0/G5CJ86tg=;
	b=B6QRk4ddbj0ZZC/LxU5uFAqI8NGYdIVNDvDOSHpmeveadWs3FRdR3qg+kbeRhMb9kvZ04I
	/mxqhWvHivzZmgCZR5qRiMZoA2zq8B2uEdyGgLHC1D3VO0+nwnZrmlpdArbsdHn/isNvDJ
	R2rQ48EApPPYlIWnyS+mXv7w0ceO8mA=
Received: from frank-u24.. (fttx-pool-80.245.73.173.bambit.de [80.245.73.173])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 64F813600D8;
	Tue, 29 Oct 2024 10:39:49 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [RFC v1 11/14] arm64: dts: mediatek: mt7988: add thermal-zone
Date: Tue, 29 Oct 2024 11:39:30 +0100
Message-ID: <20241029103937.45852-12-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029103937.45852-1-linux@fw-web.de>
References: <20241029103937.45852-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: a237a3f0-1cac-4e47-a90d-bc7df7aaec54
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_033952_422309_57D3A764 
X-CRM114-Status: UNSURE (   8.58  )
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

Add basic thermal-zone node.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index de9a9ff2edd8..a3a7deda35a5 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -379,6 +379,45 @@ clock-controller@15031000 {
 		};
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&lvts 0>;
+			trips {
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
+				cpu_trip_active_high: active-high {
+					temperature = <115000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				cpu_trip_active_med: active-med {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				cpu_trip_active_low: active-low {
+					temperature = <40000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
-- 
2.43.0


