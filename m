Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBE8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4GCG2nH69xuR0z5QkY2yiUCNtXVZgIAgOeiX5cKHIi0=; b=M9VqsKRVBQ9P5r
	oaY7FmeFOlRBKke3aAfXYKwxSqkcIcBwFCreo4J8IO4Apqcux5boATI3SAl6sV1VN+YmyAnuw5dWm
	PpcP0S347ZKYnMOWfNbl/kzPzpsdGsgVZkrmqTNVrsfHUivAJjbNTZYDEY4ZtsiFW/kYlIjKB748U
	D3Rxz2dZReC9mAQXSXRPnWoW+NFsmeo3ors9WCQxVXhGmEAihi9cTHe9keBEJXeia/OgRFipei75G
	sFQHGpnrmFcTQ9q9eXVkRExrVI2gS6Woz7ADUet74PGLfSOdpfqRetGHks9oMR0bJzVoV0YwNonh5
	gIObPvN1u9nYDD6tFICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUn7u-00FexQ-TS; Thu, 17 Mar 2022 10:13:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUn7R-00Feiz-2a; Thu, 17 Mar 2022 10:12:37 +0000
X-UUID: 2042e92b0781482bae959dcfe51f69a6-20220317
X-UUID: 2042e92b0781482bae959dcfe51f69a6-20220317
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 857425329; Thu, 17 Mar 2022 03:12:25 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 03:12:23 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Mar 2022 18:12:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 18:12:20 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
 <satyat@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Axe Yang
 <axe.yang@mediatek.com>, Lucas Stach <dev@lynxeye.de>, Eric Biggers
 <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd
 <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
 <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [RESEND v7 2/3] mmc: core: Add support for SDIO wakeup interrupt
Date: Thu, 17 Mar 2022 18:12:14 +0800
Message-ID: <20220317101215.24985-3-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317101215.24985-1-axe.yang@mediatek.com>
References: <20220317101215.24985-1-axe.yang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_031233_188296_10DE2BCC 
X-CRM114-Status: GOOD (  14.39  )
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

If wakeup-source flag is set in host dts node, parse EAI information
from SDIO CCCR interrupt externsion segment for in-band wakeup. If
async interrupt is supported by SDIO card then enable it and set
enable_async_irq flag in sdio_cccr structure to 1. The parse flow is
implemented in sdio_read_cccr().

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Axe Yang <axe.yang@mediatek.com>
---
 drivers/mmc/core/sdio.c  | 17 +++++++++++++++++
 include/linux/mmc/card.h |  8 +++++++-
 include/linux/mmc/sdio.h |  5 +++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
index 25799accf8a0..4898c5e9a299 100644
--- a/drivers/mmc/core/sdio.c
+++ b/drivers/mmc/core/sdio.c
@@ -226,6 +226,23 @@ static int sdio_read_cccr(struct mmc_card *card, u32 ocr)
 				card->sw_caps.sd3_drv_type |= SD_DRIVER_TYPE_C;
 			if (data & SDIO_DRIVE_SDTD)
 				card->sw_caps.sd3_drv_type |= SD_DRIVER_TYPE_D;
+
+			if (card->host->pm_caps & MMC_PM_WAKE_SDIO_IRQ) {
+				ret = mmc_io_rw_direct(card, 0, 0, SDIO_CCCR_INTERRUPT_EXT, 0,
+						       &data);
+				if (ret)
+					goto out;
+
+				if (data & SDIO_INTERRUPT_EXT_SAI) {
+					data |= SDIO_INTERRUPT_EXT_EAI;
+					ret = mmc_io_rw_direct(card, 1, 0, SDIO_CCCR_INTERRUPT_EXT,
+							       data, NULL);
+					if (ret)
+						goto out;
+
+					card->cccr.enable_async_irq = 1;
+				}
+			}
 		}
 
 		/* if no uhs mode ensure we check for high speed */
diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
index 37f975875102..968650c0b345 100644
--- a/include/linux/mmc/card.h
+++ b/include/linux/mmc/card.h
@@ -219,7 +219,8 @@ struct sdio_cccr {
 				wide_bus:1,
 				high_power:1,
 				high_speed:1,
-				disable_cd:1;
+				disable_cd:1,
+				enable_async_irq:1;
 };
 
 struct sdio_cis {
@@ -343,6 +344,11 @@ static inline bool mmc_large_sector(struct mmc_card *card)
 	return card->ext_csd.data_sector_size == 4096;
 }
 
+static inline int mmc_card_enable_async_irq(struct mmc_card *card)
+{
+	return card->cccr.enable_async_irq;
+}
+
 bool mmc_card_is_blockaddr(struct mmc_card *card);
 
 #define mmc_card_mmc(c)		((c)->type == MMC_TYPE_MMC)
diff --git a/include/linux/mmc/sdio.h b/include/linux/mmc/sdio.h
index 2a05d1ac4f0e..1ef400f28642 100644
--- a/include/linux/mmc/sdio.h
+++ b/include/linux/mmc/sdio.h
@@ -159,6 +159,11 @@
 #define  SDIO_DTSx_SET_TYPE_A	(1 << SDIO_DRIVE_DTSx_SHIFT)
 #define  SDIO_DTSx_SET_TYPE_C	(2 << SDIO_DRIVE_DTSx_SHIFT)
 #define  SDIO_DTSx_SET_TYPE_D	(3 << SDIO_DRIVE_DTSx_SHIFT)
+
+#define SDIO_CCCR_INTERRUPT_EXT	0x16
+#define SDIO_INTERRUPT_EXT_SAI	(1 << 0)
+#define SDIO_INTERRUPT_EXT_EAI	(1 << 1)
+
 /*
  * Function Basic Registers (FBR)
  */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
