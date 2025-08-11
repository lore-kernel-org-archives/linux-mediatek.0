Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9781ACA0EC1
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 13:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7EaqSjUTJkWLEmraz6TayVILgNp4Jq06m8bREO+Qjk=; b=LX9nvIY1kCcOILW/jCf5nRach1
	e4lgH06bR3jacm71Y/ImUJOz19hJFiD7yPsHzg86YZIrUHPaW4EP/evrsADsU94s2cwRVdGPmPWFv
	3mlyKJVfsePufhE/vxTJIGc3arQ02ww9C5vcMieMhtB6UoU/JV3c3Xbht/wH+yqfOQVumT1fKcSEJ
	p9w4qKj0w4OWDCZDQhnlr9WeULDZivyI3TN5b55ehz7TwUXR0j8ThmCcv1DzZv8sjDDQdHB+Ntukt
	4fzQ4rvklty//8lH6758UDnFCWngSMKc/VBRxPlIxfALQ+d59LYj9Wh28M0G9q6ZA+XuiB012Hu7Y
	ZD+yxwxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSS8-00000007nXf-1UQq;
	Mon, 11 Aug 2025 13:20:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSMH-00000007mik-0fLk
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Aug 2025 13:14:38 +0000
X-UUID: 1e4fa89e76b511f09f706fa2197c6ceb-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=s7EaqSjUTJkWLEmraz6TayVILgNp4Jq06m8bREO+Qjk=;
	b=Q92kci0+r/LrH0JYk6YF10GBngtpjw4XIT8ZVPk+/jwFmPYGDvZbr1UE2OuJFVBK/s4HfRB5xj1J8W/plXFCMsP1I3yP5x9aYevbJKQbORB1aFuUXWhzSvuTzlF1kVYU8b4PwsPssoqfy2SYJ1MyI79pXB1ah4c+Uq4hCN4nbBo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:f4bc9060-147e-4f1e-a6a1-22339446b55d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:99a549ce-1ac4-40cd-97d9-e8f32bab97d5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1e4fa89e76b511f09f706fa2197c6ceb-20250811
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 759403689; Mon, 11 Aug 2025 06:14:31 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 21:14:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 21:14:25 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v1 08/10] ufs: host: mediatek: Fix UniPro setting for MT6989
Date: Mon, 11 Aug 2025 21:11:24 +0800
Message-ID: <20250811131423.3444014-9-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250811131423.3444014-1-peter.wang@mediatek.com>
References: <20250811131423.3444014-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_061437_218477_AD689221 
X-CRM114-Status: GOOD (  11.65  )
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

From: Peter Wang <peter.wang@mediatek.com>

This patch sets the UniPro attribute 0xD09E[4] bit to enable the
1144 functions specifically for the MT6989 platform. This
adjustment ensures proper functionality and compatibility
with the MT6989 hardware.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index d9f582e3e72b..6db75683bbe8 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1475,6 +1475,7 @@ static int ufs_mtk_pre_link(struct ufs_hba *hba)
 {
 	int ret;
 	u32 tmp;
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
 	ufs_mtk_get_controller_version(hba);
 
@@ -1500,6 +1501,16 @@ static int ufs_mtk_pre_link(struct ufs_hba *hba)
 
 	ret = ufshcd_dme_set(hba, UIC_ARG_MIB(VS_SAVEPOWERCONTROL), tmp);
 
+	/* Enable the 1144 functions setting */
+	if (host->ip_ver == IP_VER_MT6989) {
+		ret = ufshcd_dme_get(hba, UIC_ARG_MIB(VS_DEBUGOMC), &tmp);
+		if (ret)
+			return ret;
+
+		tmp |= 0x10;
+		ret = ufshcd_dme_set(hba, UIC_ARG_MIB(VS_DEBUGOMC), tmp);
+	}
+
 	return ret;
 }
 static void ufs_mtk_post_link(struct ufs_hba *hba)
-- 
2.45.2


