Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EC5EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 10:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gOSVhCipTQhqe7KQujCKS59XbGovpmGhKA4BrqGRG4=; b=Xq5tzEXSI++cWm4Umlzj7hSS7Z
	qu0RKtzqBauF0dA1lqKDUCw04VVaoOPtCevucjRusW5g84drd2a6IEq7xW8N7kVQclEtaWC+8gqem
	DqDRE9TxABjqVPAUPFkaFgUJLh9ZLPYRz/KB5LszG5d8T4ZvbA0BzCcU3MUe6yUakxtdqJrX1z8zD
	+3saEJpOuTJEjM4PIVJEig6zqD1UNH7yAqcv/bv1F6z2MLc/dyqlF5ub7QFfoiBM+TH5uTd6taElH
	TOtLnhEbDacAv7VRJVNPaxkvoLM1jgQcULCERcFnek5P62VbD1jEtwf0PqHWFOzt1QVlh1AFyxpVH
	/39yk1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeax-000JnE-1k;
	Mon, 11 Sep 2023 10:56:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeat-000JjT-15;
	Mon, 11 Sep 2023 10:56:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BAmZOB029187;
	Mon, 11 Sep 2023 10:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=4gOSVhCipTQhqe7KQujCKS59XbGovpmGhKA4BrqGRG4=;
 b=EoobLeUT13AVt3PTwJqXJwFoFY711k/p9kBdt8sNyDx2SYQiL2+AlkP3xxwlsm4ADRKL
 +CzLEZHmHgE2tbzMTwJIg01wXHipHedMIRBYX64gw0cpiwnoQ0m8KJZ+30IWYBj7ls68
 O4B6FJ6tr5X16QUK15HuMSBPqsZyVw+PPXXXx6cjegZDhcGpXAU4QQc+yJDv9VxJVABk
 uHmq+CbUt6d/izNUgnDhZT4krttKpKCPF18dXXSMYOK9dEqV1UCY1RdxDgpFJh4tWW5v
 csaOh3NHadUqNs2Wdu7Rg2hP7Q3vXSKunSAhJqi/948dEUQt0c7M/c9lIo0ipGPJSY7i lQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0j0fkfm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 10:56:13 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BAuCVt006051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 10:56:13 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 11 Sep 2023 03:55:37 -0700
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
Subject: [REBASE PATCH v5 10/17] pstore: Add pstore_region_defined() helper and export it
Date: Mon, 11 Sep 2023 16:23:52 +0530
Message-ID: <1694429639-21484-11-git-send-email-quic_mojha@quicinc.com>
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
X-Proofpoint-ORIG-GUID: XyQCjwjHOG0scL4SF1euCldLbQ6NjV_y
X-Proofpoint-GUID: XyQCjwjHOG0scL4SF1euCldLbQ6NjV_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309110099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_035639_376545_F41EEECB 
X-CRM114-Status: GOOD (  21.58  )
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

There are users like Qualcomm minidump which is interested in
knowing the pstore frontend addresses and sizes from the backend
(ram) to be able to register it with firmware to finally collect
them during crash for debugging.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 fs/pstore/platform.c   | 15 +++++++++++++++
 fs/pstore/ram.c        | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/pstore.h |  6 ++++++
 3 files changed, 63 insertions(+)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index e5bca9a004cc..fdac951059c1 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -139,6 +139,21 @@ enum pstore_type_id pstore_name_to_type(const char *name)
 }
 EXPORT_SYMBOL_GPL(pstore_name_to_type);
 
+int pstore_region_defined(struct pstore_record *record,
+			  void **virt, phys_addr_t *phys,
+			  size_t *size, unsigned int *max_dump_cnt)
+{
+	if (!psinfo)
+		return -EINVAL;
+
+	record->psi = psinfo;
+
+	return psinfo->region_info ?
+	       psinfo->region_info(record, virt, phys, size, max_dump_cnt) :
+	       -EINVAL;
+}
+EXPORT_SYMBOL_GPL(pstore_region_defined);
+
 static void pstore_timer_kick(void)
 {
 	if (pstore_update_ms < 0)
diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index ab551caa1d2a..62202f3ddf63 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -437,6 +437,47 @@ static int ramoops_pstore_erase(struct pstore_record *record)
 	return 0;
 }
 
+static int ramoops_region_info(struct pstore_record *record,
+			       void **virt, phys_addr_t *phys,
+			       size_t *size, unsigned int *max_dump_cnt)
+{
+	struct ramoops_context *cxt = record->psi->data;
+	struct persistent_ram_zone *prz;
+
+	switch (record->type) {
+	case PSTORE_TYPE_DMESG:
+		if (record->id >= cxt->max_dump_cnt)
+			return -EINVAL;
+		prz = cxt->dprzs[record->id];
+		*max_dump_cnt = cxt->max_dump_cnt;
+		break;
+	case PSTORE_TYPE_CONSOLE:
+		if (!cxt->console_size)
+			return -EINVAL;
+		prz = cxt->cprz;
+		break;
+	case PSTORE_TYPE_FTRACE:
+		if (record->id >= cxt->max_ftrace_cnt)
+			return -EINVAL;
+		prz = cxt->fprzs[record->id];
+		*max_dump_cnt = cxt->max_ftrace_cnt;
+		break;
+	case PSTORE_TYPE_PMSG:
+		if (!cxt->pmsg_size)
+			return -EINVAL;
+		prz = cxt->mprz;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	*virt = prz->vaddr;
+	*phys = prz->paddr;
+	*size = prz->size;
+
+	return 0;
+}
+
 static struct ramoops_context oops_cxt = {
 	.pstore = {
 		.owner	= THIS_MODULE,
@@ -446,6 +487,7 @@ static struct ramoops_context oops_cxt = {
 		.write	= ramoops_pstore_write,
 		.write_user	= ramoops_pstore_write_user,
 		.erase	= ramoops_pstore_erase,
+		.region_info = ramoops_region_info,
 	},
 };
 
diff --git a/include/linux/pstore.h b/include/linux/pstore.h
index 638507a3c8ff..a64d866e8711 100644
--- a/include/linux/pstore.h
+++ b/include/linux/pstore.h
@@ -199,6 +199,9 @@ struct pstore_info {
 	int		(*write_user)(struct pstore_record *record,
 				      const char __user *buf);
 	int		(*erase)(struct pstore_record *record);
+	int		(*region_info)(struct pstore_record *record,
+				       void **virt, phys_addr_t *phys,
+				       size_t *size, unsigned int *max_dump_cnt);
 };
 
 /* Supported frontends */
@@ -230,6 +233,9 @@ struct pstore_ftrace_record {
 #define TS_CPU_SHIFT 8
 #define TS_CPU_MASK (BIT(TS_CPU_SHIFT) - 1)
 
+int pstore_region_defined(struct pstore_record *record,
+			  void **virt, phys_addr_t *phys,
+			  size_t *size, unsigned int *max_dump_cnt);
 /*
  * If CPU number can be stored in IP, store it there, otherwise store it in
  * the time stamp. This means more timestamp resolution is available when
-- 
2.7.4


