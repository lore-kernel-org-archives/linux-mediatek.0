Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BBEC54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 01:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIaFuBr0Oe9y1QivCx5pfsr3wrfD/ZEssLivgGj/3I0=; b=3/tIgBnZOEBaMPJRAqWQrS8R4g
	XNrHkoyEclo50gd/WvmUT+l4kH1EJMBWOWVI5EM8GFL5MIme77MWFfiI6nuPYbUxg2e4WEbIS3ogH
	89Eqn34PCSSGiEwVtkAlqcFicHmUHQgwkN3QaNZHi3vQz1QH+i6eVkuEpc/BEkdYrJIAUAKchdLeH
	L2C5PKnaTEsx2sfD+17Bth8die9tktymTF+sGsRyTmSS2Z2GkQ/uu64s4jNKXJBDC2pyz2lJtkMBe
	BJgZkNa8SgYxdic0fAUo6A0xwTS4BJ2Jkzd7z+CwJoIW236WRe46MQ/z7eMLULLHQi7vAZJ/OkpAg
	54pf+BFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obX9r-000tIH-Of; Fri, 23 Sep 2022 01:07:11 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obX9H-000t5J-Ce; Fri, 23 Sep 2022 01:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1663895195; x=1695431195;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=FIaFuBr0Oe9y1QivCx5pfsr3wrfD/ZEssLivgGj/3I0=;
  b=D3P8R8+gX9Zcnnb/4pQRnJo+4/Ub5lIbjDatWaK8zb0bB20mDksSl0Qu
   riheMHvaNvyjcSCY/czZZFHvoSj6/dfRHM5wBNi7/J7K6yHSehI1l4WZD
   QJRdfDpCj/v/ezrSJBw/o/xh0obPyQCX/cD7FVgaVQUvl9r3F2DMm2meZ
   k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Sep 2022 18:06:30 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 18:06:30 -0700
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 22 Sep 2022 18:06:29 -0700
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: <mani@kernel.org>, <quic_nguyenb@quicinc.com>,
	<quic_xiaosenh@quicinc.com>, <quic_cang@quicinc.com>,
	<quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
	<quic_richardp@quicinc.com>, <stanley.chu@mediatek.com>,
	<adrian.hunter@intel.com>, <bvanassche@acm.org>, <avri.altman@wdc.com>,
	<beanhuo@micron.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, Asutosh Das <quic_asutoshd@quicinc.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, open list
	<linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 03/16] ufs: core: Defer adding host to scsi if mcq is supported
Date: Thu, 22 Sep 2022 18:05:10 -0700
Message-ID: <197a8bcca288f9c36586099aa07606ed3f067c9b.1663894792.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1663894792.git.quic_asutoshd@quicinc.com>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_180635_515179_BA7AF7F8 
X-CRM114-Status: GOOD (  12.48  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If MCQ support is present, then enabling it would need
reallocating tags and memory. It would also free up the
already allocated memory in Single Doorbell Mode.
So defer invoking scsi_add_host() until MCQ is configured.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
---
 drivers/ufs/core/ufshcd.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 24661fc..426867b 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8184,6 +8184,7 @@ static int ufshcd_probe_hba(struct ufs_hba *hba, bool init_dev_params)
 	int ret;
 	unsigned long flags;
 	ktime_t start = ktime_get();
+	struct Scsi_Host *host = hba->host;
 
 	hba->ufshcd_state = UFSHCD_STATE_RESET;
 
@@ -8218,6 +8219,14 @@ static int ufshcd_probe_hba(struct ufs_hba *hba, bool init_dev_params)
 		ret = ufshcd_device_params_init(hba);
 		if (ret)
 			goto out;
+
+		if (is_mcq_supported(hba)) {
+			ret = scsi_add_host(host, hba->dev);
+			if (ret) {
+				dev_err(hba->dev, "scsi_add_host failed\n");
+				goto out;
+			}
+		}
 	}
 
 	ufshcd_tune_unipro_params(hba);
@@ -9764,10 +9773,12 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 		hba->is_irq_enabled = true;
 	}
 
-	err = scsi_add_host(host, hba->dev);
-	if (err) {
-		dev_err(hba->dev, "scsi_add_host failed\n");
-		goto out_disable;
+	if (!is_mcq_supported(hba)) {
+		err = scsi_add_host(host, hba->dev);
+		if (err) {
+			dev_err(hba->dev, "scsi_add_host failed\n");
+			goto out_disable;
+		}
 	}
 
 	hba->tmf_tag_set = (struct blk_mq_tag_set) {
-- 
2.7.4


