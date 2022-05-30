Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243BBC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 18:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSYdknr2TB7R2BxbSL19qJSglMNZm6xk6hOMaLH7x4k=; b=VIj00JODhB1m3/
	vMNx6Pau4PrWfiZi7K8RGTdU7MP4WC+IBTPqr3DzhrXVEcYjyqjBOST/DlLiEdcUwjSyrw3FB430t
	OZ7uv4DJJluMqqVeE7nV+A+e0sZ990I5NkmABs75jgv168SwOeg2vmIQWEVn1ui6nE3s17Qo4Qztu
	YvbrTBcfv1N6rcSQ3ziLxn5XTQpgTgGeaT74THREPz+mBDQ1kWI6gYHaRI8IVQoHd/N0NwYp+TIMe
	bTSHE6/8rai4ZJZHfd07v4fobvIAr+MvFUoPeAJF4xOaZQvnfU0C4uNiavddqnmQOtIlQOKB8pveu
	CBpTHKkHJ1Yx8ZieYUxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvjkU-007mPh-AE; Mon, 30 May 2022 18:04:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvjkH-007mII-Oj
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 18:04:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id n124-20020a1c2782000000b003972dfca96cso6886814wmn.4
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 11:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZmgLvUIbxgbpdB2bdHpHdShKYYvDRAzse8YTxTcYmlw=;
        b=NfEC1OIXJEz3OYJ6J87rT9rzJ1mbZNB0gKkeP3tMJSIX/sM8LGt31DrleZc5+pOgwE
         5KAoev3tGKNxqP5IHJYqti6jxR1OasqD8F/XhjuE0JmwxCEbgqDtNRsL7DZ6vZyKNcFW
         f+lKaiQkrlyWUQYfWiftdcvKoxFeEORW0pgsLIwrwyAz5uyPtgy4gLAP8iMtiZrM2wtR
         zwdy/TO0g+G0huyLhlqJR2uz4v8437twjVazYvtTO00cfSnBdq9Wka9kZqoGpgmn0LbO
         k33+uKtOndBl3UlThJThhtyxMA++fkVMajtvMiS3bXy0WlGB5T4wYUHVgz76hnEXzJxf
         pm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZmgLvUIbxgbpdB2bdHpHdShKYYvDRAzse8YTxTcYmlw=;
        b=U8vGjJ6PEV8YTllukYAyhWv7p6lofnJqEZOhPbOozFGdH9bQZcJROLZZThNJflCm/V
         khgY63MmsJ3s9qxPfqgOeZ9INjgINMTOWUTVVWuc+VkeeqJM2oqieITctA7AjdzZJ3pS
         VX+uN2I41o6cinouBCP8kxHqvFZMHsQHuHCBfYBpSJb7/ed4q/9UUP5P4TfVUBw+jx2n
         Xz94HQZZeLcu2+qSMG8VCVYfVI5dofS0Xuo/O99lJBTsbU/6O7S34fBsiLJbv37oEKRY
         1Nxg5+ZqlmE+hd3Ya0d6KIwLIpZV4Jr6tfV2LMkZPnuloT9SKQw3neI7+e1Ak2jGafgd
         pJZg==
X-Gm-Message-State: AOAM531gpxAMspsTC7XQtSyrvuqr138aKdVIgvgXYavckAwC2AmUHMfU
	HpV1syZEpE9Ve0uTgIdkjDIbQw==
X-Google-Smtp-Source: ABdhPJy3TpSKfEh0yxmuTCQYqERubX5Qj/lcKQ/awW7gRS0/MmJIqd0Xb3r8aUJ1ih0s8IO0W9TpgA==
X-Received: by 2002:a1c:4443:0:b0:397:38a7:30 with SMTP id r64-20020a1c4443000000b0039738a70030mr19773587wma.14.1653933838195;
        Mon, 30 May 2022 11:03:58 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id 9-20020a1c0209000000b00397550b387bsm1647wmc.23.2022.05.30.11.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 11:03:57 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] iommu: mtk_iommu: add support for 6-bit encoded port IDs
