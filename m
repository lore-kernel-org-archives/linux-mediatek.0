Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CFB606A325
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 03:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IhXeUyFM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=VFozkjxG;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RN5a2BCY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xavNYUcUt2JC/N4HjZciqIyCMtHY4/jj8/p6nwYYQrw=; b=IhXeUyFM3OSHkx
	ir229maLulpGTYlGommQ6TRwhaG2vHc4QABO5pMgJLizXIYcE906VNeSstfueVXVB5ye1AB3Gudxv
	zmof30B2pHjyMudk5UTclkHykZohwEec+S6mBTYrQE/gwuu+UUil9vqLx41KVWgVsW0MfU7B+ZVyd
	aqKQO2dlYkUe6xjKTQLxVA+F9UpOuhl1MB3Dwe+6G+22l2O5RuFroxKA7WBi4BFr8uQgiu3c3XSoz
	rT6HMwIj0k/sjrLCJqAAQ5eDpCYSJ8h/gOwE8cE7hyrppnWkTVUYmgbiwuXBOIa3c/UVIscHfChzm
	X5LQ7I9hix02ICC5WVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWDr-00000007cJB-3Yv0;
	Wed, 18 Nov 2026 03:20:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWDq-00000007cHB-3Cha
	for linux-mediatek@bombadil.infradead.org;
	Wed, 18 Nov 2026 03:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xavNYUcUt2JC/N4HjZciqIyCMtHY4/jj8/p6nwYYQrw=; b=VFozkjxGjdO2fk+ZLXcxgGoFBi
	6WFrgPh6YlxXMzegtEng5DWGOWaX1ReLyNIA2QM6WSZNzEZkxZPMdsAFoY4UWsXdeCbbcs1kJOGVm
	tWB4nUR+zrSTIBMlwDxXgtGrjsHyO5SIsTGczz97GDBkYwoZFUp8YCytXxwm9jfAIor/7P+X+VZcp
	HL6UZCnrHv5bK7qGtWEG136cgAsJw+9nmhOc1xEIK2olUjreQa3dov4TmPWisdbiDgaKcplEqINFo
	822KqozREPLOl7X0RikXiptnFp/Z0RxBDSBG6rT4HBZjdditW+uyL+0W2hqXNXljVoTaVZcUez0XO
	YI3raU0w==;
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWDl-0000000Fc6K-2tXP
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 03:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=RN5a2BCYZ8iStVhjDy0dINQtPs4IQ/p2cJgU14RXbEBeJ62z1cK3pTDKldN0+CFzm3hwKWNg0B1Dm
	 KPiigJdgakX/K/KiCx1aXmyl8OB2bZqtNVaztTb5ZF8Z2TOIyzXiNSF2wZkajWoy6+QYsBodj14LVg
	 nZa2856oI76fsQvg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afd1972d46-af128;
	Wed, 18 Nov 2026 11:20:19 +0800 (CST)
X-RM-TRANSID: 2ee46afd1972d46-af128
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56afd1970808-c73ca;
	Wed, 18 Nov 2026 11:20:19 +0800 (CST)
X-RM-TRANSID: 2ee56afd1970808-c73ca
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
Subject: [PATCH v2 2/2] scsi: ufs-mediatek: keep mphy state in sync when va09 disable fails
Date: Wed, 18 Nov 2026 11:20:15 +0800
Message-ID: <20261118032015.974-3-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261118032015.974-1-laixiangwu@cmss.chinamobile.com>
References: <20261118032015.974-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_032030_155118_ED7208C7 
X-CRM114-Status: GOOD (  11.65  )
X-Spam-Score: -0.5 (/)
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

In ufs_mtk_mphy_power_on(), the power-off path calls phy_power_off()
before disabling the va09 regulator.  If regulator_disable() fails,
the error is returned while host->mphy_powered_on is left set,
although the M-PHY is physically powered off already.  The next call
with on = true then bails out through the !(on ^ host->mphy_powered_on)
check without powering the M-PHY back on, leaving the UFS link dead
(I/O timeouts, controller lockups).

The M-PHY is off regardless of the va09 disable result, so update the
state flag in the power-off path and let the next power-on retry the
whole sequence.

Found by code inspection while reviewing the va09 error paths of the
driver; the failure has not been observed on real hardware.

Link: https://lore.kernel.org/r/sashiko-outbox-219916@kernel.org
Fixes: cf137b3ea49a ("scsi: ufs-mediatek: Support VA09 regulator operations")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/ufs/host/ufs-mediatek.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index ebbc017d0..8d4b84d58 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -542,6 +542,14 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
 			ufs_mtk_va09_pwr_ctrl(res, 0);
 			ret = regulator_disable(host->reg_va09);
 		}
+		/*
+		 * The M-PHY is off regardless of the va09 result, so keep
+		 * the state in sync with the hardware.  Otherwise the next
+		 * power-on bails out through the
+		 * !(on ^ host->mphy_powered_on) check without powering the
+		 * M-PHY back on.
+		 */
+		host->mphy_powered_on = false;
 	}
 out:
 	if (ret) {
-- 
2.50.1.windows.1




