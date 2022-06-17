Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76377C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 08:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+0V1FswFhS8JDSDQi560ezRR3egayVm0kqkR8HX1a0=; b=TI+4vQv7hpPHnRkbKwxxsGeOQP
	ESpiHV7llzQaT25WF07cN7/GivZshmzf82viMTRFMGjMeAOQgY8PqsslvRe8vgxBZxepq/l19PLjR
	vZmKjJxJpMtJfZPzPgj6DS429dLJx8HR4grRYmOOcVp5RClJ9zM0eo1EV4dtHzJSn9O0yzSj0k2QV
	7AGswTV7ufbj57dQ2n0bJHu6w4PqoWRcJEpY7qp1zv1/QJgt3niS8fOKNwmirpq847PmWvErgADhq
	wSmEfFxTKdyVQI5KVZXvfIgrS9vNr6vKlJEQ9gdYUKWbO3Nv3eR8agBnNovh98xUwRTxqeUMxd2mI
	k79nYVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27CO-006FtS-2C; Fri, 17 Jun 2022 08:19:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27CB-006Fob-4w
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 08:19:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id e25so900382wrc.13
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 01:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B+0V1FswFhS8JDSDQi560ezRR3egayVm0kqkR8HX1a0=;
        b=CWIw+SKozEYKSjXKiyhkbgZmMOtdHn0KwhrfNy6oyETgyT90moWsaDQWt1xbeWfagr
         GO8BJm/gbXxQnzzNT52jBfNTohTqjzZaJCVaTWUQlOiUX84/vkOFMTMrIuWaau2efh4x
         lTszgI8YDW50cv6K8Yhb9KSr3CnpmQp7uhrCSY/Zwsp7ehnxStnqE1mQD1gw0OvzszGB
         oopBaloytTGS1PaHtnIIaGf/xEmsq9ulEgL2qc5yxcfq0iDVGFFxli9x7TgzN4trFtQK
         AW9haYEXPQTPnBt1PHpi53rud0Tz5cgiROx3gOQqc1G+7FEoGNxis6gOwDN/3uYVSE8e
         8efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B+0V1FswFhS8JDSDQi560ezRR3egayVm0kqkR8HX1a0=;
        b=RKfP8ymbPQEfem/GfYwd6v89tvWbbow1q4rMDXCkJ9JLZQ9m7JeybcEf9W7Ao1F+mu
         3W2EG2pzm7ZJzKBM+3foSRtXjO2y7Npn8H+Vp8rTbv3NQNjL/NF36tZ9YRCfAmMZtXh2
         5mnWPWlphUNuaN+8BHpW1qqivwkq02GgVM2BlgFgixZeiQ5uO2sziECECQWBzb2QKuNC
         lLtTxFHL8ILcDhJ+i6HCOQ5JtI51Tf1/UfmIRUwWM9wxK77Pgw3jBRBg9LEtV+F56h+c
         PAHdwEXjTDsAPZCwKp1raK1BigW/suuVfyAHghZMzL873vj03CU/R3MJMIhSBGcPEesn
         M3bQ==
X-Gm-Message-State: AJIora+f8ORsewvGK1ixvbHgdoJW9Xnu/oblIiL5er9yZnmV2+lwhMKk
	+mZMPMrFUaKdlugdOJhhPQ2mqg==
X-Google-Smtp-Source: AGRyM1ta2q9ocH3+ZlEIO4Zm/dANjzoJkhcNDdzPCDqronR3KId0B5dJhF5i4ZTu2Sx/xXjavxJDVA==
X-Received: by 2002:a5d:570c:0:b0:210:32e1:7250 with SMTP id a12-20020a5d570c000000b0021032e17250mr8269541wrv.368.1655453948779;
        Fri, 17 Jun 2022 01:19:08 -0700 (PDT)
Received: from groot.. ([2a01:cb19:85e6:1900:b8a0:45dd:a367:2e65])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600c4f0900b0039db500714fsm4970245wmq.6.2022.06.17.01.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 01:19:07 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-input@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v3 1/2] Input: mt6779-keypad - match hardware matrix organization
Date: Fri, 17 Jun 2022 10:19:01 +0200
Message-Id: <20220617081902.2931099-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220617081902.2931099-1-mkorpershoek@baylibre.com>
References: <20220617081902.2931099-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_011911_224168_26383EC7 
X-CRM114-Status: GOOD (  12.63  )
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

The MediaTek keypad has a set of bits representing keys,
from KEY0 to KEY77, arranged in 5 chunks of 15 bits split into 5 32-bit
registers.

In our implementation, we simply decided to use register number as row
and offset in the register as column when encoding our "matrix".

Because of this, we can have a 5x32 matrix which does not match the
hardware at all, which is confusing.

Change the row/column calculation to match the hardware.

Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
Co-developed-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 2e7c9187c10f..bd86cb95bde3 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -42,7 +42,7 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
 	const unsigned short *keycode = keypad->input_dev->keycode;
 	DECLARE_BITMAP(new_state, MTK_KPD_NUM_BITS);
 	DECLARE_BITMAP(change, MTK_KPD_NUM_BITS);
-	unsigned int bit_nr;
+	unsigned int bit_nr, key;
 	unsigned int row, col;
 	unsigned int scancode;
 	unsigned int row_shift = get_count_order(keypad->n_cols);
@@ -61,8 +61,10 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
 		if (bit_nr % 32 >= 16)
 			continue;
 
-		row = bit_nr / 32;
-		col = bit_nr % 32;
+		key = bit_nr / 32 * 16 + bit_nr % 32;
+		row = key / 9;
+		col = key % 9;
+
 		scancode = MATRIX_SCAN_CODE(row, col, row_shift);
 		/* 1: not pressed, 0: pressed */
 		pressed = !test_bit(bit_nr, new_state);
-- 
2.34.1


