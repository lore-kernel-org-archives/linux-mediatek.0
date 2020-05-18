Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DD1C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 13:39:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7ED3207E8
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 13:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uamgr/ip";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="l7XVTTa5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7ED3207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UVIOZTQ+6zJXPBTepRDpWTRiaL+JL61wYGbUceaBQTY=; b=uamgr/ipPvCdMN
	6yKV2hbdcdbtUPYx6LFrPSIPy48WGY6Zr7VY/jIEh0APHNtm1jg+3AHQiHYiVETHPM/TwLkxCQb4l
	2PvXnXISb/uL9H4/2WQk0aWUbGgKFTznSo+oy3I8OMpfV95+eb802aybysMRLnX1NMBwmvkdy9j/D
	/1zVByRsCIsRLIhECapVM2H2GRFXDmD16KCKWn/VFKmJ0Mxt1Yi8KMh67ec4f0Ato1LF1nHMIS2qr
	EszgdxE92IdLjrePlRATqI0eJwXcmoYsQmk3eUGzvJNmP48NUMeuoKWLlenPe4L3OpJTNU4pYmsri
	/4WEqt0msAbS7MZs+5pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jafz7-0002SW-K4; Mon, 18 May 2020 13:39:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jafz4-0002RR-3E; Mon, 18 May 2020 13:39:11 +0000
X-UUID: 4c998d9739404fbda2cebec8521f5ffb-20200518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0oPHPt5pIb7KHZdlyVqoLRWJ+ikzXZ8b5EsBL/Pps+M=; 
 b=l7XVTTa5BNIRmYHaMG7Yv9ZpVnRhAg0ziJbNDCqBuRC9jjisumcugGycJmwGC9eLatM0aosoONyuzC8zJX58twVjqoebz6yR9uilzpsdiAuM1Ru2WeO0Xz69+Bw1SH6fIfBkVCscZMRsB7BnvsjdG8fC51CXM6EnVktPpWo27RE=;
X-UUID: 4c998d9739404fbda2cebec8521f5ffb-20200518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1845850337; Mon, 18 May 2020 05:38:54 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 May 2020 06:29:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 May 2020 21:29:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 May 2020 21:28:59 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [V6, 0/2] media: i2c: Add support for DW9768 VCM driver
Date: Mon, 18 May 2020 21:27:29 +0800
Message-ID: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_063910_148493_896B47D5 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
lens voice coil motor(VCM), which is a 10-bit DAC with 100mA output current
sink capability from Dongwoon.

The driver is designed for linear control of voice coil motor,
and controlled via IIC serial interface to set the desired focus.
It controls the position with 10-bit DAC data D[9:0] and seperates
two 8-bit regs to control the VCM position as belows.
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
v5: https://lore.kernel.org/linux-media/20200502161727.30463-1-dongchun.zhu@mediatek.com/
v4: https://lore.kernel.org/linux-media/20200330123634.363-1-dongchun.zhu@mediatek.com/
v3: https://lore.kernel.org/linux-media/20200228155958.20657-1-dongchun.zhu@mediatek.com/
v2: https://lore.kernel.org/linux-media/20190905072142.14606-1-dongchun.zhu@mediatek.com/
v1: https://lore.kernel.org/linux-media/20190708100641.2702-1-dongchun.zhu@mediatek.com/

Mainly changes of v6 are addressing comments from Rob, Sakari, Tomasz.
Compared to v5:
 - Add a second compatible string for the Giantec device
 - Document optional properties: "dongwoon,aac-mode", "dongwoon,aac-timing" and
   "dongwoon,clock-dividing-rate" for lens specific reg settings
 - Adjust Kconfig to match the current media tree master branch
 - Use container_of() directly to replace of defining macro function

Please help review.
Thanks.

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Document DW9768 bindings
  media: i2c: dw9768: Add DW9768 VCM driver

 .../bindings/media/i2c/dongwoon,dw9768.yaml        | 105 +++++
 MAINTAINERS                                        |   8 +
 drivers/media/i2c/Kconfig                          |  13 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/dw9768.c                         | 515 +++++++++++++++++++++
 5 files changed, 642 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
 create mode 100644 drivers/media/i2c/dw9768.c

-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
