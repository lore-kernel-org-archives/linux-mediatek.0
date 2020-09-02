Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CD9C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 12:04:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9782A2078B
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 12:04:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i/IdWOZ1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SMr3bXOu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9782A2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A5+7lMk2h+9VrCftWiNy0v2Vqy2prXoj+F9DjlB4U8w=; b=i/IdWOZ1YEqM5InZxBFrKF/KiF
	6jlUlAs2Dv4nSDcIHEh1KzZ/e6g6rQ+Yf09BWE+4owz162nCh7IVHlZ0yJuCDYGEJySNyYk+8CUdG
	l7IPovkq6gmizcMRG0wWNethd+aSKrEzRRLD7uOTQPf7V9Vu43ggq4G9V1MFicDY68CEZU4PNeKPA
	KHKzLOpo3aBS7ZMRipfGcWP9VfxtxMOe40aphw+HreUAEXGFIT7qCz3mhqUYhz6jdMc1eLgMFKzuk
	hlqe6ngjdnaqm8S+3sJZ06/ejsGSBh+YYJxCEGuQwAAao56yDYxWYQgVlLK7amBkCQVHmGCtjjmj2
	LjVD4qRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDRUg-0007rZ-BA; Wed, 02 Sep 2020 12:04:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDRUd-0007q6-Ol; Wed, 02 Sep 2020 12:04:01 +0000
X-UUID: a1c4b629f02046fe8e88bf7bc3d9381f-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DMolEQgcko1Hi3JfFgntu1uI44EPYKHXW5wUFW7a+48=; 
 b=SMr3bXOu9PWhs1WeLiZD8aOIYVrLc4096OxzB9UIVGCCONXuOogWRk1fa83SCR4UraUODQgn47tEVMNUFdZOqAauyNBkVFpAPl35okKFwu7msPrjY7pgFbBT4iT3QA0EMJZpT2gr1VbU+QqAo8zpY8JZ9fpW68Zs0wf4hvaGaes=;
X-UUID: a1c4b629f02046fe8e88bf7bc3d9381f-20200902
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1875689013; Wed, 02 Sep 2020 04:03:43 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 05:03:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 20:03:38 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Sep 2020 20:03:37 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [PATCH v14 0/2] media: i2c: Add support for OV02A10 sensor
Date: Wed, 2 Sep 2020 20:01:20 +0800
Message-ID: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_080359_943005_8A731DF0 
X-CRM114-Status: GOOD (  14.36  )
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

This series adds YAML DT binding and V4L2 sub-device driver for Omnivision's
OV02A10 2-megapixel 10-bit RAW CMOS 1/5" sensor, which has a single MIPI lane
interface and uses the I2C bus for control and the CSI-2 bus for data.

The driver is implemented with V4L2 framework.
 - Async registered as a V4L2 sub-device.
 - As the first component of camera system including Seninf, ISP pipeline.
 - A media entity that provides one source pad in common and two for dual-cam.

Also this driver supports following features:
 - Manual exposure and analog gain control support
 - Vertical blanking control support
 - Test pattern support
 - Media controller support
 - Runtime PM support
 - Support resolution: 1600x1200 at 30FPS
 
Previous versions of this patch-set can be found here:
 v13: https://lore.kernel.org/linux-media/20200710101850.4604-1-dongchun.zhu@mediatek.com/
 v12: https://lore.kernel.org/linux-media/20200702115223.21507-1-dongchun.zhu@mediatek.com/
 v11: https://lore.kernel.org/linux-media/20200630024942.20891-1-dongchun.zhu@mediatek.com/
 v10: https://lore.kernel.org/linux-media/20200615122937.18965-3-dongchun.zhu@mediatek.com/
 v09: https://lore.kernel.org/linux-media/20200523084103.31276-1-dongchun.zhu@mediatek.com/
 v08: https://lore.kernel.org/linux-media/20200509080627.23222-1-dongchun.zhu@mediatek.com/
 v07: https://lore.kernel.org/linux-media/20200430080924.1140-1-dongchun.zhu@mediatek.com/
 v06: https://lore.kernel.org/linux-media/20191211112849.16705-1-dongchun.zhu@mediatek.com/
 v05: https://lore.kernel.org/linux-media/20191104105713.24311-1-dongchun.zhu@mediatek.com/
 v04: https://lore.kernel.org/linux-media/20190907092728.23897-1-dongchun.zhu@mediatek.com/
 v03: https://lore.kernel.org/linux-media/20190819034331.13098-1-dongchun.zhu@mediatek.com/
 v02: https://lore.kernel.org/linux-media/20190704084651.3105-1-dongchun.zhu@mediatek.com/
 v01: https://lore.kernel.org/linux-media/20190523102204.24112-1-dongchun.zhu@mediatek.com/

Changes of v14 mainly address comments from Tomasz and Sakari.
Compared to v13:
 - Fix imperfections in DT
 - Use an array property "ovti,mipi-clock-voltage" to indicate MIPI TX speed
 - Add the handler to the optional property "ovti,mipi-clock-voltage" in driver

Please help to review this patch.
Thanks.

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Document OV02A10 bindings
  media: i2c: Add OV02A10 image sensor driver

 .../bindings/media/i2c/ovti,ov02a10.yaml           |  161 +++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov02a10.c                        | 1083 ++++++++++++++++++++
 5 files changed, 1266 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
 create mode 100644 drivers/media/i2c/ov02a10.c

-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
