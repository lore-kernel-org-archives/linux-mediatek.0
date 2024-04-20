Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C698C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 01:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WPpCiaf+ewsMyYmHzhTXLI1CVcvOmnq22A0ReGIPgsU=; b=ICXDd4p5mQI6byhMzU45rCh7RW
	XfPmf6VeoZmOZ1zjCApa9yrOIkiIMCg13lvK46exn8kVFh4NfLzvga8edwXGARemfOiNyXQM3tmAN
	0ZAzhqH9/YkSXn3UEK63nYxci1TDtFbXUFrp+33H+pf8SU1MyO7jZ4EadOf154Z/6CcbIm/SQHXMm
	zohbde0ykaen3exR8KnvtAkPv+MdnQ/Eig1c3hzi5tpxhyEBElbuCGUq2WmC7we7UvyAJG9n7GwZ0
	gB3XtfqdEqymra9zK72++uM63v3Ew+1jafZBJvUlpFXDWbyuTpQCbi+Ns84ui2WSq6QcZmFW6A0lg
	pi/r1/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzNo-00000007URC-1Yat;
	Sat, 20 Apr 2024 01:19:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzNk-00000007UQ4-2SXZ;
	Sat, 20 Apr 2024 01:19:10 +0000
X-UUID: f8c335fcfeb311eeac1957ae9f99f617-20240419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WPpCiaf+ewsMyYmHzhTXLI1CVcvOmnq22A0ReGIPgsU=;
	b=lWNhlTMXIs1OefaCQqPSC03Cy8qf/AhppDHLgpjFXmhk/M+/m3m51m63+uVii+0yHFWJdwnY2R1ZelBYcLtofYYmJEa31av4jDL7FVOzMAIK/dbxGdIHX8Fhu4d5BiRSPkKpqV3bqcUQzhdTVI2Tuas8cSt5eSdEBV6lZ2w7M2U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:e759f7f4-11c5-4f24-933a-55da550245a7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-55
X-CID-META: VersionHash:82c5f88,CLOUDID:a18d21fb-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: f8c335fcfeb311eeac1957ae9f99f617-20240419
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1599434915; Fri, 19 Apr 2024 18:19:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Apr 2024 18:18:59 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Apr 2024 09:18:57 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Zhi Mao <zhi.mao@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Heiko Stuebner
	<heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, Mehdi
 Djait <mehdi.djait@bootlin.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bingbu Cao <bingbu.cao@intel.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<shengnan.wang@mediatek.com>, <yaya.chang@mediatek.com>,
	<yunkec@chromium.org>, <10572168@qq.com>
Subject: [PATCH v1 0/2] media: i2c: Add support for GT97xx VCM
Date: Sat, 20 Apr 2024 09:18:38 +0800
Message-ID: <20240420011840.23148-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_181908_658841_8E7DA933 
X-CRM114-Status: GOOD (  13.46  )
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

This series add YAML DT binding and V4L2 sub-device driver for Giantec's GT9768&GT9769.
GT9768&GT9769 is a 10-bit DAC with 100mA output current sink capability, designed
for voice coil motor(VCM) with I2C control bus.

This driver supports:
 - support pm runtime function for suspend/resume
 - support camera lens focus position by V4L2_CID_FOCUS_ABSOLUTE CMD
 - used in camera features on ChromeOS application

Previous versions of this patch-set can be found here:
v0: https://lore.kernel.org/all/20240410104002.1197-1-zhi.mao@mediatek.com/

This series is based on linux-next, tag: next-20240419
Changes in v1:
- dts-binding files:
-- remove "aac-mode/aac-timing/clock-presc" control information
-- remove words:"drivers" in commit message, as bindings are for hardware
-- use compatible filename for YAML
-- remove some uselss comments, as they are clear from the compatibles
-- use "camera-lens" as node-name

- gt97xx vcm driver：
-- use BIT(x) method to define some MACROs
-- remove "aac-mode/aac-timing/clock-presc" control and use the default settings
-- fix duplicate "return" case in function:power_on()/power_off()
-- use API:device_get_match_data() and dev_err_probe() in function:probe()
-- fix some coding style of comments

Thanks

Zhi Mao (2):
  media: dt-bindings: i2c: add Giantec GT97xx VCM driver
  media: i2c: Add GT97xx VCM driver

 .../bindings/media/i2c/giantec,gt9769.yaml    |  56 +++
 drivers/media/i2c/Kconfig                     |  13 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/gt97xx.c                    | 436 ++++++++++++++++++
 4 files changed, 506 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
 create mode 100644 drivers/media/i2c/gt97xx.c

-- 
2.25.1




