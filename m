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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A6FC55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:01:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A6D622240
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:01:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2jKdM3iG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q0/DNlzn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A6D622240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bqNr5HMHRqC6pnO7Tshigvg+aZJlCqjZVW36xz543Jk=; b=2jKdM3iGFpIysW74dNOdbE2si
	Xkz68FGhLUbTU8nplBwRmPGxHcPGciIqmCkZMju2PTKa85oo4YlpG2SK1RVEwWtO8Dn46jz6BySZK
	AsaZq+t9viOGX7CTsmp1rm0y2aMr398ydHSGlg/0w/XkfAG0VF0OMKjN+N4U6oOhaQ2WZXqkwUVi/
	WxsKaiy5Th93BFoxO0KeS2bvhlPPSNlPiDuGYFGW7gEX1K0XXb3s0ympoeLEQsL67gpU1eZL+FcW9
	Ws1AnQBU3RMrIfcRoka7jGFM5vj6o5ms45In4xgX6y01PdLh4yfjD9CMByBk6ikf6sRuJ9fmAaLnW
	W+FREe7UQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYWC-00069U-2v; Mon, 16 Nov 2020 07:01:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYVj-0005yh-RN; Mon, 16 Nov 2020 07:01:14 +0000
X-UUID: ef95bd8b53774b94b1f2123c0cc2cee4-20201115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0VRMtEL2qA6SF4NgykJ8ofudUySTOZ3eTqoeYg+K+uc=; 
 b=Q0/DNlznCK8k/CzBWXJS+cx6TyVXfcyvv1s9FtSl9RezZUMgUOrEJhMTycF4ZhAgkInNVcerDsuUfMYfXuJE2xpLyjJXv/jugZNvzSDJsFt2hQsyJDh+gExvJB6Zeo/vx3wjiD5MXKqyvILCqOipKpwGOd3yDwfNNsjkiTbOyzE=;
X-UUID: ef95bd8b53774b94b1f2123c0cc2cee4-20201115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1033482511; Sun, 15 Nov 2020 23:01:05 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Nov 2020 22:51:03 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Nov 2020 14:50:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 16 Nov 2020 14:50:55 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 2/9] scsi: ufs: Introduce device parameter initialization
 function
Date: Mon, 16 Nov 2020 14:50:47 +0800
Message-ID: <20201116065054.7658-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201116065054.7658-1-stanley.chu@mediatek.com>
References: <20201116065054.7658-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_020112_057736_57013652 
X-CRM114-Status: GOOD (  11.15  )
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

Nowadays many vendors initialize their device parameters in
their own vendor drivers. The initialization code is almost
the same as well as the pre-defined definitions. Introduce
a common device parameter initialization function which assign
the most common initial values. With this function, we
could remove those duplicated codes in vendor drivers.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd-pltfrm.c | 17 +++++++++++++++++
 drivers/scsi/ufs/ufshcd-pltfrm.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
index 3db0af66c71c..a6f76399b3ae 100644
--- a/drivers/scsi/ufs/ufshcd-pltfrm.c
+++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
@@ -354,6 +354,23 @@ int ufshcd_get_pwr_dev_param(struct ufs_dev_params *pltfrm_param,
 }
 EXPORT_SYMBOL_GPL(ufshcd_get_pwr_dev_param);
 
+void ufshcd_init_pwr_dev_param(struct ufs_dev_params *dev_param)
+{
+	dev_param->tx_lanes = 2;
+	dev_param->rx_lanes = 2;
+	dev_param->hs_rx_gear = UFS_HS_G3;
+	dev_param->hs_tx_gear = UFS_HS_G3;
+	dev_param->pwm_rx_gear = UFS_PWM_G4;
+	dev_param->pwm_tx_gear = UFS_PWM_G4;
+	dev_param->rx_pwr_pwm = SLOW_MODE;
+	dev_param->tx_pwr_pwm = SLOW_MODE;
+	dev_param->rx_pwr_hs = FAST_MODE;
+	dev_param->tx_pwr_hs = FAST_MODE;
+	dev_param->hs_rate = PA_HS_MODE_B;
+	dev_param->desired_working_mode = UFS_HS_MODE;
+}
+EXPORT_SYMBOL_GPL(ufshcd_init_pwr_dev_param);
+
 /**
  * ufshcd_pltfrm_init - probe routine of the driver
  * @pdev: pointer to Platform device handle
diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.h b/drivers/scsi/ufs/ufshcd-pltfrm.h
index b79cdf9129a0..772a8e848098 100644
--- a/drivers/scsi/ufs/ufshcd-pltfrm.h
+++ b/drivers/scsi/ufs/ufshcd-pltfrm.h
@@ -28,6 +28,7 @@ struct ufs_dev_params {
 int ufshcd_get_pwr_dev_param(struct ufs_dev_params *dev_param,
 			     struct ufs_pa_layer_attr *dev_max,
 			     struct ufs_pa_layer_attr *agreed_pwr);
+void ufshcd_init_pwr_dev_param(struct ufs_dev_params *dev_param);
 int ufshcd_pltfrm_init(struct platform_device *pdev,
 		       const struct ufs_hba_variant_ops *vops);
 void ufshcd_pltfrm_shutdown(struct platform_device *pdev);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
