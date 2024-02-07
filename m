Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D2AC4828F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 17:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2c9IXrDCG2O8cchDAjQe99TIBBuW6s+seZlC0GVMbm0=; b=Zg1E141eKEY5atcHQwpOoL9JFb
	ZUJqdyNhDPrb563Y9P4E0dnB/JdNnHwTb8V8thTFSDdVLWUTW1JyXsTVMW14LmeGjTBhBg/6K68XM
	5Ncj5sytfWrYjOmGaXDThGMr+mAmfF4C90uPzUForR4Aw6bb2/sGNTlNofUUNMpYL7HvoVMz6xshI
	eHtixxUbowrHIRtw/OC9fPMvfCWqnNtWnQ28O7SIgxLykVEw677aLd3oB7yXI6F4c2kC7XHVMtlId
	/QBvAk/h4/+xnkt+6YW6mqMLFK/jo0FR61Pvs0j95cAzpHgV3pd5gi6pIcX4MmNUtKWXmQzfLhVCU
	4APOf6Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXlwt-0000000BL8Y-3S3m;
	Wed, 07 Feb 2024 17:43:03 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXlwp-0000000BL48-21SU;
	Wed, 07 Feb 2024 17:43:02 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rXlwe-00041Z-08;
	Wed, 07 Feb 2024 17:42:48 +0000
Date: Wed, 7 Feb 2024 17:42:41 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	William-tw Lin <william-tw.lin@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: mtk-socinfo: depends on CONFIG_SOC_BUS
Message-ID: <cc8f7f7da5bdccce514a320e0ae7468659cf7346.1707327680.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_094259_547068_CBA94471 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

The mtk-socinfo driver uses symbols 'soc_device_register' and
'soc_device_unregister' which are part of the bus driver for
System-on-Chip devices.

Select SOC_BUS to make sure that driver is built and the symbols are
available.

Fixes: 423a54da3c7e ("soc: mediatek: mtk-socinfo: Add driver for getting chip information")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index 50c664b65f4d4..1b7afb19ccd63 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -72,6 +72,7 @@ config MTK_SOCINFO
 	tristate "MediaTek SoC Information"
 	default y
 	depends on NVMEM_MTK_EFUSE
+	select SOC_BUS
 	help
 	  The MediaTek SoC Information (mtk-socinfo) driver provides
 	  information about the SoC to the userspace including the
-- 
2.43.0


