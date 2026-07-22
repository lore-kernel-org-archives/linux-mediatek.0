Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61E2C44512
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 07:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8bdrG0QFqxIH5pXZGRRRAY6FI2BH/CW3w4wZSetZqPY=; b=kNo2APcO2YCvtpfmii5oi4h3zs
	9IYofaTPXKBFu01/pE0GHf9+Aj3TJ24+PdhK5tZDU3AgoVqm4AgcqmIDFBXGklI6e4IYPG+QFejOC
	4NFng2DwdT0a4YvvIKvOupTZ925LAb195Ec3dC1gwIBL85LyIrIZqTE2xYNL8iepG4MYkgZQt79l6
	G+q10M+R+0z8KWGtGvdMe5xsey44UEOWQsDHg3Zjxk1bt1U6+Rt/g21Ujev15bq4en0NWhP24hmAy
	pQ9YZWQzy/fFNHForrhV3S2XGOFAcgAXENXCgx1ROrwHPoOZjT4dTluPalUAy/XwgiiIQPTsm+/U4
	gPpG0djw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmR04-0000000B1Vl-1JOO;
	Wed, 22 Jul 2026 07:04:16 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmR01-0000000B1Uc-26LK
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 07:04:14 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-383cb94f742so11370237a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2026 00:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784703852; x=1785308652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bdrG0QFqxIH5pXZGRRRAY6FI2BH/CW3w4wZSetZqPY=;
        b=CstAp+3gqi8Bo4n/XHTOczUreVYtE9xEvaGUhw/oK033C9p97Ty2r5qPLYsmvyFerH
         5muaQ7l7BcsWjt6PNtyjXBGzzWhtfy35DUe8z0b4+DM0GY/jgDUn0PSp+z7d0a/RqzJk
         8uanW0EVHUR2CLoRAsloiAzU5J6mzWmw6P8XPtK3nOuhd1iUgJKsQBj61u2TtkHMqglR
         1dT/ieziWYEI6Nwr/kFVGUgHjLEPHK/uS5iGHsrT3YVXiGes+AITLPJ/NHEQwZIsQ2w2
         t8luuuMYNMmJuwX2FbeI2XJA8pMFw5sM9EcRDQOWTuhGYFln+Je+O7TzHmVLOarTdwBN
         S9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784703852; x=1785308652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bdrG0QFqxIH5pXZGRRRAY6FI2BH/CW3w4wZSetZqPY=;
        b=N3yF8wIF229cbG/nGNkEcc0wKDPCo02wgmeSAWWJupd18T1OpJjDhqCKCE1jKubbGc
         q4WNgiSGW9KmvcFHR4j400V03EFCDb0WdPveFc2oIX9lYkz85qbtEGJCFSGDrRk1Ag7N
         6lb3bhHbQCCPYFPimAxkd/t/82wkox0jTdvKldnLLZgLdhTAmfZgH4Bvoj/WyGQ+zgQp
         gzU9QSrbIRcD6rRLYMvyY/EIgaey7t7Pz2Cg91PvxZBvwKlDoN6XlFDWz04o6Y2rNWZL
         bIqMweZn4bUnUsYIteeZLrOvaQwoTO4LvP5uLhn9SItr7Gwom2NS0sZNq7aO83lbf2O6
         Ve8g==
X-Forwarded-Encrypted: i=1; AHgh+Rq/gj+fAh9etVbg++1GuLUgfFZfyjUrFFxkJtmQXP4KM+5IGKTQWgJ1Gp33a+oY1QWI7yIS3Ec4v8/EG21KNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFjrz+KjEXhI1EPv2zACzI2maV6aoZ7H+tE5e7B+wZ5C3FqxhC
	MHe/9d61yvlcz0+snNl0uS11UlVnHNijKganPX3YIBIQ5TzeHon3vSB6
