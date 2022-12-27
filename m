Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0F9C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 12:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZCJkM2jLlHHVNBnvCfLwUO1eph79cbGiblmSJiL3t8=; b=ezOFnJurgmTb/RJVsViSB16tk+
	CC3pgObtOAgtD5/hByqEDWzBa0QIZcRRsCfj+wMnhAzdQEYP3mr7iRr1UbonRNs8W+q0XQMwHJge+
	m29/A2GCnmQjLiYTM0K7qm/LeZwTE9JrsB14gsh7n7xJ+Q0GAYOLVmOuJHDd844+3rLbUVmr4DV/U
	JEL7WEle5px+w1IvPAN9KSK4ps9sqGor4kCdQeaH4Tbs4nvUkjOX1rLo6I2GChwVjOjN3/iyh4fwZ
	V9chbwP1R6ldeaBxO0BRKY/2mnLrLwEs8WhBBLVoIHEQk8eQ7JycskTC9Ik2cHK+MwUnM4GK9lruP
	NhyMK8nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8oP-00CjmR-5Q; Tue, 27 Dec 2022 12:12:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA8n0-00Cj7W-Am; Tue, 27 Dec 2022 12:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tZCJkM2jLlHHVNBnvCfLwUO1eph79cbGiblmSJiL3t8=; b=LQ61XKIhYWdiobxEbpOnoDTdDy
	31aiSk6uSOYz2/uSRqbY7O+2EuBbbHL8vP83RqpiPfj/5Q8nsfsqlgO/kuOrrsu49WfswoJUR1ZHm
	xm05hIqIq5mHwHjaIrktSj19MruDjmj7yHT4BMTrgiN6Nhggjids/Iz58M5ZLmNYmmgZ7Rrs/qFu9
	Hz0lJklRYYvRBQPcOeKLyUE3NLZK6JqtGIr2jYH0RFRoTuLFvM3tg580sUkxkArkX63Eh9kNFYL6x
	CaTg6W6N/3aMDheqdMoxiprwLFLmUeYVO8nGa9c6Mjen5MzLw6k8hl+KFOYZIBNCX6VUviXh9jNrI
	kp59wzTw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pA8ms-00FdM3-1I;
	Tue, 27 Dec 2022 12:10:33 +0000
X-UUID: 02865d5e2afd49888ff91585bacb0c2e-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tZCJkM2jLlHHVNBnvCfLwUO1eph79cbGiblmSJiL3t8=;
	b=oBVIOBaRIV1GTTjiZTUUvYpU0Zc5mvF8GGxZl5pnbAKDjREfKgXMJOVP03eiTEqkGQM94bfxHtbEFiFKV6PFONsrHORodHhKCwaGigN5sTkQNTfSO2tpStKJ1R/BqaclvISxxmmMHR1OS7eX/FQl24gDzJ2nN6kyVbtwhaLcPeU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:f141708f-4cc9-4c21-baf0-a0d72e328c5c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.14,REQID:f141708f-4cc9-4c21-baf0-a0d72e328c5c,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:dcaaed0,CLOUDID:a49dee52-dd49-462e-a4be-2143a3ddc739,B
	ulkID:221227200922RO0PBLKX,BulkQuantity:2,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 02865d5e2afd49888ff91585bacb0c2e-20221227
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2037341860; Tue, 27 Dec 2022 05:09:54 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Dec 2022 20:09:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Dec 2022 20:09:18 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 10/13] soc: mediatek: mtk-svs: use common function to disable restore voltages
Date: Tue, 27 Dec 2022 20:09:11 +0800
Message-ID: <20221227120914.11346-11-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221227120914.11346-1-roger.lu@mediatek.com>
References: <20221227120914.11346-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_121031_193312_839A3B29 
X-CRM114-Status: GOOD (  13.81  )
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

The timing of disabling SVS bank and restore default voltage is more than
one place. Therefore, add a common function to use for removing the superfluous
codes.

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 44 +++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index ee663cfd4483..6cda1e93c77a 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -651,6 +651,26 @@ static int svs_adjust_pm_opp_volts(struct svs_bank *svsb)
 	return ret;
 }
 
+static void svs_bank_disable_and_restore_default_volts(struct svs_platform *svsp,
+						       struct svs_bank *svsb)
+{
+	unsigned long flags;
+
+	if (svsb->mode_support == SVSB_MODE_ALL_DISABLE)
+		return;
+
+	/* This spinlock might wait for svs_isr() process */
+	spin_lock_irqsave(&svs_lock, flags);
+	svsp->pbank = svsb;
+	svs_switch_bank(svsp);
+	svs_writel_relaxed(svsp, SVSB_PTPEN_OFF, SVSEN);
+	svs_writel_relaxed(svsp, SVSB_INTSTS_VAL_CLEAN, INTSTS);
+	spin_unlock_irqrestore(&svs_lock, flags);
+
+	svsb->phase = SVSB_PHASE_ERROR;
+	svs_adjust_pm_opp_volts(svsb);
+}
+
 static int svs_dump_debug_show(struct seq_file *m, void *p)
 {
 	struct svs_platform *svsp = (struct svs_platform *)m->private;
@@ -726,7 +746,6 @@ static ssize_t svs_enable_debug_write(struct file *filp,
 {
 	struct svs_bank *svsb = file_inode(filp)->i_private;
 	struct svs_platform *svsp = dev_get_drvdata(svsb->dev);
-	unsigned long flags;
 	int enabled, ret;
 	char *buf = NULL;
 
@@ -742,16 +761,8 @@ static ssize_t svs_enable_debug_write(struct file *filp,
 		return ret;
 
 	if (!enabled) {
-		spin_lock_irqsave(&svs_lock, flags);
-		svsp->pbank = svsb;
+		svs_bank_disable_and_restore_default_volts(svsp, svsb);
 		svsb->mode_support = SVSB_MODE_ALL_DISABLE;
-		svs_switch_bank(svsp);
-		svs_writel_relaxed(svsp, SVSB_PTPEN_OFF, SVSEN);
-		svs_writel_relaxed(svsp, SVSB_INTSTS_VAL_CLEAN, INTSTS);
-		spin_unlock_irqrestore(&svs_lock, flags);
-
-		svsb->phase = SVSB_PHASE_ERROR;
-		svs_adjust_pm_opp_volts(svsb);
 	}
 
 	kfree(buf);
@@ -1568,7 +1579,6 @@ static int svs_suspend(struct device *dev)
 {
 	struct svs_platform *svsp = dev_get_drvdata(dev);
 	struct svs_bank *svsb;
-	unsigned long flags;
 	int ret;
 	u32 idx;
 
@@ -1580,17 +1590,7 @@ static int svs_suspend(struct device *dev)
 
 	for (idx = 0; idx < svsp->bank_max; idx++) {
 		svsb = &svsp->banks[idx];
-
-		/* This might wait for svs_isr() process */
-		spin_lock_irqsave(&svs_lock, flags);
-		svsp->pbank = svsb;
-		svs_switch_bank(svsp);
-		svs_writel_relaxed(svsp, SVSB_PTPEN_OFF, SVSEN);
-		svs_writel_relaxed(svsp, SVSB_INTSTS_VAL_CLEAN, INTSTS);
-		spin_unlock_irqrestore(&svs_lock, flags);
-
-		svsb->phase = SVSB_PHASE_ERROR;
-		svs_adjust_pm_opp_volts(svsb);
+		svs_bank_disable_and_restore_default_volts(svsp, svsb);
 	}
 
 	ret = reset_control_assert(svsp->rst);
-- 
2.18.0


