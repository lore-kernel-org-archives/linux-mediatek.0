Return-Path: <SRS0=WUpV=Y4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66DBCA9EA0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2019 11:08:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA8F421D7F
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2019 11:08:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="acvrl9zy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA8F421D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v6beQkjSX+hoHy7W0JT6+u1aM2mVN5wwzgoWZAMh4T8=; b=acvrl9zybmOL5m
	0w7n4I1JpB3V/xfmS1+/I9qo88UA6MqF64RyWkx1VlvXMpj+76nXbF7D+aVUNmGMPFCiKGx0Zpgbm
	kgnsnc04sJHN9gfZSUSn9zPyULJhZbC1e6HPQvbuZnZh6JIXyesPy2rGaAXZlTdA7f3EoO6MbS7LM
	CRutumsi03lLTRETbbcGPlXVLur+hZ96Cy3jHJ8ykrOIqHSwz90M1C90up0bRgCc0svnLkw8bK6ui
	VQ11p26F42FPTGp6H1IU2MpG4rCiUKfOXZj8N26AE+GgjdbrN3EdmL7NFqDgSn/ZNNr8jwTEO5OCH
	LtR0v6YXaFm9AuJ4wERg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRaDb-0003xK-UW; Mon, 04 Nov 2019 11:08:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRaCg-00035G-VI; Mon, 04 Nov 2019 11:07:24 +0000
X-UUID: cbc358513baa499c99fda6d891ed1cdb-20191104
X-UUID: cbc358513baa499c99fda6d891ed1cdb-20191104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2039231217; Mon, 04 Nov 2019 03:07:24 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 4 Nov 2019 02:57:15 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 4 Nov 2019 18:57:13 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 4 Nov 2019 18:57:12 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [V5, 0/2] media: i2c: Add support for OV02A10 sensor
Date: Mon, 4 Nov 2019 18:57:11 +0800
Message-ID: <20191104105713.24311-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_030723_047466_5512CCA1 
X-CRM114-Status: GOOD (  11.43  )
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

Hello,

This series adds DT binding and driver for Omnivision's OV02A10 2 megapixel CMOS 1/5" sensor,
which has a single MIPI lane interface and output format of 10-bit RAW.

The driver is implemented wth V4L2 framework.
1. Async registered as a V4L2 I2C sub-device.
2. A media entity that can provide several source pads and sink pads to link with other device like Seninf, ISP one after another
   to create a default overall camera topology, image frame or meta-data from sensor can flow through particular path to output
   preview or capture image or 3A info.

Changes of v5 are addressing comments from Sakari, Tomasz.
 - Set default orientation in dt-bindings
 - Move the content of power on/off directly to the resume/suspend callbacks
 - Move sensor id check to power on to avoid the privacy LED flash on boot
 - Remove unnecessary debug log in driver
 - Fix other reviewed issues in v4

Changes of v4 mainly address the comments from Sakari, Rob, Tomasz.
 - Remove data-lanes property in DT
 - Add link frequencies in DT to match the expect value that driver requires
 - Omit open callback as int_cfg is implemented
 - Use i2c_smbus_write_byte_data/i2c_smbus_read_byte_data instead of customed APIs
 - Use do_div to calculate pixel rate
 - Use usleep_range directly for shoter sleep case
 - Re-adjust sensor power up/off sequence
 - Re-set pd/rst GPIO inverter property according to the datasheet
 - Refine set_exposure/set_gain/set_vblanking/set_test_pattern functions
 - Fix other reviewed issues in v3

Changes of v3 are mainly addressing comments from Rob, Sakari, Bingbu.
 - Fix coding style errors in dt-bindings
 - Use macro flag to describle basic line 1224 when updating v-blanking
 - Remove unnecessary debug log in driver

Mainly changes of v2 are addressing the comments from Nicolas, Bingbu, Sakari, Rob,
including,
 - Put dt binding before driver in series
 - Add MAINTAINERS entries
 - Squash the MAINTAINERS entry and Kconfig to driver patch
 - Add rotation support for driver
 - Fix other reviewed issues in v1

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Document OV02A10 bindings
  media: i2c: ov02a10: Add OV02A10 image sensor driver

 .../devicetree/bindings/media/i2c/ov02a10.txt      |   54 +
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov02a10.c                        | 1113 ++++++++++++++++++++
 5 files changed, 1188 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
 create mode 100644 drivers/media/i2c/ov02a10.c

-- 
2.9.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
