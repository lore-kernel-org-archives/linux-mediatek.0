Return-Path: <SRS0=2fV0=46=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38D4C10DCE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 09:03:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C87D62073E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 09:03:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="im/5tt+4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u3q9GsEH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C87D62073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSPC74Tn1x5WemqxMQTLZx/gPLoWgMxfrT+f+PwdmY4=; b=im/5tt+4vN3zWO
	NjbHNNJgzTqh9XldzZAkN5wffuYLnsVnnpCcGbxPMk9c1hL4kHbZtpm9oLWPrxjaPSN8ZlFlPMe0I
	cnl4ABiz//aT8ZZeUHn6ivyKNc10rwS05qyziUIbp/65BIiIuJ6HjqsilO+QJmvGJpbDPM+bJjdnE
	GK1IfWJ1WUeRfWdFGDiYn3Hvrexq7bd0vtBHHFoKOF6hGVff1/8f2XaPNUIVHsH15gI4CNjR3hDLF
	VkbOF7foTSiFuU3skDJpc5fWPQ3VGr9u7lPRjdzQPuFEboBjvTPqqlhAl2TmIud5reSKD4vhmoftY
	4aoqZDUGCGKBnb9sTBVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCgDq-00009Q-TM; Fri, 13 Mar 2020 09:03:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCgCT-00072n-Ee; Fri, 13 Mar 2020 09:01:50 +0000
X-UUID: af1c05938fc74f2e84e4a0b959a60e13-20200313
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AFM96yV028irlR8soZH4MHzhmotsvDaTG8EF1C+nQj8=; 
 b=u3q9GsEHuNW7Izeq4jNF61wxDF33YEKONVjqj4ufEdH7WYEc0kheYu8Y+uMirzO7unYDDwaZCNwW5kUgE8OS7J+9vGOQBY8xWXaOhNalwEffI1FfW5oSoWss3OJuohcH5CH/XQDeIO0hnhkTYTKhOT05o49gdBzUcFi2lC2xhfI=;
X-UUID: af1c05938fc74f2e84e4a0b959a60e13-20200313
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1848916607; Fri, 13 Mar 2020 01:01:44 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Mar 2020 02:01:58 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Mar 2020 16:58:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 13 Mar 2020 17:00:33 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v4 5/8] scsi: ufs-mediatek: replace all delay places by common
 delay function
Date: Fri, 13 Mar 2020 17:01:00 +0800
Message-ID: <20200313090103.15390-6-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200313090103.15390-1-stanley.chu@mediatek.com>
References: <20200313090103.15390-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CB1561FCEA9142D01092782EE4159A330F91F9F596C9FD14057BA7479C2D65202000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_020149_524777_326D181D 
X-CRM114-Status: UNSURE (   9.37  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, bvanassche@acm.org,
 andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A common delay function is introduced in UFS core driver, thus
ufs-mediatek can use it to replace all delay codes.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 3b0e575d7460..0ff6781654fd 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -100,17 +100,6 @@ static int ufs_mtk_bind_mphy(struct ufs_hba *hba)
 	return err;
 }
 
-static void ufs_mtk_udelay(unsigned long us)
-{
-	if (!us)
-		return;
-
-	if (us < 10)
-		udelay(us);
-	else
-		usleep_range(us, us + 10);
-}
-
 static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -123,7 +112,7 @@ static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 
 	if (on) {
 		ufs_mtk_ref_clk_notify(on, res);
-		ufs_mtk_udelay(host->ref_clk_ungating_wait_us);
+		ufshcd_wait_us(host->ref_clk_ungating_wait_us, 10, true);
 		ufshcd_writel(hba, REFCLK_REQUEST, REG_UFS_REFCLK_CTRL);
 	} else {
 		ufshcd_writel(hba, REFCLK_RELEASE, REG_UFS_REFCLK_CTRL);
@@ -138,7 +127,7 @@ static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 		if (((value & REFCLK_ACK) >> 1) == (value & REFCLK_REQUEST))
 			goto out;
 
-		usleep_range(100, 200);
+		ufshcd_wait_us(100, 100, true);
 	} while (time_before(jiffies, timeout));
 
 	dev_err(hba->dev, "missing ack of refclk req, reg: 0x%x\n", value);
@@ -150,7 +139,7 @@ static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 out:
 	host->ref_clk_enabled = on;
 	if (!on) {
-		ufs_mtk_udelay(host->ref_clk_gating_wait_us);
+		ufshcd_wait_us(host->ref_clk_gating_wait_us, 10, true);
 		ufs_mtk_ref_clk_notify(on, res);
 	}
 
@@ -430,12 +419,12 @@ static void ufs_mtk_device_reset(struct ufs_hba *hba)
 	 *
 	 * To be on safe side, keep the reset low for at least 10us.
 	 */
-	usleep_range(10, 15);
+	ufshcd_wait_us(10, 5, true);
 
 	ufs_mtk_device_reset_ctrl(1, res);
 
 	/* Some devices may need time to respond to rst_n */
-	usleep_range(10000, 15000);
+	ufshcd_wait_us(10000, 5000, true);
 
 	dev_info(hba->dev, "device reset done\n");
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
