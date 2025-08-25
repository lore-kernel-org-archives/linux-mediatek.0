Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14408CA0FEB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 11:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qRYWUXTgS4YKm3AyVWYG0syxcRZyMFivXbEJrDk9mA=; b=S26EZjjN437ObY23BV2m961sAX
	1bsXN/2JVpZ+TgXvt6DF22PjU29EYvxY6ppfG+k/rf+oklaHd9ygl32nj1XefZcEvN/5Y++DVSL6/
	LWpV7qjM5cBb2ba+dmWJPpqVlFY2W86WfVjaRzX1JJlpriQSGPmywDruW5uaM+fd0X2PVF4ypBljX
	s3LN9uD/itSfV71ouSGT27xhY9bQpic9zcQ8Of8DotfJlDGQhb1yb3j38RGgqPQvAZBsuXjqOrc/m
	BVRVOG1lAPGjb+jD51VNUF24/vPr9O3wZCI8Mhn+jOA+KPNWPtzJod63ov92gTc65qvraRl01BID5
	tm+m27cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVac-00000007nmH-0dyS;
	Mon, 25 Aug 2025 11:42:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqUHS-00000007c7w-0GY3
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Aug 2025 10:18:27 +0000
X-UUID: d2cdf9f0819c11f09eb0dd999d3936bf-20250825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1qRYWUXTgS4YKm3AyVWYG0syxcRZyMFivXbEJrDk9mA=;
	b=JmVPkS5Anx22Ue7x0rER9w1x7UEba7XC8xHpHIq9nc1ej0k3aN95i2gABhzU9cr0DiebgwS1a9TFBx2vAkE4iHY50bbR2Oe8sF9rt6u2IGY4LSDdvbUbtz29UhyLfRcl/8MiMqDsZpthuVRYAgTL4le5HFAj8/EpQesa3/Bt1z0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:b0af9a91-5d48-4ed8-ad0f-40ef15a368da,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:14e47f7a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d2cdf9f0819c11f09eb0dd999d3936bf-20250825
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 442812588; Mon, 25 Aug 2025 03:18:20 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 25 Aug 2025 18:18:17 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 25 Aug 2025 18:18:17 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <sanjeev.y@mediatek.com>
Subject: [PATCH v1 01/10] ufs: host: mediatek: Enhance recovery on hibernation exit failure
Date: Mon, 25 Aug 2025 18:10:09 +0800
Message-ID: <20250825101815.2891905-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250825101815.2891905-1-peter.wang@mediatek.com>
References: <20250825101815.2891905-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_031826_123080_962F67A5 
X-CRM114-Status: GOOD (  12.08  )
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

This patch improves the recovery process when exiting hibernation
mode fails. It triggers the error handler and breaks the suspend
operation, ensuring that the system can recover from hibernation
errors more effectively. The error handling mechanism is activated
by setting 'force_reset' and scheduling the error handler work.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 5ef0ba4527e4..3882bcc85305 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1686,8 +1686,9 @@ static void ufs_mtk_dev_vreg_set_lpm(struct ufs_hba *hba, bool lpm)
 	}
 }
 
-static void ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
+static int ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
 {
+	unsigned long flags;
 	int ret;
 
 	/* disable auto-hibern8 */
@@ -1697,8 +1698,20 @@ static void ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
 	ufs_mtk_wait_idle_state(hba, 5);
 
 	ret = ufs_mtk_wait_link_state(hba, VS_LINK_UP, 100);
-	if (ret)
+	if (ret) {
 		dev_warn(hba->dev, "exit h8 state fail, ret=%d\n", ret);
+
+		spin_lock_irqsave(hba->host->host_lock, flags);
+		hba->force_reset = true;
+		hba->ufshcd_state = UFSHCD_STATE_EH_SCHEDULED_FATAL;
+		schedule_work(&hba->eh_work);
+		spin_unlock_irqrestore(hba->host->host_lock, flags);
+
+		/* trigger error handler and break suspend */
+		ret = -EBUSY;
+	}
+
+	return ret;
 }
 
 static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
@@ -1709,7 +1722,7 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 
 	if (status == PRE_CHANGE) {
 		if (ufshcd_is_auto_hibern8_supported(hba))
-			ufs_mtk_auto_hibern8_disable(hba);
+			return ufs_mtk_auto_hibern8_disable(hba);
 		return 0;
 	}
 
-- 
2.45.2