Date: Mon, 30 May 2022 20:03:27 +0200
Message-Id: <20220530180328.845692-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530180328.845692-1-fparent@baylibre.com>
References: <20220530180328.845692-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_110401_829443_1ABB8F02 
X-CRM114-Status: GOOD (  15.75  )
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

Until now the port ID was always encoded as a 5-bit data. On MT8365,
the port ID is encoded as a 6-bit data. This requires to rework the
macros F_MMU_INT_ID_LARB_ID, and F_MMU_INT_ID_PORT_ID in order
to support 5-bit and 6-bit encoded port IDs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/iommu/mtk_iommu.c | 17 +++++++++++++----
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 6fd75a60abd6..b692347d8d56 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -103,8 +103,10 @@
 #define REG_MMU1_INT_ID				0x154
 #define F_MMU_INT_ID_COMM_ID(a)			(((a) >> 9) & 0x7)
 #define F_MMU_INT_ID_SUB_COMM_ID(a)		(((a) >> 7) & 0x3)
-#define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
-#define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
+#define F_MMU_INT_ID_LARB_ID(a, port_width)	\
+				((a) >> ((port_width + 2) & 0x7))
+#define F_MMU_INT_ID_PORT_ID(a, port_width)	\
+				(((a) >> 2) & GENMASK(port_width - 1, 0))
 
 #define MTK_PROTECT_PA_ALIGN			256
 
@@ -291,12 +293,13 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 		fault_pa |= (u64)pa34_32 << 32;
 	}
 
-	fault_port = F_MMU_INT_ID_PORT_ID(regval);
+	fault_port = F_MMU_INT_ID_PORT_ID(regval, data->plat_data->port_width);
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM)) {
 		fault_larb = F_MMU_INT_ID_COMM_ID(regval);
 		sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
 	} else {
-		fault_larb = F_MMU_INT_ID_LARB_ID(regval);
+		fault_larb = F_MMU_INT_ID_LARB_ID(regval,
+						  data->plat_data->port_width);
 	}
 	fault_larb = data->plat_data->larbid_remap[fault_larb][sub_comm];
 
@@ -1034,6 +1037,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 	.iova_region  = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
 	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}},
+	.port_width   = 5,
 };
 
 static const struct mtk_iommu_plat_data mt6779_data = {
@@ -1043,6 +1047,7 @@ static const struct mtk_iommu_plat_data mt6779_data = {
 	.iova_region   = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
 	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
+	.port_width    = 5,
 };
 
 static const struct mtk_iommu_plat_data mt8167_data = {
@@ -1052,6 +1057,7 @@ static const struct mtk_iommu_plat_data mt8167_data = {
 	.iova_region  = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
 	.larbid_remap = {{0}, {1}, {2}}, /* Linear mapping. */
+	.port_width   = 5,
 };
 
 static const struct mtk_iommu_plat_data mt8173_data = {
@@ -1062,6 +1068,7 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 	.iova_region  = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
 	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear mapping. */
+	.port_width   = 5,
 };
 
 static const struct mtk_iommu_plat_data mt8183_data = {
@@ -1071,6 +1078,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
 	.iova_region  = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
 	.larbid_remap = {{0}, {4}, {5}, {6}, {7}, {2}, {3}, {1}},
+	.port_width   = 5,
 };
 
 static const struct mtk_iommu_plat_data mt8192_data = {
@@ -1082,6 +1090,7 @@ static const struct mtk_iommu_plat_data mt8192_data = {
 	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
 	.larbid_remap   = {{0}, {1}, {4, 5}, {7}, {2}, {9, 11, 19, 20},
 			   {0, 14, 16}, {0, 13, 18, 17}},
+	.port_width     = 5,
 };
 
 static const struct of_device_id mtk_iommu_of_ids[] = {
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index b742432220c5..84cecaf6d61c 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -54,6 +54,7 @@ struct mtk_iommu_plat_data {
 	enum mtk_iommu_plat m4u_plat;
 	u32                 flags;
 	u32                 inv_sel_reg;
+	u8                  port_width;
 
 	unsigned int				iova_region_nr;
 	const struct mtk_iommu_iova_region	*iova_region;
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
