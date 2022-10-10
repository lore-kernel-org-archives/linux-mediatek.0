Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FCEC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 12:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmxR3um4spniKrU53rveTwc+P5yMRl5wO2vmfcVu86g=; b=0Sf0C61B2+0USNsgnpldVEohsd
	Tsw0hhDIVDfTakj0yeQ8++KlJ5wb3rr6rY/xGB0f/yIRHlE3GKDL5dRkwwL325L5XW5jcUqqJoP7s
	2SoPn0E9I3BoET4l0/R/g7bKM2+Ta9EDUDP8bzqIe0ZawDK0nxFLYhKlBnhEL256x6uismq38e1+v
	aThK0ZvMqeKx6zbZ/BMLbVqog5YVU6NQMlINoG/5eX4AReHmDFDETySFGugkcWYWp5aSf8QkQ5zyH
	PSR4EgD0edPdgYu7KIiDPcp8VpeA1ix7udQc3DrcQ+Y0VkmeRln12bup8ldXxF5F8b7uXKexpqTbw
	noDkrgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsIk-000tgY-Rd; Mon, 10 Oct 2022 12:54:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsIW-000tYU-Bd
	for linux-mediatek@lists.infradead.org; Mon, 10 Oct 2022 12:54:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id t4so6778724wmj.5
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Oct 2022 05:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmxR3um4spniKrU53rveTwc+P5yMRl5wO2vmfcVu86g=;
        b=vh/8DDdSud/RVv13pylyII+LJFPvrAuNJ5y7jA56FMFVURoDylE9N5z2OIOqNfrzlY
         XYapgbnrP9TeFlOWCsH4ujw+WN+VxGALgDnmKiE7XQK9n2XQQruAlzf7xuaFUhseFHcx
         3olE+TW2NIsQjY4hvGL5llKiEAi1PguqI9YwqEUi39hf70jHEeo4Oa83fhmKSEIjDn2s
         KJIMsbUgQhaIiDfyiTLgp/uM0NvJkE1bQ79dZ2V38jQdy6OHR3OkRTatmvijRolYIiGO
         BLfjAD53e32gjMsRJ/y7NUU1DAvvCZb4ZUur0ENiLBfQFW7yv2yovPMhRuTGH44Kr/nj
         uggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmxR3um4spniKrU53rveTwc+P5yMRl5wO2vmfcVu86g=;
        b=pRBtTj8c+E8NVCnrosn91/GcW15Zlx/nOUs5tzu8sSCHRNHwQJEAD/Irap2NsMhVHx
         CcuCxK2s+z7C8Z+UYKqC7u0hHNUnPKjudo34ywbUX4srIiOQAm9yuSFzB6IBrG2+v5dW
         dpxAgooCXKpMhFNbB6HfPtIWGZf6Bo4aLdZMG6RZZWxb/GYaktN5IZ/QqZK1XAaHsc7V
         1PQPxakSLdlGItl8gIXKJQYivMmwMIfZT/A9SgMSglTEquY1XhEO/jQpT90vmPKwKenf
         GWG+jUnUWrgEGluFxRFMvfibMrW6/Tf6gaa88MkWNky0OSkJxsZdzgtGj2En9qE6MMFN
         GMVA==
X-Gm-Message-State: ACrzQf0UeUBhR+F6O4fztI6Whgk32vEQ1VL2rsYB2h0f7An5Ik4ehSMS
	UCNBrrCj3yJrjWLiBQ3u0YwdkQ==
X-Google-Smtp-Source: AMsMyM5e/ro8Q9KiuUwPEt9wTVF1C8YnK/+Kpd/WM6NPHdzx+3DtpxssO50mMBicIMeImLelqerAnA==
X-Received: by 2002:a1c:2743:0:b0:3b3:f017:f23a with SMTP id n64-20020a1c2743000000b003b3f017f23amr20455356wmn.137.1665406458413;
        Mon, 10 Oct 2022 05:54:18 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id v24-20020a1cf718000000b003a6125562e1sm9767020wmh.46.2022.10.10.05.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 05:54:17 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 10 Oct 2022 14:54:08 +0200
