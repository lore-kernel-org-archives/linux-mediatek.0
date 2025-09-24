Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBD8CAC5B3
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpyMC+ep+sTappzx28K1ZXJgoWfl2iVo88rIY5JOS8I=; b=U0zixoNUVVZQ5GzNbrcw1vE251
	vIy3MU/SzN6zgs3tdxXJ6Nr1TS74ZVPp/khgyvO9ppw4z06WsWZGeH8R2it8xSYijXzHlDMKZWpE0
	TlvECx1eHBLTLDg4Hlq3ANJNkUYCnbqJCacYFRwA/zq8y9wQ+Yiu5u8KPzHv5Hw5NxnfPmTuC6eXr
	cyxbms7Z+Sa5oV4XqlbN/jg36u9rY4zlWMB/bM5Yh38g4Wnry915Lk0+Osm93Np6TGayiaTOn2uEZ
	Wn5hjkOIfCyNg3Cpx6PEWa5IEcwPQvTIwBoLMgYAU+eZmd4hW6MlZOKG+KcZMDrBGvgZIu8wUuKty
	04rzJAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M4L-0000000GB0Z-3XNd;
	Wed, 24 Sep 2025 09:45:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M4C-0000000GAhu-19JP
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 09:45:43 +0000
X-UUID: 37f608f4992b11f09f706fa2197c6ceb-20250924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UpyMC+ep+sTappzx28K1ZXJgoWfl2iVo88rIY5JOS8I=;
	b=lE9tadoVqTDf3T27W5jJMnoWz/4QCTn2IJpyRFZ4ZIL/iVn6zakCs2xW/gLAZhPDeULnzO95evfrdqnau/VabGzoUHeQ4OlqSR9DVwSEuN7FhrZu7WzhGq/IzA6stDogBwxyQj1EEwWOzCFeqUh69gmntyGRTVCv8LUfX56Jq6w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:4a0af465-9ad3-48ea-927e-64e3a1b4635e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:2a3ce56c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 37f608f4992b11f09f706fa2197c6ceb-20250924
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 41694203; Wed, 24 Sep 2025 02:45:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 24 Sep 2025 17:45:29 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 24 Sep 2025 17:45:29 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v2 8/8] ufs: host: mediatek: Support new feature for MT6991
Date: Wed, 24 Sep 2025 17:43:30 +0800
Message-ID: <20250924094527.2992256-9-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250924094527.2992256-1-peter.wang@mediatek.com>
References: <20250924094527.2992256-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_024540_406698_B1001317 
X-CRM114-Status: GOOD (  11.32  )
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

From: Naomi Chu <naomi.chu@mediatek.com>

Add support for the MT6991 platform by enabling MRTT settings
and random performance improvements. These enhancements aim
to optimize performance and efficiency on the MT6991 hardware.

Enable multi-Round Trip Time (MRTT) for improved data handling.
Enable random performance improvement features to boost
overall system responsiveness.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Naomi Chu <naomi.chu@mediatek.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 6 ++++++
 drivers/ufs/host/ufs-mediatek.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 8498e95e263a..eee56f5aed30 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -289,6 +289,12 @@ static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
 				0x453000, REG_UFS_MMIO_OPT_CTRL_0);
 		}
 
+		if (host->ip_ver >= IP_VER_MT6991_A0) {
+			/* Enable multi-rtt */
+			ufshcd_rmwl(hba, MRTT_EN, MRTT_EN, REG_UFS_MMIO_OPT_CTRL_0);
+			/* Enable random performance improvement */
+			ufshcd_rmwl(hba, RDN_PFM_IMPV_DIS, 0, REG_UFS_MMIO_OPT_CTRL_0);
+		}
 	}
 
 	return 0;
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index f96fd032371d..9747277f11e8 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -20,6 +20,9 @@
 #define MCQ_MULTI_INTR_EN       BIT(2)
 #define MCQ_CMB_INTR_EN         BIT(3)
 #define MCQ_AH8                 BIT(4)
+#define MON_EN                  BIT(5)
+#define MRTT_EN                 BIT(25)
+#define RDN_PFM_IMPV_DIS        BIT(28)
 
 #define MCQ_INTR_EN_MSK         (MCQ_MULTI_INTR_EN | MCQ_CMB_INTR_EN)
 
-- 
2.45.2


