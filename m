Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E102C27C79
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 02:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+mnQM4khjFBoKH3kg23UGpaJgkGoMkA6dhnST6cEZY8=; b=x/UcOoIQ/UE5RWJUxmrR7fHMLQ
	6ToBqvuvr5KgUiS43P91vnPc4UY9Wszmu1q+A22RBWgQ3A4EpekIF9lPGeKgiBGHwptH19ahpsqXK
	r873DI0+KBZ2i2/7ucoMhfrHB5xk2VgRqK5kp21/qHzSLVq3QG7dPR98izIiHH6A7GYu5MSDA/gGH
	iW/jFqks8cOJpm4S0kUnSX3LOQi0ZuvbEytjpEpwmlpSvPbVtRdOI9CyfqqH0V0OGPP9IYjj/ebrm
	mFT8Vhy6nJPIqctpsJRXTdxdh5UqRLIkBtKxWnlmf65mRlABK7Nlu/3i5z25EocTKeSyiWswa/8QW
	GrGr6Jyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHDZ9-0000000AmSi-00qD;
	Wed, 12 Jun 2024 02:18:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHDZ2-0000000AmR7-3hby;
	Wed, 12 Jun 2024 02:18:21 +0000
X-UUID: 03a8c018286211efba8bfb22b0451c12-20240611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+mnQM4khjFBoKH3kg23UGpaJgkGoMkA6dhnST6cEZY8=;
	b=euyXEFAh9SdHoE1hnestZPSBPtfvGjtgsSXFK/PKqleroXSSqpZGAltE4iRAlgVLIJfANNtSdPqOywqqHfz2rORHG5BT+oSrxcGi50cxJps0ueCpCJM4R5Xe8JPVsWZYpWC1Vn0981TDFcxjusd0R7gewFwSPuHBhRP0rKr5P3M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:67a14f9c-45cb-4b7b-9b9a-76632f5bb1b0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:393d96e,CLOUDID:96e47988-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 03a8c018286211efba8bfb22b0451c12-20240611
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1501936053; Tue, 11 Jun 2024 19:18:10 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 12 Jun 2024 10:18:07 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 12 Jun 2024 10:18:06 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: <mchehab@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <sakari.ailus@linux.intel.com>
CC: <laurent.pinchart@ideasonboard.com>, <shengnan.wang@mediatek.com>,
	<yaya.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yunkec@chromium.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jacopo.mondi@ideasonboard.com>,
	<zhi.mao@mediatek.com>, <10572168@qq.com>, <hverkuil-cisco@xs4all.nl>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <macromorgan@hotmail.com>,
	<linus.walleij@linaro.org>, <hdegoede@redhat.com>,
	<tomi.valkeinen@ideasonboard.com>, <gerald.loacker@wolfvision.net>,
	<andy.shevchenko@gmail.com>, <bingbu.cao@intel.com>,
	<dan.scally@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v9 0/3] media: i2c: Add support for GC08A3 sensor 
Date: Wed, 12 Jun 2024 10:17:57 +0800
Message-ID: <20240612021800.19512-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_191817_053896_3ED0C98F 
X-CRM114-Status: GOOD (  11.61  )
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
v8: https://lore.kernel.org/all/20240323023851.5503-1-zhi.mao@mediatek.com/
v7: https://lore.kernel.org/linux-media/20240303022609.26263-1-zhi.mao@mediatek.com/
v6: https://lore.kernel.org/linux-media/20240227013221.21512-1-zhi.mao@mediatek.com/
v5: https://lore.kernel.org/linux-media/20240220012540.10607-1-zhi.mao@mediatek.com/
v4: https://lore.kernel.org/linux-media/20240204061538.2105-1-zhi.mao@mediatek.com/
v3: https://lore.kernel.org/linux-media/20240109022715.30278-1-zhi.mao@mediatek.com/
v2: https://lore.kernel.org/linux-media/20231207052016.25954-1-zhi.mao@mediatek.com/
v1: https://lore.kernel.org/linux-media/20231123115104.32094-1-zhi.mao@mediatek.com/

This series is based on linux-next, tag: next-20240611
Changes in v9:
- Add maintainer entry for GC08A3 image sensor

Thanks

Zhi Mao (3):
  media: dt-bindings: i2c: add GalaxyCore GC08A3 image sensor
  media: i2c: Add GC08A3 image sensor driver
  MAINTAINERS: Add entry for GC08A3 image sensor

 .../bindings/media/i2c/galaxycore,gc08a3.yaml |  112 ++
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/gc08a3.c                    | 1339 +++++++++++++++++
 5 files changed, 1469 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
 create mode 100644 drivers/media/i2c/gc08a3.c

-- 
2.25.1



