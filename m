Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C799EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 10:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ulb6ivCBYfJxHUM4YBEtsEJoOnSrk2SMWeoI7ndeucs=; b=mB72h1YWXFbUZHK6F8JRYQci0X
	1DrXnxyf6BM3hF7mXzhOwcnazLYzvnE6FaQIVX/3Lq8tG3eLM/arZYJUIGwvplKizNFY3SpK1oiic
	5xAFujCba2xc1ZmDKoYjjRBhJZTI21BZVoedjHmPM7NaU4e4G6/ln7paOR5fEjeoErj+BrIyUm/rn
	G8EGqSczCz2X22tRu7/AcmtNvJZS//p8zUtPne3IzqPtv3J/I3QBpmMCwBMqPzBgTp0UTJMCMKKSq
	nvggfxV9QD4NqzJLt69/+c4YjyVUczXzjxjmhNWtdKSq18W5++9LYujdDSt8sNRmV/JDF6TRKgTEg
	Lpdrb7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeau-000JkO-10;
	Mon, 11 Sep 2023 10:56:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeas-000JiY-04;
	Mon, 11 Sep 2023 10:56:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BAHUGk005010;
	Mon, 11 Sep 2023 10:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Ulb6ivCBYfJxHUM4YBEtsEJoOnSrk2SMWeoI7ndeucs=;
 b=PMVy+DkuMntEMbC6E3AaypPc6J9MF6sKEejS5SF4eIQSNVSFrmhXAPTRcddOmNDRtS+y
 XBwgCr78Vw0oH9FlMM2ELswZh7cIbka+q5Un9HtRgSz61u0g8J9xtSCG3Maflg4du5XG
 QN/OQN6J0dZ5gE4stSdDACe+nNVNVC18By+VvtxgZxyGcPB2Ehq/8NhkSoMnTTADQ03A
 H/TqrLJl25Amd8ejof0lM4LyGMqfKv/PY2D3S0UCBc+0isIpJk4tI3yGmOlOtvQeR/MU
 oqIg5cY+vJy/WEj16vLShRAANt6ILj4pEcYIC5J3bMu0/vzx02WPiHPBXXyXx3NN0bkE 5g== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0hfqkenc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 10:56:13 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BAuCVs006051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 10:56:12 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 11 Sep 2023 03:55:28 -0700
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
Subject: [REBASE PATCH v5 09/17] pstore/ram: Use dynamic ramoops reserve resource
Date: Mon, 11 Sep 2023 16:23:51 +0530
Message-ID: <1694429639-21484-10-git-send-email-quic_mojha@quicinc.com>
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
X-Proofpoint-ORIG-GUID: VlpMUntWdgjbfQBbSQt02UT2ECOTiSRG
X-Proofpoint-GUID: VlpMUntWdgjbfQBbSQt02UT2ECOTiSRG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_035638_065328_9F925091 
X-CRM114-Status: GOOD (  20.13  )
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

As dynamic ramoops command line parsing is now added, so
lets add the support in ramoops driver to get the resource
structure and add it during platform device registration.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 fs/pstore/ram.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index d36702c7ab3c..ab551caa1d2a 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -914,13 +914,17 @@ static void __init ramoops_register_dummy(void)
 
 	/*
 	 * Prepare a dummy platform data structure to carry the module
-	 * parameters. If mem_size isn't set, then there are no module
-	 * parameters, and we can skip this.
+	 * parameters. If mem_size isn't set, check for dynamic ramoops
+	 * size and extract the information if it is set.
 	 */
-	if (!mem_size)
+	if (!mem_size && !dyn_ramoops_res.end)
 		return;
 
 	pr_info("using module parameters\n");
+	if (dyn_ramoops_res.end) {
+		mem_size = resource_size(&dyn_ramoops_res);
+		mem_address = dyn_ramoops_res.start;
+	}
 
 	memset(&pdata, 0, sizeof(pdata));
 	pdata.mem_size = mem_size;
-- 
2.7.4


