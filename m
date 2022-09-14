Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB92DECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 08:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i4WqWGFN996ypu86FTXwvXB/hikI0wOqqPyZaEJtfSY=; b=4SmY5f9GzGMgTvOFD1z18+gMTK
	5aY+NSlsqB7Ctx+TnUdCaZeL8jYL7yApdR14X01crNhTM2z8srM13uzxsBz8DsKwOxvR4yY25cKyj
	Xjz8yIOLe9gHaasn7r1tg3KfiC9saNBgo+K16YpOPjeScy4FFCtUWkuv5cVFrydxDVC3XzA2Iyrfq
	gMVnucIzhMOMdfdzDTTSI4VgZKuIZWvXccnmzC9tAKhrWLzbzFMGNkY3HLtF3hERY/fthfman6J2B
	A6o3itmFMLlXH9W8JJEhOGrTpdiFmzOnyTAo32IlkPXytHauRlDk6eJijYp3ol/l1WpS/QpmTw+II
	SJTGXiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNj6-00DZGz-Oh; Wed, 14 Sep 2022 08:26:32 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNiw-00DZDd-0u; Wed, 14 Sep 2022 08:26:23 +0000
Received: by mail-pl1-x635.google.com with SMTP id v1so14388803plo.9;
        Wed, 14 Sep 2022 01:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=i4WqWGFN996ypu86FTXwvXB/hikI0wOqqPyZaEJtfSY=;
        b=Pk9I7QN+hJasEV+ylLAnn7dJqAYMe00n+0NJAPi7Arcl49+qWU46huTRyJ/6g1miDI
         UHLfAT7GiwUwnBVezIgkd+Und4q9abZujU5mCdq0k/Frqkbm9jBJIAZUsIX6EaJpqapv
         AMgy7bF3S+AiAC8n3cG5najvxtQRY1YDrpYs+IaTqk3DRpikS9g6LgIDqiR7bPGQJZDU
         0rqRThk1bGGSL0sqTqtXi9dSIDuya/lwoGjO9ryAb/h7OfVn6VmuUcr2Lyj35y4nlfea
         HcHWGWF67tVLL09vn4vCcWjWfnjqKyxUsl5p+uneutQTOHX5mQJW3XqiuWTV2o+HAXx6
         dNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=i4WqWGFN996ypu86FTXwvXB/hikI0wOqqPyZaEJtfSY=;
        b=lzfmbM/bpQR/uQl40wL74kDexMEPQeHwLAdjI6Ltakj57ODSquvkhsl4OEjycac6Js
         m6G5uW/ZODahzrs+6FrAQ3J60T6bsN0SIWGd+mIV3bCqqCv9uRtqVDsV36uV2YAdIwdS
         TAvfMSQ9CUckLtTzCR7TWKtJTg5nSp8YTcIWfIVSgbGQscUYzE6s1/UgqoT69ikvUI/T
         XI50JMgjqGcMACA3Z/5VIchHpomSfWBkQObmzcQy9ALFdYaIGo3TlrL9RdPNHAp1xQ2r
         HFSn6MbvLJe6RGK0N0pwcutLCFkBKpek1k8KBueNe11O9aCy8jiqQ4oJLeuM4dhtbDFe
         tPpg==
X-Gm-Message-State: ACrzQf0uV+bmdCEj2MaqSZyYIzyll7B6H4k7u26mqpFc5QM+LzWiC65H
	tVwUBtRs6pl5UrmYTAU2ngQ=
X-Google-Smtp-Source: AMsMyM4BtmnroQBdF3hqgGthCFmpDRy5iBoH9QAgv1iUdP9UBTEJ0P4IYfv9E74Ot1tFYqSPlcgrqg==
X-Received: by 2002:a17:90a:4607:b0:202:e22d:489c with SMTP id w7-20020a17090a460700b00202e22d489cmr3603534pjg.80.1663143980150;
        Wed, 14 Sep 2022 01:26:20 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:486:362c:d94f:b1bb:6842:3424])
        by smtp.gmail.com with ESMTPSA id s8-20020a17090a880800b0020036e008bcsm8683195pjn.4.2022.09.14.01.26.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Sep 2022 01:26:19 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee@kernel.org
Cc: matthias.bgg@gmail.com,
	gene_chen@richtek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ChiYuan Huang <cy_huang@richtek.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: mt6360: add bound check in regmap read/write function
Date: Wed, 14 Sep 2022 16:26:13 +0800
Message-Id: <1663143973-29254-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_012622_084349_DBD330F4 
X-CRM114-Status: GOOD (  11.55  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Fix the potential risk for null pointer if bank index is over the maximimum.

Refer to the discussion list for the experiment result on mt6370.
https://lore.kernel.org/all/20220914013345.GA5802@cyhuang-hp-elitebook-840-g3.rt/
If not to check the bound, there is the same issue on mt6360.

Fixes: 3b0850440a06c (mfd: mt6360: Merge different sub-devices I2C read/write)
Cc: stable@vger.kernel.org
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/mfd/mt6360-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 6eaa677..d375333 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -410,6 +410,9 @@ static int mt6360_regmap_read(void *context, const void *reg, size_t reg_size,
 	u8 crc;
 	int ret;
 
+	if (bank >= MT6360_SLAVE_MAX)
+		return -EINVAL;
+
 	if (bank == MT6360_SLAVE_PMIC || bank == MT6360_SLAVE_LDO) {
 		crc_needed = true;
 		ret = mt6360_xlate_pmicldo_addr(&reg_addr, val_size);
@@ -460,6 +463,9 @@ static int mt6360_regmap_write(void *context, const void *val, size_t val_size)
 	int write_size = val_size - MT6360_REGMAP_REG_BYTE_SIZE;
 	int ret;
 
+	if (bank >= MT6360_SLAVE_MAX)
+		return -EINVAL;
+
 	if (bank == MT6360_SLAVE_PMIC || bank == MT6360_SLAVE_LDO) {
 		crc_needed = true;
 		ret = mt6360_xlate_pmicldo_addr(&reg_addr, val_size - MT6360_REGMAP_REG_BYTE_SIZE);
-- 
2.7.4


