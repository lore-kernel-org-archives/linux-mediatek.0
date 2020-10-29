Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C13EC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:59:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4956207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:59:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DJMdfbMR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uI3j8bH2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4956207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gXQ+Deq7lKqRSbOzQWK/PV9ciJNg1clep2loELxsKpM=; b=DJMdfbMRpPZlBSze5od7LmEp9
	caypKWG8aQIsly2iM6vgIoSLSW8oqBhHD+2FJSgx1PG1NyIrHOKlfoi+J1drh0EgiEASpW+gI8Cjf
	028qglPpm3jFALdQxOdDh4BSiRO5mP73PmzNmlg30NLB6s1oUK1M398LdfrRW2RYmv3epPu4/7KxZ
	BpOFx0P8dgmvwYNEzNmKtrrhMcHwrf1NKQl13GAJqhVKVjg4An5KLVrsj3mbTzJxmxyeYo99ioZZN
	EdrJgyWBWiByeWmXF5tOvsHw7fQP96HC/jrx4uEHRZhCehnXwGhFeLKnk5dpYEwUYHE7dNmK/JTNf
	lB9icKiag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY6ai-0006BV-N5; Thu, 29 Oct 2020 11:59:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY6a7-0005uV-KR; Thu, 29 Oct 2020 11:59:05 +0000
X-UUID: eeb6cd4fe0b54cc799bf728cb42d26e3-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gfnnUMTukPN9nXUoJsTAgUclVQL2iOIkqnu56wZwVGs=; 
 b=uI3j8bH2+1Ucb/B2utCgrTp7X4vcQHa8IVYtwExoWdHzTWYwma/Ci1zEpeMI5/SwUKWNCxrlsCMhnkqRx6i3Vy6lwqmcmJu6x57BQvISbBjelUflWUfbgYYr3kway44GEudyrZ31+LyXAVAaNQGjAjLy2jGvsWfHXoDW4uNYNXg=;
X-UUID: eeb6cd4fe0b54cc799bf728cb42d26e3-20201029
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 964221206; Thu, 29 Oct 2020 03:57:54 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 04:57:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 19:57:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Oct 2020 19:57:51 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 6/6] scsi: ufs-mediatek: Add HS-G4 support
Date: Thu, 29 Oct 2020 19:57:50 +0800
Message-ID: <20201029115750.24391-7-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201029115750.24391-1-stanley.chu@mediatek.com>
References: <20201029115750.24391-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_075903_865733_FD6CCE29 
X-CRM114-Status: GOOD (  16.37  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 jiajie.hao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Provide HS-G4 support in MediaTek UFS platforms.

To support HS-G4, introduce mechanism to get the
MediaTek UFS controller version. With such information,
driver can make right decision to apply different
configurations in different controllers.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 32 ++++++++++++++++++++++++++++++++
 drivers/scsi/ufs/ufs-mediatek.h | 11 +++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index dda028ec30dc..1a355f519556 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -569,6 +569,24 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 	return ret;
 }
 
+static void ufs_mtk_get_controller_version(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	int ret, ver = 0;
+
+	if (host->hw_ver.major)
+		return;
+
+	/* Set default (minimum) version anyway */
+	host->hw_ver.major = 2;
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_LOCALVERINFO), &ver);
+	if (!ret) {
+		if (ver >= UFS_UNIPRO_VER_1_8)
+			host->hw_ver.major = 3;
+	}
+}
+
 /**
  * ufs_mtk_init - find other essential mmio bases
  * @hba: host controller instance
@@ -649,7 +667,9 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
 				  struct ufs_pa_layer_attr *dev_max_params,
 				  struct ufs_pa_layer_attr *dev_req_params)
 {
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct ufs_dev_params host_cap;
+	u32 adapt_val;
 	int ret;
 
 	host_cap.tx_lanes = UFS_MTK_LIMIT_NUM_LANES_TX;
@@ -674,6 +694,16 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
 			__func__);
 	}
 
+	if (host->hw_ver.major >= 3) {
+		if (dev_req_params->gear_tx == UFS_HS_G4)
+			adapt_val = PA_INITIAL_ADAPT;
+		else
+			adapt_val = PA_NO_ADAPT;
+		ufshcd_dme_set(hba,
+			       UIC_ARG_MIB(PA_TXHSADAPTTYPE),
+			       adapt_val);
+	}
+
 	return ret;
 }
 
@@ -724,6 +754,8 @@ static int ufs_mtk_pre_link(struct ufs_hba *hba)
 	int ret;
 	u32 tmp;
 
+	ufs_mtk_get_controller_version(hba);
+
 	ret = ufs_mtk_unipro_set_lpm(hba, false);
 	if (ret)
 		return ret;
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 30f45dfce04c..ac37b11803fb 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -35,8 +35,8 @@
  */
 #define UFS_MTK_LIMIT_NUM_LANES_RX  2
 #define UFS_MTK_LIMIT_NUM_LANES_TX  2
-#define UFS_MTK_LIMIT_HSGEAR_RX     UFS_HS_G3
-#define UFS_MTK_LIMIT_HSGEAR_TX     UFS_HS_G3
+#define UFS_MTK_LIMIT_HSGEAR_RX     UFS_HS_G4
+#define UFS_MTK_LIMIT_HSGEAR_TX     UFS_HS_G4
 #define UFS_MTK_LIMIT_PWMGEAR_RX    UFS_PWM_G4
 #define UFS_MTK_LIMIT_PWMGEAR_TX    UFS_PWM_G4
 #define UFS_MTK_LIMIT_RX_PWR_PWM    SLOW_MODE
@@ -107,6 +107,12 @@ struct ufs_mtk_crypt_cfg {
 	int vcore_volt;
 };
 
+struct ufs_mtk_hw_ver {
+	u8 step;
+	u8 minor;
+	u8 major;
+};
+
 struct ufs_mtk_host {
 	struct phy *mphy;
 	struct regulator *reg_va09;
@@ -115,6 +121,7 @@ struct ufs_mtk_host {
 	struct reset_control *crypto_reset;
 	struct ufs_hba *hba;
 	struct ufs_mtk_crypt_cfg *crypt;
+	struct ufs_mtk_hw_ver hw_ver;
 	enum ufs_mtk_host_caps caps;
 	bool mphy_powered_on;
 	bool unipro_lpm;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
