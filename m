Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6366DC3DA63
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 13:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRBABrPdji7cwLt+MY4iniYEY45uLFC7zidsokLoxR0=; b=Ns0B2kX4/7FxomnwK1h+Le8AmH
	EUGG2ruypHOLzwS1uhUacPZBDEwon3UjR2m+QLc0CBoJf/SkPx1Il3qX/kby6GhYKva/4tinWcGT2
	g7JLMxM1Bsk78Zclxd76omnbvUGOwP7x3WynjuKIY5CTWF08v22o/7JXEPSsQ+NslEey3Os6/OyLe
	PyOO4DjN88vVzf5F0b6dKKSOSxBzwE0dcGdqL6NRDs06lTCU8YuFu+/7+s2miTZmOFXomflcxJCfi
	eSY5hwiAoqGxmT3C+ReLIvdV8Kg7XuYv3mov7tYr9iCqiwZQ8m5PJBzyESBuZXrijUvw6pOHc2GaQ
	INUF2ZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWFcE-0000000CXgX-3sw0;
	Tue, 23 Jul 2024 13:31:42 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWFbO-0000000CXI3-2hki;
	Tue, 23 Jul 2024 13:30:52 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4WSyhR6nGHz9sjp;
	Tue, 23 Jul 2024 15:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1721741448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LRBABrPdji7cwLt+MY4iniYEY45uLFC7zidsokLoxR0=;
	b=bPCPRTl5n8+rPT5sbvr0owxSFbqpPpIbUZLL5k688BDrdD4i1u0MeHJmEZWOfxsAEnKgCC
	fslMxZJ8nvEkfzTt/prWe9FERygCWEgw/Rpgz1khITfhOvTUXLQqHm0uX1Um5dFBzLn7XS
	WpfwzthJqmR4Pl53OOmRW8jbFZ+Sdz6EvAGek6bjYP/Z56VrUW2JHIg+uUhTIlzVak+UqP
	vMp7QnhVlBSsnROUl3helBZoyfaLX0MWnh/PysjuWEGrcfSJICxWY6IBJeRmK48t6L4bpg
	LG/CYSSnnGcvUkv5ZP361Ydb6PlIiDn5apzWs1Hf9gmIWixqqT8O07wydS3L4g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1721741445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LRBABrPdji7cwLt+MY4iniYEY45uLFC7zidsokLoxR0=;
	b=v3+rl+/tBJLBksC730XOWBQO9O/xkkdDAVuTnmne/wcBXt+E6x8ohNp/zZS5inJ21iOIJy
	mnhVyp5iOSVfLOxKywDEW0AenpKRuDGJ7Kxbx3wMssCHByI337CY2AGF4d99agoRBbnexq
	jqPy0oQ3794BdY4I96WkE2bE/FtmdZXPuZSd/ALPHIyszesJrrMVcT4QFkVyuZMlhMuAvZ
	EvqYEbj6x2K//ynjz1IPrcbAvbcWLlTi762fBSrLRpq7GGYHUrpwU4u/kgRdkeQxNnse8r
	6Yys35OdbiS8dDCjLMi5mPSv2TrA8GIXoFNgT6qZd70KVCgnnVXo5qMKzSBzzg==
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
Subject: [PATCH v4 01/15] genirq/msi: Silence set affinity failed warning
Date: Tue, 23 Jul 2024 15:27:01 +0200
Message-ID: <20240723132958.41320-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20240723132958.41320-1-marek.vasut+renesas@mailbox.org>
References: <20240723132958.41320-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3256f6e60b26448e5c4
X-MBO-RS-META: xhso8pgoaxhy9km3jgp6dfeyzp65bye6
X-Rspamd-Queue-Id: 4WSyhR6nGHz9sjp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_063051_008730_F70834E1 
X-CRM114-Status: GOOD (  18.57  )
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

Various PCIe controllers that mux MSIs onto single IRQ line produce these
"IRQ%d: set affinity failed" warnings when entering suspend. This has been
discussed before [1] [2] and an example test case is included at the end
of this commit message.

Controller drivers which create MSI IRQ domain with MSI_FLAG_USE_DEF_CHIP_OPS
flag set and which do not override the .irq_set_affinity irqchip callback get
assigned default .irq_set_affinity = msi_domain_set_affinity() callback. That
is not desired on controllers where it is not possible to set affinity of each
MSI IRQ line to a specific CPU core due to hardware limitation.

Introduce dedicated flag MSI_FLAG_NO_AFFINITY, which keeps .irq_set_affinity
unset in case the controller driver did not assign the callback. This way, the
migrate_one_irq() code in cpuhotplug.c can exit right away, without printing
the aforementioned warning. The .irq_set_affinity implementations which only
return -EINVAL can be removed from multiple controller drivers.

```
$ grep 25 /proc/interrupts
 25:   0 0 0 0 0 0 0 0   PCIe MSI   0   Edge   PCIe PME

$ echo core > /sys/power/pm_test ; echo mem > /sys/power/state
...
Disabling non-boot CPUs ...
IRQ25: set affinity failed(-22). <---------- This is being silenced here
psci: CPU7 killed (polled 4 ms)
...
```

[1] https://lore.kernel.org/all/d4a6eea3c5e33a3a4056885419df95a7@kernel.org/
[2] https://lore.kernel.org/all/5f4947b18bf381615a37aa81c2242477@kernel.org/

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
V2: - Introduce MSI_FLAG_NO_AFFINITY to inhibit assignment
      of msi_domain_set_affinity()
V3: - Replace MSI_FLAG_USE_DEF_CHIP_OPS_NOAFF with MSI_FLAG_NO_AFFINITY
      and make MSI_FLAG_NO_AFFINITY into separate flag
    - Update commit message
    - Rebase on current linux-next
    - Use genirq/msi: subject prefix which is likely better fit now
    - Split off R-Car part of the patch
V4: No change
---
 include/linux/msi.h | 2 ++
 kernel/irq/msi.c    | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index 9449797638255..b10093c4d00ea 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -554,6 +554,8 @@ enum {
 	MSI_FLAG_MSIX_CONTIGUOUS	= (1 << 19),
 	/* PCI/MSI-X vectors can be dynamically allocated/freed post MSI-X enable */
 	MSI_FLAG_PCI_MSIX_ALLOC_DYN	= (1 << 20),
+	/* PCI MSIs cannot be steered separately to CPU cores */
+	MSI_FLAG_NO_AFFINITY		= (1 << 21),
 };
 
 /**
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 5fa0547ece0c4..ca6e2ae6d6fc0 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -832,7 +832,7 @@ static void msi_domain_update_chip_ops(struct msi_domain_info *info)
 	struct irq_chip *chip = info->chip;
 
 	BUG_ON(!chip || !chip->irq_mask || !chip->irq_unmask);
-	if (!chip->irq_set_affinity)
+	if (!chip->irq_set_affinity && !(info->flags & MSI_FLAG_NO_AFFINITY))
 		chip->irq_set_affinity = msi_domain_set_affinity;
 }
 
-- 
2.43.0


