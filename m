Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC8FC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 07:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6KN7qFz99qq/ALEKkoJkPgYJrjmF3EU2O4lIDewe7o=; b=vkKVqGh8P6qOtCNDO1DVVZqdNJ
	LPMX/CszpCDrHQxrMCvdWwdQKOgIgWlKUNvb2gxXLp+W20TdfdT8OFj2jO/O7+P8CeIqHUmvwYtOY
	Gji6pjdcNPDgFfdWyI+obgAKNDvpebsmQBS9sfccPc4IY1F8qVSsRijuzeJl/YCKVdwgAF8MdMe7L
	+lXMewnApWW55WofwsMOTSBVNuxl2a1pZIUJ1z96jih7w8WB7JRFNzrzpRUgAfyKbM+yyOTPNPnz2
	D26Wj7ZoKdCbuybM/Uvi1m8cUVQV6ZLTgY558qrM3BIsbtwR3KRTnSu2S9jOZ/FPA+2xO9D0SBzzD
	2UJ0niDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9MJz-00Esgs-ST; Thu, 07 Jul 2022 07:53:11 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9MJY-00Es9y-Pe
	for linux-mediatek@lists.infradead.org; Thu, 07 Jul 2022 07:52:48 +0000
Received: by mail-wr1-x42e.google.com with SMTP id h17so11948351wrx.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Jul 2022 00:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i6KN7qFz99qq/ALEKkoJkPgYJrjmF3EU2O4lIDewe7o=;
        b=2xWwxlQmOxFF7hkSwLKpunHGvB5x/X0vkrg/yhdWYf37lt4PSFeBuS/zCnxcpFzwrh
         HKDRN0N2yCvbPkyA3QiH99SXtyd4xFJu8OslBkqSP58kp4twJwZRnVn6uM9hDdYs/NmE
         scAllfzUBCgC3DvTT/3kcl/uX2f/j9EXSuZgOgCIc1yl3CwUa8/P9KLyx5ljtKMqLz8S
         Onmv+/j7i2UPWUJn52OVvG2ThAzfPtMgEhc+ZfPdB5UK55cK34jWeW2D2hH+6pCBAJjD
         d1ZJD+cj2n/Iox9G/muCTOiD3DOlT9eh6Xl21FCLrbFrXl/nPMqvWX5v+rtpxmk50oaV
         8Kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i6KN7qFz99qq/ALEKkoJkPgYJrjmF3EU2O4lIDewe7o=;
        b=WMpl8KrMbVbD45V/IuZCN4KmygAJnKRPMNVu36oiZ2V356fTj1Y+/+7u1OOjVrsX0P
         U0Pdt5uP3W3cq0lBKntutjVf/RuEWjqO4ClAngC0qYc8VDJnRYRzKeRX3WT/pf6v6UZf
         ThH0w9ddiOCJVmwXvRIzGTRUDpFvdGTNQkOuuiwfcEusYwqtDeyHCh/s1NJ/xjkZBm5Z
         GEceX6WHkQi7vq7A/ScUOxjU1kwQK6/Id09X5Ed3I66Hgo230V4OIWIVutQ0XhKDG+kW
         0WwD/xC3fJhJdKrjSGP1qQ+gBz6I5XTf0Yry4+cU6h0WxBIup+GpLdDnrv8pE2JTfdvN
         4iJQ==
X-Gm-Message-State: AJIora/vAhzb02sWAnoT+Dl8wng6D07QMZ+5g3iPkljTmYYpYXQAo4We
	Hy+VC9F19kEludea+Nqg0DC7DQ==
X-Google-Smtp-Source: AGRyM1soDhGfdev4LQ0mIklVU0dko84uYu7TIAzqbK7fMuXRnesTOeRRyxcpUQ5KiguXVGPAm3TRKA==
X-Received: by 2002:adf:f9ce:0:b0:21d:68b7:e7af with SMTP id w14-20020adff9ce000000b0021d68b7e7afmr20416179wrr.236.1657180361035;
        Thu, 07 Jul 2022 00:52:41 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:334b:5931:88c6:bbd2])
        by smtp.gmail.com with ESMTPSA id m16-20020adfe950000000b0021d70a871cbsm6972089wrn.32.2022.07.07.00.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 00:52:40 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Fabien Parent <parent.f@gmail.com>,
	linux-input@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [RESEND PATCH v3 2/2] Input: mt6779-keypad - implement row/column selection
Date: Thu,  7 Jul 2022 09:52:36 +0200
Message-Id: <20220707075236.126631-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707075236.126631-1-mkorpershoek@baylibre.com>
References: <20220707075236.126631-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_005244_906674_CF289D32 
X-CRM114-Status: GOOD (  12.14  )
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
index bd86cb95bde3..bf447bf598fb 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -17,6 +17,11 @@
 #define MTK_KPD_DEBOUNCE	0x0018
 #define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
 #define MTK_KPD_DEBOUNCE_MAX_MS	256
+#define MTK_KPD_SEL		0x0020
+#define MTK_KPD_SEL_COL	GENMASK(15, 10)
+#define MTK_KPD_SEL_ROW	GENMASK(9, 4)
+#define MTK_KPD_SEL_COLMASK(c)	GENMASK((c) + 9, 10)
+#define MTK_KPD_SEL_ROWMASK(r)	GENMASK((r) + 3, 4)
 #define MTK_KPD_NUM_MEMS	5
 #define MTK_KPD_NUM_BITS	136	/* 4*32+8 MEM5 only use 8 BITS */
 
@@ -161,6 +166,11 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
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
2.34.1


