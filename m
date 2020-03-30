Return-Path: <SRS0=Fjxk=5P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CE2C2D0ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 12:36:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 572B620675
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Mar 2020 12:36:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EB275Dp9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="S36tuLp5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 572B620675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R4ctfl71VKswMMkIW2k65m5e+s1wHyfP4FCLLQ4VDc8=; b=EB275Dp99xs56V
	hXPCtqb4HeMrh5NE6X/9Wuk1kK/22P9icrII2taU9LQ5f90MhRgWCTIoz23gG92r2r5FZMpqHT6yx
	/nHCKegJtw+8tx0ikXIJKb3kfhtXup1PXNCEPfP0xbT5lV0spnPBWCQ9F8UUs2tVy6wupTbTaMVrt
	OUUY8Ou8q+GA/xYQSzxVv5gR0OUB14PrXhls6foe07sA+8/Se9mq7ywS+g9GTKNi+2rq9MPzMCta0
	HM51lxJbA8yc2fJFRb6VZMjGWtYoBnL4YzrXMbrLKPcP6aR5jTdVMaRW7QikTG2ukPOeqKmhcs/j3
	6xlxU2/Mp9s+wEaXXbfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jItei-0004LX-NJ; Mon, 30 Mar 2020 12:36:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIteg-0004Kb-DE; Mon, 30 Mar 2020 12:36:39 +0000
X-UUID: b319726c80a3426298678c524a7a1956-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5fynngkcfVP3y4nuFrJ+FfItuj0F2ovwQT443e47vAM=; 
 b=S36tuLp5A9vckFlGPARidf9un053JVOXrFCQQFK2npj2KBo+afhhf8Kb3ajMyXf2MvThc9uV9YX6o38N77ucL7YKEAI7zzgr9DxdlUYHMmjhA3P+TBSgvdnRIyuhBFwnYOOFnOb9hGY3MeVgACzohMhcnSuCM89vOzo77uW7TkI=;
X-UUID: b319726c80a3426298678c524a7a1956-20200330
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2114219133; Mon, 30 Mar 2020 04:36:37 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 05:36:31 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 20:36:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Mar 2020 20:36:26 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [V4, 0/2] media: i2c: add support for DW9768 VCM driver
Date: Mon, 30 Mar 2020 20:36:32 +0800
Message-ID: <20200330123634.363-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_053638_458328_6D9E7B2C 
X-CRM114-Status: UNSURE (   9.48  )
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

Here is the updated version of the changes to add DT bindings in YAML
and V4L2 driver for the DW9768 lens voicee coil motor.
This is a 10-bit DAC with 100mA output current sink capability from Dongwoon,
designed for linear control of voice coil motor, and controlled via
I2C serial interface to set the desired focus.

The DW9768 controls the position with 10-bit DAC data D[9:0] and seperates
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
v3: https://patchwork.kernel.org/cover/11412719/
v2: https://patchwork.kernel.org/cover/11132299/
v1: https://patchwork.kernel.org/cover/11034797/

Mainly changes of v4 are addressing comments from Rob, Andy, Sakari, Tomasz.
Compared to v3:
 - Fix DT bindings and MAINTAINERS checking errors
 - Use i2c_smbus_write_word_swapped() to replace of i2c_smbus_write_word_data()
 - Refine driver more simply and clear
 - Add a dependency to CONFIG_PM

Please review.
Thanks.

Dongchun Zhu (2):
  media: i2c: dw9768: Add DT support and MAINTAINERS entry
  media: i2c: Add DW9768 VCM driver

 .../bindings/media/i2c/dongwoon,dw9768.yaml        |  62 +++
 MAINTAINERS                                        |   8 +
 drivers/media/i2c/Kconfig                          |  11 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/dw9768.c                         | 432 +++++++++++++++++++++
 5 files changed, 514 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
 create mode 100644 drivers/media/i2c/dw9768.c

-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
