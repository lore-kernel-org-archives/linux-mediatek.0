Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383D2C636CC
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Feb 2023 17:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5x5jw/lnJazoXzv3c6IXoN93KLrXvZK0c1wXgqRmz8M=; b=jCPtcRjgscoYmb
	dTkNnJGm0B7wQgm2uspcA0ItvSU8oeLGjBRNzIGRP1vqdblXjhp4pMhbN9DKeolFbM6REWtelngwh
	7c6I6zfBN8rKMn/MUwffPQz406VxYEPUBaOAZhxzf/AIf8pCM9F7dfl8r8/EGKaySyVzH1A8ymuTT
	sOveLbjpGXOlUGElgy+Y/CMPD4iXFOcW5OZsSk633YDAgmxhjKqlU7Usna93+Hjn7D1VjkBH21Kmx
	x7+JeBtTfbTZ8EcILntvEd/wSLghny/VYYRz1GKW0FzzVBeLGIxERuKW6McFa4f3uB66PJvyrhZh9
	mz38/7y7wagGEm85+MkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOj8Q-006dN2-W8; Sun, 05 Feb 2023 17:49:03 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOj8H-006dLm-0h; Sun, 05 Feb 2023 17:48:54 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 3F6AE6047F;
	Sun,  5 Feb 2023 17:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1675619326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5x5jw/lnJazoXzv3c6IXoN93KLrXvZK0c1wXgqRmz8M=;
	b=rObJxyrwiG/VjAXWpqAbF9wqNgBjSp4W15IbrZ/S7aC2UDQVE97stsmFgHga+4Av7PnzRo
	Hv30INctB+bt/WDFDRAGkROzCmYrzelJgvoHsS8euQtEEK6MJU0OjsSm9EaWugDHnSsC/a
	ufuh4S4aVjzBXYQnQwRAHIP0aYqzJGs=
Received: from frank-G5.. (fttx-pool-80.245.77.40.bambit.de [80.245.77.40])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 0936B1226B0;
	Sun,  5 Feb 2023 17:48:46 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mt7986: set Wifi Leds low-active for BPI-R3
Date: Sun,  5 Feb 2023 18:48:33 +0100
Message-Id: <20230205174833.107050-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_094853_244531_2E107635 
X-CRM114-Status: UNSURE (   7.92  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Leds for Wifi are low-active, so add property to devicetree.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 33bd6febc160..2b028141f1f7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -446,5 +446,9 @@ &wifi {
 	pinctrl-names = "default", "dbdc";
 	pinctrl-0 = <&wf_2g_5g_pins>, <&wf_led_pins>;
 	pinctrl-1 = <&wf_dbdc_pins>, <&wf_led_pins>;
+
+	led {
+		led-active-low;
+	};
 };
 
-- 
2.34.1


