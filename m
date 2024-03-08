Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D482C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 07:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N778AJpRMgve8cWD/XrKvFFXVXW0C9lfolM4GaK/MX8=; b=S04x8Hq+LQXXyAWgO0FrtI19dE
	VOxl7qFckMf2Cg6eSetwZMIlRpnfO9JcgYAri7VA367fpq7e27l/20mKQTzhG3TmV83lddjsBCBWW
	YJLI8MglAMle61k4w6+kYsuSA5Wem6+yHOIin+lpDLzGdHq8iSFKRtQP/+Kx9NnoSA2z9UCSoWUW7
	8FQknNxe1KWVzrEY+lyCTgkRmBy2omu4mXVpLR1sBFb+m6Witr1YnIOw6CqdIRyboGg8TEYulfXtr
	RI1iOIDdJFm9omGwMqWnpXBsxPC840Jf2uvgTYMhJqY4M4zghdCeFAe7MIuxfGA2OUU8bOnN1g8ou
	AyqCRnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUGe-000000084RJ-2RLv;
	Fri, 08 Mar 2024 07:03:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUGO-000000084Fk-12qP
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Mar 2024 07:03:32 +0000
X-UUID: f29e631add1911eebe6b57d01cc416d2-20240308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=N778AJpRMgve8cWD/XrKvFFXVXW0C9lfolM4GaK/MX8=;
	b=T/9HGnRFhXHVhIiQRnHCGQkMlM4nl4PhvKYTUeUJM8cZXyJ1CsLui7CMbBKI7lTbZFZ49Qf3aElefOYL2QVjRO3feSjYHHS9AT+6PD6ymqgKYvxgghKgtr+/0Lq8wsd/mbeEI504s8LGo1M4W0LxItBxoGPJBPSMJBf0SGe6WK8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:d045cdf5-d635-4435-a193-a33dc87d91fa,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:259ca8ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f29e631add1911eebe6b57d01cc416d2-20240308
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 156025585; Fri, 08 Mar 2024 00:03:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Mar 2024 15:02:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Mar 2024 15:02:44 +0800
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
Subject: [PATCH v1 6/7] ufs: host: mediatek: support mphy reset
Date: Fri, 8 Mar 2024 15:02:40 +0800
Message-ID: <20240308070241.9163-7-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240308070241.9163-1-peter.wang@mediatek.com>
References: <20240308070241.9163-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.972300-8.000000
X-TMASE-MatchedRID: n/G9Jfep/EYMQLXc2MGSbHTnOygHVQpOKx5ICGp/WtE1LB46LFAAklO4
	BD7nLMxnlTJXKqh1ne0FNz4MVU+iBPDZOKmFLlvIVU3yVpaj3Qz0O7M3lSnTWxqB+wKK9uZeQmZ
	9+1UBYL38s+61e4dE7OM+w5me8ld4HxPMjOKY7A8LbigRnpKlKZx+7GyJjhAU6u76WgiZPDHnj2
	S4Kzfr7xOslDYg/c8V/LdKyN68cgGJNS65aPKWYGRgKB1mKomnyr4tqBPPwhgAhj6bO2eSuLmOX
	U+S9eQVSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euI+kK598Yf3Mg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.972300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 95417DEAAD097AF72C600FC3E193712D468A8B8A415A8C72E32EAE204B3EC4372000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_230328_599492_2DC06E7B 
X-CRM114-Status: GOOD (  14.80  )
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

