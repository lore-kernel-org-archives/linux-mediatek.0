Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE77C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 08:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vSmNF2eIsX8pnDfoe7QaZTdFmgpEfw5tcmYrsguEWOQ=; b=IfhYO18pRR1SGQ
	b9le7m/Ezp23geUJ2WmT0AfKR8EJD7NoQFqK+fH6bw/cXvjuqWpmPIU5qLDtFs+IjvYJmChLs6gw7
	EY4Yg4M7fwakaydeqQBHLdYue+NEElr+23/O6HmxXujktdKlglVh4Mr1/eiB47PEfX4mGcAOFBktp
	B2OGCUBRvgaAA9eQkCLVD32MHOF3bkKpKQHr/ZCXz5ROm6ZA2Sb77ME6ygxoiZPgB1fF9xuSjs+Ty
	isUNFn0s6GPW5A3SBoMdF6nyUuJLfWHC2b/DJvdG2DUmtqkw0kNcQB+XynSHBycSGa9entWykhjL/
	n+kyTVPN5s/5aJiYDk/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrEls-000QoB-BF; Wed, 18 May 2022 08:11:04 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrEaS-000JkJ-8e
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 07:59:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id u3so1472045wrg.3
 for <linux-mediatek@lists.infradead.org>; Wed, 18 May 2022 00:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dds68n4eVAqNb9Nh1GkmgUmrWiZNicCAFfz37bcPi/E=;
 b=q0S94H1GhZQls0QplGXXaQ20xyUhPJfSw9jx5Z1yMH4JNQDn2qssApG6YIhSC1Ahcl
 H//p6eK6yYHKF1mQCiWr5xMditxAExDaHTPHhjYdKpAP6mj+fBp5/4sczfa2Cw9/A5Se
 O3z+eoS/q5Y1ymj92c+ivFjdF4mUYtghiB3iVIGWIAV/Mlw7DCc6JVlJek/HwFN+fvMk
 8owS92GwrYaNr+e/mJFp+fywqy2sZDTd6P66ONYa5JRYMkgRk0shA6mWCBnD+//UnpIx
 P5I2FZkLKWZdCnkzEedKx1IqaiO9os3cDWOE1+7Hxq0n/LFz4ogFuZNx5v0Oj4UJVD0J
 1LWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dds68n4eVAqNb9Nh1GkmgUmrWiZNicCAFfz37bcPi/E=;
 b=XADI3n98UACM+14TWYA2BPb5ZOUj8xwa8AKwqg3m4QA7cuFM470NYCpNVbcONU0N/w
 j+JIGFWk6j7P32Z1RlFjV+FHlnGHxNBSZ319xQLpH0VdMVa1UBfN0SxLDhzlFk/V8AVd
 t4TFkgsxQC8jvROSBKrszdwdFfnsZpvQ2ud2fktZNTaxlN0YQdJ7OGZDmXfTKisUjtEt
 ndFA7zv5nlh55un4U7v7xe1/ub0cTMd5XHIa2DYDK9qVBEfYbCCV22zDxzCqWxxb02HX
 YKNaUwnNUXqTRJeWWUzALv7dJUeijM+RSgNFP1quudkNZODMJJ+6Te4KOSwxQ8Gjv76Z
 N1Hw==
X-Gm-Message-State: AOAM5336EgozmzUhHh7aAziVwvwS5STjBJSx4hDf+70WCFfR8kz1VsY8
 WTLjCdwlhnLJudFzYkQf0sFngA==
X-Google-Smtp-Source: ABdhPJwXGZwgKt2xBN/YHUpTFYOWitejVIgIv8v5y8RaS6IUg2o89e7OYU3thoshzpsYoCAbw7r/OQ==
X-Received: by 2002:a05:6000:15c1:b0:20c:5825:f043 with SMTP id
 y1-20020a05600015c100b0020c5825f043mr21710401wry.261.1652860753963; 
 Wed, 18 May 2022 00:59:13 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:bda6:8356:4db1:4539])
 by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b0039706782e06sm1041300wmb.33.2022.05.18.00.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 00:59:13 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v2 1/2] Input: mt6779-keypad - fix hardware code mapping
Date: Wed, 18 May 2022 09:59:08 +0200
Message-Id: <20220518075909.180629-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220518075909.180629-1-mkorpershoek@baylibre.com>
References: <20220518075909.180629-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_005916_401833_A9F4C240 
X-CRM114-Status: GOOD (  15.59  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
