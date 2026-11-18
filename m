Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328C5606A32A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 01:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BrgVWjQB;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=OdRnApPq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZjfWekzq4/sRPKRMmFj7v/AEpXemuhGVbDD4ndLcqmY=; b=BrgVWjQBQYye9qwGGwWYN7wCkJ
	YwCTlVqCmQf0LXgOdBS+Ql2HZZMd9poHf7jjj5UR8K4PjoilLqTH4k1rDTRs3FBAHwjJfnmoaOD4/
	oES2Pw9CLuitIefO8nmjVHT3nsvSYL4GxV9fhiZnScNMYPkj6DylrnoKI1AjQGJWCnVV4g8SVdyPc
	si+CrcvwtlXevUy3BGaSoTBgyhPLieoX+udtOzDEhVcnNXdoJw3nXiIcuyT3swlZsbmyVTcvTxp7k
	zAeISFNkQkxsVsz5VdWdD7qch9JLI3Q9C9cZrbXZbatFK33ybBvDVF0y7qcxsaSzaJLSEgIlrlOZT
	PDK6zfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUhB-00000007TQo-2Zcd;
	Wed, 18 Nov 2026 01:42:45 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUh7-00000007TQG-49DF
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 01:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=OdRnApPqBadmTms5nquAyOq4wuofPZjv8yZ/S7EbX6R9til8+1zgGQqHjJU2OdoTtXUt6+NDW4eWZ
	 cS8AqriS0U0HoPbWB1423N0gAQZGT4jGJ781Ywnchmy3ZjbSgVMTs9Hg3TeXQKznMBZNSpSKbCIGNV
	 LUiZnSmf9uoC7kos=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26afd0286879-49ca1;
	Wed, 18 Nov 2026 09:42:36 +0800 (CST)
X-RM-TRANSID: 2ee26afd0286879-49ca1
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afd028ac77-c42b3;
	Wed, 18 Nov 2026 09:42:35 +0800 (CST)
X-RM-TRANSID: 2ee66afd028ac77-c42b3
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: peter.wang@mediatek.com,
	chaotian.jing@mediatek.com
Cc: chu.stanley@gmail.com,
	alim.akhtar@samsung.com,
	bvanassche@acm.org,
	stanley.chu@mediatek.com,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] scsi: ufs-mediatek: use devm_regulator_get() for the va09 regulator
Date: Wed, 18 Nov 2026 09:42:34 +0800
Message-ID: <20261118014234.424-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_174242_692042_992C07EE 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

Fixes: cf137b3ea49a ("scsi: ufs-mediatek: Support VA09 regulator operations")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/ufs/host/ufs-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 5b6bff2cf..426af10b3 100644
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
-- 
2.50.1.windows.1




