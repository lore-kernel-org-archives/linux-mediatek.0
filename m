Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A61C43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:45:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC1102065E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y0EJhlcm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LQ89IYxK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC1102065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+Nd7YLKcegC/rdx2Sm+Lpp3pmp1tMdUUNKPXJOkDwcw=; b=y0EJhlcmEIlKxq3t9CrGOlodM
	U9drnA0y+gWEn+nGptJvUO3NVRom2n9Njlqbj7GtyWmQAY8/eA6UswGsOTL2LfspHlnP5WQCQ8Kds
	6RmJRA0aBVeo7On6w1/F23nD7R4J65zeY3gf2j8ifMqjofWzM4w9sMBPISuAVo6qv355IADCgxt1x
	xUL48/G3uf9lh12WMO/iZwh9i3YfNu12k/o6xU3TRDuA+LN2h4L9Z9S62NPbJVT6AItbYUtgA21Ns
	OpsGU1/OBrKX3L7GjbXQeAx9zKU8qtlC5UnBDw8zV10q28jZjIBS1RmYGomqYCxZgQUnGXgskLlO8
	/qyxrnzIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFXNq-0004V5-Nz; Tue, 08 Sep 2020 06:45:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFXNc-0004P9-T7; Tue, 08 Sep 2020 06:45:26 +0000
X-UUID: 410bf39438774690b02d31c616a158ec-20200907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Bjomsp98M5COQp7hU2i9F3nHqul1illrMLuipZ67MYo=; 
 b=LQ89IYxKzSQVyLZ4NgSj+SZi5XEkCJPHTwrTZR27V5UoC2MDL8k4Vr06nvn8492Zele0qScmj4IcFU+lI2XlRvRQCXH/7IVwvSm7EAFtsjHpN6Vibdl1ed4pkr5MfFBpkkPw71tXg3ULA2C+oCa+56ZHRWYuwyL1OByJPLxe0hw=;
X-UUID: 410bf39438774690b02d31c616a158ec-20200907
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1792163795; Mon, 07 Sep 2020 22:45:14 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 23:45:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 14:45:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Sep 2020 14:45:10 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH 3/4] scsi: ufs-mediatek: Fix flag of unipro low-power mode
Date: Tue, 8 Sep 2020 14:45:06 +0800
Message-ID: <20200908064507.30774-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200908064507.30774-1-stanley.chu@mediatek.com>
References: <20200908064507.30774-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A16BDD5A8366D066DA603CCA0A8A17BF6BFBBB21D4FA726657DD4C3FAA686DC52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_024525_086612_B4D988CE 
X-CRM114-Status: GOOD (  13.61  )
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
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Forcibly leave UniPro low-power mode if UIC commands is failed.
This makes hba_enable_delay_us as correct (default) value for
re-enabling the host.

At the same time, change type of parameter "lpm" in function
ufs_mtk_unipro_set_pm() to "bool".

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 887c03e8bcc0..feba74a72309 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -419,7 +419,7 @@ static int ufs_mtk_pwr_change_notify(struct ufs_hba *hba,
 	return ret;
 }
 
-static int ufs_mtk_unipro_set_pm(struct ufs_hba *hba, u32 lpm)
+static int ufs_mtk_unipro_set_pm(struct ufs_hba *hba, bool lpm)
 {
 	int ret;
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -427,8 +427,14 @@ static int ufs_mtk_unipro_set_pm(struct ufs_hba *hba, u32 lpm)
 	ret = ufshcd_dme_set(hba,
 			     UIC_ARG_MIB_SEL(VS_UNIPROPOWERDOWNCONTROL, 0),
 			     lpm);
-	if (!ret)
+	if (!ret || !lpm) {
+		/*
+		 * Forcibly set as non-LPM mode if UIC commands is failed
+		 * to use default hba_enable_delay_us value for re-enabling
+		 * the host.
+		 */
 		host->unipro_lpm = lpm;
+	}
 
 	return ret;
 }
@@ -438,7 +444,9 @@ static int ufs_mtk_pre_link(struct ufs_hba *hba)
 	int ret;
 	u32 tmp;
 
-	ufs_mtk_unipro_set_pm(hba, 0);
+	ret = ufs_mtk_unipro_set_pm(hba, false);
+	if (ret)
+		return ret;
 
 	/*
 	 * Setting PA_Local_TX_LCC_Enable to 0 before link startup
@@ -546,7 +554,7 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
 	if (err)
 		return err;
 
-	err = ufs_mtk_unipro_set_pm(hba, 0);
+	err = ufs_mtk_unipro_set_pm(hba, false);
 	if (err)
 		return err;
 
@@ -567,10 +575,10 @@ static int ufs_mtk_link_set_lpm(struct ufs_hba *hba)
 {
 	int err;
 
-	err = ufs_mtk_unipro_set_pm(hba, 1);
+	err = ufs_mtk_unipro_set_pm(hba, true);
 	if (err) {
 		/* Resume UniPro state for following error recovery */
-		ufs_mtk_unipro_set_pm(hba, 0);
+		ufs_mtk_unipro_set_pm(hba, false);
 		return err;
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
