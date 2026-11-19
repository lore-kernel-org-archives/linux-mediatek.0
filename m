Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1153606A324
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 07:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v+aAWP4m;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=sqjBq9lL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bQFs6QcycdODAlRkXP22avEkZfPGNEYE6AJIhhJv7Hw=; b=v+aAWP4mBTo6U+
	6qE9kG/kMVPHx9O31H/l/TSFanIDSR1PqsnaL9CMnvdLjJLhfzdef7ZLZOhChP4xVsYECQNtEWBSL
	zUCvDTjbUhOJCybHxZEnvI01CvyAtUied26/CcVDdv7iXAcm2HQyY+27gpzabeylFqrWXcYSiKTQD
	xttZpBqew2XaK/x4Z+w5qx+Y74BXCF1vutKVWE6t2/Z4ivfLZ1+bKOP0+Fc0zsLb+7tV/zU735Lo9
	aafuCPiaisvnmCi/4G3nvCYfWVPFzcIHEa6Uh6iUj3LNHeOwFpyG+OfHa9S+qE8KZiGbEndOSvE+m
	grqVj/njzVTLfWHI00Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwNj-0000000B3Ak-1nB4;
	Thu, 19 Nov 2026 07:16:31 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwNc-0000000B387-2XQF
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 07:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=sqjBq9lL5HZ/Lw1lhIiPaTm77Y/w3v803JsflBwtvaAgelFBEmggc01/gZKQmhIsPqsYSpQsLH1+G
	 EFXl3+JIkNkoPWCc4eWzUGaF8hzYHj0tSevEQbakntC4GGEFhC8e5bE6gQ4ofM5iFlmyrcMsu2TS3v
	 Ns8D+hBW7FxrYNwo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66afea23e8a4-e7b59;
	Thu, 19 Nov 2026 15:16:14 +0800 (CST)
X-RM-TRANSID: 2ee66afea23e8a4-e7b59
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56afea23a32d-f43aa;
	Thu, 19 Nov 2026 15:16:14 +0800 (CST)
X-RM-TRANSID: 2ee56afea23a32d-f43aa
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
Subject: [PATCH v3 2/2] scsi: ufs-mediatek: restore the M-PHY power state when va09 disable fails
Date: Thu, 19 Nov 2026 15:16:10 +0800
Message-ID: <20261119071611.117-3-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261119071611.117-1-laixiangwu@cmss.chinamobile.com>
References: <20261119071611.117-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_231625_676717_ABDBD711 
X-CRM114-Status: GOOD (  13.49  )
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

In ufs_mtk_mphy_power_on(), the power-off path tears the M-PHY down in
two steps before regulator_disable() is called: phy_power_off() puts
the PHY PLL and its clocks down, and ufs_mtk_va09_pwr_ctrl() asks the
firmware to drop the VA09 supply.  If regulator_disable() then fails,
the M-PHY stays physically off while host->mphy_powered_on is left
set, so the next power-on attempt bails out through the
!(on ^ host->mphy_powered_on) check and never powers the M-PHY back
up, leaving the UFS host with an unpowered PHY (I/O timeouts,
controller lockups).

Simply forcing mphy_powered_on to false would trade this for two more
problems.  First, the regulator core drops the consumer enable count
only after a successful disable, so the count stays at 1, the next
power-on raises it to 2 and it never returns to zero: va09 is then
never physically disabled and the devm-acquired regulator would hit
WARN_ON(enable_count) again on release.  Second, when the power-off
fails during ufs_mtk_suspend(), the error recovery in
__ufshcd_wl_suspend() runs ufshcd_host_reset_and_restore() without
powering the M-PHY back on, which would run against an unpowered PHY.
(Both points were raised by the Sashiko AI review of v2.)

Since the va09 regulator stays enabled when its disable fails, restore
the M-PHY power state instead: power the PHY back on through
ufs_mtk_va09_pwr_ctrl() and phy_power_on() and leave mphy_powered_on
set.  The next power-off attempt then retries the full sequence and
the enable count stays balanced.

Found by code inspection while reviewing the va09 error paths of the
driver; the failure has not been observed on real hardware.

Suggested-by: Peter Wang <peter.wang@mediatek.com>
Link: https://lore.kernel.org/r/sashiko-outbox-220026@kernel.org
Fixes: cf137b3ea49a ("scsi: ufs-mediatek: Support VA09 regulator operations")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/ufs/host/ufs-mediatek.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

Changes in v3:
- restore the M-PHY power state when regulator_disable() fails
  (phy_power_on() plus the va09 SMC call) instead of forcing
  mphy_powered_on to false, as suggested by Peter Wang.  This also
  keeps the va09 enable count balanced and leaves the suspend error
  recovery running with the M-PHY powered, resolving both findings of
  the Sashiko AI review of v2
  (https://lore.kernel.org/all/sashiko-outbox-220026@kernel.org/).

Link: https://lore.kernel.org/r/20261118032015.974-3-laixiangwu@cmss.chinamobile.com/

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index ebbc017d0..caf186966 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -541,6 +541,16 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
 		if (ufs_mtk_is_va09_supported(hba)) {
 			ufs_mtk_va09_pwr_ctrl(res, 0);
 			ret = regulator_disable(host->reg_va09);
+			if (ret) {
+				/*
+				 * The va09 regulator stays enabled, so
+				 * bring the M-PHY back up to keep the
+				 * software state in sync with the
+				 * hardware.
+				 */
+				ufs_mtk_va09_pwr_ctrl(res, 1);
+				phy_power_on(mphy);
+			}
 		}
 	}
 out:
-- 
2.50.1.windows.1




