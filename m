Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFDEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 12:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1jQas3TXGf5q40h1b1ySLS674Rzzh/E1T6arTvl7ec=; b=m2J5880uykdE/m
	DCNKan0CR+Sra0XhyFLylipHLGa4qBTsK29bYG2TbyAKwkIeXqAkF166SdvbulS2jE7NmRVtQtVGl
	fDz2Ljg+2zvdyaEqnAgkjY0QCY/X4VXuvtthUF7cYnR6Ne2Dpq0YumCwglDEVhdpfP10nzt35e0Ih
	ieMFbMz0IVs3hlGTX8LTzd6Z3whzma1BESiADJ3bhHUWRBnxcCI7lbcXq3B5alWQ7mmAxnVxdMtaK
	0JJiVDocC0Q1Uo1s2W871H8hU/2RAcv703Z/79pJ1fpZGi7/Mj5VNXFUza0q/4U9chIpR7fW0OTkN
	zdXLKmQ/XfVngpooq3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZXDd-00Fbrh-3F; Wed, 30 Mar 2022 12:14:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZWqJ-00FQlJ-8J; Wed, 30 Mar 2022 11:50:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A475861618;
 Wed, 30 Mar 2022 11:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89374C36AE5;
 Wed, 30 Mar 2022 11:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648641026;
 bh=l+m77C9idI4jM2I/cxdJVqKxviVUkNS+iBU28/SrWOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n0Or5OOQVIyxjl5LGE6VdR6xKSHD9PbCJZduGY+iHj5WskfZD/rBcjjEOhwL4k33F
 +878mIs5JrJPatUrRX07jm8XdB+Smpd6dOOK3xmV2q8ZDfdAH1kP2ZLMXK1UtlD5Bd
 DukOWH/axsuCzbah+rpadrUsC7tQUDPMviKgTG9UHkKp6AvAGwp0XdwvgAolk7ccu6
 T5uspxWjcFHMP2AROc8PJw0vRLZmaBx0wH+hZ+9eGlgHXqK0JeibOEUSmpPpjOm6TE
 Ge5qLq6e18VppxX9fToVqR1YA0SgTvIi6LzQl7VuvR+klcZ1EFzJPA8mRTcfhAM0eM
 Q0cbviHCt2dlQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 12/50] media: iommu/mediatek: Add device_link
 between the consumer and the larb devices
Date: Wed, 30 Mar 2022 07:49:26 -0400
Message-Id: <20220330115005.1671090-12-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330115005.1671090-1-sashal@kernel.org>
References: <20220330115005.1671090-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_045027_454217_A0D918CA 
X-CRM114-Status: GOOD (  23.78  )
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
Cc: Sasha Levin <sashal@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 joro@8bytes.org, Tomasz Figa <tfiga@chromium.org>, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yong Wu <yong.wu@mediatek.com>

[ Upstream commit 635319a4a7444ca97124d781cd96deb277ff4d40 ]

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

Meanwhile, Currently we don't have a device connect with 2 larbs at the
same time. Disallow this case, print the error log.

[1] https://lore.kernel.org/linux-mediatek/1564213888.22908.4.camel@mhfsdcap03/
[2] https://lore.kernel.org/patchwork/patch/1086569/

Suggested-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623
Acked-by: Joerg Roedel <jroedel@suse.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/mtk_iommu.c    | 30 ++++++++++++++++++++++++++++++
 drivers/iommu/mtk_iommu_v1.c | 29 ++++++++++++++++++++++++++++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 77ae20ff9b35..5971a1168666 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -562,22 +562,52 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct mtk_iommu_data *data;
+	struct device_link *link;
+	struct device *larbdev;
+	unsigned int larbid, larbidx, i;
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return ERR_PTR(-ENODEV); /* Not a iommu client device */
 
 	data = dev_iommu_priv_get(dev);
 
+	/*
+	 * Link the consumer device with the smi-larb device(supplier).
+	 * The device that connects with each a larb is a independent HW.
+	 * All the ports in each a device should be in the same larbs.
+	 */
+	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
+	for (i = 1; i < fwspec->num_ids; i++) {
+		larbidx = MTK_M4U_TO_LARB(fwspec->ids[i]);
+		if (larbid != larbidx) {
+			dev_err(dev, "Can only use one larb. Fail@larb%d-%d.\n",
+				larbid, larbidx);
+			return ERR_PTR(-EINVAL);
+		}
+	}
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
index 68bf02f87cfd..bc7ee90b9373 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -423,7 +423,9 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct of_phandle_args iommu_spec;
 	struct mtk_iommu_data *data;
-	int err, idx = 0;
+	int err, idx = 0, larbid, larbidx;
+	struct device_link *link;
+	struct device *larbdev;
 
 	/*
 	 * In the deferred case, free the existed fwspec.
@@ -453,6 +455,23 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 
 	data = dev_iommu_priv_get(dev);
 
+	/* Link the consumer device with the smi-larb device(supplier) */
+	larbid = mt2701_m4u_to_larb(fwspec->ids[0]);
+	for (idx = 1; idx < fwspec->num_ids; idx++) {
+		larbidx = mt2701_m4u_to_larb(fwspec->ids[idx]);
+		if (larbid != larbidx) {
+			dev_err(dev, "Can only use one larb. Fail@larb%d-%d.\n",
+				larbid, larbidx);
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	larbdev = data->larb_imu[larbid].dev;
+	link = device_link_add(dev, larbdev,
+			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+	if (!link)
+		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
+
 	return &data->iommu;
 }
 
@@ -473,10 +492,18 @@ static void mtk_iommu_probe_finalize(struct device *dev)
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
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
