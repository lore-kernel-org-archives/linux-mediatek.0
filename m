Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C685FC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 06:32:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9267220759
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 06:32:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h9juWxQE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q64iXN0K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9267220759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4IY/ITs7S6jLT/GVsW6Q369Bi4x67c6Qk4gXDXI6msc=; b=h9juWxQEACErafXqjbS3YbS4yi
	bQqTywCffTkMDMbWNHgMk/MOrj+/qDwHt4ED1Qv+9IwxdNGXBZ/3RNbISFK+mosqy6sV1TY3fKxAt
	rwZinzzyIK9/5ttcwArTF+o0dVJtvUTDE1dfg5/pcGB+nuFMifB70wNCqQrNed4dGYCuEKWwcJRMJ
	uAxvPbfOwif/FZk1pdSDhQvcJ8n19J86sO95toVqfKnH27QK/GQPRcWNPLskbIHjMvtbVjnP3Iufq
	WmVvfLB4rQbNvcYz9z8kRaaUCrOpSg6NiskxTPMDdrm5JPHdO3N7Iy4D0qahJElJcYGbEiN0Sy/WB
	DOU/siuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq9p4-0007BS-6C; Tue, 30 Jun 2020 06:32:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq9p1-0007As-Hb; Tue, 30 Jun 2020 06:32:48 +0000
X-UUID: 796e6958e1f747c4b3eedd32886a5d7e-20200629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nR6OzzIisReA8shV0BgR3bsU+tUWbUvrl963V50edjM=; 
 b=Q64iXN0KDB+49ds74oVzmvWAlkcdaUMxtxYJNw438CBRQEmUJod+Dg57rXYp3lgjCZ9CdPS0fccuOAXnNi7+A7q88VoaCbeHkNpcdY95AwCz7r6m4UDtzYZyAAustrCuw1RUoF1GWSuVoR1WfMHuWT/H+BJV4559Vk33CXjE5DY=;
X-UUID: 796e6958e1f747c4b3eedd32886a5d7e-20200629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 629986195; Mon, 29 Jun 2020 22:32:34 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 23:22:34 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 14:22:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 14:22:33 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [PATCH V9 0/2] media: i2c: Add support for DW9768 VCM
Date: Tue, 30 Jun 2020 14:22:09 +0800
Message-ID: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MTK: N
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

This series adds DT bindings and V4L2 sub-device driver for Dongwoon's DW9768,
which is a 10-bit DAC with 100mA output current sink capability.

The driver is designed for linear control of voice coil motor(VCM).
It creates a V4L2 sub-device and provides control to set the desired focus.

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
 v8: https://lore.kernel.org/linux-media/20200616125531.31671-1-dongchun.zhu@mediatek.com/
 v7: https://lore.kernel.org/linux-media/20200605105412.18813-1-dongchun.zhu@mediatek.com/
 v6: https://lore.kernel.org/linux-media/20200518132731.20855-1-dongchun.zhu@mediatek.com/
 v5: https://lore.kernel.org/linux-media/20200502161727.30463-1-dongchun.zhu@mediatek.com/
 v4: https://lore.kernel.org/linux-media/20200330123634.363-1-dongchun.zhu@mediatek.com/
 v3: https://lore.kernel.org/linux-media/20200228155958.20657-1-dongchun.zhu@mediatek.com/
 v2: https://lore.kernel.org/linux-media/20190905072142.14606-1-dongchun.zhu@mediatek.com/
 v1: https://lore.kernel.org/linux-media/20190708100641.2702-1-dongchun.zhu@mediatek.com/

Mainly changes of v9 are addressing comments from Tomasz.
Compared to v8:
 - Refine dw9768_cal_move_delay() to return the value in a standard unit
 - Refine err_power_off error handler section in probe()
 - Use pm_runtime_status_suspended() in remove()

Please review.
Thanks.

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Document DW9768 bindings
  media: i2c: dw9768: Add DW9768 VCM driver

 .../bindings/media/i2c/dongwoon,dw9768.yaml        | 100 ++++
 MAINTAINERS                                        |   8 +
 drivers/media/i2c/Kconfig                          |  12 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/dw9768.c                         | 554 +++++++++++++++++++++
 5 files changed, 675 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
 create mode 100644 drivers/media/i2c/dw9768.c

-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
