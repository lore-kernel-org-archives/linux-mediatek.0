Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7007C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 13:05:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 570D422C9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 13:05:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p77cUOc7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dN2PgxIx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 570D422C9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DXj6d7Cl7FmILMQxYOXRTPQdk+Uz9Au95y3+chlOCR0=; b=p77cUOc7hByMIPF7AP/TZKvvR
	6OjzwPEh3amm3VK9oY+phb11PhpJy+ymY/JjedvEJ1SzpL6pyKm9jRxmWLTb1xm4nlxByRB0NGaT3
	6vUkYLie+15EutZjBAo+ycgY7W7M03qi/PeKslK9+1Pku8UzHj+evNn7pkdFzqjRUaAGHNs60VRT5
	u/1hhPHpoXZqGFfpoIK0cwBx0IN/A81Oj3oGb2Hf2OhJAimuQT0nM7dEhz4zUk/WXP2JbEDcbfzt8
	dfnXFR3phFSn31kpwUIq8K49n/6k4aH/irlhM9RUya+19Mxp7D2wqmEjJ4jnvQcL1OJProHuQTyL3
	fdkfSGOEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSJzl-0001xi-F9; Tue, 13 Oct 2020 13:05:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSJzb-0001uY-Fe; Tue, 13 Oct 2020 13:05:31 +0000
X-UUID: 224ce16aa95a49218bd80e0f5e957682-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BwY1pHPk0NsxRTe5H7aAvwTb7mu1Ft02rzcKmURWKNA=; 
 b=dN2PgxIxMBwil8gUkl6k4XbrXpY6i2sqqNGdBMavopzOR48GmEfNTtEkX+TJQrFuPhvTasR5W+2SdkoYJMkrMtNjL6vuipM3cAGJt66s4IxZbVO/QL5pS/dzgI0kkf1Isw6Lrt8UwcbnMBOURQzv/B9Gc3fUdno6Sp6uM+923x0=;
