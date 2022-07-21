Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CC5C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 07:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rNgmD9FJXoTdnxHI+oJkblZHDGNhRdfWFgA4jAefM/0=; b=NXT0XGKDRuGzkHUyd2izi8kbyR
	6wXclclqA24+VeDhrJWYZQipJaGZrgFPbaku/utUxPYvjSaftvCkNN63ft1OyXzW33DfFOFasVOWd
	imwFoIpQK2g2LJK7lK2oouOehStXp3uUu5SDgQ7sn9Q+AFc+G5JZQkjw7DBcyWARwJWur0lP421yS
	FcN8ZO7fJ73PcoH9DHkvMgHhYpK7CsRCTOLfa5zZ3hiGl7D3SQnbvK/ZpqwS1ptDTNGbkDt6Ppskb
	OxlTGGgdG3VrICyYPsLl2iUW/8nYSFQejm9RTGzb+++BPAeRIaLu8NpWyBXi0SYGARdcHkZROZ6Xt
	YZQPTtww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEQVG-001iXb-OY; Thu, 21 Jul 2022 07:21:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEQVD-001iQo-Rz
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 07:21:45 +0000
X-UUID: 2b08f817193c4dd3932761bfae2bed42-20220721
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:c9d5079b-117a-42c0-ae3a-3d558ade8958,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:ac7e13d8-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 2b08f817193c4dd3932761bfae2bed42-20220721
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 724458014; Thu, 21 Jul 2022 00:21:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 21 Jul 2022 14:51:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jul 2022 14:51:02 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Subject: [PATCH v2] scsi: ufs: correct ufshcd_shutdown flow
Date: Thu, 21 Jul 2022 14:51:01 +0800
Message-ID: <20220721065101.26789-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_002143_928751_01B182B1 
X-CRM114-Status: GOOD (  11.54  )
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

Both ufshcd_shtdown and ufshcd_wl_shutdown could run concurrently.
And it have race condition when ufshcd_wl_shutdown on-going and
clock/power turn off by ufshcd_shutdown.

The normal case:
ufshcd_wl_shutdown -> ufshcd_shtdown
ufshcd_shtdown should turn off clock/power.

The abnormal case:
ufshcd_shtdown -> ufshcd_wl_shutdown
Wait ufshcd_wl_shutdown set device to power off and turn off clock/power.
If timeout happen, means device still in active mode, cannot turn off
clock/power directly. Skip and keep clock/power on in this case.

Also remove pm_runtime_get_sync because shutdown is focus on
turn off clock/power. We don't need turn on(resume) and turn off.
The second reason is ufshcd_wl_shutdown call ufshcd_rpm_get_sync
already, if ufshcd_shtdown wait ufshcd_wl_shutdown finish,
hba->dev is already resume and no need pm_runtime_get_sync.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index c7b337480e3e..533563a2a6b7 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -58,6 +58,9 @@
 /* Task management command timeout */
 #define TM_CMD_TIMEOUT	100 /* msecs */
 
+/* Shutdown wait devcie into power off timeout */
+#define UFS_SHUTDWON_TIMEOUT	500 /* msecs */
+
 /* maximum number of retries for a general UIC command  */
 #define UFS_UIC_COMMAND_RETRIES 3
 
@@ -9461,10 +9464,15 @@ EXPORT_SYMBOL(ufshcd_runtime_resume);
  */
 int ufshcd_shutdown(struct ufs_hba *hba)
 {
-	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba))
-		goto out;
+	unsigned long timeout;
 
-	pm_runtime_get_sync(hba->dev);
+	/* Wait ufshcd_wl_shutdown clear ufs state */
+	timeout = jiffies + msecs_to_jiffies(UFS_SHUTDWON_TIMEOUT);
+	while (!ufshcd_is_ufs_dev_poweroff(hba) || !ufshcd_is_link_off(hba)) {
+		if (time_after(jiffies, timeout))
+			goto out;
+		msleep(1);
+	}
 
 	ufshcd_suspend(hba);
 out:
-- 
2.18.0


