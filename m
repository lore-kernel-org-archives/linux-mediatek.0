Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3190C27C5E
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 11:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gZ+L3w0QZv+3dXASpa8etsuHp4Ejgx7CTnrEsKA4Jck=; b=IMLq6HFTV7DlG04Cu077POKKjk
	vvjZ+1ZSSHfUd0hX4yWKnNx8TD7ZKSvlO/gVdyUfJeC56FJdm7gOIDMFY6lkZtA372dOWlbF0juZh
	rSCDaF8Cs3rUc99IAqZE42Ss/Og4Gz8OMHaS2sSF9FjQT9ymsEUaOzp2r2OVxUKqeGtxXsULKJXFU
	t9eue2x44rLG9Jvy6JoaQKp9cQ/EO/L6Qq4BGADiL1HG9qjEbDUNuuu4YzvkubZTnlmdWkIxzrJVA
	VxMry7C7+9Imlrthmlj3dgazJAokBxzyU/Xg3nP6RQbXkj81dMDy032V9OcnJGKAqwhooi3Xe1MVn
	F1Ht25Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGzkl-00000008edD-1cfF;
	Tue, 11 Jun 2024 11:33:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGzki-00000008ecF-2Hl3;
	Tue, 11 Jun 2024 11:33:26 +0000
X-UUID: 67a3192827e611efaf04eb0598667787-20240611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gZ+L3w0QZv+3dXASpa8etsuHp4Ejgx7CTnrEsKA4Jck=;
	b=q6Y3sQ30CzbVjSHSA+CcuxnWOaUDK+FValPmlYnrAGxiU47Co32KUp7XnFf+7n10+85xWkWRCj9dFNa99aiOpJm1H6QBoRYjyEdIdv644DAmnSxX8nyTOxrZsXODnLAvwRpwFwOkZTtGoCUPDnvd6WiuZI+dgArJbhZRgm5115s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:76b8a59d-83e9-43f8-a94b-3c31039abdbd,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:393d96e,CLOUDID:b74e7488-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 67a3192827e611efaf04eb0598667787-20240611
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1126747705; Tue, 11 Jun 2024 04:33:20 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Jun 2024 19:32:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 11 Jun 2024 19:32:46 +0800
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
Subject: [PATCH v6 0/3] media: i2c: Add support for GC05A2 sensor
Date: Tue, 11 Jun 2024 19:32:33 +0800
Message-ID: <20240611113236.16513-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_043324_979352_8B456170 
X-CRM114-Status: GOOD (  10.68  )
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
v5:https://lore.kernel.org/all/20240605105540.17937-1-zhi.mao@mediatek.com/ 
v4:https://lore.kernel.org/all/20240427052233.8915-1-zhi.mao@mediatek.com/
v3:https://lore.kernel.org/linux-media/20240403033825.9072-1-zhi.mao@mediatek.com/
v2:https://lore.kernel.org/linux-media/20240323014751.4989-1-zhi.mao@mediatek.com/
v1:https://lore.kernel.org/linux-media/20240316025253.2300-1-zhi.mao@mediatek.com/
v0:https://lore.kernel.org/linux-media/20240313054409.8073-1-zhi.mao@mediatek.com/

This series is based on linux-next, tag: next-20240611
Changes in v6:
- use "dev_err_probe" API in probe function 

Thanks

Zhi Mao (3):
  media: dt-bindings: i2c: add GalaxyCore GC05A2 image sensor
  media: i2c: Add GC05A2 image sensor driver
  MAINTAINERS: Add entry for GC05A2 image sensor

 .../bindings/media/i2c/galaxycore,gc05a2.yaml |  112 ++
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/gc05a2.c                    | 1359 +++++++++++++++++
 5 files changed, 1489 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
 create mode 100644 drivers/media/i2c/gc05a2.c

-- 
2.25.1





