Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3B6C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 15:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=An4kT4BM9Rci5qYKJ4sPmVN45LRWyfiGrpIHkvgTDG4=; b=skulCVr/pdzNIWNbE9B6m65aM3
	UyVjwrew9k4LQ+YngT/0sdepvTETc9MdydsZBKhEc6t7OQGxuvvCxvWQ4mHj4p3IkargS40BzzgTr
	taXhLUcz4lJ1sy9k7391+uT4USDZULRZPjLGf8g7SjYN+FH+dzwYaHmsrCF0+hMSwwMFifp+EO2i6
	T9dV2SyPMKmnTfOvT4p9sAfjrd9LtLVwZfY4Y3tyBr21H0Q5tRGKccMuaAUANcVhP3yJs7J+zOVx+
	mL0LIWEUsUEcdomStgvMQjONB6pWKOjYNpq2mtOm701WwxTpv4mFkcyalkWcRepQIzGoZZEWems5y
	5foE47dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqFVw-00Bhw3-1n; Wed, 02 Nov 2022 15:18:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqFVP-00Bhhm-Pg
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 15:18:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso2525334wmb.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Nov 2022 08:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=An4kT4BM9Rci5qYKJ4sPmVN45LRWyfiGrpIHkvgTDG4=;
        b=Ak15HOWMj5ggmZZ/GkuP8pLq3HeA+ApcP4w8G3m8Y+od15bIOgvTXO9VGE/gs+EqnR
         fL4+LQsXL7wZXQx72Z+0C/ryo7xIe5HU03srcuxyLMSNg72bjGb3vUS5qJuqU1oxRPxk
         8hsZxdQhjE41ZPKX0oyw0jatc63LmQZRhRED2Mo7UEzHxwrjZDaVljNU4AZja2buqZcs
         l9pdDImoSKQ47tquWs1253PraUgkZYmfHFIexQUDcgNwu3cDuN9kNaPIE3RYNWzBJe66
         8DnY54tHQe/XL84+fmoKJ9LqIfSAADwkNX3we+n9Fj3A+EKpYs9rsC6fHQp6hhoUwrXp
         6BBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=An4kT4BM9Rci5qYKJ4sPmVN45LRWyfiGrpIHkvgTDG4=;
        b=k6xn3r2Z7UpaJVG20wNW+9Q/6GHO3dV1hIXXDKD60+dykpKhBF7w9DzU94XQBBU0Ta
         7Tfomu3aORKGYszR9SjFk4X2er/XjJKcZsnEbjtSmu5i3UJUc32Uf6GXaZY1cOdVaV78
         55oWIHQhkxWOItM4FpuSt9Xbgcb+ePLzuovmkjBNppTk5x/nxj7NZK2mFUUPsw1eECUE
         Bkg6am+Mw7LoeJHMqPgVTy+f31JWuQ2wEJ0maZoWuZsjHdG/ePGUL9AahGnCbo89jKlV
         mEKFP/lUOpIAQKbEvr/fkbJI7o5DOCjm4RBRM1M8DqBq+fj2U+C3p3BrhBcXSTCNrf96
         i+qA==
X-Gm-Message-State: ACrzQf2KPIUydH3XzHZEKCk3uIItfVZNL8ls7lF3Dz3ucWS8AhU4h+nu
	OlFJ1nty73S6PYS4wuv3uhpy+g==
X-Google-Smtp-Source: AMsMyM5D8bKtsFea9r6fNhLwBD4zMAiAYZhOBeMFWJL5gaiUeT4b9kPkeK3Hk860ccgg/d+kCEgkKg==
X-Received: by 2002:a05:600c:19d2:b0:3c6:fbb9:ca9a with SMTP id u18-20020a05600c19d200b003c6fbb9ca9amr16347370wmq.110.1667402293830;
        Wed, 02 Nov 2022 08:18:13 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id bq13-20020a5d5a0d000000b002365921c9aesm13332818wrb.77.2022.11.02.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 08:18:13 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 02 Nov 2022 16:18:08 +0100
