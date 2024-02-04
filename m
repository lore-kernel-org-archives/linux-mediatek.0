Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452C0C4828F
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Feb 2024 06:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fkXM634J1jlWm154+lSLzt0VRf6EPqKugqRDSzvwyjE=; b=fcsQ51WoT33M8Z0aenuymeGGeb
	Oeq8Ea7iZEX0n7Q1lGonFRzLKH7PYMuGFJkrQ7kEubqxWz14xV2UVQ0HOHAOoHnnwo/Twd3YSKJGP
	z89lV2bCQc8QM2JwSMOJihoMx60Yeu21TBjw9ieG3JiZYO37ZTzRCk2r5ySd74NjazDlU+gtkk5OA
	S24c1oKff0wbvex3jezY0JdBdajz2bp9AGtY7d2VXOIOJfSnJZXQVlIW4nnxUea448n2YaurRSiko
	eCD4YYxGK/oXyVP12FoWS+ovHGuGKSLdJKfcgJZ1eRgDVukQw03jWKckAexJ/x6eusBsP4t7Wz/79
	V8ft1rNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWVne-00000000DKX-3DY4;
	Sun, 04 Feb 2024 06:16:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWVnc-00000000DIy-0ccP;
	Sun, 04 Feb 2024 06:16:17 +0000
X-UUID: e5486b3ec32411eea0bf134e88e6c2dc-20240203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fkXM634J1jlWm154+lSLzt0VRf6EPqKugqRDSzvwyjE=;
	b=Qn36UBNzFcP7wIRnIMbrFew5Zh9bH+4wUUP7S9q5JzS+vQMMCiVtb821/aMm3zaBr6+kNNY2MfZdqAATY7MRdw229n4M06knDGLYSi1xPMPnyJmMZyFGf9apXtEhVfuggUn+RXMmh+7MRzwM/pq1rZByyO6HTLiYeioyNeukQRI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:7dd6545b-7e34-4ba9-9268-ec944aa1fae8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6e16cf4,CLOUDID:39c59783-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e5486b3ec32411eea0bf134e88e6c2dc-20240203
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 151934362; Sat, 03 Feb 2024 23:16:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 4 Feb 2024 14:15:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 4 Feb 2024 14:15:42 +0800
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
Subject: [PATCH v4 0/2] media: i2c: Add support for GC08A3 sensor
Date: Sun, 4 Feb 2024 14:15:36 +0800
Message-ID: <20240204061538.2105-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.927800-8.000000
X-TMASE-MatchedRID: Rxzc2NErS1CU2fVedEQUO9jGRkLinPFIsjXBCUyiRiYfVuGrjP7J9Mn+
	P5bPwFH9zE9s0r9yaTktNGU0YgjeG9OD37/ztihF9Ib/6w+1lWT4qCLIu0mtIGHZ+cd7VyKXEXF
	HklABLo68Vg/IW0KkK0qWBBwop/gkmxh0gY/o+VkD2WXLXdz+AXN3sLsG0mhuZ3q824boKrK6JW
	ZHJaNx2Tu2CaYPW4+0Qf7ywtpmhLmpvxu3mLBTO78P2gGjGpF1MVx/3ZYby7+K1QpOXZsW6rwos
	MBsCF61X3E2fHKxS5I1hvF/jmI7s79ZdlL8eona8dA3q/uj/L/EQdG7H66TyH4gKq42LRYk45J2
	CIYLmEfavpPfvq387lBQskZgXfN/ppwvS1ddVil+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.927800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 33169919FB7FFD4F64E3E162B218E2F6FFDCF6FFEC8629B887694416EF336E7F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_221616_206475_1F05B7CD 
X-CRM114-Status: GOOD (  12.85  )
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
v3: https://lore.kernel.org/linux-media/20240109022715.30278-1-zhi.mao@mediatek.com/
v2: https://lore.kernel.org/linux-media/20231207052016.25954-1-zhi.mao@mediatek.com/
v1: https://lore.kernel.org/linux-media/20231123115104.32094-1-zhi.mao@mediatek.com/

This series is based on linux-next, tag: next-20240202
Changes in v4:
- dts-binding files：
-- rename the titile of patch "dt-bindings"
-- use "sensor@31" as device node,according to Krzysztof's suggestion

- gc08a sensor driver：
-- use "ARRAY_SIZE(...)" directly in driver code, instead of macros
-- use pointer to corresponds an array entry of link_frequency
-- use variable of struc "mode" in function:gc08a3_get_selection()
-- declare ret as last in function:gc08a3_test_pattern()
-- fix some coding style by "checkpatch.pl --strict --max-line-length=80"
-- remove function:gc08a3_g_mbus_config()
-- use "v4l2_link_freq_to_bitmap()" API to parse driver-supported link frequencies
-- move runtime PM API before registering the sub-device in function:probe()

Thanks

Zhi Mao (2):
  media: dt-bindings: i2c: add GalaxyCore GC08A3 image sensor
  media: i2c: Add GC08A3 image sensor driver

 .../bindings/media/i2c/galaxycore,gc08a3.yaml |  112 ++
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/gc08a3.c                    | 1448 +++++++++++++++++
 4 files changed, 1571 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
 create mode 100644 drivers/media/i2c/gc08a3.c

-- 
2.25.1





