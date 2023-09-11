Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC20EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 10:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9t/tuA65wT0eZs+b0FA+a9eyUdqc9XfGqsquufrPl3g=; b=mODiWWiAc31GMmMg+qOE0GCo7Z
	gET0HdpBx8OicmoGWGh8FXzICupX3nS02KsLWxO6eneQtjVwSMbof+ex3Gptf9cW0q2lKep3c3OR8
	zxllEJpov2BSwhhW/xpVHpeZvLvA7BIE2srpj9GlgwFtItogZBRcKisLmJZCBEFyp2yg8McItmAaR
	TpQ+VKV8nElvIAiw8ljQHQT5hbLiPZmsvPgOBbFO4Cax28dfccN+4Ntn/jLvRferzir3ltILK/3tc
	VpvXErkckyojm122oG5hENg5PFNRt+zuAQYTzMAZvDxWaCLKb/Q1/w+m6b0dPuAt1HdEUImFy4Z4z
	08tOL6mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfebU-000KEF-0t;
	Mon, 11 Sep 2023 10:57:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfebQ-000KBA-0j;
	Mon, 11 Sep 2023 10:57:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B8OB3K008351;
	Mon, 11 Sep 2023 10:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=9t/tuA65wT0eZs+b0FA+a9eyUdqc9XfGqsquufrPl3g=;
 b=FWWZNxG+O2+uA+DwGV1qVHrjVMFmeh9kWdfvWVPwC2fPwRF2oHYHPjsKGQQQpZFy7b50
 f2CJw4ttx2YHBLGnARyuV+ha1qqkyGL9ZVds5YFP9/sIjMUUPirEw1C4ZEA1bXzKkWMm
 YZ03/7TxwQ+XUBueCNXzjm8SjpUFmVxTOmaieUwlcXRa+Co2F3IqPPbsOClf9F9G4Ii2
 nzJ0Xx5Twl+epOq78ic7rKAYyVahUp2B9fif08KVMV1S6Oz71rpNjZ1Tbf4XEPhWImHF
 HVm04C+ICiSQJJi2HbWKipeFq5epohRw0Yx+z9ST0Z2e0OvPe/e3pv+KpxJKGyQttRBf wQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0edmkqaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 10:56:48 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BAuloX018357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 10:56:47 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 11 Sep 2023 03:56:37 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linus.walleij@linaro.org>,
        <andy.shevchenko@gmail.com>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>,
        <quic_tsoni@quicinc.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_mojha@quicinc.com>
Subject: [REBASE PATCH v5 17/17] firmware: qcom_scm: Add multiple download mode support
Date: Mon, 11 Sep 2023 16:23:59 +0530
Message-ID: <1694429639-21484-18-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YujbjpjEHNqq676eggwCrMIBo858Mw88
X-Proofpoint-GUID: YujbjpjEHNqq676eggwCrMIBo858Mw88
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_035712_265427_65EFD79F 
X-CRM114-Status: GOOD (  18.49  )
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

Currently, scm driver only supports full dump when download
mode is selected. Add support to enable minidump as well as
enable it along with fulldump.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/firmware/qcom_scm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 4ecdb0d025a4..c70ab9afd3cb 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -34,6 +34,8 @@ static u32 download_mode;
 
 #define QCOM_DLOAD_MASK		GENMASK(5, 4)
 #define QCOM_DLOAD_FULLDUMP	0x1
+#define QCOM_DLOAD_MINIDUMP	0x2
+#define QCOM_DLOAD_BOTHDUMP	(QCOM_DLOAD_FULLDUMP | QCOM_DLOAD_MINIDUMP)
 #define QCOM_DLOAD_NODUMP	0x0
 
 struct qcom_scm {
@@ -86,6 +88,8 @@ static const char * const qcom_scm_convention_names[] = {
 static const char * const download_mode_name[] = {
 	[QCOM_DLOAD_NODUMP]	= "off",
 	[QCOM_DLOAD_FULLDUMP]	= "full",
+	[QCOM_DLOAD_MINIDUMP]	= "mini",
+	[QCOM_DLOAD_BOTHDUMP]	= "full,mini",
 };
 
 static struct qcom_scm *__scm;
@@ -1470,7 +1474,7 @@ static const struct kernel_param_ops download_mode_param_ops = {
 
 module_param_cb(download_mode, &download_mode_param_ops, NULL, 0644);
 MODULE_PARM_DESC(download_mode,
-		"download mode: off/full are acceptable values");
+		"download mode: off/full/mini/full,mini are acceptable values");
 
 static int qcom_scm_probe(struct platform_device *pdev)
 {
-- 
2.7.4


