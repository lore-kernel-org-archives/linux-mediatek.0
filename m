Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4FDC4BA0D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 05:14:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C5521556
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 05:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ato1B1S9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZeRgWc6Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C5521556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alZl7DgXRvGMjZohj+uOVP7cmvcgLQlA2BRy3PqbDMs=; b=Ato1B1S9Z+dm6x
	n575X0PyNCUTheA17wRqqAalOxeB/428GaRZUtO5tHxR9RZzV1P4wSPuOGM1vCoKn56guE4ZEf7k6
	qdQeqCLr7n6G1yprZCx9vwjK1NjGLUFb5eMVeoqfnLbBvlG+BiFtEW7CTHbjTvTR8DDSCi+UxZ9E+
	vGh+gm9FnSjdg9vHYxr94Bi42OXa7J7r4fjtLg/I2+E5pkeAlTjEt4Zlz5mlTaalm0s0k0cP+/ENK
	DEtGQaKCAkIWJ+f/pTunAeCRLIOHIqOcSmlwTxKkKizXmX2r9sRYkXgxTA2oILliKhFTJ+L5or7WW
	QKISVJCBjVQw/iC9zf2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6p1S-0003Ys-9x; Wed, 26 Feb 2020 05:14:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6p0p-0002x2-RQ; Wed, 26 Feb 2020 05:13:38 +0000
X-UUID: e1d58add5d43411ab6a3d67ad3c597b7-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DuV7mTzvMY/R1SC/6qPWzNUb/M2nXWcHc3YDd6kdvLU=; 
 b=ZeRgWc6YSFrlvN+iTQCIn4+urjop/IyOHKAuk3TUlC+pGKYTtNvINPwWgAvqTsquVpgsGOsBhB5TJRj/b2MdqqNkuq2Cu5JXvotlHU1aM75eZ47huBCKNfrduV/dibl/sNb71LfDoEuVgxTOZfx4iQ607ffUAJKtPiaLnxpHBi8=;
