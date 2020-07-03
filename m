Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF555C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 04:43:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C54F20760
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 04:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cXNvUb+q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hPNc7phc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C54F20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QoodkFBqFbm961neliQ/5qLapjeOmLn6nM7+KCq+V7g=; b=cXNvUb+q5SxVnopeN46gjZIh7
	K+eOo+jt9PrZ2eK8+dJ+nEKu2lbEUZrwrAqgCKjZtO3pVRD5kzRE6LHNwg76Rpo6w6F3H3MiS9SOG
	WZl03UByBosEHgOQ3Ilus22QY/0trZ3PlS6WXXV4yf97QG6eHstuFLg+vpr6pUFf+Q77u/rU5DXHF
	v29iJktMqQs8LFII2HLlN/+oWNtzz+aiJ+WgAxp/H7l/od0U3Asty1rmVtr3fcrxg27B3vKV0vNzs
	O5bS/2ny1gOPkD1MtITXw8k53Yf21ZEN6EJrPOgT+etkvGZ7Fq0b9tCP1IDl0Y3fI89qX2je2Lb1n
	i+D9c5Omw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrDXc-00032L-Nw; Fri, 03 Jul 2020 04:43:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrDXa-0002zO-1j; Fri, 03 Jul 2020 04:43:11 +0000
X-UUID: 9a6e1c9325364bfb9347f958b670d48c-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lwngduU5KeolcyUE3ZQ2c8+CBfHyh2i0XZQNCVNBVjA=; 
 b=hPNc7phcmUswwyfWftzELicT+cS69nUMkwT+f6Ulcq16CrTCzeWvvWr74dfYwCGjEBgGWXg6EnaxG0IRKDG9FwoaS3rKwKu1IPhdVQZmntDg5Op23QBLvLZZBbW9mUMzYld717aoItCSmCAdNMl0SNrLUHbBpyl1FU3dOhYaG2g=;
X-UUID: 9a6e1c9325364bfb9347f958b670d48c-20200702
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 246866409; Thu, 02 Jul 2020 20:42:52 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 21:42:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Jul 2020 12:42:49 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Jul 2020 12:42:45 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v6 07/10] iommu/mediatek: Add REG_MMU_WR_LEN_CTRL register
 definition
Date: Fri, 3 Jul 2020 12:41:24 +0800
Message-ID: <20200703044127.27438-8-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200703044127.27438-1-chao.hao@mediatek.com>
References: <20200703044127.27438-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_004310_481049_2D4D7D7C 
X-CRM114-Status: GOOD (  14.99  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 TH Yang <th.yang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some platforms(ex: mt6779) need to improve performance by setting
REG_MMU_WR_LEN_CTRL register. And we can use WR_THROT_EN macro to control
whether we need to set the register. If the register uses default value,
iommu will send command to EMI without restriction, when the number of
commands become more and more, it will drop the EMI performance. So when
more than ten_commands(default value) don't be handled for EMI, iommu will
stop send command to EMI for keeping EMI's performace by enabling write
throttling mechanism(bit[5][21]=0) in MMU_WR_LEN_CTRL register.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 11 +++++++++++
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0d96dcd8612b..5c8e141668fc 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -46,6 +46,8 @@
 #define F_MMU_STANDARD_AXI_MODE_MASK		(BIT(3) | BIT(19))
 
 #define REG_MMU_DCM_DIS				0x050
+#define REG_MMU_WR_LEN_CTRL			0x054
+#define F_MMU_WR_THROT_DIS_MASK			(BIT(5) | BIT(21))
 
 #define REG_MMU_CTRL_REG			0x110
 #define F_MMU_TF_PROT_TO_PROGRAM_ADDR		(2 << 4)
@@ -112,6 +114,7 @@
 #define RESET_AXI			BIT(3)
 #define OUT_ORDER_WR_EN			BIT(4)
 #define HAS_SUB_COMM			BIT(5)
+#define WR_THROT_EN			BIT(6)
 
 #define MTK_IOMMU_HAS_FLAG(pdata, _x) \
 		((((pdata)->flags) & (_x)) == (_x))
@@ -593,6 +596,12 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 		writel_relaxed(regval, data->base + REG_MMU_VLD_PA_RNG);
 	}
 	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, WR_THROT_EN)) {
+		/* write command throttling mode */
+		regval = readl_relaxed(data->base + REG_MMU_WR_LEN_CTRL);
+		regval &= ~F_MMU_WR_THROT_DIS_MASK;
+		writel_relaxed(regval, data->base + REG_MMU_WR_LEN_CTRL);
+	}
 
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, RESET_AXI)) {
 		/* The register is called STANDARD_AXI_MODE in this case */
@@ -747,6 +756,7 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
 	void __iomem *base = data->base;
 
+	reg->wr_len_ctrl = readl_relaxed(base + REG_MMU_WR_LEN_CTRL);
 	reg->misc_ctrl = readl_relaxed(base + REG_MMU_MISC_CTRL);
 	reg->dcm_dis = readl_relaxed(base + REG_MMU_DCM_DIS);
 	reg->ctrl_reg = readl_relaxed(base + REG_MMU_CTRL_REG);
@@ -771,6 +781,7 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
 		dev_err(data->dev, "Failed to enable clk(%d) in resume\n", ret);
 		return ret;
 	}
+	writel_relaxed(reg->wr_len_ctrl, base + REG_MMU_WR_LEN_CTRL);
 	writel_relaxed(reg->misc_ctrl, base + REG_MMU_MISC_CTRL);
 	writel_relaxed(reg->dcm_dis, base + REG_MMU_DCM_DIS);
 	writel_relaxed(reg->ctrl_reg, base + REG_MMU_CTRL_REG);
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 46d0d47b22e1..31edd05e2eb1 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -31,6 +31,7 @@ struct mtk_iommu_suspend_reg {
 	u32				int_main_control;
 	u32				ivrp_paddr;
 	u32				vld_pa_rng;
+	u32				wr_len_ctrl;
 };
 
 enum mtk_iommu_plat {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
