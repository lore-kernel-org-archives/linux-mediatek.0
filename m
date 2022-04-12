Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88065C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 15:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkkWtpFWnpKAS3FPP2gnITBzImhbyH+/3AUNlr929co=; b=uu2dr9yq47FZUr
	QGy1snonndkRysTd7CaFR0l+IY/yk3NkitDE9wE+SVE09ApLEU5a4ws/4KRLLJjOCLchKohajgIcF
	bBhsSez4K6vuCBYE7twJ8VVnqOEOrWemnSNjgoJonDtYbayLnLPVOJLzobsw76Q5DMvmy3gUg5qHX
	od5zu9AZs4jSY0e2rKXVWYZikkaV7KfwAP+3VvGBeF6zo9yYOMzW3olFwhc677eanHVV5gEejcDB2
	bKex2AfJEb5Mojg9ulRlqxZDGJm08+dzCnhqxoEGKKinV3qpsuVDvvLOUJv8mgkVtosrbUAsi7dM0
	uu5bN7jJ1mWCqxg4rr+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neIKL-00EtI0-88; Tue, 12 Apr 2022 15:21:09 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neIKA-00EtE4-0c; Tue, 12 Apr 2022 15:20:59 +0000
Received: by mail-ej1-x634.google.com with SMTP id k23so38004191ejd.3;
 Tue, 12 Apr 2022 08:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=C8gQ8j7J3mbrIsGT3wWEzstlM9ttuL2uLWVEJNDgDtU=;
 b=U+2B4AySb2AJW2WsQk97IM5PVdMqEYljSRFy82erPIMX3QrfKI1O2HFcCjEcuQ8H/i
 i8lN7V9XWj2OKtHv4eIgfaAgZfDovMHl/774b/2Ola9SGfoFp1tUiocmVoga7QFRhjbR
 49FyBgx3iiTGIw7tFkEHTRIkwTupDKn6t21lqk5FmXY9KB4H7KYSSQmttFCva51eXf3m
 kIJt8ws/nZZt1W7AcMbDfVuhjRxUNBl31tjbogvESZqynC0A4xUDVp+bpho9EOfsGqXw
 Awe6lgA/EYGMpeOB8NZJphejEtaCp3BETVMKyadcxAJfEAhOETHLMYOZiKJ/HnjZz9Op
 R3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=C8gQ8j7J3mbrIsGT3wWEzstlM9ttuL2uLWVEJNDgDtU=;
 b=DY66Z/lEIHOTSRI/SSADFqCXsC3OSRxdLeA/ephSV2CrdIhYII5qinBziybIjHVaFH
 KYULHDlysZY74IXB3VyykBlcLb0/cKIC4SC2gyPN7zUsZYXzXZKTNGkkztC3VAf6ARpf
 +rsyUMhp4Q3Zprpd8RAvVdciVQnL6yECvYO08UKyTBhvSyXFf+C0ncoBLoPOpxmEsEFO
 t5BKJXpALi/CKUfXzGWzDvcr8glgsERn0JFdqCF47XcRvftPZRAtnsOV9HJm8O495CcQ
 mib2EUpkfUus9QpJ77AB480J/ZxB0Cd/h+gyfNggAKoZC0uzQUAuJOduqbxGrY6x/tv5
 j2Mw==
X-Gm-Message-State: AOAM53388QDx3Jd3Uu/SnuxnY3PwBz9HgX0XhsDv0jx04CjhSIu7u9mK
 2w8jIan2n9JbV74lc6ovj0U=
X-Google-Smtp-Source: ABdhPJwmGQFhT5G6UCBt8KCHHVo0d5nomeF39Wy+JutCNEqwasMWoIS/uWxoC4C3MwExrMbUxxUWAA==
X-Received: by 2002:a17:906:7947:b0:6da:892f:2503 with SMTP id
 l7-20020a170906794700b006da892f2503mr34135770ejo.710.1649776855747; 
 Tue, 12 Apr 2022 08:20:55 -0700 (PDT)
