Return-Path: <SRS0=m7qp=6Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DC3C3A5A9
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 May 2020 16:18:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86D1F24956
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 May 2020 16:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LKSBGx9r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gteqzQ8Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86D1F24956
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fL/inEAZ75gzaoy8WGOXC+zbLhPL7TtTL3cE+GVAxQ0=; b=LKSBGx9rZ4DNkV
	4CixKgbMXbN8eigj0xyZIr+8SuszPwz7lubvO3aO9bbIU4xuZ48hG3+Pezwrm1e21J8A3TeFgkUZv
	7nOXfEk6QWZMR7dMzpossVTEzZdfs1GcM9PBdrVwLmaUQdL9yoQJ7+PYdiYvOTP9EUfe5HdxvtEsc
	IkCalF2wSXX0kwT/S11sHQys+mgxuAhazmkrNflbwIlEwUH8ZJEuOkGBsGj3fg6iQVHs2lEo/oLpy
	8Iir//C9/X0HChnPriT3WJB39wN3JCRjxuolMtPMuLZOzP6rUqunsM3a885zBYg3sVZ1TLELjo8vi
	YP7psfagC2cUfaJ6YxOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUuqj-0006fD-AS; Sat, 02 May 2020 16:18:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUuqg-0006dy-1z; Sat, 02 May 2020 16:18:44 +0000
X-UUID: 68e7af6281e24763beb6a8b7b20b5463-20200502
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=EAAh30Bef+oW9eX3BIR+Eagl/ceAkjF9T1b8MCX4U/s=; 
 b=gteqzQ8YkMYcJB1FRKXZfdwyUoGdEgzj11pVC45ifZLdzJyvW6/t5zeAT9Joyv4ezFWVa80Y22BlYEA6buj0tPQ6WO45gOkYeg/v+5uzFq8bOCD+AzucxHjWUTZkqqTxRDuBeCHLO3Hf4Zei7fJfD5gx6yHvCekZ7Qc9r6l9y2o=;
X-UUID: 68e7af6281e24763beb6a8b7b20b5463-20200502
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1455470834; Sat, 02 May 2020 08:18:30 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 2 May 2020 09:18:25 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 May 2020 00:18:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 3 May 2020 00:18:24 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [V5, 0/2] media: i2c: Add support for DW9768 VCM driver
Date: Sun, 3 May 2020 00:17:25 +0800
Message-ID: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_091842_105672_3A53FC45 
X-CRM114-Status: GOOD (  10.19  )
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

This series adds DT bindings in YAML and V4L2 sub-device driver for DW9768
lens voice coil motor, which is a 10-bit DAC with 100mA output current
sink capability from Dongwoon.

The driver is designed for linear control of voice coil motor,
and controlled via IIC serial interface to set the desired focus.
It controls the position with 10-bit DAC data D[9:0] and seperates
two 8-bit registers to control the VCM position as belows.
DAC_MSB: D[9:8](ADDR: 0x03):
     +---+---+---+---+---+---+---+---+
     |---|---|---|---|---|---|D09|D08|
     +---+---+---+---+---+---+---+---+
DAC_LSB: D[7:0](ADDR: 0x04):
     +---+---+---+---+---+---+---+---+
     |D07|D06|D05|D04|D03|D02|D01|D00|
     +---+---+---+---+---+---+---+---+

This driver supports:
 - set DW9768 to standby mode once suspend and turn it back to active if resume
 - set the desired focus via V4L2_CID_FOCUS_ABSOLUTE ctrl

Previous versions of this patch-set can be found here:
 v4: https://lore.kernel.org/linux-media/20200330123634.363-1-dongchun.zhu@mediatek.com/
 v3: https://lore.kernel.org/linux-media/20200228155958.20657-1-dongchun.zhu@mediatek.com/
 v2: https://lore.kernel.org/linux-media/20190905072142.14606-1-dongchun.zhu@mediatek.com/
 v1: https://lore.kernel.org/linux-media/20190708100641.2702-1-dongchun.zhu@mediatek.com/

Changes of v5 are addressing comments from Rob, Andy, Sakari, including:
 - Rebase onto 5.7-rc1
 - Refine DT bindings in YAML
 - Remove the condition of IS_ENABLED(CONFIG_PM) as the driver depends on PM
 - Reverse the order of enabling RPM and registering the async subdev

Please review.
Thanks.

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Document DW9768 bindings
  media: i2c: dw9768: Add DW9768 VCM driver

 .../bindings/media/i2c/dongwoon,dw9768.yaml        |  60 +++
 MAINTAINERS                                        |   8 +
 drivers/media/i2c/Kconfig                          |  11 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/dw9768.c                         | 440 +++++++++++++++++++++
 5 files changed, 520 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
 create mode 100644 drivers/media/i2c/dw9768.c

-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
