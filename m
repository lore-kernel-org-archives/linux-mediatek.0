Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02264C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 11:39:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C88FD2073D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 11:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k0E0A0K4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HWM5xuHk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C88FD2073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+frCG5ocsdi8quSAiNl6Ou3C7xJbnR9er83uG+6B0g0=; b=k0E0A0K4JXEgEz
	39kSrGhfg4Roth0/7shmmGeSpkx/gfq7hoy/87K+2i5VKVuDn+KVL4/eWEnLtp6ekNmB0OjdcXC50
	WFyJENPrlORzUGn9T22gRepCUvZfNaVIL5wg1aecGRLMGiTrFvLlwAze9OOETFvzb3bM4KbKI9/k7
	Hjq5+T6opaIxi+kcmGarVKet5ZbwXqm8maHxZF3soq1UEk7dGsd4uiyNLOO8gxy3cxORw6NohQeBj
	ZrlIizi/gJ5ofyZci+cbZI5bPOkAy2ofX4e/Mg+u/NeDe8pad3jtdyFPdFJvaY8pdoUEbVzqMKIQg
	fBFkssDEbgRx1XxvvB4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if0L3-0004of-BQ; Wed, 11 Dec 2019 11:39:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if0Ka-0004GB-9a; Wed, 11 Dec 2019 11:39:03 +0000
X-UUID: 85dac62e3f3649d0aadba0f95f229830-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=E6iZNCkFCawyWjZRc34zhuu8VrWUse/gSOjQa/y+r/g=; 
 b=HWM5xuHk3TqbXjVy/WRN4RQ1WNBaWP0zFwTpKBWTCGYAQ0iT3CRFbHTHuCsXKIddn5LPghJiV3pZ23/AzAbV32EGwIHcCF2RhswKOVH00tKV/u05DONrRPyG0fekQxfM7HWYjTEDmDy0ohl/cSTJF4RZn5kq5E/vp9j9YE5phmk=;
X-UUID: 85dac62e3f3649d0aadba0f95f229830-20191211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 410802635; Wed, 11 Dec 2019 03:38:55 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 03:29:58 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 19:28:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Dec 2019 19:28:26 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [V6, 0/2] media: i2c: Add support for OV02A10 sensor
Date: Wed, 11 Dec 2019 19:28:47 +0800
Message-ID: <20191211112849.16705-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_033900_349919_B93315BD 
X-CRM114-Status: GOOD (  10.42  )
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
2. The first component of camera system including Seninf, ISP.
3. A media entity that can provide one source pad in common and two for dual camera.

Changes compared to v5:
 - Rebase onto 5.5-rc1
 - Remove the handler of "ovti, hs-vod-adjust" property
 - Define new macro HZ_PER_MHZ to describe frequency-related parameters
 - Fixup coding style and improve code quality
 - Fix other reviewed issues in v5

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
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov02a10.c                        | 1102 ++++++++++++++++++++
 5 files changed, 1176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
 create mode 100644 drivers/media/i2c/ov02a10.c

-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
