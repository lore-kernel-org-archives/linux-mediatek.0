Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B28D78311
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvio4qYnn152relW8d8dOOQlvOo0mSc7MB7Rnu0hWEg=; b=qPflkTIz1Zc+qI
	JBfDSt1QwHR5QUJPPbiCueU5TqgCBQT/ySs2P/8fbKRQeLUUWyVeL0KY50VjaFW8hCWJ2oBYZN+Dg
	oOjY0XSoFKkQ7Sot+9ebYiWrmBIWy+RymZpgUtWD/jBWEjsfnKNCyEUgdLhQivoUcxv/1amAAc5zT
	okKuGVz4/HQwQUL2WTXByiflfjuAKzzhfUiSKT/cUR+UKOeK/ZfRCR7w2GGLo2sQIrmkfJGTxdtlI
	9eEQYyJKwYh5il7Lo1iWRrpFPhVqB+lW/oHyTGnRWTuO7DnT8D+QP10x06XYhgEPWvMSYkf1Fm3hV
	jNHpG4v4Z+vhtua54B1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5Z8-0000000656l-1eUu;
	Mon, 02 Dec 2024 12:30:14 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VF-0000000646O-2MZE;
	Mon, 02 Dec 2024 12:26:14 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 40DC7613F7;
	Mon,  2 Dec 2024 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvio4qYnn152relW8d8dOOQlvOo0mSc7MB7Rnu0hWEg=;
	b=JDvX5RswSd2RQ/g18NW4rQ0qtVwn6IhhlCcpyGPRkmpyhxpxlfCiWLYLaeu6Cj51EnuuFC
	WiWnAQE5V24sCQjKuqg5sNhPdgFexNhcuwL0GWtMXlQrZe55QFOEuIv93h+4mSH5Gd8l+T
	DELL4n1NCuMb9Kb6ezsbNAs+mzQktPA=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id ABDA0360188;
	Mon,  2 Dec 2024 12:26:11 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 03/18] arm64: dts: mediatek: mt7988: add fixed regulators for 1v8 and 3v3
Date: Mon,  2 Dec 2024 13:25:44 +0100
Message-ID: <20241202122602.30734-4-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202122602.30734-1-linux@fw-web.de>
References: <20241202122602.30734-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: f3d04e75-e09a-4074-aa49-cde4d43063c7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042613_738763_16681825 
X-CRM114-Status: UNSURE (   8.37  )
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

Add regulator nodes used for mmc to Bananapi R4 board.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- move mmc regulators to board dts of bpi-r4
---
 .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index d914eae2b524..df53512c6890 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -8,6 +8,24 @@ / {
 	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
 	model = "Banana Pi BPI-R4";
 	chassis-type = "embedded";
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &pio {
-- 
2.43.0