X-UUID: 224ce16aa95a49218bd80e0f5e957682-20201013
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 444595989; Tue, 13 Oct 2020 05:05:26 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 06:05:23 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 21:05:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 13 Oct 2020 21:05:10 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [PATCH v15 2/2] media: i2c: Add OV02A10 image sensor driver
Date: Tue, 13 Oct 2020 21:05:03 +0800
Message-ID: <20201013130503.2412-3-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_090527_830649_F225EAAD 
X-CRM114-Status: GOOD (  22.48  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 shengnan.wang@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com,
 louis.kuo@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a V4L2 sub-device driver for OmniVision OV02A10 image sensor.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 MAINTAINERS                 |    1 +
 drivers/media/i2c/Kconfig   |   13 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/ov02a10.c | 1058 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1073 insertions(+)
 create mode 100644 drivers/media/i2c/ov02a10.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 48aa7a7..ce7d8fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12724,6 +12724,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
+F:	drivers/media/i2c/ov02a10.c
 
 OMNIVISION OV13858 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 48ae60a..4da668e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -825,6 +825,19 @@ config VIDEO_IMX355
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx355.
 
+config VIDEO_OV02A10
+	tristate "OmniVision OV02A10 sensor support"
+	depends on VIDEO_V4L2 && I2C
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OV02A10 camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ov02a10.
+
 config VIDEO_OV2640
 	tristate "OmniVision OV2640 sensor support"
 	depends on VIDEO_V4L2 && I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index f0a7747..dc27e14 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
 obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
 obj-$(CONFIG_VIDEO_UPD64031A) += upd64031a.o
 obj-$(CONFIG_VIDEO_UPD64083) += upd64083.o
+obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
 obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
 obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
 obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
new file mode 100644
index 0000000..83ac821
--- /dev/null
+++ b/drivers/media/i2c/ov02a10.c
@@ -0,0 +1,1058 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 MediaTek Inc.
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#define OV02A10_ID					0x2509
+#define OV02A10_ID_MASK					0xffff
+
+#define OV02A10_REG_CHIP_ID				0x02
+
+/* Bit[1] vertical upside down */
+/* Bit[0] horizontal mirror */
+#define REG_MIRROR_FLIP_CONTROL				0x3f
+
+/* Orientation */
+#define REG_MIRROR_FLIP_ENABLE				0x03
+
+/* Bit[2:0] MIPI transmission speed select */
+#define TX_SPEED_AREA_SEL				0xa1
+#define OV02A10_MIPI_TX_SPEED_DEFAULT			0x04
+
+#define REG_PAGE_SWITCH					0xfd
+#define REG_GLOBAL_EFFECTIVE				0x01
+#define REG_ENABLE					BIT(0)
+
+#define REG_SC_CTRL_MODE				0xac
+#define SC_CTRL_MODE_STANDBY				0x00
+#define SC_CTRL_MODE_STREAMING				0x01
+
+/* Exposure control */
+#define OV02A10_EXP_SHIFT				8
+#define OV02A10_REG_EXPOSURE_H				0x03
+#define OV02A10_REG_EXPOSURE_L				0x04
+#define	OV02A10_EXPOSURE_MIN				4
+#define OV02A10_EXPOSURE_MAX_MARGIN			4
+#define	OV02A10_EXPOSURE_STEP				1
+
+/* Vblanking control */
+#define OV02A10_VTS_SHIFT				8
+#define OV02A10_REG_VTS_H				0x05
+#define OV02A10_REG_VTS_L				0x06
+#define OV02A10_VTS_MAX					0x209f
+#define OV02A10_BASIC_LINE				1224
+
+/* Analog gain control */
+#define OV02A10_REG_GAIN				0x24
+#define OV02A10_GAIN_MIN				0x10
+#define OV02A10_GAIN_MAX				0xf8
+#define OV02A10_GAIN_STEP				0x01
+#define OV02A10_GAIN_DEFAULT				0x40
+
+/* Test pattern control */
+#define OV02A10_REG_TEST_PATTERN			0xb6
+
+#define HZ_PER_KHZ					1000L
+#define HZ_PER_MHZ					1000000L
+#define OV02A10_LINK_FREQ_390MHZ			(390 * HZ_PER_MHZ)
+#define OV02A10_ECLK_FREQ				(24 * HZ_PER_MHZ)
+
+/* Number of lanes supported by this driver */
+#define OV02A10_DATA_LANES				1
+
+/* Bits per sample of sensor output */
+#define OV02A10_BITS_PER_SAMPLE				10
+
+static const char * const ov02a10_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
+struct ov02a10_reg {
+	u8 addr;
+	u8 val;
+};
+
+struct ov02a10_reg_list {
+	u32 num_of_regs;
+	const struct ov02a10_reg *regs;
+};
+
+struct ov02a10_mode {
+	u32 width;
+	u32 height;
+	u32 exp_def;
+	u32 hts_def;
+	u32 vts_def;
+	const struct ov02a10_reg_list reg_list;
+};
+
+struct ov02a10 {
+	u32 eclk_freq;
+	/* Indication of MIPI transmission speed select */
+	u32 mipi_clock_voltage;
+	/* Index of link frequency config to be used */
+	u32 freq_index;
+
+	struct clk *eclk;
+	struct gpio_desc *pd_gpio;
+	struct gpio_desc *rst_gpio;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov02a10_supply_names)];
+
+	bool streaming;
+	bool upside_down;
+
+	/*
+	 * Serialize control access, get/set format, get selection
+	 * and start streaming.
+	 */
+	struct mutex mutex;
+	struct v4l2_subdev subdev;
+	struct media_pad pad;
+	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *exposure;
+
+	const struct ov02a10_mode *cur_mode;
+};
+
+static inline struct ov02a10 *to_ov02a10(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ov02a10, subdev);
+}
+
+/*
+ * eclk 24Mhz
+ * pclk 39Mhz
+ * linelength 934(0x3a6)
+ * framelength 1390(0x56e)
+ * grabwindow_width 1600
+ * grabwindow_height 1200
+ * max_framerate 30fps
+ * mipi_datarate per lane 780Mbps
+ */
+static const struct ov02a10_reg ov02a10_1600x1200_regs[] = {
+	{0xfd, 0x01},
+	{0xac, 0x00},
+	{0xfd, 0x00},
+	{0x2f, 0x29},
+	{0x34, 0x00},
+	{0x35, 0x21},
+	{0x30, 0x15},
+	{0x33, 0x01},
+	{0xfd, 0x01},
+	{0x44, 0x00},
+	{0x2a, 0x4c},
+	{0x2b, 0x1e},
+	{0x2c, 0x60},
+	{0x25, 0x11},
+	{0x03, 0x01},
+	{0x04, 0xae},
+	{0x09, 0x00},
+	{0x0a, 0x02},
+	{0x06, 0xa6},
+	{0x31, 0x00},
+	{0x24, 0x40},
+	{0x01, 0x01},
+	{0xfb, 0x73},
+	{0xfd, 0x01},
+	{0x16, 0x04},
+	{0x1c, 0x09},
+	{0x21, 0x42},
+	{0x12, 0x04},
+	{0x13, 0x10},
+	{0x11, 0x40},
+	{0x33, 0x81},
+	{0xd0, 0x00},
+	{0xd1, 0x01},
+	{0xd2, 0x00},
+	{0x50, 0x10},
+	{0x51, 0x23},
+	{0x52, 0x20},
+	{0x53, 0x10},
+	{0x54, 0x02},
+	{0x55, 0x20},
+	{0x56, 0x02},
+	{0x58, 0x48},
+	{0x5d, 0x15},
+	{0x5e, 0x05},
+	{0x66, 0x66},
+	{0x68, 0x68},
+	{0x6b, 0x00},
+	{0x6c, 0x00},
+	{0x6f, 0x40},
+	{0x70, 0x40},
+	{0x71, 0x0a},
+	{0x72, 0xf0},
+	{0x73, 0x10},
+	{0x75, 0x80},
+	{0x76, 0x10},
+	{0x84, 0x00},
+	{0x85, 0x10},
+	{0x86, 0x10},
+	{0x87, 0x00},
+	{0x8a, 0x22},
+	{0x8b, 0x22},
+	{0x19, 0xf1},
+	{0x29, 0x01},
+	{0xfd, 0x01},
+	{0x9d, 0x16},
+	{0xa0, 0x29},
+	{0xa1, 0x04},
+	{0xad, 0x62},
+	{0xae, 0x00},
+	{0xaf, 0x85},
+	{0xb1, 0x01},
+	{0x8e, 0x06},
+	{0x8f, 0x40},
+	{0x90, 0x04},
+	{0x91, 0xb0},
+	{0x45, 0x01},
+	{0x46, 0x00},
+	{0x47, 0x6c},
+	{0x48, 0x03},
+	{0x49, 0x8b},
+	{0x4a, 0x00},
+	{0x4b, 0x07},
+	{0x4c, 0x04},
+	{0x4d, 0xb7},
+	{0xf0, 0x40},
+	{0xf1, 0x40},
+	{0xf2, 0x40},
+	{0xf3, 0x40},
+	{0x3f, 0x00},
+	{0xfd, 0x01},
+	{0x05, 0x00},
+	{0x06, 0xa6},
+	{0xfd, 0x01},
+};
+
+static const char * const ov02a10_test_pattern_menu[] = {
+	"Disabled",
+	"Eight Vertical Colour Bars",
+};
+
+static const s64 link_freq_menu_items[] = {
+	OV02A10_LINK_FREQ_390MHZ,
+};
+
+static u64 to_pixel_rate(u32 f_index)
+{
+	u64 pixel_rate = link_freq_menu_items[f_index] * 2 * OV02A10_DATA_LANES;
+
+	do_div(pixel_rate, OV02A10_BITS_PER_SAMPLE);
+
+	return pixel_rate;
+}
+
+static const struct ov02a10_mode supported_modes[] = {
+	{
+		.width = 1600,
+		.height = 1200,
+		.exp_def = 0x01ae,
+		.hts_def = 0x03a6,
+		.vts_def = 0x056e,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(ov02a10_1600x1200_regs),
+			.regs = ov02a10_1600x1200_regs,
+		},
+	},
+};
+
+static int ov02a10_write_array(struct ov02a10 *ov02a10,
+			       const struct ov02a10_reg_list *r_list)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < r_list->num_of_regs; i++) {
+		ret = i2c_smbus_write_byte_data(client, r_list->regs[i].addr,
+						r_list->regs[i].val);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void ov02a10_fill_fmt(const struct ov02a10_mode *mode,
+			     struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = V4L2_FIELD_NONE;
+}
+
+static int ov02a10_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_format *fmt)
+{
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
+	struct v4l2_mbus_framefmt *frame_fmt;
+	int ret = 0;
+
+	mutex_lock(&ov02a10->mutex);
+
+	if (ov02a10->streaming && fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	/* Only one sensor mode supported */
+	mbus_fmt->code = ov02a10->fmt.code;
+	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		frame_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+	else
+		frame_fmt = &ov02a10->fmt;
+
+	*frame_fmt = *mbus_fmt;
+
+out_unlock:
+	mutex_unlock(&ov02a10->mutex);
+	return ret;
+}
+
+static int ov02a10_get_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_format *fmt)
+{
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
+
+	mutex_lock(&ov02a10->mutex);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+	} else {
+		fmt->format = ov02a10->fmt;
+		mbus_fmt->code = ov02a10->fmt.code;
+		ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
+	}
+
+	mutex_unlock(&ov02a10->mutex);
+
+	return 0;
+}
+
+static int ov02a10_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+
+	if (code->index != 0)
+		return -EINVAL;
+
+	code->code = ov02a10->fmt.code;
+
+	return 0;
+}
+
+static int ov02a10_enum_frame_sizes(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index >= ARRAY_SIZE(supported_modes))
+		return -EINVAL;
+
+	fse->min_width  = supported_modes[fse->index].width;
+	fse->max_width  = supported_modes[fse->index].width;
+	fse->max_height = supported_modes[fse->index].height;
+	fse->min_height = supported_modes[fse->index].height;
+
+	return 0;
+}
+
+static int ov02a10_check_sensor_id(struct ov02a10 *ov02a10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	u16 chip_id;
+	int ret;
+
+	/* Validate the chip ID */
+	ret = i2c_smbus_read_word_swapped(client, OV02A10_REG_CHIP_ID);
+	if (ret < 0)
+		return ret;
+
+	chip_id = le16_to_cpu(ret);
+
+	if ((chip_id & OV02A10_ID_MASK) != OV02A10_ID) {
+		dev_err(&client->dev, "unexpected sensor id(0x%04x)\n", chip_id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ov02a10_power_on(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+	int ret;
+
+	gpiod_set_value_cansleep(ov02a10->rst_gpio, 1);
+	gpiod_set_value_cansleep(ov02a10->pd_gpio, 1);
+
+	ret = clk_prepare_enable(ov02a10->eclk);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable eclk\n");
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov02a10_supply_names),
+				    ov02a10->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		goto disable_clk;
+	}
+	usleep_range(5000, 6000);
+
+	gpiod_set_value_cansleep(ov02a10->pd_gpio, 0);
+	usleep_range(5000, 6000);
+
+	gpiod_set_value_cansleep(ov02a10->rst_gpio, 0);
+	usleep_range(5000, 6000);
+
+	ret = ov02a10_check_sensor_id(ov02a10);
+	if (ret)
+		goto disable_regulator;
+
+	return 0;
+
+disable_regulator:
+	regulator_bulk_disable(ARRAY_SIZE(ov02a10_supply_names),
+			       ov02a10->supplies);
+disable_clk:
+	clk_disable_unprepare(ov02a10->eclk);
+
+	return ret;
+}
+
+static int ov02a10_power_off(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+
+	gpiod_set_value_cansleep(ov02a10->rst_gpio, 1);
+	clk_disable_unprepare(ov02a10->eclk);
+	gpiod_set_value_cansleep(ov02a10->pd_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ov02a10_supply_names),
+			       ov02a10->supplies);
+
+	return 0;
+}
+
+static int __ov02a10_start_stream(struct ov02a10 *ov02a10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	const struct ov02a10_reg_list *reg_list;
+	int ret;
+
+	/* Apply default values of current mode */
+	reg_list = &ov02a10->cur_mode->reg_list;
+	ret = ov02a10_write_array(ov02a10, reg_list);
+	if (ret)
+		return ret;
+
+	/* Apply customized values from user */
+	ret = __v4l2_ctrl_handler_setup(ov02a10->subdev.ctrl_handler);
+	if (ret)
+		return ret;
+
+	/* Set orientation to 180 degree */
+	if (ov02a10->upside_down) {
+		ret = i2c_smbus_write_byte_data(client, REG_MIRROR_FLIP_CONTROL,
+						REG_MIRROR_FLIP_ENABLE);
+		if (ret) {
+			dev_err(&client->dev, "failed to set orientation\n");
+			return ret;
+		}
+		ret = i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
+						REG_ENABLE);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Set MIPI TX speed according to DT property */
+	if (ov02a10->mipi_clock_voltage != OV02A10_MIPI_TX_SPEED_DEFAULT) {
+		ret = i2c_smbus_write_byte_data(client, TX_SPEED_AREA_SEL,
+						ov02a10->mipi_clock_voltage);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Set stream on register */
+	return i2c_smbus_write_byte_data(client, REG_SC_CTRL_MODE,
+					 SC_CTRL_MODE_STREAMING);
+}
+
+static int __ov02a10_stop_stream(struct ov02a10 *ov02a10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+
+	return i2c_smbus_write_byte_data(client, REG_SC_CTRL_MODE,
+					 SC_CTRL_MODE_STANDBY);
+}
+
+static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.format = {
+			.width = 1600,
+			.height = 1200,
+		}
+	};
+
+	ov02a10_set_fmt(sd, cfg, &fmt);
+
+	return 0;
+}
+
+static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
+{
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	int ret;
+
+	mutex_lock(&ov02a10->mutex);
+
+	if (ov02a10->streaming == on)
+		goto unlock_and_return;
+
+	if (on) {
+		ret = pm_runtime_get_sync(&client->dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(&client->dev);
+			goto unlock_and_return;
+		}
+
+		ret = __ov02a10_start_stream(ov02a10);
+		if (ret) {
+			__ov02a10_stop_stream(ov02a10);
+			ov02a10->streaming = !on;
+			goto err_rpm_put;
+		}
+	} else {
+		__ov02a10_stop_stream(ov02a10);
+		pm_runtime_put(&client->dev);
+	}
+
+	ov02a10->streaming = on;
+	mutex_unlock(&ov02a10->mutex);
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(&client->dev);
+unlock_and_return:
+	mutex_unlock(&ov02a10->mutex);
+
+	return ret;
+}
+
+static const struct dev_pm_ops ov02a10_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(ov02a10_power_off, ov02a10_power_on, NULL)
+};
+
+/*
+ * ov02a10_set_exposure - Function called when setting exposure time
+ * @priv: Pointer to device structure
+ * @val: Variable for exposure time, in the unit of micro-second
+ *
+ * Set exposure time based on input value.
+ *
+ * Return: 0 on success
+ */
+static int ov02a10_set_exposure(struct ov02a10 *ov02a10, int val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_EXPOSURE_H,
+					val >> OV02A10_EXP_SHIFT);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_EXPOSURE_L, val);
+	if (ret < 0)
+		return ret;
+
+	return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
+					 REG_ENABLE);
+}
+
+static int ov02a10_set_gain(struct ov02a10 *ov02a10, int val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_GAIN, val);
+	if (ret < 0)
+		return ret;
+
+	return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
+					 REG_ENABLE);
+}
+
+static int ov02a10_set_vblank(struct ov02a10 *ov02a10, int val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	u32 vts = val + ov02a10->cur_mode->height - OV02A10_BASIC_LINE;
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
+					vts >> OV02A10_VTS_SHIFT);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_L, vts);
+	if (ret < 0)
+		return ret;
+
+	return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
+					 REG_ENABLE);
+}
+
+static int ov02a10_set_test_pattern(struct ov02a10 *ov02a10, int pattern)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_TEST_PATTERN,
+					pattern);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
+					REG_ENABLE);
+	if (ret < 0)
+		return ret;
+
+	return i2c_smbus_write_byte_data(client, REG_SC_CTRL_MODE,
+					 SC_CTRL_MODE_STREAMING);
+}
+
+static int ov02a10_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov02a10 *ov02a10 = container_of(ctrl->handler,
+					       struct ov02a10, ctrl_handler);
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	s64 max_expo;
+	int ret;
+
+	/* Propagate change of current control to all related controls */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Update max exposure while meeting expected vblanking */
+		max_expo = ov02a10->cur_mode->height + ctrl->val -
+			   OV02A10_EXPOSURE_MAX_MARGIN;
+		__v4l2_ctrl_modify_range(ov02a10->exposure,
+					 ov02a10->exposure->minimum, max_expo,
+					 ov02a10->exposure->step,
+					 ov02a10->exposure->default_value);
+	}
+
+	/* V4L2 controls values will be applied only when power is already up */
+	if (!pm_runtime_get_if_in_use(&client->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE:
+		ret = ov02a10_set_exposure(ov02a10, ctrl->val);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = ov02a10_set_gain(ov02a10, ctrl->val);
+		break;
+	case V4L2_CID_VBLANK:
+		ret = ov02a10_set_vblank(ov02a10, ctrl->val);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov02a10_set_test_pattern(ov02a10, ctrl->val);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	};
+
+	pm_runtime_put(&client->dev);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops ov02a10_video_ops = {
+	.s_stream = ov02a10_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops ov02a10_pad_ops = {
+	.init_cfg = ov02a10_entity_init_cfg,
+	.enum_mbus_code = ov02a10_enum_mbus_code,
+	.enum_frame_size = ov02a10_enum_frame_sizes,
+	.get_fmt = ov02a10_get_fmt,
+	.set_fmt = ov02a10_set_fmt,
+};
+
+static const struct v4l2_subdev_ops ov02a10_subdev_ops = {
+	.video	= &ov02a10_video_ops,
+	.pad	= &ov02a10_pad_ops,
+};
+
+static const struct media_entity_operations ov02a10_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_ctrl_ops ov02a10_ctrl_ops = {
+	.s_ctrl = ov02a10_set_ctrl,
+};
+
+static int ov02a10_initialize_controls(struct ov02a10 *ov02a10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
+	const struct ov02a10_mode *mode;
+	struct v4l2_ctrl_handler *handler;
+	struct v4l2_ctrl *ctrl;
+	s64 exposure_max;
+	s64 vblank_def;
+	s64 pixel_rate;
+	s64 h_blank;
+	int ret;
+
+	handler = &ov02a10->ctrl_handler;
+	mode = ov02a10->cur_mode;
+	ret = v4l2_ctrl_handler_init(handler, 7);
+	if (ret)
+		return ret;
+
+	handler->lock = &ov02a10->mutex;
+
+	ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ, 0, 0,
+				      link_freq_menu_items);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	pixel_rate = to_pixel_rate(0);
+	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE, 0, pixel_rate, 1,
+			  pixel_rate);
+
+	h_blank = mode->hts_def - mode->width;
+	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK, h_blank, h_blank, 1,
+			  h_blank);
+
+	vblank_def = mode->vts_def - mode->height;
+	v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops, V4L2_CID_VBLANK,
+			  vblank_def, OV02A10_VTS_MAX - mode->height, 1,
+			  vblank_def);
+
+	exposure_max = mode->vts_def - 4;
+	ov02a10->exposure = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
+					      V4L2_CID_EXPOSURE,
+					      OV02A10_EXPOSURE_MIN,
+					      exposure_max,
+					      OV02A10_EXPOSURE_STEP,
+					      mode->exp_def);
+
+	v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
+			  V4L2_CID_ANALOGUE_GAIN, OV02A10_GAIN_MIN,
+			  OV02A10_GAIN_MAX, OV02A10_GAIN_STEP,
+			  OV02A10_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std_menu_items(handler, &ov02a10_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ov02a10_test_pattern_menu) - 1,
+				     0, 0, ov02a10_test_pattern_menu);
+
+	if (handler->error) {
+		ret = handler->error;
+		dev_err(&client->dev, "failed to init controls(%d)\n", ret);
+		goto err_free_handler;
+	}
+
+	ov02a10->subdev.ctrl_handler = handler;
+
+	return 0;
+
+err_free_handler:
+	v4l2_ctrl_handler_free(handler);
+
+	return ret;
+}
+
+static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
+{
+	struct fwnode_handle *ep;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	unsigned int i, j;
+	int ret;
+
+	if (!fwnode)
+		return -EINVAL;
+
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return -ENXIO;
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
+		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
+			if (link_freq_menu_items[i] ==
+				bus_cfg.link_frequencies[j]) {
+				ov02a10->freq_index = i;
+				break;
+			}
+		}
+
+		if (j == bus_cfg.nr_of_link_frequencies) {
+			dev_err(dev, "no link frequency %lld supported\n",
+				link_freq_menu_items[i]);
+			ret = -EINVAL;
+			break;
+		}
+	}
+
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static int ov02a10_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ov02a10 *ov02a10;
+	unsigned int cnt;
+	unsigned int i;
+	unsigned int num_freq_clk_volt;
+	unsigned int rotation;
+	int ret;
+
+	ov02a10 = devm_kzalloc(dev, sizeof(*ov02a10), GFP_KERNEL);
+	if (!ov02a10)
+		return -ENOMEM;
+
+	ret = ov02a10_check_hwcfg(dev, ov02a10);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to check HW configuration\n");
+
+	/* Initialize subdev */
+	v4l2_i2c_subdev_init(&ov02a10->subdev, client, &ov02a10_subdev_ops);
+
+	ov02a10->mipi_clock_voltage = OV02A10_MIPI_TX_SPEED_DEFAULT;
+	ov02a10->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
+
+	/* Optional indication of physical rotation of sensor */
+	rotation = 0;
+	fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
+	if (rotation == 180) {
+		ov02a10->upside_down = true;
+		ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
+	}
+
+	/* Optional indication of MIPI clock voltage unit */
+	cnt = 0;
+	num_freq_clk_volt = 2 * ARRAY_SIZE(link_freq_menu_items);
+	ret = fwnode_property_count_u32(dev_fwnode(dev),
+					"ovti,mipi-clock-voltage");
+	if (ret > 0 && ret % 2 == 0) {
+		u32 freq_clk_volt[ret];
+
+		fwnode_property_read_u32_array(dev_fwnode(dev),
+					       "ovti,mipi-clock-voltage",
+					       freq_clk_volt,
+					       ARRAY_SIZE(freq_clk_volt));
+
+		while (num_freq_clk_volt) {
+			unsigned long freq;
+			unsigned long volt;
+
+			if (cnt >= ARRAY_SIZE(freq_clk_volt)) {
+				dev_warn(dev, "mismatched link frequency\n");
+				break;
+			}
+
+			freq = freq_clk_volt[cnt++] * HZ_PER_KHZ;
+			volt = freq_clk_volt[cnt++];
+
+			/* Get clock voltage unit value from DT */
+			if (freq == link_freq_menu_items[ov02a10->freq_index]) {
+				ov02a10->mipi_clock_voltage = volt;
+				break;
+			}
+
+			num_freq_clk_volt -= 2;
+		}
+	}
+
+	/* Get system clock (eclk) */
+	ov02a10->eclk = devm_clk_get(dev, "eclk");
+	if (IS_ERR(ov02a10->eclk))
+		return dev_err_probe(dev, PTR_ERR(ov02a10->eclk),
+				     "failed to get eclk\n");
+
+	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
+				       &ov02a10->eclk_freq);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to get eclk frequency\n");
+
+	ret = clk_set_rate(ov02a10->eclk, ov02a10->eclk_freq);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to set eclk frequency (24MHz)\n");
+
+	if (clk_get_rate(ov02a10->eclk) != OV02A10_ECLK_FREQ)
+		dev_warn(dev, "eclk mismatched, mode is based on 24MHz\n");
+
+	ov02a10->pd_gpio = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
+	if (IS_ERR(ov02a10->pd_gpio))
+		return dev_err_probe(dev, PTR_ERR(ov02a10->pd_gpio),
+				     "failed to get powerdown-gpios\n");
+
+	ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ov02a10->rst_gpio))
+		return dev_err_probe(dev, PTR_ERR(ov02a10->rst_gpio),
+				     "failed to get reset-gpios\n");
+
+	for (i = 0; i < ARRAY_SIZE(ov02a10_supply_names); i++)
+		ov02a10->supplies[i].supply = ov02a10_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov02a10_supply_names),
+				      ov02a10->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
+
+	mutex_init(&ov02a10->mutex);
+
+	/* Set default mode */
+	ov02a10->cur_mode = &supported_modes[0];
+
+	ret = ov02a10_initialize_controls(ov02a10);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to initialize controls\n");
+		goto err_destroy_mutex;
+	}
+
+	/* Initialize subdev */
+	ov02a10->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov02a10->subdev.entity.ops = &ov02a10_subdev_entity_ops;
+	ov02a10->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	ov02a10->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&ov02a10->subdev.entity, 1, &ov02a10->pad);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to initialize entity pads\n");
+		goto err_free_handler;
+	}
+
+	pm_runtime_enable(dev);
+	if (!pm_runtime_enabled(dev)) {
+		ret = ov02a10_power_on(dev);
+		if (ret < 0) {
+			dev_err_probe(dev, ret, "failed to power on\n");
+			goto err_clean_entity;
+		}
+	}
+
+	ret = v4l2_async_register_subdev(&ov02a10->subdev);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
+		goto err_power_off;
+	}
+
+	return 0;
+
+err_power_off:
+	if (pm_runtime_enabled(dev))
+		pm_runtime_disable(dev);
+	else
+		ov02a10_power_off(dev);
+err_clean_entity:
+	media_entity_cleanup(&ov02a10->subdev.entity);
+err_free_handler:
+	v4l2_ctrl_handler_free(ov02a10->subdev.ctrl_handler);
+err_destroy_mutex:
+	mutex_destroy(&ov02a10->mutex);
+
+	return ret;
+}
+
+static int ov02a10_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov02a10 *ov02a10 = to_ov02a10(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov02a10_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+	mutex_destroy(&ov02a10->mutex);
+
+	return 0;
+}
+
+static const struct of_device_id ov02a10_of_match[] = {
+	{ .compatible = "ovti,ov02a10" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ov02a10_of_match);
+
+static struct i2c_driver ov02a10_i2c_driver = {
+	.driver = {
+		.name = "ov02a10",
+		.pm = &ov02a10_pm_ops,
+		.of_match_table = ov02a10_of_match,
+	},
+	.probe_new	= &ov02a10_probe,
+	.remove		= &ov02a10_remove,
+};
+module_i2c_driver(ov02a10_i2c_driver);
+
+MODULE_AUTHOR("Dongchun Zhu <dongchun.zhu@mediatek.com>");
+MODULE_DESCRIPTION("OmniVision OV02A10 sensor driver");
+MODULE_LICENSE("GPL v2");
-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
