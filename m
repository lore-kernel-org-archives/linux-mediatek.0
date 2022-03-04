Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A0AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 16:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0d95R+dnjhl9QojAXPEV+U/nXh/s268ygfr160gua54=; b=yN2hQRJcUTUoqF
	zUhS1SPNm0hGr7zeHlkvsNFPWaJiiZTJMk9QwUYDqUdOmmEaK8Euh/Eqkt3rrBbrWZT9TMa0YOvqa
	muUCEVowi9tbn7FWdhVrbsxxXo14gE9BfaZkNlaK5ZsJnEalNn7MhDzXeu5Ml/sDOMpuzJc9Tq3VC
	jHfmKC1WqebUXIFKG38e2Pliv2zbhpEbuZUpufWwoqdgzBEW+2WHMmXDwCHotHDlyZMexNVROV2pB
	pqfLc4RQcUvm19Z8or8P+4QQsHzcqyhnKPbR1wyCyCsjNAymSnoGzL8fjsEWXqxvJRoVUO/XriGCA
	Pz19QyaEOrAlc9mqgILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQAis-00B1D0-TW; Fri, 04 Mar 2022 16:24:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQAaZ-00AxpE-GV
 for linux-mediatek@lists.infradead.org; Fri, 04 Mar 2022 16:15:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so5371910wms.4
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Mar 2022 08:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DFsuyCOMy/pl+DrmLQk2yMUaSrmiytEYHpzUyHLsV8M=;
 b=MfM51jgPq7iaGaLlQsyEHm/9ew1UFuusyy1unUC+zh3q+Nmf1L3n9YE7xcAwnx9FCJ
 XjtkR6AKg8+cAcFPWYX11uhdoCZKFxdDbKBnWuA2daTUlTHTqk86YT+PSJaC/tniMNdH
 NMr5Cu842/zTYHMn7BZe8/XaTj11PTamnDTomm4/kLFCTM24KBVCEJIiDCGe6yQwZtV9
 CaNd7/iKn+K2+Pse/Ff5skhlz4Dk+neOVxd4jbOOX9w+pMODz5V+jzlNFm3NxSOLHR8Q
 OqpES/+l3HarKWoFkFL3upi6aue2PIPgM1lNOAPpJM+EfwpXtKiA3095r/sMi/nGfNDm
 DKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DFsuyCOMy/pl+DrmLQk2yMUaSrmiytEYHpzUyHLsV8M=;
 b=OtK11Cz1fwyBPy/PoeSKuGnLHiegWjWaUbCxLBTIGGBLi0+2YkHJrluM5A5U+mCV7i
 0kZT7n2ugCqSCx9jpvErKkZo1whTX3+RQRoHdXrpjDXNKKDw8T7vfvAcJUGvVE2uKLOZ
 6JXFCjBoasKXGtfKKh34jr9ZD5QnVgmS1GCKe/F8W8lVrjQwN99xISXJthaHtULAYfZB
 +YDkvVxZT3zQbh6KEbgXQwM340qNhorQ+NcNUP/8meO9FDBg3Ie6ffEIe/NCyRAvSfBf
 ZlUthwvElB78UJ6IOk/dJG3M/wH2jZuAuCMrPXiPLmi4kpXNE1Z1gtt+c20f8Q1x41cj
 JAnA==
X-Gm-Message-State: AOAM532FYvNI5LL6AazqcONkLe3cPccQzopw8mLHu3s4QQaE+afEa1OL
 EEyh94IGYWq4Wxp004c3TsTu1ahMlKCP95Rw
X-Google-Smtp-Source: ABdhPJyBJOcBWjTtm8HY+gNhpkU9m234PAZ12suoskfo+8t/6sjPrUd+bewsHN/nHvszJDXwairsFA==
X-Received: by 2002:a05:600c:3c9b:b0:380:be98:6204 with SMTP id
 bg27-20020a05600c3c9b00b00380be986204mr8063300wmb.121.1646410529792; 
 Fri, 04 Mar 2022 08:15:29 -0800 (PST)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b001f049726044sm4937307wrv.79.2022.03.04.08.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 08:15:29 -0800 (PST)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 robh+dt@kernel.or
Cc: matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stephane.leprovost@mediatek.com, khilman@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v4 4/7] remoteproc: mtk_apu: Add support of JTAG
Date: Fri,  4 Mar 2022 17:15:11 +0100
Message-Id: <20220304161514.994128-5-abailon@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304161514.994128-1-abailon@baylibre.com>
References: <20220304161514.994128-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_081531_614891_1973F27B 
X-CRM114-Status: GOOD (  21.83  )
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
index 959d24e9492c..28140cf04d8a 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -74,6 +74,15 @@ config MTK_APU
 
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
index 867b4682b507..3905eb5b7174 100644
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
 #include <linux/string.h>
@@ -45,6 +47,11 @@
 #define CORE_DEFAULT1				(0x00000140)
 #define CORE_DEFAULT0_ARUSER_IDMA_USE_IOMMU	(0x10 << 0)
 #define CORE_DEFAULT0_AWUSER_IDMA_USE_IOMMU	(0x10 << 5)
+#define CORE_DEFAULT2				(0x00000144)
+#define CORE_DEFAULT2_DBG_EN			BIT(3)
+#define CORE_DEFAULT2_NIDEN			BIT(2)
+#define CORE_DEFAULT2_SPNIDEN			BIT(1)
+#define CORE_DEFAULT2_SPIDEN			BIT(0)
 #define CORE_XTENSA_ALTRESETVEC			(0x000001F8)
 
 #define VDEV_MEM_COUNT				(3)
@@ -59,6 +66,13 @@ struct mtk_apu_rproc {
 	struct clk_bulk_data *clks;
 	struct iommu_domain *domain;
 	struct list_head mappings;
+
+#ifdef CONFIG_MTK_APU_JTAG
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_jtag;
+	bool jtag_enabled;
+	struct mutex jtag_mutex;
+#endif
 };
 
 static const char * const mt8183_clk_names[] = {
@@ -355,6 +369,133 @@ static irqreturn_t mtk_apu_rproc_callback(int irq, void *data)
 	return IRQ_WAKE_THREAD;
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
@@ -442,6 +583,10 @@ static int mtk_apu_rproc_probe(struct platform_device *pdev)
 		goto free_rproc;
 	}
 
+	ret = apu_jtag_probe(apu_rproc);
+	if (ret)
+		dev_warn(dev, "Failed to configure jtag\n");
+
 	return 0;
 
 free_rproc:
@@ -457,7 +602,7 @@ static int mtk_apu_rproc_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 
 	disable_irq(apu_rproc->irq);
-
+	apu_disable_jtag(apu_rproc);
 	rproc_del(rproc);
 	of_reserved_mem_device_release(dev);
 	rproc_free(rproc);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
