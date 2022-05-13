Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B163C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 15:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fs1Wkx7t3Ids6prfzZPoikCMsOgR6ciYDiLykc9zDdo=; b=D6RBVy1+fwaRlR
	yhw7uJvUOm/aL2lK2Qo2uxA51I9WxvaUaxD2DwUnSDa8jeMUyuWbytNMxpPezkD0LxemcePt7shn2
	rA23/8m4hGlOB2eLerLCOlcfQQhUiAGoAlwuYtCaEytQe/T/0MZsGbg/b8VESDwMRW/aJR/pV/BFM
	N+dItqzNnMERBMewGKxjS9vFxmVxKFjA/Msejiae9UbQWlynQZ5Yzp4nIssy6IP8tGk/UTNgE+xIF
	u1v09xxolApeOO8FoiVd1pAay3YEbuGUt3p+Y/SUwTLp9ItA1V2rlvM51mxPBPSb9nQF00rgimo98
	X90Cf10mqzXLQeAqx7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npX4Y-00Gd7f-Bt; Fri, 13 May 2022 15:19:18 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npX4C-00Gcse-8G
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 15:18:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id j25so10865315wrc.9
 for <linux-mediatek@lists.infradead.org>; Fri, 13 May 2022 08:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ILXr0TJPBJo0r6+Bn2TlxMvdz9hhu2MSRkeWBLg3s/U=;
 b=HLD6Co9A73LAXEkw7+pf5QazPc69Bm06mHH6jsxZoX0JxGEgEYzaYyu56Alvyu+0Qt
 7PFQjfMia2V+1HGOLGC56uB3KItocMtPicnNQds8cHaoIxgRl8RxEQM18q7Dnm0PPopw
 pu9sSSMCdD9d08zK0JXdLDAngru3KaGKK7TXryjBh9EVoGJBv+yPX7GKis6MqNc3Nc9f
 OUSKwsKg9hGxD/hkmkLK6kxmWAQyN1ujJxUVeCeweirF1euA33h4Uhhif6rWjxM0qE7n
 1WsnoTM/6xOg67hixrGo+3a7CUqfYPhjHy0GitnM6mu6WGR0Pk6nGNWm+JPibcdI9oJF
 nJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ILXr0TJPBJo0r6+Bn2TlxMvdz9hhu2MSRkeWBLg3s/U=;
 b=n+o42Y1VDMi3jMb+1G7UczDCPWafKV45NSaKbTzfRCGZgTgnZF4vqkB7QkfI2rv4ze
 0WMsKWzDqVRzRRAxCcWjdUrlJnmerrNQC0sgbxanJpy3KVate+Y2Rg+m+DtVrqbMuti4
 CtEoSNkE8zd+SOSE7XKKtvliLKKrUYtOp5nrgC4N5J8q6u68G3v7Je/bEtIOwLw1pUrF
 rFf9UDL5JvhyRsK0Oa6RoTmm4BdJSpOyU6y03lQUJCckVfv8hK9tyDX/As3PhI9Ubtl2
 9pBvAzXAdcAs2Y9+ldr66p7n/1LDgqKDQ/31+HJSwQ1PGmUeWUo4uy+klEx3DUTRG84s
 birA==
X-Gm-Message-State: AOAM533LOtI/T+FtuJeE9J7eBN0qvzjau3mcMAlhr2HC2Tbt5c06sqEl
 F2QG3nm06cDQdkkzbGl/u5vYjg==
X-Google-Smtp-Source: ABdhPJzKFEfxpnN+vZ4gkOcoP10PztsJZ+L6QlSReHHtgDvmMOwpglZXa0bZZncL5YwfpXGV9OgxEg==
X-Received: by 2002:adf:e2cb:0:b0:20c:c1bb:9fcb with SMTP id
 d11-20020adfe2cb000000b0020cc1bb9fcbmr4435589wrj.35.1652455131503; 
 Fri, 13 May 2022 08:18:51 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:9353:61cb:4e25:b9cd])
 by smtp.gmail.com with ESMTPSA id
 b9-20020adfc749000000b0020c6a524fd5sm2800825wrh.99.2022.05.13.08.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:18:51 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [RESEND PATCH 1/2] Input: mt6779-keypad - fix hardware code mapping
Date: Fri, 13 May 2022 17:18:44 +0200
Message-Id: <20220513151845.2802795-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
References: <20220513151845.2802795-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_081856_345059_732A1A21 
X-CRM114-Status: GOOD (  15.18  )
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