Received: from [192.168.3.2] (p5dd1ed70.dip0.t-ipconnect.de. [93.209.237.112])
 by smtp.googlemail.com with ESMTPSA id
 c4-20020a170906170400b006e87c7b8ffasm3676306eje.32.2022.04.12.08.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 08:20:55 -0700 (PDT)
Message-ID: <7550da4043ae45ffd58399f1ee696238a5689f25.camel@gmail.com>
Subject: Re: [PATCH 1/1] scsi: ufs: remove redundant HPB unmap
From: Bean Huo <huobean@gmail.com>
To: Po-Wen Kao <powen.kao@mediatek.com>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Avri Altman <avri.altman@wdc.com>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com, 
 stanley.chu@mediatek.com, alice.chao@mediatek.com,
 chun-hung.wu@mediatek.com,  cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,  yohan.joung@sk.com,
 jason.li@sk.com, linux-scsi@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Date: Tue, 12 Apr 2022 17:20:54 +0200
In-Reply-To: <781bfe33efb1e44d22f71e6711da7d15be9d3ab4.camel@gmail.com>
References: <20220412073131.10644-1-powen.kao@mediatek.com>
 <781bfe33efb1e44d22f71e6711da7d15be9d3ab4.camel@gmail.com>
User-Agent: Evolution 3.44.0-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_082058_122247_AFB9F81E 
X-CRM114-Status: GOOD (  16.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Po-Wen,
Previous email did not properly append the patch, this one is better
for your review and test.




From: Bean Huo <beanhuo@micron.com>
Date: Tue, 12 Apr 2022 16:56:34 +0200
Subject: [PATCH] scsi: ufshpb: UFSHPB cleanup

Remove redundant ufshpb_reset*, and merge into a single helper
ufshbp_state_toggle().

Delete the redundant Inactivation code of all HPB Regions in the cold
boot stage,
and add inactivating all HPB Regions when the HPP status changes from
HPB_RESET
to HBP_PRESENT.

Signed-off-by: Bean Huo <beanhuo@micron.com>
---
 drivers/scsi/ufs/ufshcd.c |  4 ++--
 drivers/scsi/ufs/ufshpb.c | 38 +++++++++++++-------------------------
 drivers/scsi/ufs/ufshpb.h |  6 ++----
 3 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 0899d5b8cdad..d8b59d017ce4 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -7223,7 +7223,7 @@ static int ufshcd_host_reset_and_restore(struct
ufs_hba *hba)
 	 * Stop the host controller and complete the requests
 	 * cleared by h/w
 	 */
-	ufshpb_reset_host(hba);
+	ufshpb_state_toggle(hba, HPB_RESET);
 	ufshcd_hba_stop(hba);
 	hba->silence_err_logs = true;
 	ufshcd_complete_requests(hba);
@@ -8184,7 +8184,7 @@ static int ufshcd_probe_hba(struct ufs_hba *hba,
bool init_dev_params)
 	/* Enable Auto-Hibernate if configured */
 	ufshcd_auto_hibern8_enable(hba);
 
-	ufshpb_reset(hba);
+	ufshpb_state_toggle(hba, HPB_PRESENT);
 out:
 	spin_lock_irqsave(hba->host->host_lock, flags);
 	if (ret)
diff --git a/drivers/scsi/ufs/ufshpb.c b/drivers/scsi/ufs/ufshpb.c
index 3ca745ad616c..4ed156031413 100644
--- a/drivers/scsi/ufs/ufshpb.c
+++ b/drivers/scsi/ufs/ufshpb.c
@@ -2278,39 +2278,29 @@ static bool ufshpb_check_hpb_reset_query(struct
ufs_hba *hba)
 	return flag_res;
 }
 
