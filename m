Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD45EC7EE33
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 11:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpZ3v9CV8d71fiyi3ksjiw8vHO4BZ+sw2TuyEP+CFbw=; b=kmJf5q4tChBS/L2lVUdzFHGpwO
	fCarHOe4MKGhYKr4AWIkVIMhOVLNQRpmYaKYOnK4105r6IX8VVz7OZe6OgNs4O6ZeItO7LiMw4hUe
	QolMtT+rxTOV7R8V2+Po1Fl+S52etUyvJxogzuF5kABbiC+ooUSLIzEReKi/ZiBUR6cxTLbmvlHKI
	QhvQ6cVkxCRpDSEjFOpnKLpu0B+2Sxbl6UYNblJDOpp3ChzSrKtD0p+yrS9t7LrfVgTv7+8hkqAse
	YFi3v3xLa+bYX1jL2pXPAY26Pz0HRBfrSI6DsRRJpw+VVm6Snke6VA5DBcXRWVTpduo1BzoEnR04B
	tpvNTYyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gAT-003B0e-1B;
	Thu, 01 Jun 2023 11:08:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gAK-003Ar1-0t;
	Thu, 01 Jun 2023 11:08:27 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EE2946606EC7;
	Thu,  1 Jun 2023 12:08:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685617701;
	bh=7QDKHi+A/gqA9xknsWF5jEq2ws7Pw6cLm96d6FgjS6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xx+cHzrVM/7QBN8zx2IGQc44p3xQUNdFoCjaNWsOuAxvqd6YW6PADm/kQBCn00y6E
	 Kqt13x3/yukpW5PRkDNzlM2Q4Ciw1ksxMRw6b6LRiWzBg0/MioNAi2MDKyVjpHIPu5
	 uWnSS5QzqH/vV51900qxbSe8yEMSPA8z33g44GaPwX3N1afhNG2eFiFxzAHshe/wX4
	 ENHO8u0j060kKWaAOKB/QUFXmT2t4AyIY8wXTm5OgE6XzS/IaUjr7QU10jQUUZYkh3
	 2iH88ZuNPIWJY6PpuNJJxoe9ocyyKAYi9MaMNwGXTkaYHLelqGRMV/KfVSZM6u9Oeq
	 Sfk6VcdTDDhNg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: pavel@ucw.cz
Cc: lee@kernel.org,
	sean.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 3/8] dt-bindings: leds: leds-mt6323: Support WLED output
Date: Thu,  1 Jun 2023 13:08:08 +0200
Message-Id: <20230601110813.2373764-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
References: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_040824_485417_D9AA97B1 
X-CRM114-Status: UNSURE (   8.12  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some PMICs have a separated WLED string output: add a property
`mediatek,is-wled` to indicate which LED string is a WLED.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/leds/leds-mt6323.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
index 052dccb8f2ce..904b2222a5fe 100644
--- a/Documentation/devicetree/bindings/leds/leds-mt6323.txt
+++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
@@ -30,6 +30,7 @@ Optional properties for the LED child node:
 - label : See Documentation/devicetree/bindings/leds/common.txt
 - linux,default-trigger : See Documentation/devicetree/bindings/leds/common.txt
 - default-state: See Documentation/devicetree/bindings/leds/common.txt
+- mediatek,is-wled: LED string is connected to WLED output
 
 Example:
 
-- 
2.40.1


