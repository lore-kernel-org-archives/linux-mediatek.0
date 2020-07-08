Return-Path: <SRS0=VCtr=AT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FC9C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 10:40:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4B98207DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 10:40:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s6CrY20t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UWE+Qb1E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4B98207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JDJc9HBUljnNsIB3FGDKVx0onZ2lIKWQFUtthIdTLfE=; b=s6CrY20t2q1BSp1ocFpLdtqxmb
	vHwqXgudrieDV7pkENsIAWikW7cZMUHJL19f5eZ6rpsJ6ZZ4TfwCnIWnme/xNOs8tOupOBWc9OEQ9
	JlDP8Af19ShDexWwz3+gHtbBIZIY/JkLO8286czcPrrXavRYy90J5FJgWnmMwudmJC88tkO2lTk6X
	J6ER+gfo8gSnuIuKAqxFGQPEWJMjQZCgPCXbaBLhMDOVoUjd2WJrYMLQI/c8tGMN+DVZdGKZJhurm
	vIR3x8FuLOX+EIgJw4W2rQN06RqWj8DsTR76bPy8SJeMb/jX/bj88aa/LqfS96BF1fMDh2dR5/BsS
	lG0esaGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jt7VK-0002bJ-M9; Wed, 08 Jul 2020 10:40:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jt7VI-0002Zt-K7; Wed, 08 Jul 2020 10:40:41 +0000
X-UUID: c0ffda978664497ba78adfb25eff4daa-20200708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cmUMQrE1Nc11tyoLsvpy8kDypaLzBJ4JZ9W0hcNcjPE=; 
 b=UWE+Qb1ECzTIRjNCrd7ahfb4+O4w9e5nfoNN8go7pRw4N415rUYv1v3L1lpAAAabVa42YkZuxSOAMaYweDUBGBRykbdDjLgwH+Hrb/RdQXTs/8kAL8/5k/cPvdNijyBwxeVMrd8FNESLPflGLuyGQrgKn1AT6mgoGnZvyEn+Blw=;
X-UUID: c0ffda978664497ba78adfb25eff4daa-20200708
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2145344256; Wed, 08 Jul 2020 02:40:41 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 03:40:27 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 18:40:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Jul 2020 18:40:26 +0800
From: Louis Kuo <louis.kuo@mediatek.com>
To: <hans.verkuil@cisco.com>, <laurent.pinchart+renesas@ideasonboard.com>,
 <tfiga@chromium.org>, <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
 <mchehab@kernel.org>
Subject: [RFC PATCH V7 0/3] media: support Mediatek sensor interface driver
Date: Wed, 8 Jul 2020 18:40:20 +0800
Message-ID: <20200708104023.3225-1-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_064040_816261_9B15411B 
X-CRM114-Status: GOOD (  10.83  )
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
* mtk_seninf_dphy.c: Implement mipi-rx phy-device of seninf driver.
* mtk_seninf_reg.h: Define HW register R/W macros and HW register names.
* mtk_seninf_rx_reg.h: Define HW RX register R/W macros and HW register names.

[ V7: Use phy device to control mipi dphy rx, Shrink register definition]

  media: platform: mtk-isp: Add Mediatek sensor interface driver
  dt-bindings: mt8183: Add sensor interface dt-bindings
  dts: arm64: mt8183: Add sensor interface nodes

 .../bindings/media/mediatek-seninf.yaml       |  223 +++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   26 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/mtk-isp/Kconfig        |   18 +
 drivers/media/platform/mtk-isp/Makefile       |    3 +
 .../media/platform/mtk-isp/seninf/Makefile    |    7 +
 .../platform/mtk-isp/seninf/mtk_seninf.c      |  974 +++++++++++
 .../platform/mtk-isp/seninf/mtk_seninf_dphy.c |  353 ++++
 .../platform/mtk-isp/seninf/mtk_seninf_reg.h  | 1491 +++++++++++++++++
 .../mtk-isp/seninf/mtk_seninf_rx_reg.h        |  515 ++++++
 10 files changed, 3611 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.yaml
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig
 create mode 100644 drivers/media/platform/mtk-isp/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/seninf/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf.c
 create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf_dphy.c
 create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf_reg.h
 create mode 100644 drivers/media/platform/mtk-isp/seninf/mtk_seninf_rx_reg.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
