Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59543C432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 14:23:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 246BC20637
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 14:23:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lrDUUcbN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BAVmAcet"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 246BC20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31ibV2hddAz3+um9uPnv4fNFh3h7iS6fngeJZ4DR6p8=; b=lrDUUcbNSdvxwh
	N5RQnLlT+0JUW0Hx30lVnTtNDgsJAXgVXpWxIjHYR7vB26zZtu1WPGrDAuBoT4eFPrCBLCa5uoxRX
	+9I9335uNeuxfwKTHGAwV/4YptEOL0De9tHzscDtd19Hkqcjm6UY8rOELwaqnJffkjyvXbAMovoke
	5CNRxCZNOuF9f5e7rEPbGZ6jkSvWIFm2LfJtnBcoskVulXYRT0N+DrfrHXR74FGsSFUYrQAxWrTbC
	ysUeFGMHeZZ2Z0QZZyC/CYpxlZrEoOa13yeMCSsEzQ7/qG27WNbZZ8slaG+2X1sSmETvJ/ZDYlxtF
	gi9mxEXVpR3XWwIeCQbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZyET-0007jM-56; Wed, 27 Nov 2019 14:23:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZyDu-0007Et-Mz; Wed, 27 Nov 2019 14:23:20 +0000
X-UUID: 4d36f98ea5a545f0aea9b09887e440a7-20191127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WFphvlMRaDKdtjVxAem+AWZT/bf0cnW1dQzo9Dpt9Co=; 
 b=BAVmAcettnKIN1LE0bkG5QTvcqrXyT6Lq4JIDlH38hYhfJ8FTOlxN3QoH1xjhx1wWhwxunCIiuk/H10ksaFLNX9EmECaOLGB0dOp2Gq5OUwYBI76/NEVoOh6EpOkq9vVtUI/U3c8mH5lnHnhQTvLPen0WfOhLgbefYONPOT/2Dw=;
X-UUID: 4d36f98ea5a545f0aea9b09887e440a7-20191127
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1840600412; Wed, 27 Nov 2019 06:23:08 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 06:23:42 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 27 Nov 2019 22:23:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 27 Nov 2019 22:23:03 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v5 3/3] hwrng: add mtk-sec-rng driver
Date: Wed, 27 Nov 2019 22:22:58 +0800
Message-ID: <1574864578-467-4-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1574864578-467-1-git-send-email-neal.liu@mediatek.com>
References: <1574864578-467-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_062318_754648_D16618B3 
X-CRM114-Status: GOOD (  16.56  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Crystal Guo <Crystal.Guo@mediatek.com>,
 linux-crypto@vger.kernel.org, Neal Liu <neal.liu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For MediaTek SoCs on ARMv8 with TrustZone enabled, peripherals like
entropy sources is not accessible from normal world (linux) and
rather accessible from secure world (ATF/TEE) only. This driver aims
to provide a generic interface to ATF rng service.

Signed-off-by: Neal Liu <neal.liu@mediatek.com>
---
 drivers/char/hw_random/Kconfig       |   16 ++++++
 drivers/char/hw_random/Makefile      |    1 +
 drivers/char/hw_random/mtk-sec-rng.c |  103 ++++++++++++++++++++++++++++++++++
 3 files changed, 120 insertions(+)
 create mode 100644 drivers/char/hw_random/mtk-sec-rng.c

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index 25a7d8f..f08c852 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -398,6 +398,22 @@ config HW_RANDOM_MTK
 
 	  If unsure, say Y.
 
+config HW_RANDOM_MTK_SEC
+	tristate "MediaTek Security Random Number Generator support"
+	depends on HW_RANDOM
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	default HW_RANDOM
+	  help
+	  This driver provides kernel-side support for the Random Number
+	  Generator hardware found on MediaTek SoCs. The difference with
+	  mtk-rng is the Random Number Generator hardware is secure
+	  access only.
+
+	  To compile this driver as a module, choose M here. the
+	  module will be called mtk-sec-rng.
+
+	  If unsure, say Y.
+
 config HW_RANDOM_S390
 	tristate "S390 True Random Number Generator support"
 	depends on S390
diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
index 7c9ef4a..bee5412 100644
--- a/drivers/char/hw_random/Makefile
+++ b/drivers/char/hw_random/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_HW_RANDOM_PIC32) += pic32-rng.o
 obj-$(CONFIG_HW_RANDOM_MESON) += meson-rng.o
 obj-$(CONFIG_HW_RANDOM_CAVIUM) += cavium-rng.o cavium-rng-vf.o
 obj-$(CONFIG_HW_RANDOM_MTK)	+= mtk-rng.o
