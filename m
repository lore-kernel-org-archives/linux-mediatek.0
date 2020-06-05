Return-Path: <SRS0=fggR=7S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E755AC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 11:06:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A012A206FA
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 11:06:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FeqKCHNG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bydpq7m6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A012A206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/e/Jd2xleRGJTA4Xa+A3MGPcUVo7xGLXD1nCyKsNqxM=; b=FeqKCHNGPTUDVb
	AVG9bCjMmyxvPqVYSd09qL13b+vDQXpIQavETuA1DnDxf9d0YcGKNC5kdHhCQ1SFW6/kHThg1OjaB
	hlmv00MmUEt4T2PDK0VqqtmWp1toxkR31iaTEYN5wlKAmi3g4j+vE6/Pc/idNNvZ52i0J8hjH/ZNc
	BlF56aD1E/PhAtG5EUwdeSQtYMmPjhVNvZrgAnHc7yotAC74uCRA6W4ULJwWj1kPPg75NPGZoTpnl
	Nud14AdEW6reCvWuEMpd3Z9oTESK8p9hj+/TAKDPHuSqIuFy8PFb5CO1bu+abKQ+l54NdyPfi5u4m
	KYreOirFl1Rexq5GLv2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhABA-00072B-S5; Fri, 05 Jun 2020 11:06:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhAB8-00071I-OF; Fri, 05 Jun 2020 11:06:28 +0000
X-UUID: 5085f83076774187aecf61726d09d4c4-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RDATlCMt7JAqD+s3CrHj64evnMGc2HkPNIFyTmwdTd4=; 
 b=bydpq7m6/IV+fpJlBB24jPrmNyLK5ps2k5juGN/wZpfUOpHqAX9+kohzL3Q2JTkVociC55b5aFU9vA8wrFpTvXo6pZiX//9SUF3F6X0qPk2eGEhkDOwwkHdmsI30O2xSCq7NPnm4cQoz9OU+rKYgcVixYfT0RXB6ols+lM+K9Es=;
X-UUID: 5085f83076774187aecf61726d09d4c4-20200605
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1241717567; Fri, 05 Jun 2020 03:06:16 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 03:56:18 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 18:56:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 18:56:15 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [V7, 0/2] media: i2c: Add support for DW9768 VCM driver
Date: Fri, 5 Jun 2020 18:54:10 +0800
Message-ID: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_040626_795442_5B59418B 
X-CRM114-Status: UNSURE (   7.67  )
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

This series adds DT bindings and V4L2 sub-device driver for Dongwoon's DW9768,
which is a 10-bit DAC with 100mA output current sink capability.

The driver controls the position with 10-bit DAC data D[9:0] and seperates
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
v6: https://lore.kernel.org/linux-media/20200518132731.20855-1-dongchun.zhu@mediatek.com/
v5: https://lore.kernel.org/linux-media/20200502161727.30463-1-dongchun.zhu@mediatek.com/
v4: https://lore.kernel.org/linux-media/20200330123634.363-1-dongchun.zhu@mediatek.com/
v3: https://lore.kernel.org/linux-media/20200228155958.20657-1-dongchun.zhu@mediatek.com/
v2: https://lore.kernel.org/linux-media/20190905072142.14606-1-dongchun.zhu@mediatek.com/
v1: https://lore.kernel.org/linux-media/20190708100641.2702-1-dongchun.zhu@mediatek.com/

Mainly changes of v7 are addressing comments from Rob, Sakari, Tomasz.
Compared to v6:
 - Refine DT bindings
 - Use i2c_smbus_read_byte_data() directly to replace of dw9768_read_smbus()
 - Calculate operation time based on the configured board-specific DT settings
 - Abstract async register error handling case
 - Fix other review comments in v6

Please review.
Thanks.

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Document DW9768 bindings
  media: i2c: dw9768: Add DW9768 VCM driver

 .../bindings/media/i2c/dongwoon,dw9768.yaml        | 100 ++++
 MAINTAINERS                                        |   8 +
 drivers/media/i2c/Kconfig                          |  13 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/dw9768.c                         | 566 +++++++++++++++++++++
 5 files changed, 688 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
 create mode 100644 drivers/media/i2c/dw9768.c

-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
