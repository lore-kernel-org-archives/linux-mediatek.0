Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550DAC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 11:53:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26485207CD
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 11:53:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YhSehGP7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QMsEoFtX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26485207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K037SU0qVoFHAwVgaGWt5vuITGagj4R0iwRXz4WNrFA=; b=YhSehGP72mRB3gO5xqgGRQPshe
	LmU41sRi8bCvhtIFskzYiAT2P7PJbZKnUT7kUjcBXbPVvT1XNVfG7ma7q8SYWiyZJ8Etn0nJkDgHS
	GQRmz9d8V6meatkbm2rwEo4lYBYsnJqhnT4C5QD8CWEZaCb1GM3WUXsEwS5Qf8WHOaVgSEsBda1RS
	sJyMUwL8VSfIENvMgkXYyQATMJyinIO6uJyG2xB74CxMOAly60KOm48KSpeXd6k1KCt3yi2wrwqIA
	df0rskSiFUCwqL880HAAdV1xmp8e+r4ZUhCOTJdnLjAwm3YXlNDUjr5EBFzTHD2qe5d1C8CU6Nqf2
	OVBvh6Gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqxm5-0000BM-MY; Thu, 02 Jul 2020 11:53:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqxm3-00009H-Lz; Thu, 02 Jul 2020 11:53:04 +0000
X-UUID: ada176e289124ad8a588541ce1d79285-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nKlkkWFs3s2d4usM6wA4JUcE08ohBoy1IQ8R65ZelwI=; 
 b=QMsEoFtXueawmjXCAiGgcFsDUkIMsU/s5ihO33BAgNSmrA30JL6Ak8fVViGRmWT5mfXwZcRS3uU1UUONCCpcO2sbvdd0HIsrvH98FnTEMoJ2FzPqyI6t8ClM4Xl53zq4lmXGArvweM5cpmf6JjwsFvyHl2H830QsjUXTzMNyTG0=;
X-UUID: ada176e289124ad8a588541ce1d79285-20200702
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1834692342; Thu, 02 Jul 2020 03:52:52 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 04:52:53 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 19:52:47 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Jul 2020 19:52:46 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [PATCH V12 0/2] media: i2c: Add support for OV02A10 sensor
Date: Thu, 2 Jul 2020 19:52:21 +0800
Message-ID: <20200702115223.21507-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_075303_843045_DF7E7D07 
X-CRM114-Status: GOOD (  10.08  )
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

This series adds DT bindings in YAML and V4L2 sub-device driver for Omnivision's
OV02A10 2 megapixel CMOS 1/5" sensor, which has a single MIPI lane interface
and output format of 10-bit RAW.

The driver is implemented with V4L2 framework.
 - Async registered as a V4L2 sub-device.
 - As the first component of camera system including Seninf, ISP pipeline.
 - A media entity that provides one source pad in common and two for dual-cam.
 
Previous versions of this patch-set can be found here:
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

Changes of v12 mainly address comments from Sakari, Tomasz, Andy.
Compared to v11:
 - Update the initial GPIO state for reset pin in probe()
 - Refine the function ov02a10_entity_init_cfg()

Please review.
Thanks.

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Document OV02A10 bindings
  media: i2c: ov02a10: Add OV02A10 image sensor driver

 .../bindings/media/i2c/ovti,ov02a10.yaml           |  172 ++++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov02a10.c                        | 1052 ++++++++++++++++++++
 5 files changed, 1246 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
 create mode 100644 drivers/media/i2c/ov02a10.c

-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
