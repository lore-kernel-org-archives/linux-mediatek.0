Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86732C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 13:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWMjNm/nU5DIb7kAzkcTKs8li33Qu7nlH6YpR7krqWA=; b=BuuXHH1VwL4v9meHmh3F4tfa58
	BZoW/+Bi8cvu1SZoD443RCM207tkluXRLbojFrbIpoiroER4Md4xyYliGw64V8v8hzRCX0CJb8RSG
	TmtrQ2iyzKpmWFa84TzCyOUeJ5dduNoRUreyzAkEWg+3KKKHKHVmEduw/uqBiepRb+YFgMCLJIUTg
	Q6144ZCnBIFfvJwikN3Ie4AW5xtk50Om+lrIEdLbQkMPKe9aDq72DK3NhMjcDW23H0A9aT8Sz4kzD
	aso0eK+bAT4nPV1oGjvqyz7ZiqcQo2aEksUdgKq8p9eFEY5zYDqw9Q2rn0+8JyvVwPnP04Nl1Qv2d
	yxwtT7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWFdb-0000000CYIV-0ecJ;
	Tue, 23 Jul 2024 13:33:07 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWFbj-0000000CXPk-18Bh;
	Tue, 23 Jul 2024 13:31:13 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4WSyhq6LBHz9sp5;
	Tue, 23 Jul 2024 15:31:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1721741467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rWMjNm/nU5DIb7kAzkcTKs8li33Qu7nlH6YpR7krqWA=;
	b=tfZO7v8evYgRtHCTpNUAAhPj4nuyBl1xgQXJGRL2ByKsB5/RN8LABaLZi1Sz+hJcLMTB+1
	QsPL+L3/8gfk2gFOT1EJHXxM9lH+33/uGNMD8J90JKoXr0ABGMUZK4mplMltD0MbhXtMCs
	vupeyTjjtxoy8EsjBGJlBE1qo4yCAqvTrI17ot2RM9pvUDPIx7UHKSIcWTAx4i4zl6rffH
	TDgdokMZiL5MmSv7mWLcil7CwjdhW290nxIMlneqFnmD80I0LX/e60EBsyYfVp4++Re19r
	tY2a3T8CiZO79tDdh7yxPbEdAD/B/UneK+VuvduyKs2Nigp5Ivr5Fkir8Vq05w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1721741464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rWMjNm/nU5DIb7kAzkcTKs8li33Qu7nlH6YpR7krqWA=;
	b=ppi8DBnPwXk5AX9ydq4fm42sZz4U5FbwBQW6Z3bf6tM/Qn7w65/4+Cv1rVv6mWfvlw9kej
	p3G3JxC0CPgyO0S0NgumfJz6CRDa3tEdPKug4Xk/bfS03f7XRW88ubncqzkjGYVJ3hMgwJ
	O9sZHq1RwBtRocZLo7f2BxzLiDZqZ2sgDAfWS6H3DgMzzZwbAKcf5ITEdCKL5P9dOGZ2Hj
	Pm/5TRCt0jUDm1kl92/DecdyJbz+fMu1x6DCvu6eMqFesUxxNj4tGXuxRB1pgEdbv5m2ng
	9sC5xPivJD6yBKv+cGF8uVorPTlkqs6wSaQBXrMw6zkMUeR5yUJ3P4htF+oalw==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Aleksandr Mishin <amishin@t-argos.ru>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Koichiro Den <den@valinux.co.jp>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 04/15] PCI: brcmstb: Silence set affinity failed warning
Date: Tue, 23 Jul 2024 15:27:04 +0200
Message-ID: <20240723132958.41320-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20240723132958.41320-1-marek.vasut+renesas@mailbox.org>
References: <20240723132958.41320-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c273d39a1d80222af6a
X-MBO-RS-META: myyuu3m7ze6oct9t5rutzgqaoje59518
X-Rspamd-Queue-Id: 4WSyhq6LBHz9sp5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_063111_669917_A99B7798 
X-CRM114-Status: GOOD (  11.43  )
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

Use newly introduced MSI_FLAG_NO_AFFINITY, which keeps .irq_set_affinity unset
and allows migrate_one_irq() code in cpuhotplug.c to exit right away, without
printing "IRQ...: set affinity failed(-22)" warning.

Remove .irq_set_affinity implementation which only return -EINVAL from this
controller driver.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Krzysztof Wilczyński" <kw@linux.com>
Cc: "Pali Rohár" <pali@kernel.org>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Anup Patel <apatel@ventanamicro.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>
Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Jim Quinlan <jim2101024@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Joyce Ooi <joyce.ooi@intel.com>
Cc: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Koichiro Den <den@valinux.co.jp>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>
Cc: Nipun Gupta <nipun.gupta@amd.com>
Cc: Nirmal Patel <nirmal.patel@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>
Cc: Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-tegra@vger.kernel.org
---
V4: - New patch
---
 drivers/pci/controller/pcie-brcmstb.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index c08683febdd40..b9de3acec3753 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -445,8 +445,8 @@ static struct irq_chip brcm_msi_irq_chip = {
 };
 
 static struct msi_domain_info brcm_msi_domain_info = {
-	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
-		   MSI_FLAG_MULTI_PCI_MSI),
+	.flags	= MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
+		  MSI_FLAG_NO_AFFINITY | MSI_FLAG_MULTI_PCI_MSI,
 	.chip	= &brcm_msi_irq_chip,
 };
 
@@ -484,12 +484,6 @@ static void brcm_msi_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 	msg->data = (0xffff & PCIE_MISC_MSI_DATA_CONFIG_VAL_32) | data->hwirq;
 }
 
-static int brcm_msi_set_affinity(struct irq_data *irq_data,
-				 const struct cpumask *mask, bool force)
-{
-	return -EINVAL;
-}
-
 static void brcm_msi_ack_irq(struct irq_data *data)
 {
 	struct brcm_msi *msi = irq_data_get_irq_chip_data(data);
@@ -502,7 +496,6 @@ static void brcm_msi_ack_irq(struct irq_data *data)
 static struct irq_chip brcm_msi_bottom_irq_chip = {
 	.name			= "BRCM STB MSI",
 	.irq_compose_msi_msg	= brcm_msi_compose_msi_msg,
-	.irq_set_affinity	= brcm_msi_set_affinity,
 	.irq_ack                = brcm_msi_ack_irq,
 };
 
-- 
2.43.0


