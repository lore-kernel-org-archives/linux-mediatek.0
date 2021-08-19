Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B84FC4320A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:12:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26C7860E76
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26C7860E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BiCUUbjk/RxcRZtGZb7tOMirjQfZv84SWzDWcq3Nn0c=; b=QYLBcRuoPo/uJt
	WXtVZn08LsxfIX1RRmYvc9NOeRHJxbwRVhxQ8kFHz3e2FXh+5xep7Nb7jcvNA1pfZNMWSdsumVzCx
	ad7Q5LnN85EcrGmb6aoDVBRrukY6mPQDHXtCiYNjaXXwmFJ330j3P2iOjk+gcCTjXXZbzGXvDOner
	odTweIIm461YRRu7PYjgSHjpR3U44y4qe28E/YRxBmhLvEgh+hyNc91HRAq8EidjKTetrp9HKP2eW
	bk4yf6Y7VghiyVZ+aMihRd1Ktsw1+RkjVO2OolqQHKSor8D3w7JoQDOFXSt1hefbC2ABrC+iFOF0n
	rUkiWCwMpPU4ZmU5i3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGjiZ-008kL4-Id; Thu, 19 Aug 2021 15:12:31 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGjiB-008kDk-Om
 for linux-mediatek@lists.infradead.org; Thu, 19 Aug 2021 15:12:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id v4so9581943wro.12
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Aug 2021 08:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v6GAbr66okOD9V7dTNi4u5Z8fCaq8a6byUdlyqLUflM=;
 b=Ivd46ySJLbNsyxlfRVwWbG0GqXzPnOnmBg9kLe6sNoCc93b2zmwKLIVtfXtBUFSs3t
 RD3cnncBBKsq83vO6sr5ZAWqc9MA4lhDRFx4Nzv7el4ezY2lIP/eie51SgDztqFNH8L4
 5Uma2sJE3gcQHd2Ca07X4+RUrIflsan9LKuteL4bIHmUxRu5LkWSFzlxP5LTxAlSh3Za
 bM2m5x2jCYEjtZeDt3nUUAzrtZyAT8agSj/WPjIi4EV7595MVQ0tdK/Y2lnJwkYAQaLb
 x2WtmeA8T85HCfM9sZfb8u5Wm5FqDfq4WtZFwkvT/8idb1vbdWdV92T3/LdMLzWhtN+i
 nZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v6GAbr66okOD9V7dTNi4u5Z8fCaq8a6byUdlyqLUflM=;
 b=CbDq+BzlRFyAMwBj31zp74bx1boCe2YRwcbHkaDQTIyv6yQITDvKux7G4+Mps7C1q6
 i7cHH72U+GVuiglcPp6rNJnCLbfwbre9VuniFiOifrZjqyYzCjkqRC/Jgic3ReLMpKqu
 2UXNjFSN2B2FxukIuqwGbX5fN0EbLE23n0AgfiNZVB74bL6ciSzRbDO5xjxEsBnM+kaY
 Y45pW0pN4Kd1CQUKoiopFsBG5gAKvqoJiCgJmmo8Ht5rIXId2F/HQn9hsPNDUPqtgtxF
 PWgnwS8HYRhHVeVxcnAjoMPWg4FAV9fYtdvaa0k92+AOveYJ+Y4pIA7MFW/PkDyT8sKU
 49bQ==
X-Gm-Message-State: AOAM533Fvzbq6TIYGnMfOHWFcso+sxaeu0dV2Mmgq5xD86z1Vnn0Fq51
 CgCDgqSo3AkFqcKRmnjHxF/SHg==
X-Google-Smtp-Source: ABdhPJxBE5twHcmKowsG+ovIEnPxIQ8S3bdEfeFLCv51hFg0jKHZTJmwlsXhIIq2/OLE2ElyuD+KbQ==
X-Received: by 2002:a5d:4309:: with SMTP id h9mr4415176wrq.299.1629385925959; 
 Thu, 19 Aug 2021 08:12:05 -0700 (PDT)
