Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25CEC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqAGsu6kz2S6d5SCKmvmZs5M2BTVRYIjfIVSTz6lRA0=; b=TqQ8vXLvcuTq1/
	NykSg4QmHmq70OF1BzrnNIJuFPmkcTPIZlUHTpocsE578jprONyDQcviCPmQI76/6PojVG0shKO52
	pKtGtUp7JSYvBMrw5oxgDMkIo0FuWI3FthVdwbGVHdLH5Ca4CRTm95D+bSC0KdYB2C+FFEDhHOb0F
	znWxaP4CIs7eomdnJROn9wR4Z8uF2ulZjMME0nuNSskrHtcgspcjbVe3zHchCikdlyTGh9e6kIfjp
	scvNIXW3o9pM+zmLs43PIWgI+20gS2cA6rdrPGrXiewRJ1Qc4vfJYu9JBFyGKUF7tjIA+X08c2q+E
	TNkUiRnEX01LOVip4Jfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nizaI-009tnw-EZ; Mon, 25 Apr 2022 14:21:02 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nizYg-009t5X-RN
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 14:19:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id t6so17652686wra.4
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 07:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f2ty6Kirg+4vRs3TX4nTiMefjQ+ct09dXtXeTw7jYik=;
 b=1sB7e3bdedA9AmRsfGnyCiarRfssvnjB14wg3RY5vuJjV8MlDlAG4m3750y3L4EI6B
 VCreeEhx06bcRLFb3DUHAYJvjqkhhjWZ5wEsdtvd0iyChuQyufYvQz/rFgbcBNXFkta5
 oZ364bmnxUDmoMo5PKJYxul44ORkdDIAdkjhG7RD7z3xVe48qqIIxETG2j+dSi9L5Pxi
 451O8ITGyPjGK/bRn2zi7whFR2olqTX68D+YTPvymtepHOVTUjCHRAG4eiBUy0hkofDD
 QV83KEgXbzukq11DA/dsG46j5gmqyPahC8HpJjhHATw13Xy4EH6GtVSWueTVkutXrcyB
 H+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f2ty6Kirg+4vRs3TX4nTiMefjQ+ct09dXtXeTw7jYik=;
 b=BcxALCAaBISyCQ0cxe2VKcktqFkIj3se3bMgZzqdj9Zlr+cZeq72nCzauGdxeTXnKd
 gvaudWpLNL4+klyEYRFdY4XhxrHjMANvLe3FWvFl+h9oQ455J3U9Qmp49hhJC/PSYpek
 XfKDyOrJsjSa1wZDG+slYErzfyEk3ejTPMjKVAfnjJZYksSoVMrjOnc+M/MocWaBGSxt
 UsWmpuGqRVLXuxVsaVOsIuSfsZqBMOkvzB5K1Q42jYpd579rktZ8gXMXnjcX+9lDaDyx
 +hN4TUI/LBVrKVHMGqY3mnsrbKdHZLHLljEdddHHXP8JQ2/9T+9s1NKjEP+dGuSvTOwg
 LHNw==
X-Gm-Message-State: AOAM5303CFS1VuFdMvQVZHglupP6jgOeUP6xTNcmyP/cRy6MDze7bMr3
 5lA1YPiBZTMQkY+sLwUdx716hg==
X-Google-Smtp-Source: ABdhPJyz4lwM9SSlgEubsE2+9MARuzk/2+T+ZiKJb/BBzhW4+LWq+OpWxYNbBON2beZCu62KJb+UqQ==
X-Received: by 2002:a05:6000:1a86:b0:20a:a933:ba16 with SMTP id
 f6-20020a0560001a8600b0020aa933ba16mr14279412wry.583.1650896359277; 
 Mon, 25 Apr 2022 07:19:19 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:ce86:3a65:67d7:726d])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a5d64ca000000b0020aa97b0383sm9144592wri.113.2022.04.25.07.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:19:19 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH 2/2] Input: mt6779-keypad - implement row/column selection
Date: Mon, 25 Apr 2022 16:19:14 +0200
Message-Id: <20220425141914.158959-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425141914.158959-1-mkorpershoek@baylibre.com>
References: <20220425141914.158959-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_071922_944425_A342979A 
X-CRM114-Status: GOOD (  11.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MediaTek keypad has a total of 6 input rows and 6 input columns.
By default, rows/columns 0-2 are enabled.

This is controlled by the KP_SEL register:
- bits[9:4]   control row selection
- bits[15:10] control column selection

Each bit enables the corresponding row/column number (e.g KP_SEL[4]
enables ROW0)

Depending on how the keypad is wired, this may result in wrong readings
of the keypad state.

Program the KP_SEL register to limit the key detection to n_rows,
n_cols we retrieve from the device tree.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 23360de20da5..653dfc619696 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -17,6 +17,11 @@
 #define MTK_KPD_DEBOUNCE	0x0018
 #define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
 #define MTK_KPD_DEBOUNCE_MAX_MS	256
+#define MTK_KPD_SEL		0x0020
+#define MTK_KPD_SEL_COL	GENMASK(15, 10)
+#define MTK_KPD_SEL_ROW	GENMASK(9, 4)
+#define MTK_KPD_SEL_COLMASK(c)	(MTK_KPD_SEL_COL >> (6 - (c)))
+#define MTK_KPD_SEL_ROWMASK(r)	(MTK_KPD_SEL_ROW >> (6 - (r)))
 #define MTK_KPD_NUM_MEMS	5
 #define MTK_KPD_NUM_BITS	136	/* 4*32+8 MEM5 only use 8 BITS */
 
@@ -171,6 +176,11 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
 		     (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);
 
+	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_ROW,
+			   MTK_KPD_SEL_ROWMASK(keypad->n_rows));
+	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,
+			   MTK_KPD_SEL_COLMASK(keypad->n_cols));
+
 	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
 	if (IS_ERR(keypad->clk))
 		return PTR_ERR(keypad->clk);
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
