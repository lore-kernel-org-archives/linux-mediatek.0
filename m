Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380E6C3F2D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 16:01:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C932F2064A
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 16:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U28gwIc7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oF3/ZhXT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C932F2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WB03H4dweiFl+efa/g1Yv7ifOb/j6mY7ZGA62/MZNWM=; b=U28gwIc79C/QtJ
	5tdItcqatD7Dx+cjWJJYhAR4FkoICa8GSVGiP2OoyqRCGf1QE6IN4ARZvFV3ANw96GVON9ZlKD58F
	lCxnOSFZyc68tLiYi/cwprYkvHOqSBwtcZchXlfpertZDg2Plf4/rFb7RUgpG+el4oT4K3MxxZ81G
	dlaCVdqqIwaeTu7kRT23LJlaepl0BG+er6ifDQPvunIYT7QPzCV1e+lgVTasVkv80ayaFKvf7xwTM
	X2vnomkx1ysFrv9QszE/Mmdgg91PdiUcKmaaS8TnDRKen2Ofc2MwJZeaTmIiYiDp8CLACSwJLlpx/
	2kAQtwPytL+Vy6DmE8/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7i4p-0008BV-1l; Fri, 28 Feb 2020 16:01:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7i3k-00076g-B2; Fri, 28 Feb 2020 16:00:18 +0000
X-UUID: 238509fa3be84e219ff04851a0490b41-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6GQzQmyAP4hZHov0w9Z++EkLKOgmoZgg7oFRSbDV/cs=; 
 b=oF3/ZhXT0lsdOfiwc56cBMF6TTySj1OjKziRwyhm/UW9vtIFAEV+pAD0IUIzgBbyw3uYc+Y61h9pa8vF/pPGJ3qN6ltUfi7LcCIZUFV3dGvB7A+h68GhljnmhKxkFqZVMyUenI/wIMcRx6w1Mjqn8jFRaoGZf9cZZZ3Ng/Kyy4c=;
X-UUID: 238509fa3be84e219ff04851a0490b41-20200228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1295405409; Fri, 28 Feb 2020 08:00:10 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 08:01:18 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 23:59:03 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Feb 2020 23:59:48 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [V3, 0/2] media: i2c: add support for DW9768 VCM driver
Date: Fri, 28 Feb 2020 23:59:56 +0800
Message-ID: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_080016_425753_66FD2619 
X-CRM114-Status: UNSURE (   9.46  )
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

Add DT bindings in YAML and v4l2 driver for DW9768 lens voice coil actuator.
This is a 10-bit DAC with 100mA output current sink capability from Dongwoon,
designed for linear control of voice coil motor, and controlled via I2C serial
interface to set the desired focus position.

The DW9768 controls the position with 10-bit DAC data D[9:0] and seperates
two 8-bit registers to control the VCM position as belows.
DAC_MSB: D[9:8] (ADD: 0x03)
     +---+---+---+---+---+---+---+---+
     |---|---|---|---|---|---|D09|D08|
     +---+---+---+---+---+---+---+---+
DAC_LSB: D[7:0] (ADD: 0x04)
     +---+---+---+---+---+---+---+---+
     |D07|D06|D05|D04|D03|D02|D01|D00|
     +---+---+---+---+---+---+---+---+

This driver supports:
 - set DW9768 to standby mode once suspend and turn it back to active if resume
 - set the position via V4L2_CID_FOCUS_ABSOLUTE ctrl

Changes of v3 are mainly addressing comments from Andy, Rob, Sakari, Tomasz,
compared to v2:
 - Rebase onto 5.6-rc1
 - Convert text documentation to YAML schema
 - Add documents for the register addresses and bits in the registers
 - Merge _power_off/on with runtime PM suspend/resume function
 - Drop the I2C ID table
 - Refine DW9768 power sequencing timing
 - Use the regulator bulk API to enable/disable regulators
 - Change i2c_smbus_write_block_data() to i2c_smbus_write_word_data()
 - Fixup coding style and improve code quality
 - Fix other reviewed issues in V2

Mainly changes of v2 are addressing the comments from Tomasz, Bingbu, Andy,
including,
 - Use i2c_smbus_write_byte_data to replace of the custom dw9768_i2c_write
 - Use i2c_smbus_write_block_data to set vcm postion
 - Use the runtime PM suspend/resume callbacks to power off/on
 - Check the PM runtime status before powering off in dw9768_remove function
 - Add one more regulator vin for the I2C interface
 - Remove or refine log print
 - Fix other reviewed issues in v1

Dongchun Zhu (2):
  media: i2c: dw9768: Add DT support and MAINTAINERS entry
  media: i2c: Add DW9768 VCM driver

 .../bindings/media/i2c/dongwoon,dw9768.yaml        |  55 +++
 MAINTAINERS                                        |   8 +
 drivers/media/i2c/Kconfig                          |  10 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/dw9768.c                         | 437 +++++++++++++++++++++
 5 files changed, 511 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
 create mode 100644 drivers/media/i2c/dw9768.c

-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
