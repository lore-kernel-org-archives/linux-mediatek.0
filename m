Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EE1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 14:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fs1Wkx7t3Ids6prfzZPoikCMsOgR6ciYDiLykc9zDdo=; b=DelzLlrEguC+/t
	j2hhgJxQKfBq4u8wQby0L48ryo/VylWwiD4LNu2LEu5L/mw/TmkIzPM7WR1DM+iSsHq/qRr8g8SwQ
	BRxTH5jW8EdrewsvxLr7oUmaFdzoABAqSqznuSM3hAu6o3mVNvwHuvM+rLMu8nQKBbrMfUKyebnF6
	SYJr1SkaCvMkNyAFd3ey/gmRVBUFyF+lWB+tNOThTnHBSd565h6hIX2ZB04aaCmzUxw7+gB660+CP
	GOBeZkuiXnotSoaPRbuy23xhRhzHh8HaFnAzRVWOyqArGAf8BVO0p4KZumeTKcUwTSza+LYG0wYeT
	aX2cmB+kNzHtYnGG+IKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nizaK-009tp6-DS; Mon, 25 Apr 2022 14:21:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nizYg-009t4z-Tt
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 14:19:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id bg25so8662594wmb.4
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ILXr0TJPBJo0r6+Bn2TlxMvdz9hhu2MSRkeWBLg3s/U=;
 b=a7zJOVdoFT/GJdg7tl5UUVlOAPsrIqhbrZwjAOwmQ4CUB3vTk6tzLUPDaiVYfgN/ZW
 qohGnepBzmVhEdNr448DkesYtQlznMwL36KNGAD/EQY30n9grXzN0t2iLQVJVVXUE5sp
 WSyC9oqtFSQ/7306YsSXPb5iJZg5HeuFtZQtUNSQV9N+vzf88FBtkiR+Y+nrbCgLJZFW
 aR7pQaK4H2Td6QTP++rtOW8CwXXVBU4cfQ3enBKgk8Cedh6VUBSzgsN+8tg0QXBkhjTX
 yhqsf1Q2RmG/LEl9lo8Q3uJM6Xy4s3YaYcBRk4qfzpqmnCk+lHlkqIaJktG+fc1EXs9G
 apSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ILXr0TJPBJo0r6+Bn2TlxMvdz9hhu2MSRkeWBLg3s/U=;
 b=5SRA9JIQkX8YAadUHWqvsBRs+qU4dvQsotsFKCVo5pM5cGcLE8WPfB1Gl3njOblGXY
 GtuYvPaySigvnGbKgolrTDvstrPu7Kh4rxJvltUT61lPrwZvtXnNtnj6ukJw+0DvMlS7
 1dr9Z97Eae0ox44s0i2amvSVTprV6i/CdKsyAnWvYXiZ2Xdx24MiFk/9C+sUc8arIE4V
 r20X8YcVtAGCU412twDta3VzQhD0TFEi59nSGqFVspQxsw3jXXqmucIDfzPAJTlhLqPS
 51Ky2kY3M2wriQhf5TLVlEAAfY7jAfUsIMYNnA0oBBy34+HsvD+QpmnTI6gVIMebeLl9
 0caQ==
X-Gm-Message-State: AOAM533IHr0hDpzYufsM96e4LiGt9YFroli9Ngiu4qnNDRCSkLMSd5mn
 C+33oIu3dUz85C+w+OsXrRtH7A==
X-Google-Smtp-Source: ABdhPJysAxok8ZUtzCpuS7vDpaS2DasQQibTMujnwrwmYIWm5LDaazhaCyHbAKTtyTITppXmXN7r9w==
X-Received: by 2002:a05:600c:4ca2:b0:393:eb2e:faaa with SMTP id
 g34-20020a05600c4ca200b00393eb2efaaamr6016743wmp.206.1650896358597; 
 Mon, 25 Apr 2022 07:19:18 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:ce86:3a65:67d7:726d])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a5d64ca000000b0020aa97b0383sm9144592wri.113.2022.04.25.07.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:19:18 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH 1/2] Input: mt6779-keypad - fix hardware code mapping
Date: Mon, 25 Apr 2022 16:19:13 +0200
Message-Id: <20220425141914.158959-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425141914.158959-1-mkorpershoek@baylibre.com>
References: <20220425141914.158959-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_071923_013233_927FD40C 
X-CRM114-Status: GOOD (  15.35  )
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

In mt6779_keypad_irq_handler(), we
1. Read a hardware code from KPD_MEM1 -> KPD_MEM5
2. Use that hardware code to compute columns/rows for the standard
   keyboard matrix.

According to the (non-public) datasheet, the
map between the hardware code and the cols/rows is:

        |(0)  |(1)  |(2)
    ----*-----*-----*-----
        |     |     |
        |(9)  |(10) |(11)
    ----*-----*-----*-----
        |     |     |
        |(18) |(19) |(20)
    ----*-----*-----*-----
        |     |     |

This brings us to another formula:
-> row = code / 9;
-> col = code % 3;

Implement this mapping in bitnr_to_col_row() to fetch the
correct input event from keypad->input_dev->keycode and report that
back to userspace.

Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
Co-developed-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 2e7c9187c10f..23360de20da5 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -36,6 +36,19 @@ static const struct regmap_config mt6779_keypad_regmap_cfg = {
 	.max_register = 36,
 };
 
+/*
+ * | hardware key code | col0 | col1 | col2|
+ * | ----------------- | -----| ---- | --- |
+ * | row0              | 0    | 1    | 2   |
+ * | row1              | 9    | 10   | 11  |
+ * | row2              | 18   | 19   | 20  |
+ */
+static void bitnr_to_col_row(int bit_nr, int *col, int *row)
+{
+	*row = bit_nr / 9;
+	*col = bit_nr % 3;
+}
+
 static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
 {
 	struct mt6779_keypad *keypad = dev_id;
@@ -61,8 +74,7 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
 		if (bit_nr % 32 >= 16)
 			continue;
 
-		row = bit_nr / 32;
-		col = bit_nr % 32;
+		bitnr_to_col_row(bit_nr, &col, &row);
 		scancode = MATRIX_SCAN_CODE(row, col, row_shift);
 		/* 1: not pressed, 0: pressed */
 		pressed = !test_bit(bit_nr, new_state);
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
