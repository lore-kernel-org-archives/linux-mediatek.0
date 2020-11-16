Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A715C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:01:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE06205ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F6GPcl5u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dcymQY1Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EE06205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RjSftKblT6qru4BZLzx5jKw7R2EjVYe2GyDsmY8ULsw=; b=F6GPcl5uRb2Z7XnsC1rtE2baz
	RB/nlAzFBYEK5nOF9GyxXxMSQ10BC9y1+2XXQbrpIyUfmlppHVd2JYkmPSsKaP1Ov1ToumJe7qMR0
	GLO6TcqT+PfJHpXUywpUIvzi8ku5kHnezSo/7HSdsVzTQ4FSekwJrR03xMhIUCp67nzWLiTsqq3qG
	BP87jmHcIek2p61J9S22tyWMW3XbbzfYItCJH4EMo40UEVumdW5kM1063vn7AwIMNOKoWwqwUC+gH
	ZDewbRJjta7qRQCeNqAFe9KpxrbvOnXJzNhyXG+yaJZt57kPKSolJgawu/1R8h8XNBHZ/c+B2rviK
	5J0AusJrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYVt-000634-0p; Mon, 16 Nov 2020 07:01:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYVe-0005wd-Cj; Mon, 16 Nov 2020 07:01:08 +0000
X-UUID: e570a9b1cd72401a9b8a67376a758dc5-20201115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=12sWmcr47VMxInYTaXFnfJ9he4NVxl9BMogcTGHlvps=; 
 b=dcymQY1Ys2eJQYOhHUF9iHR5732krzRXsW6F0OrZZwco49/34GG2vM1C7Q4xCeidB7NuOtlSVUjlhu/iBIwN6RBsNRF7qcNAEXFP0ChE3xis0IZcl3qBoJsmq/HvJIDx7+K2v3t8gJBk0am5JbzdPcvh5ZcfAajejQ1LGNQYJzg=;
X-UUID: e570a9b1cd72401a9b8a67376a758dc5-20201115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1916960853; Sun, 15 Nov 2020 23:01:00 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Nov 2020 22:50:58 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 14:50:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 Nov 2020 14:50:56 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 8/9] scsi: ufs-mediatek: Use common ADAPT configuration
 function
Date: Mon, 16 Nov 2020 14:50:53 +0800
Message-ID: <20201116065054.7658-9-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201116065054.7658-1-stanley.chu@mediatek.com>
References: <20201116065054.7658-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 586618FD9FC2E94551F1713EFAAF3BF557FB27D60D232CE7923BD1AADFE1CDAF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_020107_217440_8D0CAC36 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, peter.wang@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, kwmad.kim@samsung.com, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org, liwei213@huawei.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use common ADAPT configuration function to reduce duplicated
code in UFS drivers.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 87b4bf125e23..1d3c5cd4592e 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -677,7 +677,6 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct ufs_dev_params host_cap;
-	u32 adapt_val;
 	int ret;
 
 	ufshcd_init_pwr_dev_param(&host_cap);
@@ -693,13 +692,9 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
 	}
 
 	if (host->hw_ver.major >= 3) {
-		if (dev_req_params->gear_tx == UFS_HS_G4)
-			adapt_val = PA_INITIAL_ADAPT;
-		else
-			adapt_val = PA_NO_ADAPT;
-		ufshcd_dme_set(hba,
-			       UIC_ARG_MIB(PA_TXHSADAPTTYPE),
-			       adapt_val);
+		ret = ufshcd_dme_configure_adapt(hba,
+					   dev_req_params->gear_tx,
+					   PA_INITIAL_ADAPT);
 	}
 
 	return ret;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
