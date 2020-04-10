Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C04C2BB55
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 07:20:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E64520753
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 07:20:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G/OwBsqA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JZwCQi0B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E64520753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=flqZW+045Ltehnm7h628TkaWNmGH4y6VQwzewOnww3s=; b=G/OwBsqATRHILD
	ZmOYOqcFjXSr7hXq01WERlLZpPfjuO21fzjeC0zPVbUqlrDLtyURD0Zt+1hMMHSpnOHMhsqnUJnCw
	mqxvSqvg9s/HkuUpSZ9l9dGbEBgz44SW5GoWb7Mn8+Jc5+L0qnN/CyBkn0j9zCuKSEw/OePqeS8Aw
	5KaF04RLCV80QKgq3l9Kb9LV+vf5qrT6girJYrtKti0RDqax7s/v8yJHn/o+VrWb3L0T/mR7xdIKA
	bHCF2rkOhr/hlFhkmZIBqd9D6UXF2u/6sUOLR3EChIJ24J/BL8umkg8hkMSiP7uvCOXBacDc2KLGW
	kB4JewLBXyfr+E7yGXuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMnxp-0006jE-VJ; Fri, 10 Apr 2020 07:20:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMnxm-0006gp-9U; Fri, 10 Apr 2020 07:20:31 +0000
X-UUID: 60d8398dccb84f2ea4754220f5316e9e-20200409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=vYfMs9/1iEBCtaElVkxErOIYD7/OvfRvtH3nKu3LNUQ=; 
 b=JZwCQi0BcDi3Z/Px6HO/Sb4JfPtAETUG5+XDpnZ9t5up8b5JVB+7Cd4FZMWziy7OjyyMapao3XGo1fDzFRA/UeOxvEAmsrMtUDlq8hqqe/KzDO7nvgLxynIK6W8ZenUBsjUaMulM3YhU9mg7eNEKzI8S4S15saBk2iZPL/B434o=;
X-UUID: 60d8398dccb84f2ea4754220f5316e9e-20200409
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 351601269; Thu, 09 Apr 2020 23:20:22 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 00:17:32 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 15:17:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Apr 2020 15:17:30 +0800
From: Louis Kuo <louis.kuo@mediatek.com>
To: <hans.verkuil@cisco.com>, <laurent.pinchart+renesas@ideasonboard.com>,
 <tfiga@chromium.org>, <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
 <mchehab@kernel.org>
Subject: [RFC PATCH V6 0/3] media: support Mediatek sensor interface driver
Date: Fri, 10 Apr 2020 15:17:20 +0800
Message-ID: <20200410071723.19720-1-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_002030_336160_F35C0077 
X-CRM114-Status: UNSURE (   7.46  )
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
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com,
 srv_heupstream@mediatek.com, Jerry-ch.Chen@mediatek.com,
 jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org,
 linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 louis.kuo@mediatek.com, christie.yu@mediatek.com, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

This is the RFC patch adding Sensor Inferface(seninf) driver on Mediatek mt8183 SoC, which will be used
in camera features on CrOS application.
It belongs to the first Mediatek's camera driver series based on V4L2 and media controller framework.
I posted the main part of the seninf driver as RFC to discuss first and would like some review comments
on the overall structure of the driver.

The driver is implemented with V4L2 framework.
1. Register as a V4L2 sub-device.
2. Only one entity with sink pads linked to camera sensors for choosing desired camera sensor by setup link
   and with source pads linked to cam-io for routing different types of decoded packet datas to PASS1 driver
   to generate sensor image frame and meta-data.

The overall file structure of the seninf driver is as following:

* mtk_seninf.c: Implement software and HW control flow of seninf driver.
* mtk_seninf_reg.h: Define HW register R/W macros and HW register names.
* mtk_seninf_rx_reg.h: Define HW RX register R/W macros and HW register names.

[ V6: Change parse endpoints API, fix coding style, refine error handling and return value,
remove redundant macros and header files]

  media: platform: mtk-isp: Add Mediatek sensor interface driver
  dt-bindings: mt8183: Add sensor interface dt-bindings
  dts: arm64: mt8183: Add sensor interface nodes

 .../bindings/media/mediatek-seninf.yaml       |  219 +++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   25 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/mtk-isp/Kconfig        |   18 +
 drivers/media/platform/mtk-isp/Makefile       |    3 +
 .../media/platform/mtk-isp/seninf/Makefile    |    5 +
 drivers/media/platform/mtk-isp/seninf/TODO    |   18 +
 .../platform/mtk-isp/seninf/mtk_seninf.c      | 1173 +++++++++++++
 .../platform/mtk-isp/seninf/mtk_seninf_reg.h  | 1491 +++++++++++++++++
 .../mtk-isp/seninf/mtk_seninf_rx_reg.h        | 1398 ++++++++++++++++
 10 files changed, 4351 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.yaml
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig
 create mode 100644 drivers/media/platform/mtk-isp/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/seninf/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/seninf/TODO
 create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf.c
 create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf_reg.h
 create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf_rx_reg.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