Received: from alex-xps13.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j37sm1556962wms.39.2021.08.19.08.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 08:12:05 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 robh+dt@kernel.org
Cc: matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stephane.leprovost@mediatek.com, gpain@baylibre.com, khilman@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v3 3/4] remoteproc: mtk_vpu_rproc: Add support of JTAG
Date: Thu, 19 Aug 2021 17:13:39 +0200
Message-Id: <20210819151340.741565-4-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819151340.741565-1-abailon@baylibre.com>
References: <20210819151340.741565-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_081207_919700_E55B7E73 
X-CRM114-Status: GOOD (  22.49  )
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

The DSP could be debugged using JTAG.
The support of JTAG could enabled at build time and it could be enabled
using debugfs.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/remoteproc/Kconfig   |   9 +++
 drivers/remoteproc/mtk_apu.c | 147 ++++++++++++++++++++++++++++++++++-
 2 files changed, 155 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 6c106a6c3ad5d..cb1a2d9f4a9f6 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -63,6 +63,15 @@ config MTK_APU
 
 	  It's safe to say N here.
 
+config MTK_APU_JTAG
+	bool "Enable support of JTAG"
+	depends on MTK_APU
+	help
+	  Say y to enable support of JTAG.
+	  By default, JTAG will remain disabled until it is enabled using
+	  debugfs: remoteproc/remoteproc0/jtag. Write 1 to enable it and
+	  0 to disable it.
+
 config OMAP_REMOTEPROC
 	tristate "OMAP remoteproc support"
 	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
diff --git a/drivers/remoteproc/mtk_apu.c b/drivers/remoteproc/mtk_apu.c
index 0e3f63987bd85..3daed38bb5188 100644
--- a/drivers/remoteproc/mtk_apu.c
+++ b/drivers/remoteproc/mtk_apu.c
@@ -5,12 +5,14 @@
 
 #include <linux/bitops.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/iommu.h>
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
 
@@ -44,6 +46,11 @@
 #define CORE_DEFAULT1				(0x00000140)
 #define CORE_DEFAULT0_ARUSER_IDMA_USE_IOMMU	(0x10 << 0)
 #define CORE_DEFAULT0_AWUSER_IDMA_USE_IOMMU	(0x10 << 5)
+#define CORE_DEFAULT2				(0x00000144)
+#define CORE_DEFAULT2_DBG_EN			BIT(3)
+#define CORE_DEFAULT2_NIDEN			BIT(2)
+#define CORE_DEFAULT2_SPNIDEN			BIT(1)
+#define CORE_DEFAULT2_SPIDEN			BIT(0)
 #define CORE_XTENSA_ALTRESETVEC			(0x000001F8)
 
 #define RSC_VENDOR_CARVEOUT			(RSC_VENDOR_START + 1)
@@ -56,6 +63,13 @@ struct mtk_apu_rproc {
 	int irq;
 	struct clk_bulk_data clks[3];
 	struct list_head mappings;
+
+#ifdef CONFIG_MTK_APU_JTAG
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_jtag;
+	bool jtag_enabled;
+	struct mutex jtag_mutex;
+#endif
 };
 
 static int mtk_apu_iommu_map(struct rproc *rproc, struct rproc_mem_entry *entry)
