Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B117C30653
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jul 2024 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GJ4/E9J4xI4cimYcWsERwrFehVb+qxmPhq/NewCkOwc=; b=ucFXNHTvg3DRGE6b3RVRU8oXQB
	vZP/ZUIluFlGmAdYHn0oH9ZETE4jwxp8njFg/ODlHO3eJq8U/ScBmvzvgClygGc14aCvfZVzvIfhC
	651cQhiKIvwitLmsou6sF+Snsg/Z1yeD8mV78g6GS1LqXDlee5vmca/0hEi7RnOaTN87hLQy1Yk35
	IDaH8tZFTtr3P5pm/2nSpmC46f21LU0SbeAJaAlYw3ONyWdZHUTXSDHNOqqZTRg2JDVkkg6OmfQfD
	4gcyWG5cbsAOEYPlbOxhTDhyEGznjsmz5nwePC+Qw1DqYUGMVKQz5bTV142ahOXF0MVPPc8KOclAe
	zD29Bk0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQQNc-00000001i2x-2XLj;
	Sun, 07 Jul 2024 11:48:32 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQQNa-00000001i1h-0Vhq
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Jul 2024 11:48:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4255fa23f7bso20116725e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Jul 2024 04:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720352908; x=1720957708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ4/E9J4xI4cimYcWsERwrFehVb+qxmPhq/NewCkOwc=;
        b=mM/Hjl8lnlixKog4gvg1bKf5xb3kSzwPGveHQqTk78/nDs99G3RsV7zoAb9ugEDH0i
         dufJqvKXVlCIwp97gXlg/xjbq6bxFbGG8/HJyeQlK8XjFcg+yPXacELs2xgJ6J12PO1B
         wYYrKbQUaDIHx6K6k9HisM2pfJ4jYTKad8NCVmNGPvt4RqLD0LvRMHiBESx6yOaVASFo
         AYqcv8BkT3wNv0i6dUQnDZmkQIgMCE3fXooSgb/k86xzgLJ6++7TUTIHfJ5lErOL0DL/
         m3YclMm/BGcTYMLb7nnBDycQmK3AhP2X3tbVw7RsY9sPkrZZ2z4I2QvHOQRSoGeFiDwn
         ltKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720352908; x=1720957708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJ4/E9J4xI4cimYcWsERwrFehVb+qxmPhq/NewCkOwc=;
        b=UJsXDpcT02hvH0TkinQFQdaM7gmWSGzencd3qwepPR3TQiT+WKA0DwiL4RIQrd7sEV
         MVZ6s/eoNUw5L6Lqo5kYulOvwhasK1EkhhlJay+D5TTYrI/HY92ge5xmyKGy7GQKTHN6
         aDYI9uyIeEq/SoTaIZVhWw2TOhBQcCF84KIPbNmBix5rbSlwvVkI4XG796m0S/BUUGfR
         t329pzRtGV8zUt001qp+tJItoVv7OUJpJk5ONE9J4zyMcKjZS0yd6HRwYHyJDupe+cA7
         za+BK4HqzAjNEGFEPekmxtLO7g4T/QgbiZ6XpPyBSfpb0zx1uqBNlIJAfk1gj0jOcC3E
         XxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqj29QfkKD9TEea6M342Pb1gD/VlyHkiGb5GmJwb2Zl38iGgOF7UZLNS2RiXW5RP/KwdygAp6fSWpdIit4/vA8cIBgaUO39kVZOayl/k3UKm+9
X-Gm-Message-State: AOJu0YyWw7MSVRy6BUnTvlZZ9nrOzbQqq6NmrkE3s7+6N773JHU6CVC6
	3a2jsQtzDu9gPV4w3iUKGNh7TsmDacZf4Jw1Hz/aIXrgQfZUkyYZEcdxobi0ZUQ=
X-Google-Smtp-Source: AGHT+IEI6lDV64Hl12cyK3t6agUGUkDoFIW2n3pq5pOaxd9XBSBXy4giAuXzNO3Rsklt90kI7V0pLw==
X-Received: by 2002:a05:600c:1d90:b0:426:6960:34ac with SMTP id 5b1f17b1804b1-4266960362emr1276995e9.36.1720352907837;
        Sun, 07 Jul 2024 04:48:27 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367b09401d3sm4926279f8f.28.2024.07.07.04.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 04:48:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] mfd: mt6360: Simplify with cleanup.h
Date: Sun,  7 Jul 2024 13:48:22 +0200
Message-ID: <20240707114823.9175-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_044830_190278_CF1958E8 
X-CRM114-Status: GOOD (  13.00  )
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

Allocate the memory with scoped/cleanup.h to reduce error handling and
make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/mt6360-core.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 2685efa5c9e2..b9b1036c8ff4 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -5,6 +5,7 @@
  * Author: Gene Chen <gene_chen@richtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/crc8.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
@@ -404,7 +405,6 @@ static int mt6360_regmap_read(void *context, const void *reg, size_t reg_size,
 	u8 reg_addr = *(u8 *)(reg + 1);
 	struct i2c_client *i2c;
 	bool crc_needed = false;
-	u8 *buf;
 	int buf_len = MT6360_ALLOC_READ_SIZE(val_size);
 	int read_size = val_size;
 	u8 crc;
@@ -423,7 +423,7 @@ static int mt6360_regmap_read(void *context, const void *reg, size_t reg_size,
 		read_size += MT6360_CRC_CRC8_SIZE;
 	}
 
-	buf = kzalloc(buf_len, GFP_KERNEL);
+	u8 *buf __free(kfree) = kzalloc(buf_len, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -433,24 +433,19 @@ static int mt6360_regmap_read(void *context, const void *reg, size_t reg_size,
 	ret = i2c_smbus_read_i2c_block_data(i2c, reg_addr, read_size,
 					    buf + MT6360_CRC_PREDATA_OFFSET);
 	if (ret < 0)
-		goto out;
-	else if (ret != read_size) {
-		ret = -EIO;
-		goto out;
-	}
+		return ret;
+	else if (ret != read_size)
+		return -EIO;
 
 	if (crc_needed) {
 		crc = crc8(ddata->crc8_tbl, buf, val_size + MT6360_CRC_PREDATA_OFFSET, 0);
-		if (crc != buf[val_size + MT6360_CRC_PREDATA_OFFSET]) {
-			ret = -EIO;
-			goto out;
-		}
+		if (crc != buf[val_size + MT6360_CRC_PREDATA_OFFSET])
+			return -EIO;
 	}
 
 	memcpy(val, buf + MT6360_CRC_PREDATA_OFFSET, val_size);
-out:
-	kfree(buf);
-	return (ret < 0) ? ret : 0;
+
+	return 0;
 }
 
 static int mt6360_regmap_write(void *context, const void *val, size_t val_size)
-- 
2.43.0


