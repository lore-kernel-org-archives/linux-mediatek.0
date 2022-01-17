Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA89C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 08:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgPFLMFtXgh4/A3VcBF7CM+qsTw6rSc7SCdQT+KT/mE=; b=IEGX98UVYio+N6
	LilGi/Df0BbMA90THCibE6/avUEk6gsCF1xDeFUajQ15DziHoIHDy/G1WF9CVzroT01VpZxTBl6Cw
	rQpQyZf8Bl/9BelW7Mbm4ExzZhTzjphs5h4NThTgbPn1D1onIsi1AmUwhdVPd13OwGzxv6B/BaFVj
	50p7DA2x4OryxMBkY4ycOa3unejxKsVu4i5UC4eNR8aW18yx1cHsCU85ilGsg3PHwC0hBYFrAWUY4
	BXv49HoxdW1uG2cAWwW2jP6ds5d7+WNLgO4HVYQYa8M8e9Pc3isLwdYQktJMBWNbpIba/lnzR0nSY
	TLVZ+u2GrtXUkZTrsGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9NTq-00E5am-31; Mon, 17 Jan 2022 08:35:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9NTH-00E5L5-09; Mon, 17 Jan 2022 08:34:37 +0000
X-UUID: c33c3fdc862f48feada7f95a12c3985a-20220117
X-UUID: c33c3fdc862f48feada7f95a12c3985a-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 128392827; Mon, 17 Jan 2022 01:34:20 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 00:25:57 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 17 Jan 2022 16:25:56 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 16:25:54 +0800
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
Subject: [RESEND v3 2/3] mmc: core: Add support for SDIO async interrupt
Date: Mon, 17 Jan 2022 16:25:38 +0800
Message-ID: <20220117082539.18713-3-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117082539.18713-1-axe.yang@mediatek.com>
References: <20220117082539.18713-1-axe.yang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_003435_062968_B321F9E1 
X-CRM114-Status: GOOD (  17.29  )
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

If cap-sdio-async-irq flag is set in host dts node, parse EAI
information from SDIO CCCR interrupt externsion segment. If async
interrupt is supported by SDIO card then send command to card to
enable it and set enable_async_irq flag in sdio_cccr structure to 1.
The parse flow is implemented in sdio_read_cccr().

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Axe Yang <axe.yang@mediatek.com>
---
 drivers/mmc/core/host.c  |  2 ++
 drivers/mmc/core/sdio.c  | 17 +++++++++++++++++
 include/linux/mmc/card.h |  3 ++-
 include/linux/mmc/host.h |  1 +
 include/linux/mmc/sdio.h |  5 +++++
 5 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index cf140f4ec864..a972241548b4 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -410,6 +410,8 @@ int mmc_of_parse(struct mmc_host *host)
 	if (device_property_read_bool(dev, "no-mmc-hs400"))
 		host->caps2 &= ~(MMC_CAP2_HS400_1_8V | MMC_CAP2_HS400_1_2V |
 				 MMC_CAP2_HS400_ES);
+	if (device_property_read_bool(dev, "cap-sdio-async-irq"))
+		host->caps2 |= MMC_CAP2_SDIO_ASYNC_IRQ;
 
 	/* Must be after "non-removable" check */
 	if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {
diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
index 41164748723d..771fb5d18585 100644
--- a/drivers/mmc/core/sdio.c
+++ b/drivers/mmc/core/sdio.c
@@ -225,6 +225,23 @@ static int sdio_read_cccr(struct mmc_card *card, u32 ocr)
 				card->sw_caps.sd3_drv_type |= SD_DRIVER_TYPE_C;
 			if (data & SDIO_DRIVE_SDTD)
 				card->sw_caps.sd3_drv_type |= SD_DRIVER_TYPE_D;
+
+			if (card->host->caps2 & MMC_CAP2_SDIO_ASYNC_IRQ) {
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
index 37f975875102..4df9182bc0e6 100644
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
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 7afb57cab00b..502a5418264c 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -402,6 +402,7 @@ struct mmc_host {
 #define MMC_CAP2_CRYPTO		0
 #endif
 #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
+#define MMC_CAP2_SDIO_ASYNC_IRQ	(1 << 29)	/* SDIO host supports asynchronous interrupt */
 
 	int			fixed_drv_type;	/* fixed driver type for non-removable media */
 
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