@@ -333,6 +347,133 @@ static irqreturn_t handle_event(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+#ifdef CONFIG_MTK_APU_JTAG
+
+static int apu_enable_jtag(struct mtk_apu_rproc *apu_rproc)
+{
+	int ret = 0;
+
+	mutex_lock(&apu_rproc->jtag_mutex);
+	if (apu_rproc->jtag_enabled)
+		goto err_mutex_unlock;
+
+	writel(CORE_DEFAULT2_SPNIDEN | CORE_DEFAULT2_SPIDEN |
+		CORE_DEFAULT2_NIDEN | CORE_DEFAULT2_DBG_EN,
+		apu_rproc->base + CORE_DEFAULT2);
+
+	apu_rproc->jtag_enabled = 1;
+
+err_mutex_unlock:
+	mutex_unlock(&apu_rproc->jtag_mutex);
+
+	return ret;
+}
+
+static int apu_disable_jtag(struct mtk_apu_rproc *apu_rproc)
+{
+	int ret = 0;
+
+	mutex_lock(&apu_rproc->jtag_mutex);
+	if (!apu_rproc->jtag_enabled)
+		goto err_mutex_unlock;
+
+	writel(0, apu_rproc->base + CORE_DEFAULT2);
+
+	apu_rproc->jtag_enabled = 0;
+
+err_mutex_unlock:
+	mutex_unlock(&apu_rproc->jtag_mutex);
+
+	return ret;
+}
+
+static ssize_t rproc_jtag_read(struct file *filp, char __user *userbuf,
+			       size_t count, loff_t *ppos)
+{
+	struct rproc *rproc = filp->private_data;
+	struct mtk_apu_rproc *apu_rproc = (struct mtk_apu_rproc *)rproc->priv;
+	char *buf = apu_rproc->jtag_enabled ? "enabled\n" : "disabled\n";
+
+	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
+}
+
+static ssize_t rproc_jtag_write(struct file *filp, const char __user *user_buf,
+				size_t count, loff_t *ppos)
+{
+	struct rproc *rproc = filp->private_data;
+	struct mtk_apu_rproc *apu_rproc = (struct mtk_apu_rproc *)rproc->priv;
+	char buf[10];
+	int ret;
+
+	if (count < 1 || count > sizeof(buf))
+		return -EINVAL;
+
+	ret = copy_from_user(buf, user_buf, count);
+	if (ret)
+		return -EFAULT;
+
+	/* remove end of line */
+	if (buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
+
+	if (!strncmp(buf, "enabled", count))
+		ret = apu_enable_jtag(apu_rproc);
+	else if (!strncmp(buf, "disabled", count))
+		ret = apu_disable_jtag(apu_rproc);
+	else
+		return -EINVAL;
+
+	return ret ? ret : count;
+}
+
+static const struct file_operations rproc_jtag_ops = {
+	.read = rproc_jtag_read,
+	.write = rproc_jtag_write,
+	.open = simple_open,
+};
+
+static int apu_jtag_probe(struct mtk_apu_rproc *apu_rproc)
+{
+	int ret;
+
+	if (!apu_rproc->rproc->dbg_dir)
+		return -ENODEV;
+
+	apu_rproc->pinctrl = devm_pinctrl_get(apu_rproc->dev);
+	if (IS_ERR(apu_rproc->pinctrl)) {
+		dev_warn(apu_rproc->dev, "Failed to find JTAG pinctrl\n");
+		return PTR_ERR(apu_rproc->pinctrl);
+	}
+
+	apu_rproc->pinctrl_jtag = pinctrl_lookup_state(apu_rproc->pinctrl,
+						       "jtag");
+	if (IS_ERR(apu_rproc->pinctrl_jtag))
+		return PTR_ERR(apu_rproc->pinctrl_jtag);
+
+	ret = pinctrl_select_state(apu_rproc->pinctrl,
+				   apu_rproc->pinctrl_jtag);
+	if (ret < 0)
+		return ret;
+
+	mutex_init(&apu_rproc->jtag_mutex);
+
+	debugfs_create_file("jtag", 0600, apu_rproc->rproc->dbg_dir,
+			    apu_rproc->rproc, &rproc_jtag_ops);
+
+	return 0;
+}
+#else
+static int apu_jtag_probe(struct mtk_apu_rproc *apu_rproc)
+{
+	return 0;
+}
+
+static int apu_disable_jtag(struct mtk_apu_rproc *apu_rproc)
+{
+	return 0;
+}
+#endif /* CONFIG_MTK_APU_JTAG */
+
 static int mtk_apu_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -396,6 +537,10 @@ static int mtk_apu_rproc_probe(struct platform_device *pdev)
 		goto free_rproc;
 	}
 
+	ret = apu_jtag_probe(apu_rproc);
+	if (ret)
+		dev_warn(dev, "Failed to configure jtag\n");
+
 	return 0;
 
 free_rproc:
@@ -411,7 +556,7 @@ static int mtk_apu_rproc_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 
 	disable_irq(apu_rproc->irq);
-
+	apu_disable_jtag(apu_rproc);
 	rproc_del(rproc);
 	of_reserved_mem_device_release(dev);
 	rproc_free(rproc);
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