+obj-$(CONFIG_HW_RANDOM_MTK_SEC)	+= mtk-sec-rng.o
 obj-$(CONFIG_HW_RANDOM_S390) += s390-trng.o
 obj-$(CONFIG_HW_RANDOM_KEYSTONE) += ks-sa-rng.o
 obj-$(CONFIG_HW_RANDOM_OPTEE) += optee-rng.o
diff --git a/drivers/char/hw_random/mtk-sec-rng.c b/drivers/char/hw_random/mtk-sec-rng.c
new file mode 100644
index 0000000..69ddeca
--- /dev/null
+++ b/drivers/char/hw_random/mtk-sec-rng.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 MediaTek Inc.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/hw_random.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
+
+#define MTK_SEC_RNG_MAGIC	0x74726e67
+#define SMC_RET_NUM		4
+#define MTK_SEC_RND_SIZE	(sizeof(u32) * SMC_RET_NUM)
+
+static void mtk_sec_get_rnd(uint32_t *val)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(MTK_SIP_KERNEL_GET_RND,
+		      MTK_SEC_RNG_MAGIC, 0, 0, 0, 0, 0, 0, &res);
+
+	val[0] = res.a0;
+	val[1] = res.a1;
+	val[2] = res.a2;
+	val[3] = res.a3;
+}
+
+static int mtk_sec_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
+{
+	u32 val[4] = {0};
+	int retval = 0;
+	int i;
+
+	while (max >= MTK_SEC_RND_SIZE) {
+		mtk_sec_get_rnd(val);
+
+		for (i = 0; i < SMC_RET_NUM; i++) {
+			*(u32 *)buf = val[i];
+			buf += sizeof(u32);
+		}
+
+		retval += MTK_SEC_RND_SIZE;
+		max -= MTK_SEC_RND_SIZE;
+	}
+
+	return retval;
+}
+
+static struct hwrng mtk_sec_rng = {
+	.name = "mtk_sec_rng",
+	.read = mtk_sec_rng_read,
+	.quality = 900,
+};
+
+static int mtk_sec_rng_probe(void)
+{
+	int ret;
+
+	ret = hwrng_register(&mtk_sec_rng);
+	if (ret) {
+		pr_err("Failed to register rng device: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __init mtk_sec_rng_driver_init(void)
+{
+	struct device_node *fw_np;
+	struct device_node *np;
+	const char *method;
+
+	fw_np = of_find_node_by_name(NULL, "firmware");
+	if (!fw_np)
+		return -ENODEV;
+
+	np = of_find_compatible_node(fw_np, NULL, "mediatek,mtk-sec-rng");
+	if (!np)
+		return -ENODEV;
+
+	if (of_property_read_string(np, "method", &method))
+		return -ENXIO;
+
+	if (strncmp("smc", method, strlen("smc")))
+		return -EINVAL;
+
+	return mtk_sec_rng_probe();
+}
+
+static void __exit mtk_sec_rng_driver_exit(void)
+{
+	hwrng_unregister(&mtk_sec_rng);
+}
+
+module_init(mtk_sec_rng_driver_init);
+module_exit(mtk_sec_rng_driver_exit);
+
+MODULE_DESCRIPTION("MediaTek Security Random Number Generator Driver");
+MODULE_AUTHOR("Neal Liu <neal.liu@mediatek.com>");
+MODULE_LICENSE("GPL");
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
