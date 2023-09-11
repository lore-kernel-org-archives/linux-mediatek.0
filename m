Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3225EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 10:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKMHFIzgNDvTMejnjOR6kwDOnmpfUj34ZTlTQsO29Hg=; b=VGJhdTLk9oEhTpv6W3jaFb4Qb7
	L47TKldA6dBCsCIYNVc99MrSqPmTWR+Fm1IYNZR9xHXJZUxB7V4aXPQWjNbzsaTN05FA10vjEfqTS
	Ehu3L/Jul1f7ft4h3Mj0082tTIay+bvNHBbHmviBkeKL8DwDK//ZJLLk82nrw1bmSU7tbdw96euEc
	yiuMYTPaxuaWmdY4A0wzAHNRV2jS6cy9V14fADpVY5kD38KAKWiCKCJYdCXPlB0EYpz04eYW3OpzA
	x52FstiJPpxPffLBhWgckucmXhbM6oBsp281GRakGcMWlQm5UsFBL70ZbSNAhGu6qE2mOnczML8V+
	z9Q08x0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeaz-000Jor-2F;
	Mon, 11 Sep 2023 10:56:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeat-000JjF-0s;
	Mon, 11 Sep 2023 10:56:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B8eBlD007844;
	Mon, 11 Sep 2023 10:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=NKMHFIzgNDvTMejnjOR6kwDOnmpfUj34ZTlTQsO29Hg=;
 b=KoVO7sdBJS0she7hPmr4/t1yUhTGgxueqxfq0T1eZxgraPLGrp0cActMnGTzUDg99Jtk
 BxnOLzKd3EVlQ2z03YbA8feoytur2YXujEFaTdZmoal0WVWbv52OH2LbKvp+AS8KZj7a
 rpDrftwtIr4JdSfrBdxbqz9/izdj3rzMu1bCkLJgFi+CTrFbgawnwRLWxo4mOc9EPof/
 qB3+SfFUntkO0IRr4Sa5Pb0c2SwbwKeSjkXgtlthAAUmTXcyXj2CYP4N/WDuWJ0djdSp
 jsmUvadwxlrd/Mj1SqEYo1oH/iN/nhl8FfpJWyl8yc4peCIScbj3FacS+f2NkoA8z0Yk ZQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0hvyke07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 10:56:13 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BAuCVr006051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 10:56:12 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 11 Sep 2023 03:55:19 -0700
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
Subject: [REBASE PATCH v5 08/17] arm64: mm: Add dynamic ramoops region support through command line
Date: Mon, 11 Sep 2023 16:23:50 +0530
Message-ID: <1694429639-21484-9-git-send-email-quic_mojha@quicinc.com>
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
X-Proofpoint-ORIG-GUID: D7aQZe1nCAe-0oMdraPzGcnkv8bF0XPZ
X-Proofpoint-GUID: D7aQZe1nCAe-0oMdraPzGcnkv8bF0XPZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_035639_311865_9B72D110 
X-CRM114-Status: GOOD (  26.45  )
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

The reserved memory region for ramoops is assumed to be at a fixed
and known location when read from the devicetree. This may not be
required for something like Qualcomm's minidump which is interested
in knowing addresses of ramoops region but it does not put hard
requirement of address being fixed as most of it's SoC does not
support warm reset and does not use pstorefs at all instead it has
firmware way of collecting ramoops region if it gets to know the
address and register it with apss minidump table which is sitting
in shared memory region in DDR and firmware will have access to
these table during reset and collects it on crash of SoC.

So, add the support of reserving ramoops region to be dynamically
allocated early during boot if it is request through command line
via 'dyn_ramoops_size=' and fill up reserved resource structure and
export the structure, so that it can be read by ramoops driver.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 arch/arm64/mm/init.c       | 94 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pstore_ram.h |  2 +
 2 files changed, 96 insertions(+)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 8a0f8604348b..680c1ce18fbe 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -31,6 +31,7 @@
 #include <linux/hugetlb.h>
 #include <linux/acpi_iort.h>
 #include <linux/kmemleak.h>
