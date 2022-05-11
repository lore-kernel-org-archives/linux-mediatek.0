Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D4EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 06:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hikg063hZP/uIL8myzIh3Wla+994zHncknBA/G5y/iw=; b=VtwXwzqs8eAbnX
	/bEF2nqiuIUPOxvDGTDDCYerh+Wwi94BFwZQ1bR1oWtV4Mk3vwA1ekxP0oPmfxsSw1EiHB6ugdu/w
	J7iZDJiRNlx5JEHh6vmkKxXR3VUEu4g1F7r92gIIE95f+ZT6CfaWvtkk0R4cHUPjd/npmGCi8cxLV
	Vvzcfc6F6fWN50Ms+Ntlyr1Q0i3FL9XtgfzNFlldxQaCEf3JG72GWRrEozoJtt848oHBWgWF7hP2X
	S35LqrB/dzBrPVWBIJcFe0dotRIvYjVHyYdvMWGiiRisEwne0OMNmP9ZsdbjPYINumccuvW3QctVg
	KDEoqd6Y4upd5U1hzJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nogBZ-005Z4I-U0; Wed, 11 May 2022 06:51:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nogBW-005Z0x-Ik; Wed, 11 May 2022 06:50:59 +0000
X-UUID: 211d69203519445b895dd84258510fed-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b18fe6dd-be20-496b-88c3-9c92e1c9e7ae, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:abf363b3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 211d69203519445b895dd84258510fed-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1134001176; Tue, 10 May 2022 23:50:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 23:50:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 14:50:03 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 May 2022 14:50:02 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Yong Wu" <yong.wu@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
 <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <xueqi.zhang@mediatek.com>, Guenter Roeck <groeck@chromium.org>, "Dan
 Carpenter" <dan.carpenter@oracle.com>
Subject: [PATCH 3/4] iommu/mediatek: Validate number of phandles associated
 with "mediatek, larbs"
Date: Wed, 11 May 2022 14:49:19 +0800
Message-ID: <20220511064920.18455-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220511064920.18455-1-yong.wu@mediatek.com>
References: <20220511064920.18455-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_235058_653329_270C77DB 
X-CRM114-Status: GOOD (  16.04  )
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

From: Guenter Roeck <groeck@chromium.org>

Fix the smatch warnings:
drivers/iommu/mtk_iommu.c:878 mtk_iommu_mm_dts_parse() error: uninitialized
symbol 'larbnode'.

If someone abuse the dtsi node(Don't follow the definition of dt-binding),
for example "mediatek,larbs" is provided as boolean property, the code may
crash. To fix this problem and improve the code safety, add some checking
for the invalid input from dtsi, e.g. checking the larb_nr/larbid valid
range, and avoid "mediatek,larb-id" property conflicts in the smi-larb
nodes.

Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 523bf59264e1..1ba92751e9df 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1046,6 +1046,8 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 	larb_nr = of_count_phandle_with_args(dev->of_node, "mediatek,larbs", NULL);
 	if (larb_nr < 0)
 		return larb_nr;
+	if (larb_nr == 0 || larb_nr > MTK_LARB_NR_MAX)
+		return -EINVAL;
 
 	for (i = 0; i < larb_nr; i++) {
 		u32 id;
@@ -1062,6 +1064,10 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 		ret = of_property_read_u32(larbnode, "mediatek,larb-id", &id);
 		if (ret)/* The id is consecutive if there is no this property */
 			id = i;
+		if (id >= MTK_LARB_NR_MAX) {
+			ret = -EINVAL;
+			goto err_larbnode_put;
+		}
 
 		plarbdev = of_find_device_by_node(larbnode);
 		if (!plarbdev) {
@@ -1072,6 +1078,11 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 			ret = -EPROBE_DEFER;
 			goto err_larbnode_put;
 		}
+
+		if (data->larb_imu[id].dev) {
+			ret = -EEXIST;
+			goto err_larbnode_put;
+		}
 		data->larb_imu[id].dev = &plarbdev->dev;
 
 		component_match_add_release(dev, match, component_release_of,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
