Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8071CEE14C3
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Sep 2023 20:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACXZo6SoFenqElAwh1aLmZnN6nH9EA+30CpBcrvZiOI=; b=zpjyVVmQ2JCvYnhSxutKURDgr9
	EtG6lAjnfaN/6pBqNv3UN9XOWSnSBLZ83tBCd72G+rHJ0c7Jx31TCZtQrVYSfNlOEyKd8QTyZMzws
	zE8fIJ0EwboAgj84J6tY4O+AURTuRbKKlJWtY9nduLDfbMFJvf0BfsVqbcL798qGbV/qnnba/ys1f
	9toPS/tITba2KchI/PlzzU7TXX83AHb9i1joX38bO7A1v1QkwO3/6c20oV4xgjnF4C9R6zuc1PcU2
	HoGjg4UTypZ3B2f78gWGElrxTgIDrd+WzbSElwWo5/23oC3zh2ySvKfZOcH/Ex3GHqhQbq3GH1Bfk
	bR9evAsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4RK-00FmiW-1N;
	Sat, 09 Sep 2023 20:20:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4RI-00FmhK-12;
	Sat, 09 Sep 2023 20:20:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 389KJIBh030508;
	Sat, 9 Sep 2023 20:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=ACXZo6SoFenqElAwh1aLmZnN6nH9EA+30CpBcrvZiOI=;
 b=Rt1gP1l5mXVAmq1hgjVY/pRMA+ogMvFXupVoxzTo2LeeTfwyJbn0NlPcJeja6I1bfxmK
 xUW659AMsZLMxg+V/8s5rxA7r9Kiim2F3BwpiPz9v5WlM22ti2Ap3bSdWd/TEWwwY0QE
 dyoO+JlkguQN/QYFtLiKjN/Vv1iwzd2BTNu3h8Ydpf7G18p9iumyco5iAyCgctij1Bjc
 3vxOVaxmxqqlSKhyWx6WK9XinUfgFw+rqm6YEyoa3VtT1EGFCKd9WWcYw3VJQ6+Nml8q
 V7KrhKirTwHYHhBuwBqY0tuBp7rTP+7lDeEuvFwJ1QKnR61KVzqgDRTK2ZXGfSSlopsX 5Q== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0edmh6se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Sep 2023 20:19:18 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 389KIxVf024061
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 9 Sep 2023 20:18:59 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sat, 9 Sep 2023 13:18:48 -0700
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
Subject: [PATCH v5 15/17] firmware: scm: Modify only the download bits in TCSR register
Date: Sun, 10 Sep 2023 01:46:16 +0530
Message-ID: <1694290578-17733-16-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mf2Som43FWD0w6bnaWgCvn2IUOBI5APA
X-Proofpoint-GUID: mf2Som43FWD0w6bnaWgCvn2IUOBI5APA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-09_19,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309090188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_132020_370186_B5CAE0B6 
X-CRM114-Status: GOOD (  19.85  )
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

Crashdump collection is based on the DLOAD bit of TCSR register.
To retain other bits, we read the register and modify only the
DLOAD bit as the other bits have their own significance.

Co-developed-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/firmware/qcom_scm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 5ea8fc4fd4e8..eda92f713019 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -5,6 +5,8 @@
 #include <linux/platform_device.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/completion.h>
 #include <linux/cpumask.h>
 #include <linux/export.h>
@@ -30,6 +32,10 @@ module_param(download_mode, bool, 0);
 #define SCM_HAS_IFACE_CLK	BIT(1)
 #define SCM_HAS_BUS_CLK		BIT(2)
 
+#define QCOM_DLOAD_MASK		GENMASK(5, 4)
+#define QCOM_DLOAD_FULLDUMP	0x1
+#define QCOM_DLOAD_NODUMP	0x0
+
 struct qcom_scm {
 	struct device *dev;
 	struct clk *core_clk;
@@ -444,6 +450,7 @@ static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 
 static void qcom_scm_set_download_mode(bool enable)
 {
+	u32 val = enable ? QCOM_DLOAD_FULLDUMP : QCOM_DLOAD_NODUMP;
 	bool avail;
 	int ret = 0;
 
@@ -453,8 +460,9 @@ static void qcom_scm_set_download_mode(bool enable)
 	if (avail) {
 		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
 	} else if (__scm->dload_mode_addr) {
-		ret = qcom_scm_io_writel(__scm->dload_mode_addr,
-				enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
+		ret = qcom_scm_io_update_field(__scm->dload_mode_addr,
+					       QCOM_DLOAD_MASK,
+					       FIELD_PREP(QCOM_DLOAD_MASK, val));
 	} else {
 		dev_err(__scm->dev,
 			"No available mechanism for setting download mode\n");
-- 
2.7.4


