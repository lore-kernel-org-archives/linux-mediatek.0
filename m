Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497EDC4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Apr 2024 05:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CELhWbt4NjsEULqlYxJQ70BLiveuDAWolKCman6uuzY=; b=kdpMJA0q4qhRAekH32u0PuvoMI
	yGth3pZ6/eM46W551kwonPxlKpwPoMehZbmycPGQEruEIgzTcHg6QJjfjX/SA8P144sHQnVDKt+UK
	XDyDqdZA4ZWDdPvcTCr9TA9x1vpOiGbFhDt6EHf6UsWp8z+xx7AkVvlOopK0xSyTDHNe4GRg4SCcy
	oLs98mJJQoS+nLhvTqe+J2FrYXypdhwXmxrMxYbnBbioGOUz8ewTqyBKvfJ0bBZIjNJNVSQz1zboi
	e0mwJCvycXosIpbNapDyPWfbd09VKC8YnAq/RpiPKmUFiVLiZ6oaObVrd+T8qvnIx1Iwa8TxxOIi3
	iZmMOcpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0aWR-0000000EsUb-1mwr;
	Sat, 27 Apr 2024 05:22:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0aWO-0000000EsTm-1iLK;
	Sat, 27 Apr 2024 05:22:49 +0000
X-UUID: 2b4a3f46045611ef9a78ddf43a9225dc-20240426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CELhWbt4NjsEULqlYxJQ70BLiveuDAWolKCman6uuzY=;
	b=UiFVYRYagVHuTOmD6RlSVzcFx3urS9xav9iSKgJdPn+RojZhO8NbSUMMtSlzoqYngr0XUjka864/kiJ0O7vRUwa1yXprqx0K5W9xHQaQplwQya0ln+sHLV4CH8zE0ECRusA2qMQy5BkcjDjBHfd2gfiPgU3PT0klpWK4DqsuQ+w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:6a93307e-f406-41f8-93ef-aff2873b0f47,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:1c6eac86-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 2b4a3f46045611ef9a78ddf43a9225dc-20240426
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 958926975; Fri, 26 Apr 2024 22:22:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 27 Apr 2024 13:22:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 27 Apr 2024 13:22:36 +0800
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
Subject: [PATCH v4 0/2] media: i2c: Add support for GC05A2 sensor
Date: Sat, 27 Apr 2024 13:22:30 +0800
Message-ID: <20240427052233.8915-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_222248_481750_A90A7191 
X-CRM114-Status: GOOD (  10.92  )
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
GC05A2 5-megapixel 10-bit RAW CMOS 1/5" sensor, with an MIPI CSI-2 image data
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
 - support resolution: 2592x1944@30fps, 1280x720@60fps

Previous versions of this patch-set can be found here:
v3:https://lore.kernel.org/linux-media/20240403033825.9072-1-zhi.mao@mediatek.com/
v2:https://lore.kernel.org/linux-media/20240323014751.4989-1-zhi.mao@mediatek.com/
v1:https://lore.kernel.org/linux-media/20240316025253.2300-1-zhi.mao@mediatek.com/
v0:https://lore.kernel.org/linux-media/20240313054409.8073-1-zhi.mao@mediatek.com/

This series is based on linux-next, tag: next-20240426
Changes in v4:
- gc05a2 sensor driver：
-- remove pm_runtime_set_active() in function:probe(), as there is no sensor power on operation in probe process
-- add comments for default case pattern index
-- remove some obscure register comments
-- use decimal unit for width register setting

Thanks

Zhi Mao (2):
  media: dt-bindings: i2c: add GalaxyCore GC05A2 image sensor
  media: i2c: Add GC05A2 image sensor driver

 .../bindings/media/i2c/galaxycore,gc05a2.yaml |  112 ++
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/gc05a2.c                    | 1361 +++++++++++++++++
 4 files changed, 1484 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
 create mode 100644 drivers/media/i2c/gc05a2.c

-- 
2.25.1




