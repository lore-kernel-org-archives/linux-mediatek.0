Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D7AC00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 06:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p10kD+gTdAN7sPfTgPFIBsiL3UbFKgINASKfJF4tRJE=; b=b6SIpMoDcNfWsM4iobL3ENM8ZG
	/oWxz++82jwSPR38mInwY6bNUV/nEs+8cF7cgapAyPAhHrk8DeaNTaniCo86PukkuRP/zdUDmjGc+
	zqkuzvt2JtYRIUgCqc69Xp+44sIMoibzIxvgKb/tBtC/l1xkJzsDThZjV4qt7cadNhVTha+dhqW0x
	MhqSB/pwgLNomv+GhvYfFhZZHlKu1fL8CEFu4CJIUvEvAWLoEGTQz14mnZNP8iMlGezdP3BeqB+gZ
	Iql7KZwrsY+nJ+NNdwrwubex4/AG8TwKxHytqhZbjQxJVERU/9f7gaeSmqLa/jEEz6VlP4pNUMqub
	5sWrxI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQkIX-00B0nb-RW; Wed, 24 Aug 2022 06:55:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQkIJ-00B0kF-Lc; Wed, 24 Aug 2022 06:55:21 +0000
X-UUID: 37699a537b164f0487a34635f5e7472b-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=p10kD+gTdAN7sPfTgPFIBsiL3UbFKgINASKfJF4tRJE=;
	b=K6j1eQqh9J+BbgHB8I+yj5u5yc/5tHzOO/zRHxKDz2XPElOsFLo3f+z5zmv5TFF/Nf6GBD1mgBBk3cckv5baeE4IA9q33WXDdTnInCY8Els+oY7SZ/24nh5vzfWxSNIMzblZppMFGRZYtDyjeDVdMXwPMXaN/s8I9+0RmK/XLs4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:7ef212b9-64b1-4752-87fa-d27186e5fd18,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:60b2a1c9-6b09-4f60-bf82-12f039f5d530,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 37699a537b164f0487a34635f5e7472b-20220823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1154917871; Tue, 23 Aug 2022 23:55:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 24 Aug 2022 14:44:00 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 24 Aug 2022 14:43:59 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, <iommu@lists.linux.dev>,
	<iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Yong
 Wu" <yong.wu@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
	<xueqi.zhang@mediatek.com>, Guenter Roeck <groeck@chromium.org>, "Dan
 Carpenter" <dan.carpenter@oracle.com>
Subject: [PATCH v4 4/6] iommu/mediatek: Validate number of phandles associated with "mediatek,larbs"
Date: Wed, 24 Aug 2022 14:43:04 +0800
Message-ID: <20220824064306.21495-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220824064306.21495-1-yong.wu@mediatek.com>
References: <20220824064306.21495-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_235519_713367_5D18A8C0 
X-CRM114-Status: GOOD (  16.50  )
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

From: Guenter Roeck <groeck@chromium.org>

Fix the smatch warnings:
drivers/iommu/mtk_iommu.c:878 mtk_iommu_mm_dts_parse() error: uninitialized
symbol 'larbnode'.

If someone abuse the dtsi node(Don't follow the definition of dt-binding),
for example "mediatek,larbs" is provided as boolean property, "larb_nr"
will be zero and cause abnormal.

To fix this problem and improve the code safety, add some checking
for the invalid input from dtsi, e.g. checking the larb_nr/larbid valid
range, and avoid "mediatek,larb-id" property conflicts in the smi-larb
nodes.

Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index f63d4210043d..21195ac060f1 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1048,6 +1048,8 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 	larb_nr = of_count_phandle_with_args(dev->of_node, "mediatek,larbs", NULL);
 	if (larb_nr < 0)
 		return larb_nr;
+	if (larb_nr == 0 || larb_nr > MTK_LARB_NR_MAX)
+		return -EINVAL;
 
 	for (i = 0; i < larb_nr; i++) {
 		u32 id;
@@ -1066,6 +1068,11 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 		ret = of_property_read_u32(larbnode, "mediatek,larb-id", &id);
 		if (ret)/* The id is consecutive if there is no this property */
 			id = i;
+		if (id >= MTK_LARB_NR_MAX) {
+			of_node_put(larbnode);
+			ret = -EINVAL;
+			goto err_larbdev_put;
+		}
 
 		plarbdev = of_find_device_by_node(larbnode);
 		of_node_put(larbnode);
@@ -1073,6 +1080,11 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 			ret = -ENODEV;
 			goto err_larbdev_put;
 		}
+		if (data->larb_imu[id].dev) {
+			platform_device_put(plarbdev);
+			ret = -EEXIST;
+			goto err_larbdev_put;
+		}
 		data->larb_imu[id].dev = &plarbdev->dev;
 
 		if (!plarbdev->dev.driver) {
-- 
2.18.0