-void ufshpb_reset(struct ufs_hba *hba)
+void ufshpb_state_toggle(struct ufs_hba *hba, enum UFSHPB_STATE state)
 {
 	struct ufshpb_lu *hpb;
 	struct scsi_device *sdev;
 
 	shost_for_each_device(sdev, hba->host) {
 		hpb = ufshpb_get_hpb_data(sdev);
-		if (!hpb)
-			continue;
 
-		if (ufshpb_get_state(hpb) != HPB_RESET)
+		if (!hpb || ufshpb_get_state(hpb) != state)
 			continue;
 
-		ufshpb_set_state(hpb, HPB_PRESENT);
-	}
-}
-
-void ufshpb_reset_host(struct ufs_hba *hba)
-{
-	struct ufshpb_lu *hpb;
-	struct scsi_device *sdev;
-
-	shost_for_each_device(sdev, hba->host) {
-		hpb = ufshpb_get_hpb_data(sdev);
-		if (!hpb)
-			continue;
-
-		if (ufshpb_get_state(hpb) != HPB_PRESENT)
-			continue;
-		ufshpb_set_state(hpb, HPB_RESET);
-		ufshpb_cancel_jobs(hpb);
-		ufshpb_discard_rsp_lists(hpb);
+		ufshpb_set_state(hpb, state);
+		if (state == HPB_RESET) {
+			ufshpb_cancel_jobs(hpb);
+			ufshpb_discard_rsp_lists(hpb);
+		}
 	}
+	/*
+	 * Inactivating all HPB Region in device side in case HPB
state changed
+	 * from HPB_RESET to HPB_PRESENT
+	 */
+	if (!hpb->is_hcm && state == HPB_PRESENT)
+		ufshpb_issue_umap_all_req(hpb);
 }
 
 void ufshpb_suspend(struct ufs_hba *hba)
@@ -2456,8 +2446,6 @@ static void ufshpb_hpb_lu_prepared(struct ufs_hba
*hba)
 			ufshpb_set_state(hpb, HPB_PRESENT);
 			if ((hpb->lu_pinned_end - hpb-
>lu_pinned_start) > 0)
 				queue_work(ufshpb_wq, &hpb->map_work);
-			if (!hpb->is_hcm)
-				ufshpb_issue_umap_all_req(hpb);
 		} else {
 			dev_err(hba->dev, "destroy HPB lu %d\n", hpb-
>lun);
 			ufshpb_destroy_lu(hba, sdev);
diff --git a/drivers/scsi/ufs/ufshpb.h b/drivers/scsi/ufs/ufshpb.h
index b475dbd78988..a130f0b16c3e 100644
--- a/drivers/scsi/ufs/ufshpb.h
+++ b/drivers/scsi/ufs/ufshpb.h
@@ -288,8 +288,7 @@ static int ufshpb_prep(struct ufs_hba *hba, struct
ufshcd_lrb *lrbp) { return 0;
 static void ufshpb_rsp_upiu(struct ufs_hba *hba, struct ufshcd_lrb
*lrbp) {}
 static void ufshpb_resume(struct ufs_hba *hba) {}
 static void ufshpb_suspend(struct ufs_hba *hba) {}
-static void ufshpb_reset(struct ufs_hba *hba) {}
-static void ufshpb_reset_host(struct ufs_hba *hba) {}
+static void ufshpb_state_toggle(struct ufs_hba *hba, enum UFSHPB_STATE
state) {}
 static void ufshpb_init(struct ufs_hba *hba) {}
 static void ufshpb_init_hpb_lu(struct ufs_hba *hba, struct scsi_device
*sdev) {}
 static void ufshpb_destroy_lu(struct ufs_hba *hba, struct scsi_device
*sdev) {}
@@ -303,8 +302,7 @@ int ufshpb_prep(struct ufs_hba *hba, struct
ufshcd_lrb *lrbp);
 void ufshpb_rsp_upiu(struct ufs_hba *hba, struct ufshcd_lrb *lrbp);
 void ufshpb_resume(struct ufs_hba *hba);
 void ufshpb_suspend(struct ufs_hba *hba);
-void ufshpb_reset(struct ufs_hba *hba);
-void ufshpb_reset_host(struct ufs_hba *hba);
+void ufshpb_state_toggle(struct ufs_hba *hba, enum UFSHPB_STATE
state);
 void ufshpb_init(struct ufs_hba *hba);
 void ufshpb_init_hpb_lu(struct ufs_hba *hba, struct scsi_device
*sdev);
 void ufshpb_destroy_lu(struct ufs_hba *hba, struct scsi_device *sdev);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