X-UUID: e1d58add5d43411ab6a3d67ad3c597b7-20200225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ran.bi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 977767806; Tue, 25 Feb 2020 21:13:33 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 21:14:10 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 13:09:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 13:13:25 +0800
From: Ran Bi <ran.bi@mediatek.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/4] rtc: add support for the MediaTek MT2712 RTC
Date: Wed, 26 Feb 2020 13:13:01 +0800
Message-ID: <20200226051303.22560-3-ran.bi@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200226051303.22560-1-ran.bi@mediatek.com>
References: <20200226051303.22560-1-ran.bi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5E48E4219BF1F7E42CFB405BCFEA4DAC90F39100BED726D22D012C5B8FE0CCA12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_211335_949875_B2DEDCD5 
X-CRM114-Status: GOOD (  18.99  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Flora
 Fu <flora.fu@mediatek.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Ran Bi <ran.bi@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This add support for the MediaTek MT2712 RTC. It was SoC based RTC, but
had different architecture compared with MT7622 RTC.

Signed-off-by: Ran Bi <ran.bi@mediatek.com>
---
 drivers/rtc/Kconfig      |  10 +
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-mt2712.c | 422 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 433 insertions(+)
 create mode 100644 drivers/rtc/rtc-mt2712.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 34c8b6c7e095..685fb00bfda1 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1806,6 +1806,16 @@ config RTC_DRV_MOXART
 	   This driver can also be built as a module. If so, the module
 	   will be called rtc-moxart
 
+config RTC_DRV_MT2712
+	tristate "MediaTek MT2712 SoC based RTC"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  This enables support for the real time clock built in the MediaTek
+	  SoCs for MT2712.
+
+	  This drive can also be built as a module. If so, the module
+	  will be called rtc-mt2712.
+
 config RTC_DRV_MT6397
 	tristate "MediaTek PMIC based RTC"
 	depends on MFD_MT6397 || (COMPILE_TEST && IRQ_DOMAIN)
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 4ac8f19fb631..6c3e93aa36dc 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -110,6 +110,7 @@ obj-$(CONFIG_RTC_DRV_MESON)	+= rtc-meson.o
 obj-$(CONFIG_RTC_DRV_MOXART)	+= rtc-moxart.o
 obj-$(CONFIG_RTC_DRV_MPC5121)	+= rtc-mpc5121.o
 obj-$(CONFIG_RTC_DRV_MSM6242)	+= rtc-msm6242.o
+obj-$(CONFIG_RTC_DRV_MT2712)	+= rtc-mt2712.o
 obj-$(CONFIG_RTC_DRV_MT6397)	+= rtc-mt6397.o
 obj-$(CONFIG_RTC_DRV_MT7622)	+= rtc-mt7622.o
 obj-$(CONFIG_RTC_DRV_MV)	+= rtc-mv.o
diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
new file mode 100644
index 000000000000..2cb9392a1cdd
--- /dev/null
+++ b/drivers/rtc/rtc-mt2712.c
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: Ran Bi <ran.bi@mediatek.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+
+#define MT2712_BBPU		0x0000
+#define MT2712_BBPU_CLRPKY	BIT(4)
+#define MT2712_BBPU_RELOAD	BIT(5)
+#define MT2712_BBPU_CBUSY	BIT(6)
+#define MT2712_BBPU_KEY		(0x43 << 8)
+
+#define MT2712_IRQ_STA		0x0004
+#define MT2712_IRQ_STA_AL	BIT(0)
+#define MT2712_IRQ_STA_TC	BIT(1)
+
+#define MT2712_IRQ_EN		0x0008
+#define MT2712_IRQ_EN_AL	BIT(0)
+#define MT2712_IRQ_EN_TC	BIT(1)
+#define MT2712_IRQ_EN_ONESHOT	BIT(2)
+
+#define MT2712_CII_EN		0x000c
+
+#define MT2712_AL_MASK		0x0010
+#define MT2712_AL_MASK_DOW	BIT(4)
+
+#define MT2712_TC_SEC		0x0014
+#define MT2712_TC_MIN		0x0018
+#define MT2712_TC_HOU		0x001c
+#define MT2712_TC_DOM		0x0020
+#define MT2712_TC_DOW		0x0024
+#define MT2712_TC_MTH		0x0028
+#define MT2712_TC_YEA		0x002c
+
+#define MT2712_AL_SEC		0x0030
+#define MT2712_AL_MIN		0x0034
+#define MT2712_AL_HOU		0x0038
+#define MT2712_AL_DOM		0x003c
+#define MT2712_AL_DOW		0x0040
+#define MT2712_AL_MTH		0x0044
+#define MT2712_AL_YEA		0x0048
+
+#define MT2712_SEC_MASK		0x003f
+#define MT2712_MIN_MASK		0x003f
+#define MT2712_HOU_MASK		0x001f
+#define MT2712_DOM_MASK		0x001f
+#define MT2712_DOW_MASK		0x0007
+#define MT2712_MTH_MASK		0x000f
+#define MT2712_YEA_MASK		0x007f
+
+#define MT2712_POWERKEY1	0x004c
+#define MT2712_POWERKEY2	0x0050
+#define MT2712_POWERKEY1_KEY	0xa357
+#define MT2712_POWERKEY2_KEY	0x67d2
+
+#define MT2712_CON0		0x005c
+#define MT2712_CON1		0x0060
+
+#define MT2712_PROT		0x0070
+#define MT2712_PROT_UNLOCK1	0x9136
+#define MT2712_PROT_UNLOCK2	0x586a
+
+#define MT2712_WRTGR		0x0078
+
+#define MT2712_RTC_TIMESTAMP_END_2127	4985971199LL
+
+struct mt2712_rtc {
+	struct rtc_device	*rtc;
+	void __iomem		*base;
+	int			irq;
+	u8			irq_wake_enabled;
+	u8			powerlost;
+};
+
+static inline u32 mt2712_readl(struct mt2712_rtc *mt2712_rtc, u32 reg)
+{
+	return readl(mt2712_rtc->base + reg);
+}
+
+static inline void mt2712_writel(struct mt2712_rtc *mt2712_rtc,
+				 u32 reg, u32 val)
+{
+	writel(val, mt2712_rtc->base + reg);
+}
+
+static void mt2712_rtc_write_trigger(struct mt2712_rtc *mt2712_rtc)
+{
+	unsigned long timeout = jiffies + HZ / 10;
+
+	mt2712_writel(mt2712_rtc, MT2712_WRTGR, 1);
+	while (1) {
+		if (!(mt2712_readl(mt2712_rtc, MT2712_BBPU)
+					& MT2712_BBPU_CBUSY))
+			break;
+
+		if (time_after(jiffies, timeout)) {
+			dev_err(&mt2712_rtc->rtc->dev,
+				"%s time out!\n", __func__);
+			break;
+		}
+		cpu_relax();
+	}
+}
+
+static void mt2712_rtc_writeif_unlock(struct mt2712_rtc *mt2712_rtc)
+{
+	mt2712_writel(mt2712_rtc, MT2712_PROT, MT2712_PROT_UNLOCK1);
+	mt2712_rtc_write_trigger(mt2712_rtc);
+	mt2712_writel(mt2712_rtc, MT2712_PROT, MT2712_PROT_UNLOCK2);
+	mt2712_rtc_write_trigger(mt2712_rtc);
+}
+
+static irqreturn_t rtc_irq_handler_thread(int irq, void *data)
+{
+	struct mt2712_rtc *mt2712_rtc = data;
+	u16 irqsta;
+
+	/* Clear interrupt */
+	irqsta = mt2712_readl(mt2712_rtc, MT2712_IRQ_STA);
+	if (irqsta & MT2712_IRQ_STA_AL) {
+		rtc_update_irq(mt2712_rtc->rtc, 1, RTC_IRQF | RTC_AF);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static void __mt2712_rtc_read_time(struct mt2712_rtc *mt2712_rtc,
+				   struct rtc_time *tm, int *sec)
+{
+	tm->tm_sec  = mt2712_readl(mt2712_rtc, MT2712_TC_SEC)
+			& MT2712_SEC_MASK;
+	tm->tm_min  = mt2712_readl(mt2712_rtc, MT2712_TC_MIN)
+			& MT2712_MIN_MASK;
+	tm->tm_hour = mt2712_readl(mt2712_rtc, MT2712_TC_HOU)
+			& MT2712_HOU_MASK;
+	tm->tm_mday = mt2712_readl(mt2712_rtc, MT2712_TC_DOM)
+			& MT2712_DOM_MASK;
+	tm->tm_mon  = (mt2712_readl(mt2712_rtc, MT2712_TC_MTH) - 1)
+			& MT2712_MTH_MASK;
+	tm->tm_year = (mt2712_readl(mt2712_rtc, MT2712_TC_YEA) + 100)
+			& MT2712_YEA_MASK;
+
+	*sec = mt2712_readl(mt2712_rtc, MT2712_TC_SEC) & MT2712_SEC_MASK;
+}
+
+static int mt2712_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct mt2712_rtc *mt2712_rtc = dev_get_drvdata(dev);
+	int sec;
+
+	if (mt2712_rtc->powerlost)
+		return -EINVAL;
+
+	do {
+		__mt2712_rtc_read_time(mt2712_rtc, tm, &sec);
+	} while (sec < tm->tm_sec);	/* SEC has carried */
+
+	return 0;
+}
+
+static int mt2712_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct mt2712_rtc *mt2712_rtc = dev_get_drvdata(dev);
+
+	mt2712_writel(mt2712_rtc, MT2712_TC_SEC, tm->tm_sec  & MT2712_SEC_MASK);
+	mt2712_writel(mt2712_rtc, MT2712_TC_MIN, tm->tm_min  & MT2712_MIN_MASK);
+	mt2712_writel(mt2712_rtc, MT2712_TC_HOU, tm->tm_hour & MT2712_HOU_MASK);
+	mt2712_writel(mt2712_rtc, MT2712_TC_DOM, tm->tm_mday & MT2712_DOM_MASK);
+	mt2712_writel(mt2712_rtc, MT2712_TC_MTH,
+		      (tm->tm_mon + 1) & MT2712_MTH_MASK);
+	mt2712_writel(mt2712_rtc, MT2712_TC_YEA,
+		      (tm->tm_year - 100) & MT2712_YEA_MASK);
+
+	mt2712_rtc_write_trigger(mt2712_rtc);
+
+	if (mt2712_rtc->powerlost)
+		mt2712_rtc->powerlost = false;
+
+	return 0;
+}
+
+static int mt2712_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	struct mt2712_rtc *mt2712_rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &alm->time;
+	u16 irqen;
+
+	irqen = mt2712_readl(mt2712_rtc, MT2712_IRQ_EN);
+	alm->enabled = !!(irqen & MT2712_IRQ_EN_AL);
+
+	tm->tm_sec  = mt2712_readl(mt2712_rtc, MT2712_AL_SEC) & MT2712_SEC_MASK;
+	tm->tm_min  = mt2712_readl(mt2712_rtc, MT2712_AL_MIN) & MT2712_MIN_MASK;
+	tm->tm_hour = mt2712_readl(mt2712_rtc, MT2712_AL_HOU) & MT2712_HOU_MASK;
+	tm->tm_mday = mt2712_readl(mt2712_rtc, MT2712_AL_DOM) & MT2712_DOM_MASK;
+	tm->tm_mon  = (mt2712_readl(mt2712_rtc, MT2712_AL_MTH) - 1)
+		      & MT2712_MTH_MASK;
+	tm->tm_year = (mt2712_readl(mt2712_rtc, MT2712_AL_YEA) + 100)
+		      & MT2712_YEA_MASK;
+
+	return 0;
+}
+
+static int mt2712_rtc_alarm_irq_enable(struct device *dev,
+				       unsigned int enabled)
+{
+	struct mt2712_rtc *mt2712_rtc = dev_get_drvdata(dev);
+	u16 irqen;
+
+	irqen = mt2712_readl(mt2712_rtc, MT2712_IRQ_EN);
+	if (enabled)
+		irqen |= MT2712_IRQ_EN_AL;
+	else
+		irqen &= ~MT2712_IRQ_EN_AL;
+	mt2712_writel(mt2712_rtc, MT2712_IRQ_EN, irqen);
+	mt2712_rtc_write_trigger(mt2712_rtc);
+
+	return 0;
+}
+
+static int mt2712_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
+{
+	struct mt2712_rtc *mt2712_rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &alm->time;
+	u16 irqen;
+
+	dev_dbg(&mt2712_rtc->rtc->dev, "set al time: %ptR, alm en: %d\n",
+		tm, alm->enabled);
+
+	mt2712_writel(mt2712_rtc, MT2712_AL_SEC,
+		      (mt2712_readl(mt2712_rtc, MT2712_AL_SEC)
+		       & ~(MT2712_SEC_MASK)) | (tm->tm_sec  & MT2712_SEC_MASK));
+	mt2712_writel(mt2712_rtc, MT2712_AL_MIN,
+		      (mt2712_readl(mt2712_rtc, MT2712_AL_MIN)
+		       & ~(MT2712_MIN_MASK)) | (tm->tm_min  & MT2712_MIN_MASK));
+	mt2712_writel(mt2712_rtc, MT2712_AL_HOU,
+		      (mt2712_readl(mt2712_rtc, MT2712_AL_HOU)
+		       & ~(MT2712_HOU_MASK)) | (tm->tm_hour & MT2712_HOU_MASK));
+	mt2712_writel(mt2712_rtc, MT2712_AL_DOM,
+		      (mt2712_readl(mt2712_rtc, MT2712_AL_DOM)
+		       & ~(MT2712_DOM_MASK)) | (tm->tm_mday & MT2712_DOM_MASK));
+	mt2712_writel(mt2712_rtc, MT2712_AL_MTH,
+		      (mt2712_readl(mt2712_rtc, MT2712_AL_MTH)
+		       & ~(MT2712_MTH_MASK))
+		      | ((tm->tm_mon + 1) & MT2712_MTH_MASK));
+	mt2712_writel(mt2712_rtc, MT2712_AL_YEA,
+		      (mt2712_readl(mt2712_rtc, MT2712_AL_YEA)
+		       & ~(MT2712_YEA_MASK))
+		      | ((tm->tm_year - 100) & MT2712_YEA_MASK));
+
+	/* mask day of week */
+	mt2712_writel(mt2712_rtc, MT2712_AL_MASK, MT2712_AL_MASK_DOW);
+	mt2712_rtc_write_trigger(mt2712_rtc);
+
+	mt2712_rtc_alarm_irq_enable(dev, alm->enabled);
+
+	return 0;
+}
+
+/* Init RTC register */
+static void mt2712_rtc_hw_init(struct mt2712_rtc *mt2712_rtc)
+{
+	u32 p1, p2;
+
+	mt2712_writel(mt2712_rtc, MT2712_BBPU,
+		      MT2712_BBPU_KEY | MT2712_BBPU_RELOAD);
+
+	mt2712_writel(mt2712_rtc, MT2712_CII_EN, 0);
+	mt2712_writel(mt2712_rtc, MT2712_AL_MASK, 0);
+	/* necessary before set MT2712_POWERKEY */
+	mt2712_writel(mt2712_rtc, MT2712_CON0, 0x4848);
+	mt2712_writel(mt2712_rtc, MT2712_CON1, 0x0048);
+
+	mt2712_rtc_write_trigger(mt2712_rtc);
+
+	p1 = mt2712_readl(mt2712_rtc, MT2712_POWERKEY1);
+	p2 = mt2712_readl(mt2712_rtc, MT2712_POWERKEY2);
+	if (p1 != MT2712_POWERKEY1_KEY || p2 != MT2712_POWERKEY2_KEY) {
+		mt2712_rtc->powerlost = true;
+		dev_dbg(&mt2712_rtc->rtc->dev,
+			"powerkey not set (lost power)\n");
+	} else {
+		mt2712_rtc->powerlost = false;
+	}
+
+	/* RTC need POWERKEY1/2 match, then goto normal work mode */
+	mt2712_writel(mt2712_rtc, MT2712_POWERKEY1, MT2712_POWERKEY1_KEY);
+	mt2712_writel(mt2712_rtc, MT2712_POWERKEY2, MT2712_POWERKEY2_KEY);
+	mt2712_rtc_write_trigger(mt2712_rtc);
+
+	mt2712_rtc_writeif_unlock(mt2712_rtc);
+}
+
+static const struct rtc_class_ops mt2712_rtc_ops = {
+	.read_time	= mt2712_rtc_read_time,
+	.set_time	= mt2712_rtc_set_time,
+	.read_alarm	= mt2712_rtc_read_alarm,
+	.set_alarm	= mt2712_rtc_set_alarm,
+	.alarm_irq_enable = mt2712_rtc_alarm_irq_enable,
+};
+
+static int mt2712_rtc_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct mt2712_rtc *mt2712_rtc;
+	int ret;
+
+	mt2712_rtc = devm_kzalloc(&pdev->dev,
+				  sizeof(struct mt2712_rtc), GFP_KERNEL);
+	if (!mt2712_rtc)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	mt2712_rtc->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(mt2712_rtc->base))
+		return PTR_ERR(mt2712_rtc->base);
+
+	/* rtc hw init */
+	mt2712_rtc_hw_init(mt2712_rtc);
+
+	mt2712_rtc->irq = platform_get_irq(pdev, 0);
+	if (mt2712_rtc->irq < 0) {
+		dev_err(&pdev->dev, "No IRQ resource\n");
+		return mt2712_rtc->irq;
+	}
+
+	platform_set_drvdata(pdev, mt2712_rtc);
+
+	mt2712_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(mt2712_rtc->rtc))
+		return PTR_ERR(mt2712_rtc->rtc);
+
+	ret = devm_request_threaded_irq(&pdev->dev, mt2712_rtc->irq, NULL,
+					rtc_irq_handler_thread,
+					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+					dev_name(&mt2712_rtc->rtc->dev),
+					mt2712_rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
+			mt2712_rtc->irq, ret);
+		return ret;
+	}
+
+	device_init_wakeup(&pdev->dev, true);
+
+	mt2712_rtc->rtc->ops = &mt2712_rtc_ops;
+	mt2712_rtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	mt2712_rtc->rtc->range_max = MT2712_RTC_TIMESTAMP_END_2127;
+
+	ret = rtc_register_device(mt2712_rtc->rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "register rtc device failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int mt2712_rtc_suspend(struct device *dev)
+{
+	int wake_status = 0;
+	struct mt2712_rtc *mt2712_rtc = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev)) {
+		wake_status = enable_irq_wake(mt2712_rtc->irq);
+		if (!wake_status)
+			mt2712_rtc->irq_wake_enabled = true;
+	}
+
+	return 0;
+}
+
+static int mt2712_rtc_resume(struct device *dev)
+{
+	int wake_status = 0;
+	struct mt2712_rtc *mt2712_rtc = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev) && mt2712_rtc->irq_wake_enabled) {
+		wake_status = disable_irq_wake(mt2712_rtc->irq);
+		if (!wake_status)
+			mt2712_rtc->irq_wake_enabled = false;
+	}
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(mt2712_pm_ops, mt2712_rtc_suspend,
+			 mt2712_rtc_resume);
+#endif
+
+static const struct of_device_id mt2712_rtc_of_match[] = {
+	{ .compatible = "mediatek,mt2712-rtc", },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, mt2712_rtc_of_match)
+
+static struct platform_driver mt2712_rtc_driver = {
+	.driver = {
+		.name = "mt2712-rtc",
+		.of_match_table = mt2712_rtc_of_match,
+		.pm = &mt2712_pm_ops,
+	},
+	.probe  = mt2712_rtc_probe,
+};
+
+module_platform_driver(mt2712_rtc_driver);
+
+MODULE_DESCRIPTION("MediaTek MT2712 SoC based RTC Driver");
+MODULE_AUTHOR("Ran Bi <ran.bi@mediatek.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
