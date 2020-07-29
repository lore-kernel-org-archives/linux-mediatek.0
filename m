Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCBCC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 05:29:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A02D02070B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 05:29:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B5dCvXcN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kMAixCiS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A02D02070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+cOP2PUE7OSK/QKSnx78sPSnj6x8v4yVesZ2D0h4v8Y=; b=B5dCvXcNVVfJ6tfGbEHYU7h+V
	kAYk7ASo2Tp8Rvp7ABFA/pyjfZBZVg8HMiN0CsUvJiGr/SeXuMaOLH09bISeLadGyEbnrmqr55f2E
	28LM6P/gaVog3pPaSl45uTkZVPwPvPcd6KQnBUHf8iKgBvEXNq4ipX8Zy+0U5DXfpxjdozI70dsSu
	tqMcOZQKe4L7O17wNFsqT73cO4toRRl4kv4CuUgG9G0Sisfms2x19uCqaWeKz3Sb5igudK2WCjWn8
	aWWCBfAd1XrbtunWXZuOlB4sZsksYQvbwvO6sKTTK0f3Tpfz3PfzhYAVRViWhlWm2Br5c+5Wxtq0p
	sBVp/4fTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0eeE-00058Y-4q; Wed, 29 Jul 2020 05:29:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0ee8-00057V-Hi; Wed, 29 Jul 2020 05:28:58 +0000
X-UUID: 506d678244d6464aa22c3af37d386450-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AiW8oR0hft7D4lqwhgoiimjhk6Sk5LoavMLolAc9+uE=; 
 b=kMAixCiS+/p1KXt1K1WXEZdN5icS/7d/+Q05fBuS4NUMeqRsR667H0V32ff3mcABeWMM44IJYhCIpCpedZndvE8Q/FCL8fMp/iUDsaoieu1OI9VnTTjHQ9k4JVyIiUEIJ6bR4ymf6j8tQN/Uo0Bd2lsh2CEfjwUEiuaLwC4YD7Q=;
X-UUID: 506d678244d6464aa22c3af37d386450-20200728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 153044587; Tue, 28 Jul 2020 21:28:52 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 22:18:50 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 13:18:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 29 Jul 2020 13:18:37 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <beanhuo@micron.com>
Subject: [PATCH v1 1/2] scsi: ufs: Introduce device quirk "DELAY_AFTER_LPM"
Date: Wed, 29 Jul 2020 13:18:39 +0800
Message-ID: <20200729051840.31318-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200729051840.31318-1-stanley.chu@mediatek.com>
References: <20200729051840.31318-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0D04A94861386952C8B68E824B73A7255AEB99E12A9CBFEE23563D1A21504EC12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_012857_099164_716E0E9B 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some UFS devices require delay after VCC power rail is turned-off.
Introduce a device quirk "DELAY_AFTER_LPM" to add 5ms delays after
VCC power-off during suspend flow.

Signed-off-by: Andy Teng <andy.teng@mediatek.com>
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs_quirks.h |  7 +++++++
 drivers/scsi/ufs/ufshcd.c     | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/scsi/ufs/ufs_quirks.h b/drivers/scsi/ufs/ufs_quirks.h
index 2a0041493e30..07f559ac5883 100644
--- a/drivers/scsi/ufs/ufs_quirks.h
+++ b/drivers/scsi/ufs/ufs_quirks.h
@@ -109,4 +109,11 @@ struct ufs_dev_fix {
  */
 #define UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES (1 << 10)
 
+/*
+ * Some UFS devices require delay after VCC power rail is turned-off.
+ * Enable this quirk to introduce 5ms delays after VCC power-off during
+ * suspend flow.
+ */
+#define UFS_DEVICE_QUIRK_DELAY_AFTER_LPM        (1 << 11)
+
 #endif /* UFS_QUIRKS_H_ */
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index acba2271c5d3..63f4e2f75aa1 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -8111,6 +8111,8 @@ static int ufshcd_link_state_transition(struct ufs_hba *hba,
 
 static void ufshcd_vreg_set_lpm(struct ufs_hba *hba)
 {
+	bool vcc_off = false;
+
 	/*
 	 * It seems some UFS devices may keep drawing more than sleep current
 	 * (atleast for 500us) from UFS rails (especially from VCCQ rail).
@@ -8139,13 +8141,22 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba *hba)
 	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba) &&
 	    !hba->dev_info.is_lu_power_on_wp) {
 		ufshcd_setup_vreg(hba, false);
+		vcc_off = true;
 	} else if (!ufshcd_is_ufs_dev_active(hba)) {
 		ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
+		vcc_off = true;
 		if (!ufshcd_is_link_active(hba)) {
 			ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq);
 			ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq2);
 		}
 	}
+
+	/*
+	 * Some UFS devices require delay after VCC power rail is turned-off.
+	 */
+	if (vcc_off && hba->vreg_info.vcc &&
+		hba->dev_quirks & UFS_DEVICE_QUIRK_DELAY_AFTER_LPM)
+		usleep_range(5000, 5100);
 }
 
 static int ufshcd_vreg_set_hpm(struct ufs_hba *hba)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
