Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A59C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 12:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/51e5iz1+IaMnPeMal6JSyz1/dK//yeUO2cbZ7wXjM=; b=OWPrNcKYWsD6WRlg0aT1zbxrT/
	emd0LHESUymR1LVOJv4mANk8RK7Qeb1t96XPyZfSyMsfpflxGxHlA5CygU1dMjesDkH1G7drwcPea
	P7I4OXLRJFFXNEgri7tnNLbPOqGSGSYWuwAfKasf/ZAUTglpTOHykZJIuyoXQIEk/nfhjRGpHUkzE
	eSgyTu+DF+TpcEDZNBRCOFU4riieYNGlVST3UdMIEjTEYveaH5s8/f6+75y2lsCcTmvU0EF1uEZmn
	D1QWnx9rZqc15UYv2zxthX90UWjoLxdT5+u4vUuR9PBL8YFGsGD6mTHX5D5uqIY3dOSVMb+guC5Le
	uk4ujayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDObO-00EdBu-0l;
	Wed, 13 Dec 2023 12:44:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDObL-00EdAI-0s;
	Wed, 13 Dec 2023 12:44:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BD8rFvC031194;
	Wed, 13 Dec 2023 12:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=W/51e5iz1+IaMnPeMal6
	JSyz1/dK//yeUO2cbZ7wXjM=; b=aOcOzCDZYZ4KFA4aCLuqlxZcj4ojg0gbnoK+
	vZfJINDFJCfdZyDaUjmMqkjX5ht8WhZKALf7+GrA4xMz4s8uS/92GRys/4bXkxbQ
	LS5vfhjtE6hDj7nT7DJT8mEdSRNr3XrkjcILlpNe7ng64ah8S5x5DkTEToeSBURe
	tOj92IaDaHPOBL3CSknWI2hZjHjsmGHqOvsfFMje8RBmTpoHxD9i9TbJ6yENrCIn
	1H05W1UHT57N2Q4/CT6YcxvbGFIoIunwqstdHv+mvu8g6S8VRZcRRIFQfkJy57KI
	jkjwdnzhWmb3JiWp8s0VfepLQrL5MAhNiGlOMgv4q7x+TzQc1g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy5x4s2xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 12:44:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDCiOnT001127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 12:44:24 GMT
Received: from hu-mnaresh-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 13 Dec 2023 04:44:19 -0800
From: Maramaina Naresh <quic_mnaresh@quicinc.com>
To: "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>,
        Peter Wang <peter.wang@mediatek.com>,
        "Matthias
 Brugger" <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Stanley Jhu <chu.stanley@gmail.com>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>
Subject: [PATCH V5 2/2] ufs: ufs-mediatek: Migrate to UFSHCD generic CPU latency PM QoS support
Date: Wed, 13 Dec 2023 18:13:53 +0530
Message-ID: <20231213124353.16407-3-quic_mnaresh@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231213124353.16407-1-quic_mnaresh@quicinc.com>
References: <20231213124353.16407-1-quic_mnaresh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -CTmDAMoydg8RNHUWrvXzvHv2p2lmlU6
X-Proofpoint-ORIG-GUID: -CTmDAMoydg8RNHUWrvXzvHv2p2lmlU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_044435_330116_86551137 
X-CRM114-Status: GOOD (  13.67  )
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

The PM QoS feature found in the MediaTek UFS driver was moved to the UFSHCD
core. Hence remove it from MediaTek UFS driver as it is redundant now.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Maramaina Naresh <quic_mnaresh@quicinc.com>
---
 drivers/ufs/host/ufs-mediatek.c | 17 -----------------
 drivers/ufs/host/ufs-mediatek.h |  3 ---
 2 files changed, 20 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index fc61790d289b..1e7dadcb644f 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -17,7 +17,6 @@
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
-#include <linux/pm_qos.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/soc/mediatek/mtk_sip_svc.h>
@@ -626,21 +625,9 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 	dev_info(hba->dev, "caps: 0x%x", host->caps);
 }
 
-static void ufs_mtk_boost_pm_qos(struct ufs_hba *hba, bool boost)
-{
-	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
-
-	if (!host || !host->pm_qos_init)
-		return;
-
-	cpu_latency_qos_update_request(&host->pm_qos_req,
-				       boost ? 0 : PM_QOS_DEFAULT_VALUE);
-}
-
 static void ufs_mtk_scale_perf(struct ufs_hba *hba, bool scale_up)
 {
 	ufs_mtk_boost_crypt(hba, scale_up);
-	ufs_mtk_boost_pm_qos(hba, scale_up);
 }
 
 static void ufs_mtk_pwr_ctrl(struct ufs_hba *hba, bool on)
@@ -959,10 +946,6 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	host->ip_ver = ufshcd_readl(hba, REG_UFS_MTK_IP_VER);
 
-	/* Initialize pm-qos request */
-	cpu_latency_qos_add_request(&host->pm_qos_req, PM_QOS_DEFAULT_VALUE);
-	host->pm_qos_init = true;
-
 	goto out;
 
 out_variant_clear:
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index f76e80d91729..38eab95b0f79 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -7,7 +7,6 @@
 #define _UFS_MEDIATEK_H
 
 #include <linux/bitops.h>
-#include <linux/pm_qos.h>
 #include <linux/soc/mediatek/mtk_sip_svc.h>
 
 /*
@@ -167,7 +166,6 @@ struct ufs_mtk_mcq_intr_info {
 
 struct ufs_mtk_host {
 	struct phy *mphy;
-	struct pm_qos_request pm_qos_req;
 	struct regulator *reg_va09;
 	struct reset_control *hci_reset;
 	struct reset_control *unipro_reset;
@@ -178,7 +176,6 @@ struct ufs_mtk_host {
 	struct ufs_mtk_hw_ver hw_ver;
 	enum ufs_mtk_host_caps caps;
 	bool mphy_powered_on;
-	bool pm_qos_init;
 	bool unipro_lpm;
 	bool ref_clk_enabled;
 	u16 ref_clk_ungating_wait_us;
-- 
2.17.1


