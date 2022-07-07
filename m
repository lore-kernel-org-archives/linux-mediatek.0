Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFF8C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 07:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+0V1FswFhS8JDSDQi560ezRR3egayVm0kqkR8HX1a0=; b=vdEARaysWk90RyOOoy5Fpb6TMw
	pHwRyQ+9zVaJxAB3A9xm0c1+DYjxch1kCITEPbvDTz04ZPHz8I31QTFjzY1NU0WlcyuX+3gtsm0Yp
	o1zZMCJ0e8ePy3iY/O8ziTfW4rhdGGaS0J1h8WQNWrW00r4m0hlUOqg9xdlJ1GuGlkBNimAXzpWvb
	A09Vl2/T00vAdIXVGj2lhbuTJ/6HViOJV6oAX7WeShgX0x27xNXkeNmes9V3ng2he68dwHzOVSZGT
	/u/NjeWhu9N5nN+ZCewt8izF4SEbCoyBg34s4UgOT0EH17oWqRwJK18h+ltL9r7NBE9X59jnZ3uLa
	juYnr/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9MJp-00EsUK-3k; Thu, 07 Jul 2022 07:53:01 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9MJX-00Es9U-SG
	for linux-mediatek@lists.infradead.org; Thu, 07 Jul 2022 07:52:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id d16so18773872wrv.10
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Jul 2022 00:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B+0V1FswFhS8JDSDQi560ezRR3egayVm0kqkR8HX1a0=;
        b=s7qniQ82clkr0qiDz/59anL2Yhq0MJPmg5Uo+vvMjhFZ2nNzPjMoByBSrPJZvNcNyJ
         ijbTMdy1h4wdCvGOOU18QWioh7teFl4wVHMQ+O47et+Aca3Gyi2aNjbtYa6j+PGDAbem
         We2Y6w8oMpa44OGB09r5nzcNCuMgj3poFhkqfMb8iDPwPu/s5VufDiGu3yqMgzvte3Nl
         DwxzWvI0fHEcUTDyZwfcdmZVyzjkjU0xNv1JOPsnfU6TABEotuD1zrg7jdXu0tNnz93v
         hG/hTE8orD4FTYfMjh6pA5aR1murMAGzonAcIFaoRU+l3wmjCAgOOMnNCL2xfuW5iLq2
         7x1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B+0V1FswFhS8JDSDQi560ezRR3egayVm0kqkR8HX1a0=;
        b=PaWWwFk6cF5Lx1kpoUrl4tMgVYVNrgkfg9jM8+7pLKZunpODbOgv2PawqUvzGVdcEl
         we0j0uYidjBwzT433ZB8qfNkc95GYg9w/M5fpuo85MPIPMyBKeq0AeWC7DXtZ1TflDnb
         5Rt6YeEo3TL5rveH6ZYJuTlhJy7fNrOPiqQVQwbBbkKxB7Gozm3bTOIXBAXnpttun97z
         WsOfSuHy1PgJUjaHeHHBrfwdLY4EMc9bjWi0B50DEEOeR/55j+o8f8Ti3tC8YFmm3Jb3
         pWq9CbS5hU2az8MBTe+EBFW7wEQv1Q+6zUVGuTnWk7ztnr0yOISvu3L1zv1QtaDfEMl6
         UjcA==
X-Gm-Message-State: AJIora+ZdecVIPubgzWvF0x+lqghUrZXCBRZdoZjURPtZmoCNu75tLJg
	JccJE9MUw1yCb7ky58VUAGcdiQ==
X-Google-Smtp-Source: AGRyM1vpNxZN7VNyJdlVhEnP2s+sR0sREI2vQy0cjQ06bLJ4egqraKcgsxkQF5alFIsdPU+dYGR5nA==
X-Received: by 2002:a05:6000:1ac7:b0:21d:134e:5d74 with SMTP id i7-20020a0560001ac700b0021d134e5d74mr42907947wry.78.1657180360266;
        Thu, 07 Jul 2022 00:52:40 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:334b:5931:88c6:bbd2])
        by smtp.gmail.com with ESMTPSA id m16-20020adfe950000000b0021d70a871cbsm6972089wrn.32.2022.07.07.00.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 00:52:39 -0700 (PDT)
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
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>
Subject: [RESEND PATCH v3 1/2] Input: mt6779-keypad - match hardware matrix organization
Date: Thu,  7 Jul 2022 09:52:35 +0200
Message-Id: <20220707075236.126631-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707075236.126631-1-mkorpershoek@baylibre.com>
References: <20220707075236.126631-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_005244_163293_8F72BBF9 
X-CRM114-Status: GOOD (  12.99  )
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


