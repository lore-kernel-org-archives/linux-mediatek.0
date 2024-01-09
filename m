Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1326FC4707B
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 02:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rXwfaIrSSvqdoNzoOeix4SaMIUsOU9vNlNHRnWF1Qxo=; b=Vqq7aXCkicFMaIcjQV5SyuYxYn
	iwiJFhbCCykVQG7Nephsu0/pFZ4fASUZ9SQBcYrPLx5FkDqfbnWj0ovQqlzIGSOwwMf4pLy9RV/4i
	85SyKew7LTNh/Ejbcehc8FOk+NTH4WB16EEvEUyCwR4mLX4pDZ7fu+xMEUQQ3qgJUtx299GY51Nde
	1hboAa0Vi9LsZQYfKkX4hqow3wf04r+3Bn8eOyAfGSY9g1hGUydxMfJqtfGUZyfRsMOlWG0UwbwI/
	Uv+hXU16hkdvF1/8OJStuft59qllSeVsrz8zWmkXZBplgwzpFeKn+Hq7ZU5VadyBeR5RWfs4XzvQJ
	qctzqQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN1qg-006hfL-03;
	Tue, 09 Jan 2024 02:28:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN1qZ-006hcX-2r;
	Tue, 09 Jan 2024 02:28:10 +0000
X-UUID: b6611e08ae9611eeafd70d0b34820190-20240108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rXwfaIrSSvqdoNzoOeix4SaMIUsOU9vNlNHRnWF1Qxo=;
	b=IhlQrHS8lNsXeebwzSeTlaQi0ybNi8beZaWTuAmq0+9Yv1V1XCTS0oxPSdTftyvkJruIRNUCTFFNIpoGwxbyzjEeeXekmWvP3a3iprDwvduVv0c5xhvUofs1/4uayRXc1FHuEE8eZboSwhGKFBWiB0fZbSmFTVFFUtrQGlxQknk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:ce018887-7a33-4e43-98e6-c199513429b0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:5f1ca282-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: b6611e08ae9611eeafd70d0b34820190-20240108
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1143968289; Mon, 08 Jan 2024 19:28:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 Jan 2024 10:27:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 Jan 2024 10:27:22 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: <mchehab@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <sakari.ailus@linux.intel.com>
CC: <laurent.pinchart@ideasonboard.com>, <shengnan.wang@mediatek.com>,
	<yaya.chang@mediatek.com>, <10572168@qq.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yunkec@chromium.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jacopo.mondi@ideasonboard.com>,
	<zhi.mao@mediatek.com>, <hverkuil-cisco@xs4all.nl>, <heiko@sntech.de>,
	<jernej.skrabec@gmail.com>, <macromorgan@hotmail.com>,
	<linus.walleij@linaro.org>, <hdegoede@redhat.com>,
	<tomi.valkeinen@ideasonboard.com>, <gerald.loacker@wolfvision.net>,
	<andy.shevchenko@gmail.com>, <bingbu.cao@intel.com>,
	<dan.scally@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 0/2] media: i2c: Add support for GC08A3 sensor
Date: Tue, 9 Jan 2024 10:27:13 +0800
Message-ID: <20240109022715.30278-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_182808_007189_9D371278 
X-CRM114-Status: GOOD (  14.09  )
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

This series adds YAML DT binding and V4L2 sub-device driver for Galaxycore's
GC08A3 8-megapixel 10-bit RAW CMOS 1/4" sensor, with an MIPI CSI-2 image data
interface and the I2C control bus.

The driver is implemented with V4L2 framework.
 - Async registered as a V4L2 sub-device.
 - As the first component of camera system including Seninf, ISP pipeline.
 - A media entity that provides one source pad in common.
 - Used in camera features on ChromeOS application.

Also this driver supports following features:
 - manual exposure and analog gain control support
 - vertical blanking control support
 - test pattern support
 - media controller support
 - runtime PM support
 - support resolution: 3264x2448@30fps, 1920x1080@60fps

Previous versions of this patch-set can be found here:
v2: https://lore.kernel.org/linux-media/20231207052016.25954-1-zhi.mao@mediatek.com/
v1: https://lore.kernel.org/linux-media/20231123115104.32094-1-zhi.mao@mediatek.com/

This series is based on linux-next, tag: next-20240108
Changes in v3:
- dts-binding files：
-- rename enable-gpio to reset-gpio.
-- remove "status","clock-names" & "clock-frequency" useless infomatin in dts-binding files.
-- remove the modifcation in "vendor-prefixes.yaml" as key words “galaxycore” has been added.

- gc08a sensor driver：
-- rename enable-gpio to reset-gpio in sensor driver
-- remove reset-gpio pull low in start of function：power_on()
-- fix some indentation code style issue in sensor driver probe function
-- remove some dev_info() print log function and some none C style comments in sensor driver
-- remove system suspend/resume operations and implement runtime PM support
-- remove .g_volatile_ctrl() and .try_ctrl() implementations
-- revome g_register/s_register functions
-- remove "mutex" cntrol and use subdev active state
-- remove "fmt&crop" variable in sensor driver and let subdev active state to store them
-- use v4l2-cci api to read/write sensor register
-- remove some dependencies & selection infomation in Kconfig, as they are handled in the VIDEO_CAMERA_SENSOR menu
-- remove .try_ctrl callback function
-- remobe "streaming == enable" in start_stream function
-- use an exact match method in enum_frame_interval() function
-- add "V4L2_SUBDEV_FL_HAS_EVENTS" for sd.flags in probe() function

Thanks

Zhi Mao (2):
  media: dt-bindings: media: i2c: Document GC08A3 bindings
  media: i2c: Add GC08A3 image sensor driver

 .../bindings/media/i2c/galaxycore,gc08a3.yaml |  112 ++
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/gc08a3.c                    | 1467 +++++++++++++++++
 4 files changed, 1590 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
 create mode 100644 drivers/media/i2c/gc08a3.c

-- 
2.25.1 