X-Gm-Gg: AR+sD1155O6vYK2WVapNsq7jMSZPOnB0MD12GOMc0AmECZzmgPh6N3m/1miTA9MOLDC
	EosKnyGkJhauqgEA5DUd0Up6YleOhB6s4J07HXoM96ybGHdbePzU3nsIlCXAbqcKmwFlC/FgRjs
	MOK03yc6hH7gu1JY1qitTuhGIxleH/xabiWh1Si1TN897b7fBaJ68UgjpXRHi6a1MsC6xmjoFGj
	FWT85DYvfSonsonkvyDMKISHBE1catVVF/6nENDNLE9x7N5bT8vcYRXix1lmOZ7nAJu8tLfItKy
	4cTrrE8C/dm3rWbZp67MQBS4apo2jTQmMs7KBa8cwEclpbJwjaQbffaB3t4EsPdXjHQHW4szK1z
	Z8Ul5Gj+vh6lrPiy9UwnBmNn1E4OtQw/LVdPJQ2K+eC1pHp6RYWQkTlGMzpXQCJfMoCuHC7oY3E
	miO+KnocTR9uKusVY4WDq3U9z1nFhs0Thr+tcbP4Vd47NdXSHIqWTemgyJcUI1iU/So2OZXHbJn
	tf8XgHhClCdxIsOzQblGeg=
X-Received: by 2002:a17:90b:2e90:b0:368:ed26:15b2 with SMTP id 98e67ed59e1d1-38e4b43c408mr21798100a91.8.1784703851941;
        Wed, 22 Jul 2026 00:04:11 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm3203259c88.10.2026.07.22.00.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jul 2026 00:04:11 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
Subject: [PATCH] wifi: mt76: mt7925: validate CLC firmware records
Date: Wed, 22 Jul 2026 12:49:02 +0545
Message-ID: <20260722070402.45328-1-acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_000413_533042_4FF9F029 
X-CRM114-Status: GOOD (  14.94  )
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

The CLC region is supplied by firmware, but the loader trusts the region
count and each record length. A malformed image can make the region table
pointer precede the firmware buffer, make the record loop fail to advance,
or index phy->clc past its end. Validate the table and record bounds
before dereferencing or copying.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 32 ++++++++++++++-----
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index e94fa544ff20..76e30bf4ce0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -803,8 +803,9 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	struct mt76_dev *mdev = &dev->mt76;
 	struct mt792x_phy *phy = &dev->phy;
 	const struct firmware *fw;
+	size_t clc_len, fw_data_len, len, offset = 0;
 	u8 *clc_base = NULL, hw_encap = 0;
-	int ret, i, len, offset = 0;
+	int ret, i;
 
 	dev->phy.clc_chan_conf = 0xff;
 	dev->regd_user = false;
@@ -829,13 +830,21 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	}
 
 	hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
+	if (hdr->n_region > (fw->size - sizeof(*hdr)) / sizeof(*region)) {
+		dev_err(mdev->dev, "Invalid firmware region table\n");
+		ret = -EINVAL;
+		goto out;
+	}
+	fw_data_len = fw->size - sizeof(*hdr) -
+		      hdr->n_region * sizeof(*region);
+
 	for (i = 0; i < hdr->n_region; i++) {
 		region = (const void *)((const u8 *)hdr -
 					(hdr->n_region - i) * sizeof(*region));
 		len = le32_to_cpu(region->len);
 
 		/* check if we have valid buffer size */
-		if (offset + len > fw->size) {
+		if (len > fw_data_len - offset) {
 			dev_err(mdev->dev, "Invalid firmware region\n");
 			ret = -EINVAL;
 			goto out;
@@ -852,11 +861,19 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	if (!clc_base)
 		goto out;
 
-	for (offset = 0; offset < len; offset += le32_to_cpu(clc->len)) {
-		clc = (const struct mt7925_clc *)(clc_base + offset);
+	for (offset = 0; offset < len; offset += clc_len) {
+		if (len - offset < sizeof(*clc)) {
+			ret = -EINVAL;
+			goto out;
+		}
 
-		if (clc->idx >= ARRAY_SIZE(phy->clc))
-			break;
+		clc = (const struct mt7925_clc *)(clc_base + offset);
+		clc_len = le32_to_cpu(clc->len);
+		if (clc_len < sizeof(*clc) || clc_len > len - offset ||
+		    clc->idx >= ARRAY_SIZE(phy->clc)) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		/* do not init buf again if chip reset triggered */
 		if (phy->clc[clc->idx])
@@ -869,8 +886,7 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 			continue;
 
 		phy->clc[clc->idx] = devm_kmemdup(mdev->dev, clc,
-						  le32_to_cpu(clc->len),
-						  GFP_KERNEL);
+						  clc_len, GFP_KERNEL);
 
 		if (!phy->clc[clc->idx]) {
 			ret = -ENOMEM;
-- 
2.51.2