Subject: [PATCH v6 2/3] iommu/mediatek: add support for 6-bit encoded port IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221001-iommu-support-v6-2-be4fe8da254b@baylibre.com>
References: <20221001-iommu-support-v6-0-be4fe8da254b@baylibre.com>
In-Reply-To: <20221001-iommu-support-v6-0-be4fe8da254b@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Fabien Parent <fparent@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2748; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=12NL2NIpCRtKtHudS7M2vbMHWUQeZ96+QJE5QCrHjlQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjYooyslmq6zZt3zk7YPwEA4DTWaC6O3ikzGVN+bRB
 b1hhTYKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY2KKMgAKCRArRkmdfjHURROMD/
 4kETHOn8ZygXYS5ED3s+0Z7ynhPWo4sQxfCbaMUfm3/IGXPeENWKxwHswgWmMBaGBTmgsGkabZChFS
 r+sf3hFkHm4q924vR2L1jp0A4qohhZIC5XZG3tOhi8leNLmgyY3QHoif9dlsnMz9GKpz7P0NU0FhhC
 BN1pscvvk5tu/YUHUAaDJIiAU6rGx7AlIih3KhCdhTNMi1lPsMHKCOJ4YBpzIyv77mbynPTdbAISo0
 HVDwxSxe8I+Tl5/FXZMJ7UivJlcNYRwHcQjqUIdCuy1DPgQYpxil+lNKdGGltl3iZXD44s0TTJrv0V
 22+G/nLQ8S3p6psdJxOEyzwivXF7t/EUimjbox0xqdZRTDLKAutMLhNoAjuH+6ulC0e/6FHw8GweNO
 UyuYkquVDKxwanLxCfd+7FdrRVJHM/NfBcIXV2T1hFVT8jTjW+QEH6IQ0bPceRkfMkqYYZcDKi4xlH
 v/w4zzmSAgcIYCAJxwW52b1kOY86TOn9cq0vjhb4EDDzNDNOFIDEosW+C44WcQqJQkW7jt67rASnqW
 64ud2CzK9ZbjbEutURBcdXhCsk7ngii4jWyx9FKxTDGekzxBJeJXihZ2oiycaPyEEi6KjkKpnrfjmB
 mt0fgO1W9KPQbhBmEdhbCuh6jkZW+LzYV3jvsT91gJDGCcF/ZlUHTBOrqN4g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_081815_882070_63C85472 
X-CRM114-Status: GOOD (  13.94  )
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

From: Fabien Parent <fparent@baylibre.com>

Until now the port ID was always encoded as a 5-bit data. On MT8365,
the port ID is encoded as a 6-bit data. This requires to add extra
macro F_MMU_INT_ID_LARB_ID_EXT, and F_MMU_INT_ID_PORT_ID_EXT in order
to support 6-bit encoded port IDs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/iommu/mtk_iommu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 5a4e00e4bbbc..563e3c54a0e2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -108,8 +108,12 @@
 #define F_MMU_INT_ID_SUB_COMM_ID(a)		(((a) >> 7) & 0x3)
 #define F_MMU_INT_ID_COMM_ID_EXT(a)		(((a) >> 10) & 0x7)
 #define F_MMU_INT_ID_SUB_COMM_ID_EXT(a)		(((a) >> 7) & 0x7)
+/* Macro for 5 bits length port ID field (default) */
 #define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
 #define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
+/* Macro for 6 bits length port ID field */
+#define F_MMU_INT_ID_LARB_ID_WID_6(a)		(((a) >> 8) & 0x7)
+#define F_MMU_INT_ID_PORT_ID_WID_6(a)		(((a) >> 2) & 0x3f)
 
 #define MTK_PROTECT_PA_ALIGN			256
 #define MTK_IOMMU_BANK_SZ			0x1000
@@ -139,6 +143,7 @@
 #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
 #define PGTABLE_PA_35_EN		BIT(17)
 #define TF_PORT_TO_ADDR_MT8173		BIT(18)
+#define INT_ID_PORT_WIDTH_6		BIT(19)
 
 #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
 				((((pdata)->flags) & (mask)) == (_x))
@@ -441,14 +446,19 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	fault_pa |= (u64)pa34_32 << 32;
 
 	if (MTK_IOMMU_IS_TYPE(plat_data, MTK_IOMMU_TYPE_MM)) {
-		fault_port = F_MMU_INT_ID_PORT_ID(regval);
 		if (MTK_IOMMU_HAS_FLAG(plat_data, HAS_SUB_COMM_2BITS)) {
 			fault_larb = F_MMU_INT_ID_COMM_ID(regval);
 			sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
+			fault_port = F_MMU_INT_ID_PORT_ID(regval);
 		} else if (MTK_IOMMU_HAS_FLAG(plat_data, HAS_SUB_COMM_3BITS)) {
 			fault_larb = F_MMU_INT_ID_COMM_ID_EXT(regval);
 			sub_comm = F_MMU_INT_ID_SUB_COMM_ID_EXT(regval);
+			fault_port = F_MMU_INT_ID_PORT_ID(regval);
+		} else if (MTK_IOMMU_HAS_FLAG(plat_data, INT_ID_PORT_WIDTH_6)) {
+			fault_port = F_MMU_INT_ID_PORT_ID_WID_6(regval);
+			fault_larb = F_MMU_INT_ID_LARB_ID_WID_6(regval);
 		} else {
+			fault_port = F_MMU_INT_ID_PORT_ID(regval);
 			fault_larb = F_MMU_INT_ID_LARB_ID(regval);
 		}
 		fault_larb = data->plat_data->larbid_remap[fault_larb][sub_comm];

-- 
b4 0.10.1

