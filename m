Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6E4C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 07:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OQ+cHSQAYnGpIiu2SoxX8OpToenxZ8edoLlPHRwy2o=; b=lkOaP9rtnuBd1TZWZhPwnuOM2O
	nHM9LEV22IB9BCRV1wMuJfO41+X3lCB05QzgQDGrmwn3Ee1ThGSeTCiRDc7G/Rrp1Bq1FvLNJF8LA
	M4MG5iDLKu5P6fPfn+wpNPm+DrwGEsLQuBreduoAKJrvCcQxwKPkJeNzh1YubfQCn0cL+0hOpalLS
	eY/0SzOBpZ5Yn/1s5EpQErIks20qLG2qHQKTWjLzGqyHWyjcU/GgOLffWdbaQ2YkK+q02aMowjOAr
	iGEg15qPYCgeCkK0EAot3Vy3gLwaEmamyM6nsyv6dR6wPSiFbm2O5XolR4NngRz7+wsboXRMwJFo8
	e2jQV3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUGP-000000084HH-2uqA;
	Fri, 08 Mar 2024 07:03:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUGM-000000084D3-1JrJ
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Mar 2024 07:03:27 +0000
X-UUID: f21be82cdd1911eebe6b57d01cc416d2-20240308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5OQ+cHSQAYnGpIiu2SoxX8OpToenxZ8edoLlPHRwy2o=;
	b=tXn4xqDg9mFd1czdGWQ3xEaqpA1S6io0B1w5l62K8PHsiJYfyoADjbRIWnJXC/3VqO9gy96uZj5YOybfOjIXHLc7CS212XTCPc7WOspFIe3boE61JX+qY1TaOBOGdAjdRYpBDu+xhJXtoAY3rhSu3UR2elwFu5vv6Qt9cPeI47g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:3aff2253-aa7a-455e-b0ba-eb3393af8eb9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-55
X-CID-META: VersionHash:6f543d0,CLOUDID:43f0c384-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f21be82cdd1911eebe6b57d01cc416d2-20240308
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 479038917; Fri, 08 Mar 2024 00:03:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Mar 2024 15:02:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Mar 2024 15:02:43 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>
Subject: [PATCH v1 3/7] ufs: host: mediatek: Add UFS_MTK_CAP_DISABLE_MCQ
Date: Fri, 8 Mar 2024 15:02:37 +0800
Message-ID: <20240308070241.9163-4-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240308070241.9163-1-peter.wang@mediatek.com>
References: <20240308070241.9163-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.664600-8.000000
X-TMASE-MatchedRID: eim6YYjnci0MQLXc2MGSbNIKqYKXY3SWMZm0+sEE9mtnnK6mXN72myCX
	Mf8jB8MxNF7ugkXaLcairLZc9CxEZNLDec/x7CA8H5YQyOg71ZZMkOX0UoduuQqiCYa6w8tvlUN
	mxPSthYIULfbRmZ/onHhbWkjJzPSiFm2HuAZVgfZfwzQfOH01PDJcsSAcBZLamyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1NvlZHTMWqVxPZ6n/jSr7LVNOTDMCNRY2lJms31GF30kR7M+mkS6mNg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.664600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F505CFF517C54E71D043184C7A7E5DD743EAE2BE6E58E62FB7900B28F3D242BB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_230326_475791_49B3171F 
X-CRM114-Status: GOOD (  11.85  )
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

From: Po-Wen Kao <powen.kao@mediatek.com>

Add new mediatek host cap UFS_MTK_CAP_DISABLE_MCQ to allow disable
MCQ feature by assigning dts boolean property
"mediatek,ufs-disable-mcq""

Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 12 ++++++++++++
 drivers/ufs/host/ufs-mediatek.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 0262e8994236..cdf29cfa490b 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -640,6 +640,9 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 	if (of_property_read_bool(np, "mediatek,ufs-tx-skew-fix"))
 		host->caps |= UFS_MTK_CAP_TX_SKEW_FIX;
 
+	if (of_property_read_bool(np, "mediatek,ufs-disable-mcq"))
+		host->caps |= UFS_MTK_CAP_DISABLE_MCQ;
+
 	dev_info(hba->dev, "caps: 0x%x", host->caps);
 }
 
@@ -874,6 +877,9 @@ static void ufs_mtk_init_mcq_irq(struct ufs_hba *hba)
 	host->mcq_nr_intr = UFSHCD_MAX_Q_NR;
 	pdev = container_of(hba->dev, struct platform_device, dev);
 
+	if (host->caps & UFS_MTK_CAP_DISABLE_MCQ)
+		goto failed;
+
 	for (i = 0; i < host->mcq_nr_intr; i++) {
 		/* irq index 0 is legacy irq, sq/cq irq start from index 1 */
 		irq = platform_get_irq(pdev, i + 1);
@@ -1585,6 +1591,12 @@ static int ufs_mtk_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 
 static int ufs_mtk_get_hba_mac(struct ufs_hba *hba)
 {
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	/* MCQ operation not permitted */
+	if (host->caps & UFS_MTK_CAP_DISABLE_MCQ)
+		return -EPERM;
+
 	return MAX_SUPP_MAC;
 }
 
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 146c25080599..79c64de25254 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -143,6 +143,7 @@ enum ufs_mtk_host_caps {
 	UFS_MTK_CAP_ALLOW_VCCQX_LPM            = 1 << 5,
 	UFS_MTK_CAP_PMC_VIA_FASTAUTO           = 1 << 6,
 	UFS_MTK_CAP_TX_SKEW_FIX                = 1 << 7,
+	UFS_MTK_CAP_DISABLE_MCQ                = 1 << 8,
 };
 
 struct ufs_mtk_crypt_cfg {
-- 
2.18.0


