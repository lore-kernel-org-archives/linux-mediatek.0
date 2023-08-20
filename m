Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1A7EE4993
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Aug 2023 15:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09XlR83YFSi4NRf25+3bw/2BaTp3RGKRQHRUPxLTGrw=; b=iEAGJ+CYi1sA13
	99SwCEJr3sF+o5NBiupjIwB4oVaTmnlOqV66bmNqV6eX6iYggtNWwUZqz0guPcvbqhfIhDs27lME2
	DSgDXDqUc46JY61zpna2jEpZrlZS4ONuY4pbmqjj030VvSUYl/4kLP1ZZvTZ0ok9ZJWWSs5lZz6+9
	PByhqFcNyOQoruN0Lo46p69yrzBRMHJSl6YVox8Ysz9WqnVPiHblXb46gDMUebwQS0oQtTMWH34eK
	NWhsfGythxawj8lqgqTRe8iD56bcqarBQ+Ldj3nlMNmKlPey2CTSStCkPf6hwn521C6l0YHBjud5u
	6ZJCTCuMkdrxBwfEkEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXkPZ-00C6y2-00;
	Sun, 20 Aug 2023 15:32:17 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXkPF-00C6sI-3D;
	Sun, 20 Aug 2023 15:32:00 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id E43BE1006A2;
	Sun, 20 Aug 2023 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1692545513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09XlR83YFSi4NRf25+3bw/2BaTp3RGKRQHRUPxLTGrw=;
	b=aA34mCShWIjt/OJuI9kgsex39Pl5HOVtnaKoyii24yUdlkhPuvy543fX8VSs2nOerU6Iul
	QhfpBiF9D2hAAv1PjGbh1yjgCBj/To+Qndxs9B3zcDQpE+5G8Hq6xFZVkMOmIj9F4UHqj7
	stwlfqHakLX6UpIlErcQ2uBz/ofh6+0=
Received: from frank-G5.. (fttx-pool-80.245.78.65.bambit.de [80.245.78.65])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 51506401CF;
	Sun, 20 Aug 2023 15:31:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v1 3/3] arm64: dts: mt7986: change thermal trips on BPI-R3
Date: Sun, 20 Aug 2023 17:31:35 +0200
Message-Id: <20230820153135.42588-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230820153135.42588-1-linux@fw-web.de>
References: <20230820153135.42588-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 58ee28ff-36e2-45c9-af2e-5d6e67be8ab5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_083158_193005_BA43F37B 
X-CRM114-Status: GOOD (  11.35  )
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

Apply new naming after mt7986 thermal trips were changed.

Fixes: c26f779a2295 ("arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts")
Suggested-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts      | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

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
-- 
2.34.1