+#include <linux/pstore_ram.h>
 
 #include <asm/boot.h>
 #include <asm/fixmap.h>
@@ -100,6 +101,93 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
 #define ARM64_MEMSTART_ALIGN	(1UL << ARM64_MEMSTART_SHIFT)
 #endif
 
+#define RAMOOPS_ADDR_HIGH_MAX		(PHYS_MASK + 1)
+
+/* Location of the reserved area for the dynamic ramoops */
+struct resource dyn_ramoops_res = {
+	.name  = "ramoops",
+	.start = 0,
+	.end   = 0,
+	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
+	.desc  = IORES_DESC_NONE,
+};
+EXPORT_SYMBOL(dyn_ramoops_res);
+
+static int __init parse_dynamic_ramoops(char *cmdline, unsigned long long *size)
+{
+	const char *name = "dyn_ramoops_size=";
+	char *p = NULL;
+	char *q = NULL;
+	char *tmp;
+
+	if (!cmdline)
+		return -ENOENT;
+
+	/* Check for "dyn_ramoops_size" and use the later if there are more */
+	p = strstr(cmdline, name);
+	while (p) {
+		q = p;
+		p = strchr(p, ' ');
+		if (!p)
+			break;
+
+		p = strstr(p + 1, name);
+	}
+
+	if (!q) {
+		pr_err("ramoops: No entry found for %s\n", name);
+		return -ENOENT;
+	}
+
+	p = q + strlen(name);
+	*size = memparse(p, &tmp);
+	if (p == tmp) {
+		pr_err("ramoops: memory value expected\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int __init parse_dyn_ramoops_size_dummy(char *arg)
+{
+	return 0;
+}
+early_param("dyn_ramoops_size", parse_dyn_ramoops_size_dummy);
+
+/*
+ * reserve_dynamic_ramoops() - reserves memory for dynamic ramoops
+ *
+ * This enable dynamic reserve memory support for ramoops through
+ * command line.
+ */
+static void __init reserve_dynamic_ramoops(void)
+{
+	char *cmdline = boot_command_line;
+	unsigned long long ramoops_base;
+	unsigned long long ramoops_size;
+
+	if (!IS_ENABLED(CONFIG_PSTORE_RAM))
+		return;
+
+	if (parse_dynamic_ramoops(cmdline, &ramoops_size))
+		return;
+
+	ramoops_base = memblock_phys_alloc_range(ramoops_size, SMP_CACHE_BYTES,
+						 0, RAMOOPS_ADDR_HIGH_MAX);
+	if (!ramoops_base) {
+		pr_err("cannot allocate ramoops dynamic memory (size:0x%llx).\n",
+			ramoops_size);
+		return;
+	}
+
+	kmemleak_ignore_phys(ramoops_base);
+
+	dyn_ramoops_res.start = ramoops_base;
+	dyn_ramoops_res.end = ramoops_base + ramoops_size - 1;
+	insert_resource(&iomem_resource, &dyn_ramoops_res);
+}
+
 static int __init reserve_crashkernel_low(unsigned long long low_size)
 {
 	unsigned long long low_base;
@@ -481,6 +569,12 @@ void __init bootmem_init(void)
 	 */
 	reserve_crashkernel();
 
+	/*
+	 * Reserving ramoops region resource dynamically in case it is
+	 * requested from command line.
+	 */
+	reserve_dynamic_ramoops();
+
 	memblock_dump_all();
 }
 
diff --git a/include/linux/pstore_ram.h b/include/linux/pstore_ram.h
index 9d65ff94e216..07d700b7649d 100644
--- a/include/linux/pstore_ram.h
+++ b/include/linux/pstore_ram.h
@@ -10,6 +10,8 @@
 
 #include <linux/pstore.h>
 
+extern struct resource dyn_ramoops_res;
+
 struct persistent_ram_ecc_info {
 	int block_size;
 	int ecc_size;
-- 
2.7.4


