Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639E4C4828E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uqu45baJwDwaQIYrmiCmGtAl5ihaAmheXtf6eJawaw0=; b=o2x3seJUF4+8d9
	7pm618uS0Sbgdkt2y97iZg0VzgpWoTFaYNDzfodjlRbJmRfVb1fZOBjBSD1/xiGL0Xh3n/vqemiwe
	ZcZCNkFOSD46rwAGLqIg9aqaLX/DyCHJipCXJe+k3YHLr7FeMkHv7eNUnDPQp8m6DPZWebNFKx+F8
	O/H1Z3f6wM/00LMmqTlPC7d5BWGiQsayijPg8Abf2ugsCd3aVQfvf/cTSZyiTbmc2pbNS/hRl9jLj
	XFRWODxm3HRtzkcgTvEZ2LjEMRQHoBmpPQe0DCBlmPq0eHSk25/24pL8DBfcXOYiNylnTlQG89xbT
	fqbr43zB6C1u2DMefmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbji-000000090CG-0Bra;
	Thu, 01 Feb 2024 18:24:30 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbjb-00000009067-0SD7;
	Thu, 01 Feb 2024 18:24:24 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id E8FF1626B3;
	Thu,  1 Feb 2024 18:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1706811857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uqu45baJwDwaQIYrmiCmGtAl5ihaAmheXtf6eJawaw0=;
	b=ZA8iTrswx0AqyUw1eB9MbcmBmI/SSwy+YQVkzA+V6HM5RgGQH190iQKSTop/rgFn5MgZke
	n9oweBMWMpYJoT32F05cGCfwZyiDv5iZ59D2I6eXghF26ZOUKK1HSZHUDGqYR/LjU2hseK
	0Qpbo31IEn/u7VRTDVvmu4R3cyF0M9c=
Received: from frank-G5.. (fttx-pool-217.61.148.248.bambit.de [217.61.148.248])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 07579406E6;
	Thu,  1 Feb 2024 18:24:16 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: reset: mediatek: add MT7988 infracfg reset IDs
Date: Thu,  1 Feb 2024 19:24:08 +0100
Message-Id: <20240201182409.39878-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201182409.39878-1-linux@fw-web.de>
References: <20240201182409.39878-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: f86ec7b2-db69-458e-813c-2cef7dd7b5cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_102423_449461_EB429B6D 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add reset constants for using as index in driver and dts.

Value is starting again from 0 because resets are used in another device
than existing constants.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v4:
- add info about restarting ids from 0 to commit message

v3:
- add pcie reset id as suggested by angelo

v2:
 - add missing commit message and SoB
 - change value of infrareset to 0
---
 include/dt-bindings/reset/mediatek,mt7988-resets.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include/dt-bindings/reset/mediatek,mt7988-resets.h
index 493301971367..0eb152889a89 100644
--- a/include/dt-bindings/reset/mediatek,mt7988-resets.h
+++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
@@ -10,4 +10,10 @@
 /* ETHWARP resets */
 #define MT7988_ETHWARP_RST_SWITCH		0
 
+/* INFRA resets */
+#define MT7988_INFRA_RST0_PEXTP_MAC_SWRST	0
+#define MT7988_INFRA_RST1_THERM_CTRL_SWRST	1
+
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT7988 */
+
-- 
2.34.1


