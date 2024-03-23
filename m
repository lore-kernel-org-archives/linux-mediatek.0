Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82B5C54E64
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Mar 2024 02:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kBYW2HSKPAO73a9/6vY6GefeFn9WVoTooqq0gWEt8W4=; b=J9byZ3fOGx1thUumvhvMN4FuGx
	7i1wfPS5+qZ2+YD7RjgwLO9DP7IA/rSblvLuFbN0Hw2iGws7shfJ3uJgAfrNrgh2TLH5ZJExgIoKo
	fFLCTu+PCn93vwojel192fM7PHQQzrh9byXT1fAEg/VyVE/ICtcOdGgHG56f74V07wKbF1QuT6hZn
	hfCPtipOnPX5vH6ab7ip6fqeaU3bzKQqWrii/wzolohS73knxrg2V/p1wvQKnxbCXD1SaY8mkmQuw
	7wu8wSqjjHRKnMXLSuB7s+P2v9IlFVErQUDZedBM0Qw61qYb8f13QLkDbmLDRNxz9KllsqQgLiPIv
	sUxhaBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnrHl-00000009G0h-1K3Q;
	Sat, 23 Mar 2024 02:39:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnrHj-00000009G0H-0oRN;
	Sat, 23 Mar 2024 02:39:04 +0000
X-UUID: 8116c8f8e8be11eeacdb61a41848c7d2-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kBYW2HSKPAO73a9/6vY6GefeFn9WVoTooqq0gWEt8W4=;
	b=YfQXCdSL3rIBSXx5qkrvELIQoZg+22qs38uyUcx1y9sTal4kApzSX4lcsT363eKltk8iITT7Q0/XHmy59VrQwgS9vY7fOYd1pq4wX1u426JbZKRcT1lnTpsW/QiBiMybu4kFcYHeqnGUcN7hvEmXt/JVDNV/Lm/H8sPOHsgLGII=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:8aefc324-f55f-4cbc-8037-1b4fab45bb44,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:d9823900-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 8116c8f8e8be11eeacdb61a41848c7d2-20240322
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 811460372; Fri, 22 Mar 2024 19:39:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 23 Mar 2024 10:38:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 23 Mar 2024 10:38:54 +0800
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
Subject: [PATCH v8 0/2] media: i2c: Add support for GC08A3 sensor 
Date: Sat, 23 Mar 2024 10:38:49 +0800
Message-ID: <20240323023851.5503-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.668500-8.000000
X-TMASE-MatchedRID: krcWnEzmQoEtlu2PjaXfUW3NvezwBrVmQPCPzycuBFOl4EP+dy+wBAwF
	qajp21ReNJCQfPeJOQovXSnelSgBMJlIfdN/LTrGdE/dhjO8a+RqYquCrLrVwhHfiujuTbedduS
	l0OECBiZx7H5wEf5GN9b0cMVDXqkVp8pDLp9CdcJc/msUC5wFQUyQ5fRSh265NSweOixQAJJHdE
	c8dOyw1Vl+Hk3Iw2bEgDLqnrRlXrYyF7rbsD7xoYrfx+nI+XiI+gtHj7OwNO2J8YJgRrgXF7T1y
	WCIvwqnrolbQyGqrgQeOCBAkDaY05qOSQt7Cnwr
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.668500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E9F45716C2CDABF3B78A875838D6AE63442ADCAFC38CA188AB45B35435897E332000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_193903_415924_43AD20F5 
X-CRM114-Status: GOOD (  10.10  )
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
v7: https://lore.kernel.org/linux-media/20240303022609.26263-1-zhi.mao@mediatek.com/
v6: https://lore.kernel.org/linux-media/20240227013221.21512-1-zhi.mao@mediatek.com/
v5: https://lore.kernel.org/linux-media/20240220012540.10607-1-zhi.mao@mediatek.com/
v4: https://lore.kernel.org/linux-media/20240204061538.2105-1-zhi.mao@mediatek.com/
v3: https://lore.kernel.org/linux-media/20240109022715.30278-1-zhi.mao@mediatek.com/
v2: https://lore.kernel.org/linux-media/20231207052016.25954-1-zhi.mao@mediatek.com/
v1: https://lore.kernel.org/linux-media/20231123115104.32094-1-zhi.mao@mediatek.com/

This series is based on linux-next, tag: next-20240323
Changes in v8:
- gc08a3 sensor driver:
-- use function: pm_runtime_get_if_active()

Thanks

Zhi Mao (2):
  media: dt-bindings: i2c: add GalaxyCore GC08A3 image sensor
  media: i2c: Add GC08A3 image sensor driver

 .../bindings/media/i2c/galaxycore,gc08a3.yaml |  112 ++
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/gc08a3.c                    | 1339 +++++++++++++++++
 4 files changed, 1462 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
 create mode 100644 drivers/media/i2c/gc08a3.c

-- 
2.25.1




