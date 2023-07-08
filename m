Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBC2EB64DA
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jul 2023 18:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2nWPM4jwPafYGbRkd318KIxOMWqBhLm3R65ukPzT5Hw=; b=dfDtpkc85Tx6IryTPQljgxhpc4
	bV3XgJ1fYT3eY3HFXwNL4w2FlhC/lxAxVMZKu0VwM+9bH0N4VuyZLrSGMTdZPLHBfYKku3L56XfG0
	H4I4tw3Tv2mod/9xDuwX32p0ht9hK5p0XOyaGaEWAWRQnQC4v25fR+UO2mG/90+GQkaMZyGX7B9A8
	ucT5scHJheWUPJwGI7as/vmfDqkTLtg+H/t/4a6V82wt5g01fyMY+G53qV0MdoIgXYkOA8Ntc1uny
	1V9SVUTVnvid3bTFAZdu65K01wWVgbqW1iOcdabYdEtDH01p3k2t/4moHWNHLar02nveB2EDmD/vW
	w30knt/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qICgp-007gYG-0S;
	Sat, 08 Jul 2023 18:29:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qICgj-007gX1-2C;
	Sat, 08 Jul 2023 18:29:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbfa811667so16495105e9.1;
        Sat, 08 Jul 2023 11:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688840983; x=1691432983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2nWPM4jwPafYGbRkd318KIxOMWqBhLm3R65ukPzT5Hw=;
        b=Eo+Ve0tiHadMyHDD4YevTQOQH7jWzOxi9XRPXgvke/Z4nauF7ijUaEBi86hGQl1XeI
         v/DReW2ssHDGOaL78gYoJwUkr+JrfAyCGMEIyZ9iV2OOaGFTxcsiHR2/n2LUpIyVU70h
         oEm2qI6A+t1pfxzOJBQx0x0JBQjis34S6KFKialnq17k8ZAoX4/xCIPJfd/V6uNtcUr2
         SwqD9LqMph/nDcn1lYu7Ksw46/xs55Sz+KcUILIIh4SawmW/BxIVfxfpTpR5z2gI4bPL
         6W3Fxz8xe3RtAXl/X/rW3fmFFswhtmiYF2GRediYYo3FA98sh/GGx5oB0CGJmayEPwte
         Pvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688840983; x=1691432983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nWPM4jwPafYGbRkd318KIxOMWqBhLm3R65ukPzT5Hw=;
        b=W+K5PHGSQROtdpndOTD2F3XDNiOBIiMSkTHn8G8MtJ5Q7yf3Usjnyvvj0aIlUTe9rs
         yieb8nndeCfuVbZFj5FTDi6L6bCh23v+7NxzRav1J4gisxz3NVpzBm9sWiDL4xay4Xs5
         jlDDTXwmL6fGttlG3/xbaIC4DhUJu76Nv5xYIYO8+pGYkN/tSxLLtZdCzY/GO6aIKfKU
         l3b+hDXo1OBJlsPt3GbXuMPbJBs+RbQi3DX5Av9nPQeT9S4d777mBgGgb6aklxrXy7LQ
         wRJNZKtymhppLaViZ9KTTt6pkI1IkEMI/e4chKAtxfsXdaRvV0poIbqMURM59k4dNkmm
         4Khg==
X-Gm-Message-State: ABy/qLZRK/7pqAAQeiwLxU001j33slkkwvHCPZQW/oShxVTFfLsgy8y9
	sLKpQxYkoXL4o7zBEbS6Ncw=
X-Google-Smtp-Source: APBJJlHEs+Abh2p4LsTa9DS8Xo9WLU3gZZVMEj49tQExaGWJKA40ooL/IXqMn0LcwfERBDMYoUmscw==
X-Received: by 2002:a5d:420d:0:b0:314:3f1:cebf with SMTP id n13-20020a5d420d000000b0031403f1cebfmr11449963wrq.28.1688840982706;
        Sat, 08 Jul 2023 11:29:42 -0700 (PDT)
Received: from localhost.localdomain (93-34-93-173.ip49.fastwebnet.it. [93.34.93.173])
        by smtp.googlemail.com with ESMTPSA id h9-20020adfe989000000b0030647449730sm7492067wrm.74.2023.07.08.11.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 11:29:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] wifi: mt76: split get_of_eeprom in subfunction
Date: Sat,  8 Jul 2023 20:29:35 +0200
Message-Id: <20230708182936.24469-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230708_112945_743955_81672C27 
X-CRM114-Status: GOOD (  14.23  )
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

In preparation for NVMEM support, split get_of_eeprom() in subfunction
to tidy the code and facilitate the addition of alternative method to
get eeprom data. No behaviour change intended.

While at it also drop OF ifdef checks as OF have stubs and calling
of_get_property would result in the same error returned.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 51 ++++++++++++++-------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index dce851d42e08..c3a762074be8 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -9,31 +9,35 @@
 #include <linux/etherdevice.h>
 #include "mt76.h"
 
-int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
+static int mt76_get_of_eeprom_data(struct mt76_dev *dev, void *eep, int len)
 {
-#if defined(CONFIG_OF) && defined(CONFIG_MTD)
 	struct device_node *np = dev->dev->of_node;
-	struct mtd_info *mtd;
-	const __be32 *list;
 	const void *data;
-	const char *part;
-	phandle phandle;
 	int size;
-	size_t retlen;
-	int ret;
 
-	if (!np)
+	data = of_get_property(np, "mediatek,eeprom-data", &size);
+	if (!data)
 		return -ENOENT;
 
-	data = of_get_property(np, "mediatek,eeprom-data", &size);
-	if (data) {
-		if (size > len)
-			return -EINVAL;
+	if (size > len)
+		return -EINVAL;
 
-		memcpy(eep, data, size);
+	memcpy(eep, data, size);
 
-		return 0;
-	}
+	return 0;
+}
+
+static int mt76_get_of_epprom_from_mtd(struct mt76_dev *dev, void *eep, int offset, int len)
+{
+#ifdef CONFIG_MTD
+	struct device_node *np = dev->dev->of_node;
+	struct mtd_info *mtd;
+	const __be32 *list;
+	const char *part;
+	phandle phandle;
+	size_t retlen;
+	int size;
+	int ret;
 
 	list = of_get_property(np, "mediatek,mtd-eeprom", &size);
 	if (!list)
@@ -100,6 +104,21 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
 	return -ENOENT;
 #endif
 }
+
+int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
+{
+	struct device_node *np = dev->dev->of_node;
+	int ret;
+
+	if (!np)
+		return -ENOENT;
+
+	ret = mt76_get_of_eeprom_data(dev, eep, len);
+	if (!ret)
+		return 0;
+
+	return mt76_get_of_epprom_from_mtd(dev, eep, offset, len);
+}
 EXPORT_SYMBOL_GPL(mt76_get_of_eeprom);
 
 void
-- 
2.40.1


