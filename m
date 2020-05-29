Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35201C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 09:25:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB5C62072D
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 09:25:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tfyNVrtE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MUfbobrp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB5C62072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1NYaKAVIFULuZH3UoNOip/N+UnY/yZEiJH1VSrnmmo=; b=tfyNVrtEWrFtla
	U05pGenGN3tAuW0F3Su6bCbygPPmd/Ermrpzc33ZH9TzS2hQuRSwFDZk08LDYU8zT2sEKp86x0WiI
	FbUINDIFAbTNw87suploRsYl4MMmt6vbL0s8M0OMl/rMn+vz17XZGxNbzMZJYCEmsjD1SL03qSuE+
	S+m9IKfenmQYZyD33Jtm/GAEtwemWP8hw+2OyDNXItyKaNTxOXx1VCNvxGs+wbiySgnzCo9OpC7Q8
	HTJZ1jVM2doQNuNMdDh8E4g/3+f/iOwio9S8MaH1bMZ7X5V5MBTGOX8+Y6wWyXk85t3pHpxGvFPl6
	3ndhx4uXgv2SQAKsspug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jebGW-00016U-NE; Fri, 29 May 2020 09:25:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jebEe-0005Nr-Dm; Fri, 29 May 2020 09:23:30 +0000
X-UUID: d991d4f598cb4f1a8b24b7a29b203409-20200529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uzfw9R1d1VOhip5QwrPTSrk84wKyVcP93tK5NZw6nGU=; 
 b=MUfbobrpT7qYztbauBkf6fKsVCXZlRGY2QrZL6JkU4vH+t61Tc6JheMHNpy+4T0z/1QvwltAaVP0Ji0R2wWtMmNLH+wdWyShDdlCIt7/T+517wQJi5xxCBm44vaCwNkLaoPJWcdlWUxKq/RIdZGZpkQilKqRc7JjW1TAw5Oruoo=;
X-UUID: d991d4f598cb4f1a8b24b7a29b203409-20200529
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2088589378; Fri, 29 May 2020 01:23:13 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 May 2020 02:23:18 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 May 2020 17:23:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 29 May 2020 17:23:10 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 1/5] scsi: ufs-mediatek: Fix imprecise waiting time for
 ref-clk control
Date: Fri, 29 May 2020 17:23:06 +0800
Message-ID: <20200529092310.1106-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200529092310.1106-1-stanley.chu@mediatek.com>
References: <20200529092310.1106-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_022328_494204_BB85BC53 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
Cc: pengshun.zhao@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>,
 bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently ref-clk control timeout is implemented by Jiffies. However
jiffies is not accurate enough thus "false timeout" may happen.

Use more accurate delay mechanism instead, for example, ktime.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Andy Teng <andy.teng@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 7 ++++---
 drivers/scsi/ufs/ufs-mediatek.h | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index d56ce8d97d4e..523ee5573921 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -120,7 +120,7 @@ static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct arm_smccc_res res;
-	unsigned long timeout;
+	ktime_t timeout, time_checked;
 	u32 value;
 
 	if (host->ref_clk_enabled == on)
@@ -135,8 +135,9 @@ static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 	}
 
 	/* Wait for ack */
-	timeout = jiffies + msecs_to_jiffies(REFCLK_REQ_TIMEOUT_MS);
+	timeout = ktime_add_us(ktime_get(), REFCLK_REQ_TIMEOUT_US);
 	do {
+		time_checked = ktime_get();
 		value = ufshcd_readl(hba, REG_UFS_REFCLK_CTRL);
 
 		/* Wait until ack bit equals to req bit */
@@ -144,7 +145,7 @@ static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 			goto out;
 
 		usleep_range(100, 200);
-	} while (time_before(jiffies, timeout));
+	} while (ktime_before(time_checked, timeout));
 
 	dev_err(hba->dev, "missing ack of refclk req, reg: 0x%x\n", value);
 
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 5bbd3e9cbae2..fc42dcbfd800 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -28,7 +28,7 @@
 #define REFCLK_REQUEST              BIT(0)
 #define REFCLK_ACK                  BIT(1)
 
-#define REFCLK_REQ_TIMEOUT_MS       3
+#define REFCLK_REQ_TIMEOUT_US       3000
 
 /*
  * Vendor specific pre-defined parameters
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