This patch will reset mphy when host reset.
Backup mphy setting after mphy reset control get.
Restore mphy setting after mphy reset.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek-sip.h |  9 ++++++++-
 drivers/ufs/host/ufs-mediatek.c     | 14 ++++++++++++++
 drivers/ufs/host/ufs-mediatek.h     |  1 +
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek-sip.h b/drivers/ufs/host/ufs-mediatek-sip.h
index fd640846910a..64f48ecc54c7 100755
--- a/drivers/ufs/host/ufs-mediatek-sip.h
+++ b/drivers/ufs/host/ufs-mediatek-sip.h
@@ -19,7 +19,7 @@
 #define UFS_MTK_SIP_SRAM_PWR_CTRL         BIT(5)
 #define UFS_MTK_SIP_GET_VCC_NUM           BIT(6)
 #define UFS_MTK_SIP_DEVICE_PWR_CTRL       BIT(7)
-
+#define UFS_MTK_SIP_MPHY_CTRL             BIT(8)
 
 /*
  * Multi-VCC by Numbering
@@ -31,6 +31,10 @@ enum ufs_mtk_vcc_num {
 	UFS_VCC_MAX
 };
 
+enum ufs_mtk_mphy_op {
+	UFS_MPHY_BACKUP = 0,
+	UFS_MPHY_RESTORE
+};
 
 /*
  * SMC call wrapper function
@@ -80,4 +84,7 @@ static inline void _ufs_mtk_smc(struct ufs_mtk_smc_arg s)
 #define ufs_mtk_device_pwr_ctrl(on, ufs_version, res) \
 	ufs_mtk_smc(UFS_MTK_SIP_DEVICE_PWR_CTRL, &(res), on, ufs_version)
 
+#define ufs_mtk_mphy_ctrl(op, res) \
+	ufs_mtk_smc(UFS_MTK_SIP_MPHY_CTRL, &(res), op)
+
 #endif /* !_UFS_MEDIATEK_SIP_H */
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 2caf0c1d4e17..c4aae031b694 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -185,16 +185,23 @@ static void ufs_mtk_crypto_enable(struct ufs_hba *hba)
 static void ufs_mtk_host_reset(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	struct arm_smccc_res res;
 
 	reset_control_assert(host->hci_reset);
 	reset_control_assert(host->crypto_reset);
 	reset_control_assert(host->unipro_reset);
+	reset_control_assert(host->mphy_reset);
 
 	usleep_range(100, 110);
 
 	reset_control_deassert(host->unipro_reset);
 	reset_control_deassert(host->crypto_reset);
 	reset_control_deassert(host->hci_reset);
+	reset_control_deassert(host->mphy_reset);
+
+	/* restore mphy setting aftre mphy reset */
+	if (host->mphy_reset)
+		ufs_mtk_mphy_ctrl(UFS_MPHY_RESTORE, res);
 }
 
 static void ufs_mtk_init_reset_control(struct ufs_hba *hba,
@@ -219,6 +226,8 @@ static void ufs_mtk_init_reset(struct ufs_hba *hba)
 				   "unipro_rst");
 	ufs_mtk_init_reset_control(hba, &host->crypto_reset,
 				   "crypto_rst");
+	ufs_mtk_init_reset_control(hba, &host->mphy_reset,
+				   "mphy_rst");
 }
 
 static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
@@ -918,6 +927,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	struct device *dev = hba->dev;
 	struct ufs_mtk_host *host;
 	int err = 0;
+	struct arm_smccc_res res;
 
 	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
 	if (!host) {
@@ -946,6 +956,10 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	ufs_mtk_init_reset(hba);
 
+	/* backup mphy setting if mphy can reset */
+	if (host->mphy_reset)
+		ufs_mtk_mphy_ctrl(UFS_MPHY_BACKUP, res);
+
 	/* Enable runtime autosuspend */
 	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
 
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 17be3f748fa0..6129ab59e5f5 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -166,6 +166,7 @@ struct ufs_mtk_host {
 	struct reset_control *hci_reset;
 	struct reset_control *unipro_reset;
 	struct reset_control *crypto_reset;
+	struct reset_control *mphy_reset;
 	struct ufs_hba *hba;
 	struct ufs_mtk_crypt_cfg *crypt;
 	struct ufs_mtk_clk mclk;
-- 
2.18.0


