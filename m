Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782F6C4320A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 02:55:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ADA36103B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 02:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3ADA36103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuhG3dQG4PDiCp2Ver37Xp0PT3UYhoL/fRIyXzHCUiU=; b=DQK8VVim8xjikq
	JaDoC9iss6qHes6HES29A3qS+sdJYyBim7OE2EMEqsaQhyJ7sQ/Vv5xUeSB4c7z43fTLDmOiW6vML
	k7nsjNJ+DFIR6L5oRE8013n3nVFnJLZvrHnIo5sRHgyMcgnPwm5PrJ2UhLMccKf2k//D1LHBsZG+q
	XKVp9ZjWg41XJJcSoB6xEIG4O3K1uwWEZvHQipus2zK+ULudgwPzDqoh+hYLmhYAJ4e7X9ntGmqMr
	LEErE2DWZjfUGsLCQ6RTwvUFCWyHfcs3CXhu3zPqjCvcxdrRWoFbTI4jOaSLvJlwMMIrVjliP+1CW
	bXHggE4pZr9gf99HUrlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Ig9-006jUz-2b; Fri, 30 Jul 2021 02:55:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9IfA-006j0W-Oh; Fri, 30 Jul 2021 02:54:18 +0000
X-UUID: 76e0027402374bf18d829694e0d9e4d3-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DQhjfy0LfYoCb1a6tDq8CSU9OysemG2ukaAu4P4lKt4=; 
 b=XWBirUkmlh9gPwxowUgAECfUZiAHlfwDNfIdS5+VQxTXRNON8BZ6+OSaVmSZGAft5C5ZUVevAQ9bFE5BD3i3DmyEMCG6nsiwMXp1m8hseUkSKpIEY40/nFFVQuCJRkXbNPz/BGHJ2kEmdpImvD7MwYXrUJuPKRbrUt1pWU7rMSY=;
X-UUID: 76e0027402374bf18d829694e0d9e4d3-20210729
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1205352405; Thu, 29 Jul 2021 19:54:14 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 19:54:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 10:54:11 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 10:54:07 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, 
 <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Eizan
 Miyamoto" <eizan@chromium.org>, <anthony.huang@mediatek.com>, Frank
 Wunderlich <frank-w@public-files.de>
Subject: [PATCH v7 04/12] iommu/mediatek: Add device_link between the consumer
 and the larb devices
Date: Fri, 30 Jul 2021 10:52:30 +0800
Message-ID: <20210730025238.22456-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_195416_888851_ED3384C0 
X-CRM114-Status: GOOD (  22.41  )
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

MediaTek IOMMU-SMI diagram is like below. all the consumer connect with
smi-larb, then connect with smi-common.

        M4U
         |
    smi-common
         |
  -------------
  |         |    ...
  |         |
larb1     larb2
  |         |
vdec       venc

When the consumer works, it should enable the smi-larb's power which
also need enable the smi-common's power firstly.

Thus, First of all, use the device link connect the consumer and the
smi-larbs. then add device link between the smi-larb and smi-common.

This patch adds device_link between the consumer and the larbs.

When device_link_add, I add the flag DL_FLAG_STATELESS to avoid calling
pm_runtime_xx to keep the original status of clocks. It can avoid two
issues:
1) Display HW show fastlogo abnormally reported in [1]. At the beggining,
all the clocks are enabled before entering kernel, but the clocks for
display HW(always in larb0) will be gated after clk_enable and clk_disable
called from device_link_add(->pm_runtime_resume) and rpm_idle. The clock
operation happened before display driver probe. At that time, the display
HW will be abnormal.

2) A deadlock issue reported in [2]. Use DL_FLAG_STATELESS to skip
pm_runtime_xx to avoid the deadlock.

Corresponding, DL_FLAG_AUTOREMOVE_CONSUMER can't be added, then
device_link_removed should be added explicitly.

[1] https://lore.kernel.org/linux-mediatek/1564213888.22908.4.camel@mhfsdcap03/
[2] https://lore.kernel.org/patchwork/patch/1086569/

Suggested-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Tested-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com> # on mt8173
---
 drivers/iommu/mtk_iommu.c    | 22 ++++++++++++++++++++++
 drivers/iommu/mtk_iommu_v1.c | 20 +++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index a02dde094788..ee742900cf4b 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -571,22 +571,44 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct mtk_iommu_data *data;
+	struct device_link *link;
+	struct device *larbdev;
+	unsigned int larbid;
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return ERR_PTR(-ENODEV); /* Not a iommu client device */
 
 	data = dev_iommu_priv_get(dev);
 
+	/*
+	 * Link the consumer device with the smi-larb device(supplier)
+	 * The device in each a larb is a independent HW. thus only link
+	 * one larb here.
+	 */
+	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
+	larbdev = data->larb_imu[larbid].dev;
+	link = device_link_add(dev, larbdev,
+			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+	if (!link)
+		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
 	return &data->iommu;
 }
 
 static void mtk_iommu_release_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct mtk_iommu_data *data;
+	struct device *larbdev;
+	unsigned int larbid;
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return;
 
+	data = dev_iommu_priv_get(dev);
+	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
+	larbdev = data->larb_imu[larbid].dev;
+	device_link_remove(dev, larbdev);
+
 	iommu_fwspec_free(dev);
 }
 
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index c259433f1130..806d4200665b 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -424,7 +424,9 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct of_phandle_args iommu_spec;
 	struct mtk_iommu_data *data;
-	int err, idx = 0;
+	int err, idx = 0, larbid;
+	struct device_link *link;
+	struct device *larbdev;
 
 	/*
 	 * In the deferred case, free the existed fwspec if the dev already has,
@@ -454,6 +456,14 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 
 	data = dev_iommu_priv_get(dev);
 
+	/* Link the consumer device with the smi-larb device(supplier) */
+	larbid = mt2701_m4u_to_larb(fwspec->ids[0]);
+	larbdev = data->larb_imu[larbid].dev;
+	link = device_link_add(dev, larbdev,
+			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+	if (!link)
+		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
+
 	return &data->iommu;
 }
 
@@ -474,10 +484,18 @@ static void mtk_iommu_probe_finalize(struct device *dev)
 static void mtk_iommu_release_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct mtk_iommu_data *data;
+	struct device *larbdev;
+	unsigned int larbid;
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return;
 
+	data = dev_iommu_priv_get(dev);
+	larbid = mt2701_m4u_to_larb(fwspec->ids[0]);
+	larbdev = data->larb_imu[larbid].dev;
+	device_link_remove(dev, larbdev);
+
 	iommu_fwspec_free(dev);
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