Subject: [PATCH v3 2/3] iommu/mediatek: add support for 6-bit encoded port IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221001-iommu-support-v3-2-c7b3059b0d16@baylibre.com>
References: <20221001-iommu-support-v3-0-c7b3059b0d16@baylibre.com>
In-Reply-To: <20221001-iommu-support-v3-0-c7b3059b0d16@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: iommu@lists.linux.dev, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Fabien Parent <fparent@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2694; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=BCe+/ykFa/fn5SOJye+/BgPzDIeybFkkbiXBZtITeNI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjRBX2NMVamMxV4iKNdLs5Ytoj7x609EByzseEUlTr
 DCfCrwmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY0QV9gAKCRArRkmdfjHURXkqD/
 4kl4rMFWfYv99V/bLZVANdkEu77lQ589T720XVn8pm3TCt7R3wPnDPW1pQ5PFpUNw8QrFVzCl0FLTH
 rob/5QlnOXrSsP7UbptiAySmzifaGslwWa1nkumPRIWRn3yVfV+Lufs3rb7RoWdQuKX5VcN1rmg2kV
 uAeh4NkOxuUmjSiNJ6ZRBrVMye2vwFCk/3zQpB+vd/dVDKkaANhDrO7ZscT3xO+Mgy4Wjsuu85mHQk
 KETF3RFnwN51wwb90GaA8S4sfnT4tuG3RxGP+BFHaWCq80lpKo0EcxZXYbf9sNVUYUpNUThwqsGpOV
 KwGy0YIJ3rOSTQ31GyYYix6QuhUhqE/+K9jQjwSJJ5k4U5mpa+XEOinGJR/7G5CahDb5G6i2mxVXSW
 OrqyacrT2yjFKLO2s9HsO1sUUy5kbMIpQcUwlyIqMaxOBkK9QoLVQ2Q+DxtVP20ZyDeF6+NrmdHZB/
 VK3EoniLFX22BqXAtrWrr+rGA2gfkCf0lfyce7LyP1u31swSk/lXzxxbrmDnK9ODBczX+4U2Ng5Eb+
 n60sRNliqSmm/o3DBKXHSt2BU4IZyq5cizoPK29RPGjUuC/rJx7YD/n2QmwBIPs6j2QauZr+9b0sB5
 5v4E94mRCBs8r8PgKsoyur1k6BK6w+wdwVfj5OIl/DZbyFRUbhEfvLzlvVnw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_055420_422619_7ACC92AF 
X-CRM114-Status: GOOD (  13.77  )
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
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/iommu/mtk_iommu.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 5a4e00e4bbbc..35e9731c3441 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -108,8 +108,12 @@
 #define F_MMU_INT_ID_SUB_COMM_ID(a)		(((a) >> 7) & 0x3)
 #define F_MMU_INT_ID_COMM_ID_EXT(a)		(((a) >> 10) & 0x7)
 #define F_MMU_INT_ID_SUB_COMM_ID_EXT(a)		(((a) >> 7) & 0x7)
+/* Macro for 5 bits lenght port ID field (default) */
 #define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
 #define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
+/* Macro for 6 bits lenght port ID field */
+#define F_MMU_INT_ID_LARB_ID_EXT(a)		(((a) >> 8) & 0x7)
+#define F_MMU_INT_ID_PORT_ID_EXT(a)		(((a) >> 2) & 0x3f)
 
 #define MTK_PROTECT_PA_ALIGN			256
 #define MTK_IOMMU_BANK_SZ			0x1000
@@ -139,6 +143,7 @@
 #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
 #define PGTABLE_PA_35_EN		BIT(17)
 #define TF_PORT_TO_ADDR_MT8173		BIT(18)
+#define HAS_INT_ID_PORT_WIDTH_6		BIT(19)
 
 #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
 				((((pdata)->flags) & (mask)) == (_x))
@@ -441,7 +446,11 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	fault_pa |= (u64)pa34_32 << 32;
 
 	if (MTK_IOMMU_IS_TYPE(plat_data, MTK_IOMMU_TYPE_MM)) {
-		fault_port = F_MMU_INT_ID_PORT_ID(regval);
+		if (MTK_IOMMU_HAS_FLAG(plat_data, HAS_INT_ID_PORT_WIDTH_6)) {
+			fault_port = F_MMU_INT_ID_PORT_ID_EXT(regval);
+		} else {
+			fault_port = F_MMU_INT_ID_PORT_ID(regval);
+		}
 		if (MTK_IOMMU_HAS_FLAG(plat_data, HAS_SUB_COMM_2BITS)) {
 			fault_larb = F_MMU_INT_ID_COMM_ID(regval);
 			sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
@@ -449,7 +458,11 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 			fault_larb = F_MMU_INT_ID_COMM_ID_EXT(regval);
 			sub_comm = F_MMU_INT_ID_SUB_COMM_ID_EXT(regval);
 		} else {
-			fault_larb = F_MMU_INT_ID_LARB_ID(regval);
+			if (MTK_IOMMU_HAS_FLAG(plat_data, HAS_INT_ID_PORT_WIDTH_6)) {
+				fault_larb = F_MMU_INT_ID_LARB_ID_EXT(regval);
+			} else {
+				fault_larb = F_MMU_INT_ID_LARB_ID(regval);
+			}
 		}
 		fault_larb = data->plat_data->larbid_remap[fault_larb][sub_comm];
 	}

-- 
b4 0.10.1

