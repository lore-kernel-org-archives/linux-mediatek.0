Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B11C63697
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:02:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E794D22265
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:02:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FNnjyDel";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="htpdMD8A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E794D22265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bXXWV+QSjHhGI5RX6KBi7tlN2KxU+D2ZLFHMZuqw1WU=; b=FNnjyDelilR2ecjwFgaExn7Qp
	FJjwAb9aJ5ybd0oeLtIQB0CUitLUlsrk8R0PrbNJ0zBlhhb4C9Bojzy7atfrXG2AEDeoluz1uPHYG
	tRugwPOZkhFrbyh7Lz4h4cBPbyu4YMxeiOtkAEP2/UFFfwgwOEfnIu+CgPu4/DToF217BEtkik10q
	mmSBBO3TshvU5mgzh211fkWGFTGgo1kvaO1fgaFpwKkphJZM+CYYbTqpIduhDRrwJf/F0qmes5k53
	81iQWrBu4DPfO18sRhk4dxCdPmTY7hTzpBQOndwRnmMV9fwNzIuDll6Ok2mUBrMluvVaVLuARR6e6
	3l6HFEeXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYWe-0006NL-DN; Mon, 16 Nov 2020 07:02:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYVm-0005xz-5L; Mon, 16 Nov 2020 07:01:16 +0000
X-UUID: 3bdb40536b1b42fc801cc553600e1940-20201115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ocMRgqKWgjb8uoD49HaTnkcMF6rBmYq/dahjYhSDMwM=; 
 b=htpdMD8A9uGvuPwdSdNOJCh/zViUqUhS9PQSDiBQUvXhqZvS5Ji4xmCTyp37KPk5kD3taE9jcDMwonTy5MKMMVyPacjJd8d6raB69U8+9MNwyylM1WYnZfI7YrMiWg/224v2UWB5pXumT1DtT8Q4KIa9BWerXZJV1XHBkMGSwTg=;
X-UUID: 3bdb40536b1b42fc801cc553600e1940-20201115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1574201401; Sun, 15 Nov 2020 23:01:05 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Nov 2020 22:51:04 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 14:50:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 Nov 2020 14:50:56 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 6/9] scsi: ufs-hisi: Use device parameter initialization
 function
Date: Mon, 16 Nov 2020 14:50:51 +0800
Message-ID: <20201116065054.7658-7-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201116065054.7658-1-stanley.chu@mediatek.com>
References: <20201116065054.7658-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_020114_422243_8CA9CE53 
X-CRM114-Status: GOOD (  10.10  )
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

Use common device parameter initialization function instead of
initialziing those parameters by vendor driver itself.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-hisi.c | 13 +------------
 drivers/scsi/ufs/ufs-hisi.h | 13 -------------
 2 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-hisi.c b/drivers/scsi/ufs/ufs-hisi.c
index 074a6a055a4c..0aa58131e791 100644
--- a/drivers/scsi/ufs/ufs-hisi.c
+++ b/drivers/scsi/ufs/ufs-hisi.c
@@ -293,18 +293,7 @@ static int ufs_hisi_link_startup_notify(struct ufs_hba *hba,
 
 static void ufs_hisi_set_dev_cap(struct ufs_dev_params *hisi_param)
 {
-	hisi_param->rx_lanes = UFS_HISI_LIMIT_NUM_LANES_RX;
-	hisi_param->tx_lanes = UFS_HISI_LIMIT_NUM_LANES_TX;
-	hisi_param->hs_rx_gear = UFS_HISI_LIMIT_HSGEAR_RX;
-	hisi_param->hs_tx_gear = UFS_HISI_LIMIT_HSGEAR_TX;
-	hisi_param->pwm_rx_gear = UFS_HISI_LIMIT_PWMGEAR_RX;
-	hisi_param->pwm_tx_gear = UFS_HISI_LIMIT_PWMGEAR_TX;
-	hisi_param->rx_pwr_pwm = UFS_HISI_LIMIT_RX_PWR_PWM;
-	hisi_param->tx_pwr_pwm = UFS_HISI_LIMIT_TX_PWR_PWM;
-	hisi_param->rx_pwr_hs = UFS_HISI_LIMIT_RX_PWR_HS;
-	hisi_param->tx_pwr_hs = UFS_HISI_LIMIT_TX_PWR_HS;
-	hisi_param->hs_rate = UFS_HISI_LIMIT_HS_RATE;
-	hisi_param->desired_working_mode = UFS_HISI_LIMIT_DESIRED_MODE;
+	ufshcd_init_pwr_dev_param(hisi_param);
 }
 
 static void ufs_hisi_pwr_change_pre_change(struct ufs_hba *hba)
diff --git a/drivers/scsi/ufs/ufs-hisi.h b/drivers/scsi/ufs/ufs-hisi.h
index 3231d3d81c98..5a90c0f4e90c 100644
--- a/drivers/scsi/ufs/ufs-hisi.h
+++ b/drivers/scsi/ufs/ufs-hisi.h
@@ -76,19 +76,6 @@ enum {
 #define SLOW	1
 #define FAST	2
 
-#define UFS_HISI_LIMIT_NUM_LANES_RX	2
-#define UFS_HISI_LIMIT_NUM_LANES_TX	2
-#define UFS_HISI_LIMIT_HSGEAR_RX	UFS_HS_G3
-#define UFS_HISI_LIMIT_HSGEAR_TX	UFS_HS_G3
-#define UFS_HISI_LIMIT_PWMGEAR_RX	UFS_PWM_G4
-#define UFS_HISI_LIMIT_PWMGEAR_TX	UFS_PWM_G4
-#define UFS_HISI_LIMIT_RX_PWR_PWM	SLOW_MODE
-#define UFS_HISI_LIMIT_TX_PWR_PWM	SLOW_MODE
-#define UFS_HISI_LIMIT_RX_PWR_HS	FAST_MODE
-#define UFS_HISI_LIMIT_TX_PWR_HS	FAST_MODE
-#define UFS_HISI_LIMIT_HS_RATE	PA_HS_MODE_B
-#define UFS_HISI_LIMIT_DESIRED_MODE	FAST
-
 #define UFS_HISI_CAP_RESERVED		BIT(0)
 #define UFS_HISI_CAP_PHY10nm		BIT(1)
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
