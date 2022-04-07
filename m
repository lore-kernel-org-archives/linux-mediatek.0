Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2650C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 08:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tGBKr3V3ueeAakRTHCb670U8gM5j32H6Dbl+XDMntOY=; b=O2zMdNUogBRDfE
	vNBN6uUNwFppon6NkT2bydT8ALV0bsyFMZb4BeNwS6F4HbgbMvfcN0scwUMZPtBqT2gNwJae9oZie
	6GoGWb28tQdEsvtbc3c6CBsHZUha39exgeOjiL6tZ68l4SN52mvLqj2ggKuWddc9IzgDTFBv9ySYW
	z8Ngy487Hszek7cLgakB9kYbBQjS/Fs0auv2D+ene10m+PpV0bFAKiIp/tDqa3a+qN9p0TpMCVWLC
	+IwarbKzSA7NF5/9F8St8aTDBYvEomGlPWNDwjDDAPs2T4Zrekz6xlRAHMG+EiYE2OWr6NW9bLqYM
	UHoeEJKYbYUss6eCb5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncN8g-00AESW-Tn; Thu, 07 Apr 2022 08:05:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncN2e-00AB6j-BZ; Thu, 07 Apr 2022 07:58:57 +0000
X-UUID: 03e05b157138400294bb2bc5952bf9fe-20220407
X-UUID: 03e05b157138400294bb2bc5952bf9fe-20220407
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2010205608; Thu, 07 Apr 2022 00:58:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 00:58:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 7 Apr 2022 15:58:48 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 15:58:47 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <xueqi.zhang@mediatek.com>, <yen-chang.chen@mediatek.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
 <mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, 
 <chengci.xu@mediatek.com>
Subject: [PATCH v6 06/34] iommu/mediatek: Add mutex for m4u_group and m4u_dom
 in data
Date: Thu, 7 Apr 2022 15:56:58 +0800
Message-ID: <20220407075726.17771-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220407075726.17771-1-yong.wu@mediatek.com>
References: <20220407075726.17771-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_005856_451437_FC239F4E 
X-CRM114-Status: GOOD (  19.06  )
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

Add a mutex to protect the data in the structure mtk_iommu_data,
like ->"m4u_group" ->"m4u_dom". For the internal data, we should
protect it in ourselves driver. Add a mutex for this.
This could be a fix for the multi-groups support.

Fixes: c3045f39244e ("iommu/mediatek: Support for multi domains")
Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 13 +++++++++++--
 drivers/iommu/mtk_iommu.h |  2 ++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 81b8db450eac..3413cc98e57e 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -464,15 +464,16 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 		dom->data = data;
 	}
 
+	mutex_lock(&data->mutex);
 	if (!data->m4u_dom) { /* Initialize the M4U HW */
 		ret = pm_runtime_resume_and_get(m4udev);
 		if (ret < 0)
-			return ret;
+			goto err_unlock;
 
 		ret = mtk_iommu_hw_init(data);
 		if (ret) {
 			pm_runtime_put(m4udev);
-			return ret;
+			goto err_unlock;
 		}
 		data->m4u_dom = dom;
 		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
@@ -480,9 +481,14 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 
 		pm_runtime_put(m4udev);
 	}
+	mutex_unlock(&data->mutex);
 
 	mtk_iommu_config(data, dev, true, domid);
 	return 0;
+
+err_unlock:
+	mutex_unlock(&data->mutex);
+	return ret;
 }
 
 static void mtk_iommu_detach_device(struct iommu_domain *domain,
@@ -622,6 +628,7 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 	if (domid < 0)
 		return ERR_PTR(domid);
 
+	mutex_lock(&data->mutex);
 	group = data->m4u_group[domid];
 	if (!group) {
 		group = iommu_group_alloc();
@@ -630,6 +637,7 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 	} else {
 		iommu_group_ref_get(group);
 	}
+	mutex_unlock(&data->mutex);
 	return group;
 }
 
@@ -910,6 +918,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, data);
+	mutex_init(&data->mutex);
 
 	ret = iommu_device_sysfs_add(&data->iommu, dev, NULL,
 				     "mtk-iommu.%pa", &ioaddr);
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index b742432220c5..5e8da947affc 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -80,6 +80,8 @@ struct mtk_iommu_data {
 
 	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
 
+	struct mutex			mutex; /* Protect m4u_group/m4u_dom above */
+
 	struct list_head		list;
 	struct mtk_smi_larb_iommu	larb_imu[MTK_LARB_NR_MAX];
 };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
