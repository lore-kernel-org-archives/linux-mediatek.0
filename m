Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9331FC47079
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jan 2024 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbTPIz1gjiBa6bP04mmh2p5yqroBe9n9SqY/1TA2rR0=; b=Tj6lDdVBPpPSFk
	wqvihxSRB8iRRD/Zer4b1jCRSvYfOyAiftTTs/4HLe13FYsADqmETLJ2SRzrLAvvUu4omLdOeLiz9
	EPZhgPfbIrXgK42HyY/cd+tl9n+LIObSXmJGCptbYEQaRChnpDOLuNBf4NwYJEcbmc47X7aYWOnQ/
	qIduo6Ihy8o4FD1oAL4WRiTgvnfh0vw7ioBqd6+nriPKzkcXY9FK1Fjmu9yHFxPV2IjdcLNwIU3Ll
	F1uNYpXMVoYNVV2tF6T300u16kbTWayB7AbbQG2Hh0xhLqySDZm+rMPQMIfUkZLXDJkg2Ik41Y89n
	ojqm8hMUuWnUwi7SgyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLmwd-00HIgQ-22;
	Fri, 05 Jan 2024 16:21:15 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLmwW-00HIcc-2e;
	Fri, 05 Jan 2024 16:21:12 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 8AC1B100866;
	Fri,  5 Jan 2024 16:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1704471664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbTPIz1gjiBa6bP04mmh2p5yqroBe9n9SqY/1TA2rR0=;
	b=YgBZW8H8tPQZI6XRVvoImj6SKnHvJEXOz+8OiJKrlS5cGHYR5FwJdv8eX6O/0iXgn3b/7j
	4iJaXnf+9nOUnjAZqYiMB2UA042Qd29XFU4/6TX3nBNAIjedZIuvicOChnGm/T1LJD5m1y
	KFBufk7ulRwHQNfFXv3/xdJOjaKDQq4=
Received: from frank-G5.. (fttx-pool-80.245.77.34.bambit.de [80.245.77.34])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id B4938360670;
	Fri,  5 Jan 2024 16:21:03 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: reset: mediatek: add MT7988 LVTS reset ID
Date: Fri,  5 Jan 2024 17:20:54 +0100
Message-Id: <20240105162056.43266-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105162056.43266-1-linux@fw-web.de>
References: <20240105162056.43266-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 675202b4-de89-47e3-acdb-612b0c41f0f9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_082109_000883_EB364FBF 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add reset constant for using as index in driver and dts.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
 - add missing commit message and SoB
 - change value of infrareset to 0
---
 include/dt-bindings/reset/mediatek,mt7988-resets.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include/dt-bindings/reset/mediatek,mt7988-resets.h
index 493301971367..0216eeb249c7 100644
--- a/include/dt-bindings/reset/mediatek,mt7988-resets.h
+++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
@@ -10,4 +10,8 @@
 /* ETHWARP resets */
 #define MT7988_ETHWARP_RST_SWITCH		0
 
+/* INFRA resets */
+#define MT7988_INFRA_RST0_THERM_CTRL_SWRST	0
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT7988 */
+
-- 
2.34.1


