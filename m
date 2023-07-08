Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA082EB64DC
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jul 2023 18:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRlinllzuoLno5ix8NJN30aYnS4fPlc7sOxq/5PjHIk=; b=yCk/W+nakOyH38pjOPjCxDeGfa
	+UnP4I20QLiZEU94m7OjOEgIcAljF0mYJH+9Fs/9HaVZHB758AUSQGp4cF4M5DeIuYQuXp/6Ejkdo
	jYv8uIP3nacJnATZQH8SQgb7kV/XZwCq9MPK+nmJA+xFpnnxqJpfoJ31gtyxwc4468MJYEF5wLVdN
	m4lnr4n8+4UXmPldtwcn98swIbSINDU/yMovwmqQYqDMNGMQ6N6V3uEq7JzTxkzTIjlW76pF2jIh3
	GPS+Q477fPL6kpD4mWgPpeOdd7CSKP/UFmHe5qrd8ozZXbC6st2dknTsIfmaUMbchxeAISrAC4EzM
	EgOAzXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qICgo-007gXv-2N;
	Sat, 08 Jul 2023 18:29:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qICgj-007gX4-2F;
	Sat, 08 Jul 2023 18:29:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbf1b82de7so24520105e9.1;
        Sat, 08 Jul 2023 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688840984; x=1691432984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRlinllzuoLno5ix8NJN30aYnS4fPlc7sOxq/5PjHIk=;
        b=qu+RlsIaWJd8WTxko1JbxVTi2ZRF7I15gRBdEyTNLfm4+1YU0LEOFxXJKCmCZx4YPc
         Ki0bBjXQwBl8NaKHddnzIJI2Mij6+V+yE6uvl6l1XmSAVrYvC5sG2VjQhUsxakdvkBK1
         39b+6bIJw2iuskMXwiLzm3PLKfI3LYPiUsDt6HAPSpYnSJFCkclV3zcMU3s9mg/IG6GL
         +VOY8OuxYuucrplErZc5fXwHGZfhcmqkV2B0eq3xGJdAzmYeMET5T7QEAWtN9BX7oCFu
         M7ddlT44sT/CngI3SzNKFmrKkYG4nwEP1EQmoszDP3zkW5xtBfsGc0PlKdfD39LKBaFF
         Twdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688840984; x=1691432984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRlinllzuoLno5ix8NJN30aYnS4fPlc7sOxq/5PjHIk=;
        b=lkpX4vglDJ+SXfxPUSusgD3xotTipzG2NSfGlWiALerYdDLBrMTmoUavOpnJPaGQi1
         Mb78ZZzXl0/ySPVAIM/O9uegOTkor/Q0scNchkdYBpJriLzokfCJ178RgKSit3fR7W/G
         TWCXHFHvjzdVKyIUX2bISrasTXXfcw++H3OLCBNsVPdzUvAD4E9eFuxM1CJMULzfiDY5
         ugodJdk7NHpO3Dt+tJod0WvXAoFmHc9nfm/fTmYpXh5g5o/Pquta2VmRIjRu0GXVr+/F
         YFMrsC8c+iho5y5+8WpTt26SYgkVymMJkxBSF8ZBzXkzq6FVJgsBjZdK8Yv/9PWHTSDO
         L1kg==
X-Gm-Message-State: ABy/qLZH2S6dekFbuLqeAqRPhWT6t8dYBG/00N14v30W2oRt2bYOzRbK
	F2kJrnA2cuVghdHlU42/9v4=
X-Google-Smtp-Source: APBJJlHQCf5NSpNxS5BwssHQcf8A1hFtRUGQ9JeBaBFBFtD02S1IhjHLWTq+vacSUBIVP3j3aXcnkw==
X-Received: by 2002:a05:600c:2207:b0:3f7:e660:cdc5 with SMTP id z7-20020a05600c220700b003f7e660cdc5mr7583435wml.9.1688840983788;
        Sat, 08 Jul 2023 11:29:43 -0700 (PDT)
Received: from localhost.localdomain (93-34-93-173.ip49.fastwebnet.it. [93.34.93.173])
        by smtp.googlemail.com with ESMTPSA id h9-20020adfe989000000b0030647449730sm7492067wrm.74.2023.07.08.11.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 11:29:43 -0700 (PDT)
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
Subject: [PATCH 2/2] wifi: mt76: add support for providing eeprom in nvmem cells
Date: Sat,  8 Jul 2023 20:29:36 +0200
Message-Id: <20230708182936.24469-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230708182936.24469-1-ansuelsmth@gmail.com>
References: <20230708182936.24469-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230708_112945_743779_79FD1D47 
X-CRM114-Status: GOOD (  16.26  )
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

Add support for providing eeprom in nvmem cells by adding nvmem cell as
an alternative source for mt76_get_of_eeprom().

Nvmem cells will follow standard nvmem cell definition and needs to be
called 'eeprom' to be correctly identified.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 38 ++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index c3a762074be8..36564930aef1 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -6,6 +6,7 @@
 #include <linux/of_net.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/etherdevice.h>
 #include "mt76.h"
 
@@ -105,6 +106,37 @@ static int mt76_get_of_epprom_from_mtd(struct mt76_dev *dev, void *eep, int offs
 #endif
 }
 
+static int mt76_get_of_epprom_from_nvmem(struct mt76_dev *dev, void *eep, int len)
+{
+	struct device_node *np = dev->dev->of_node;
+	struct nvmem_cell *cell;
+	const void *data;
+	size_t retlen;
+	int ret = 0;
+
+	cell = of_nvmem_cell_get(np, "eeprom");
+	if (IS_ERR(cell))
+		return PTR_ERR(cell);
+
+	data = nvmem_cell_read(cell, &retlen);
+	nvmem_cell_put(cell);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	if (retlen < len) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	memcpy(eep, data, len);
+
+exit:
+	kfree(data);
+
+	return ret;
+}
+
 int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
 {
 	struct device_node *np = dev->dev->of_node;
@@ -117,7 +149,11 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
 	if (!ret)
 		return 0;
 
-	return mt76_get_of_epprom_from_mtd(dev, eep, offset, len);
+	ret = mt76_get_of_epprom_from_mtd(dev, eep, offset, len);
+	if (!ret)
+		return 0;
+
+	return mt76_get_of_epprom_from_nvmem(dev, eep, len);
 }
 EXPORT_SYMBOL_GPL(mt76_get_of_eeprom);
 
-- 
2.40.1


