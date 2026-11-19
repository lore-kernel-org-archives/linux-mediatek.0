Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2F0606A325
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 07:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S1BOgkUB;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=gczEOvsr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2OudAXJ6+F96OuHUO9W1vneOvlOFueMINifjqdXC0LQ=; b=S1BOgkUBmV4xQG
	vnjd231MJRq+26kYRO7czbFpo/c3K43GGWAYCNX4KdQipEW01WUQC3PFlp9Z4jskP27adY95hprC4
	AIbqYJ/L2clQhjkRmap1lMI4RnbNvIqbvmT0Zloq6SDP+2Ioo5v8+WeJY82aIaRuoqap/S6cnL+Hi
	uKT7PkVaCcLVmsAPouEoRGJgNMSLPaHjMB6P5/iouCnHxeKXyur51OQuvMRoNlm7FDZDov/nqhs6l
	ZE5wffWoglidsmitkINdXOfhOgbx8evmYq+/5M1xZ7uUOjPNxc41ylV7JIL1kBnNfREFFjMedgHR3
	jaM7vpds1fSUwSXxq/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwNj-0000000B3Aq-1yHR;
	Thu, 19 Nov 2026 07:16:31 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwNc-0000000B384-2Zci
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 07:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=gczEOvsr08e2K6/YnuTtrUv+WbtCBBKCO1yI51hiq+pxyEOZlgrw5ZcZmYqIIRbNbeCka8vgXJKCN
	 mU8omgUzO4Hnuf8Sv5XK5MIe8MNyRh0SE1IKU0bkLJsCXWpFWFj1N4RBDGMJRh0B6PWyqarOeNNAgX
	 IY5hWAfIlvWTLvt0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86afea23db8b-bb244;
	Thu, 19 Nov 2026 15:16:13 +0800 (CST)
X-RM-TRANSID: 2ee86afea23db8b-bb244
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56afea23a32d-f43a8;
	Thu, 19 Nov 2026 15:16:13 +0800 (CST)
X-RM-TRANSID: 2ee56afea23a32d-f43a8
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: peter.wang@mediatek.com,
	chaotian.jing@mediatek.com
Cc: chu.stanley@gmail.com,
	alim.akhtar@samsung.com,
	bvanassche@acm.org,
	stanley.chu@mediatek.com,
	sashiko-bot@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v3 1/2] scsi: ufs-mediatek: use devm_regulator_get() for the va09 regulator
Date: Thu, 19 Nov 2026 15:16:09 +0800
Message-ID: <20261119071611.117-2-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261119071611.117-1-laixiangwu@cmss.chinamobile.com>
References: <20261119071611.117-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_231625_676208_0B1A04D5 
X-CRM114-Status: GOOD (  14.14  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ufs_mtk_init_va09_pwr_ctrl() obtains the va09 regulator with
regulator_get() but the reference is never released with
regulator_put(), neither on driver unbind nor on probe failure. The
other regulators handled by this driver (dvfsrc-vcore) are already
obtained with devm_regulator_get_optional().

Use devm_regulator_get() so that the reference is released
automatically when the UFS device is detached.

This alone is not enough, though: ufs_mtk_init() powers the M-PHY on,
which enables the va09 regulator, and nothing powers it off again on
the way out -- the variant operations have no .exit callback and
ufshcd_pltfrm_remove() only resumes the device.  The devm release
would then hit WARN_ON(regulator->enable_count) in _regulator_put()
and leak the enable reference.

Balance the use count by adding an .exit callback which powers the
M-PHY off, in the same spirit as the .exit callbacks of ufs-exynos
and ufs-qcom.  ufshcd_hba_exit() invokes it both on driver unbind and
on ufshcd_init() failure after the variant init, so the enable count
is always balanced by the time devm releases the regulator.  It
relies on the state tracking in ufs_mtk_mphy_power_on() and is a
no-op if the M-PHY was never powered on.

Fixes: cf137b3ea49a ("scsi: ufs-mediatek: Support VA09 regulator operations")
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/ufs/host/ufs-mediatek.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

Changes in v3:
- none, the Reviewed-by tag received for v2 is kept.

Link: https://lore.kernel.org/r/20261118032015.974-2-laixiangwu@cmss.chinamobile.com/

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 5b6bff2cf..ebbc017d0 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -692,7 +692,7 @@ static void ufs_mtk_init_va09_pwr_ctrl(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	host->reg_va09 = regulator_get(hba->dev, "va09");
+	host->reg_va09 = devm_regulator_get(hba->dev, "va09");
 	if (IS_ERR(host->reg_va09))
 		dev_info(hba->dev, "failed to get va09");
 	else
@@ -1331,6 +1331,14 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	return err;
 }
 
+static void ufs_mtk_exit(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	if (host)
+		ufs_mtk_mphy_power_on(hba, false);
+}
+
 static int ufs_mtk_negotiate_pwr_mode(struct ufs_hba *hba,
 				      const struct ufs_pa_layer_attr *dev_max_params,
 				      struct ufs_pa_layer_attr *dev_req_params)
@@ -2353,6 +2361,7 @@ static void ufs_mtk_config_scsi_dev(struct scsi_device *sdev)
 static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.name                = "mediatek.ufshci",
 	.init                = ufs_mtk_init,
+	.exit                = ufs_mtk_exit,
 	.get_ufs_hci_version = ufs_mtk_get_ufs_hci_version,
 	.setup_clocks        = ufs_mtk_setup_clocks,
 	.hce_enable_notify   = ufs_mtk_hce_enable_notify,
-- 
2.50.1.windows.1




