Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FDFC2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 09:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rTcWd7Y+2uU+htlZ+Zs0y/k1MjeuEU+D5s5qrsCnvug=; b=c4gcE1zHtXtA3PqBXD9jyYsEKp
	UCemIUA32/aTrMl6uQFTGCfyvEIC1dBjvS23Spv6iRg6CVglWPcobvkxE5fs7oeO2LTRPAHSn7qI9
	uZ8es/yoqyc17LJp8pVwNe60r2ViZhYpIziFVdoG8Lg2catJym0yTiSUmKCAVTnjUv1n/MX4LQYp4
	/jtZQwgUR0AgmRQJe7kaqEm9mX/knjHMGfIkwaeBJ5yVH4Bj7j2z/hh4hmiLoRxx3NJCNGMCcIIPK
	LubQyZx/eGUMUgkJMfU2N2zHtXxNqz+m/CqObiETe5L7W2VpLiWAUr9r/r9piuQs/cD2QkUgZ8PrW
	CzNTcJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSD04-0000000HCLc-23St;
	Fri, 12 Jul 2024 09:55:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCzm-0000000HCFq-1HSX
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jul 2024 09:55:20 +0000
X-UUID: d511c106403411efa6c87f6b4542ff6b-20240712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rTcWd7Y+2uU+htlZ+Zs0y/k1MjeuEU+D5s5qrsCnvug=;
	b=DVn3TVNWgxFWZRxW+NZ19Gxv8ru2SoaMa8UvOuI/f7DgWye70LgJ1s1xcQpG3IA7IxJZZMrXJjQiJqF1DxQaNkHW5BffIn8oPBQTvY2UzSu+C3RbMgxp6nFumZoS2jdynBWIyC1iPvsZXWE7gQd5vUAFXSm4YpBJ2F2rhVNJoFw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:c987eb1f-53e9-4c8e-9e66-f39ca2a72fbb,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:ba885a6,CLOUDID:44b167d1-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d511c106403411efa6c87f6b4542ff6b-20240712
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 343081683; Fri, 12 Jul 2024 02:55:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Jul 2024 17:45:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Jul 2024 17:45:09 +0800
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
Subject: [PATCH v1] ufs: core: bypass quick recovery if need force reset
Date: Fri, 12 Jul 2024 17:45:06 +0800
Message-ID: <20240712094506.11284-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_025518_358224_3E340450 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

If force_reset is true, bypass quick recovery.
This will shorten error recovery time.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 46433ecf0c4d..357379ddd79a 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6545,7 +6545,8 @@ static void ufshcd_err_handler(struct work_struct *work)
 	if (ufshcd_err_handling_should_stop(hba))
 		goto skip_err_handling;
 
-	if (hba->dev_quirks & UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS) {
+	if ((hba->dev_quirks & UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS) &&
+	    !hba->force_reset) {
 		bool ret;
 
 		spin_unlock_irqrestore(hba->host->host_lock, flags);
-- 
2.18.0


