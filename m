Return-Path: <SRS0=1JTW=3S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CEAC35240
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 08:17:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D49D320720
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 08:17:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qrAPRJDz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="c4DqkSMX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D49D320720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hGPPw/3eXOidsyeoIcoaP0E4zVfXEHT3jHfTC2kjsIM=; b=qrAPRJDzT255lg
	XtXD4dvc2G164Kvh8gxkHyQe/ot4ZoOIrOrCb6eqocyCqOSrBshrYZmTSF4pDWCSHpcy1PbISyNMb
	k2XbcuoaHQrdfqllubraK+bxvc9XUIHEaf5fgf1nj3qktc5bjOizjHqPQeOiyn+1B+1NBoTtUTreh
	9Y9SitAtcpODIVg7qN30lW6Uu4CO2ee4kB9yvqXDAa5cCjf81wXQ4Io0Q8xr9u406ccLDt/kNn8gZ
	fpj9w+IEYponBdTQ45nbopBQV6RzvawtPH6syZaSe7pViKp3OY//8Mw2vCUaD8toJ87PrWXOnOIaw
	laClu14eaEbSFDf19A4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwiXD-00078h-4l; Wed, 29 Jan 2020 08:17:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwiX2-00070f-Ks; Wed, 29 Jan 2020 08:17:06 +0000
X-UUID: bca3ce5bb9fb4f039f5560027dee6004-20200129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=pAeCviEgp5SyhyDozmBEeXR8il9ypqHLYGqVz9VurIU=; 
 b=c4DqkSMXTCTiAeRIoSD0X8bqQpDGceYRNDWUdKL0JRQZI9Iq9v2uSy+Xy080RlmGoOohYqMe8bdTmxdj33WdWrw2O/iTfR5nRKFaWIGyLWFwiLGp8mC/BvDAcsTM2rZXEvGKaCvunASKQ+0zslscVlWP2Helge4MMWS3lr76KUY=;
X-UUID: bca3ce5bb9fb4f039f5560027dee6004-20200129
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1156645027; Wed, 29 Jan 2020 00:16:59 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 00:18:11 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 16:16:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 29 Jan 2020 16:17:02 +0800
From: Louis Kuo <louis.kuo@mediatek.com>
To: <hans.verkuil@cisco.com>, <laurent.pinchart+renesas@ideasonboard.com>,
 <tfiga@chromium.org>, <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
 <mchehab@kernel.org>
Subject: [RFC PATCH V5 0/3] media: support Mediatek sensor interface driver 
Date: Wed, 29 Jan 2020 16:16:47 +0800
Message-ID: <20200129081650.8027-1-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 70D65C83CC9C06DA6BDFA9C6C27F4D408CC3BC8D2095CBD9243989F3B9DC9A682000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_001704_694624_F0B4A7BE 
X-CRM114-Status: UNSURE (   7.70  )
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
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com,
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
* mtk_seninf_def.h: Define data structure and enumeration.
* mtk_seninf_reg.h: Define HW register R/W macros and HW register names.

[ V5: use recommended coding style, revise DT binding documentation]

  media: platform: mtk-isp: Add Mediatek sensor interface driver
  dt-bindings: mt8183: Add sensor interface dt-bindings
  dts: arm64: mt8183: Add sensor interface nodes

 .../bindings/media/mediatek-seninf.txt        |   66 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   12 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/mtk-isp/Kconfig        |   17 +
 .../media/platform/mtk-isp/isp_50/Makefile    |    3 +
 .../platform/mtk-isp/isp_50/seninf/Makefile   |    6 +
 .../mtk-isp/isp_50/seninf/mtk_seninf.c        | 1112 +++
 .../mtk-isp/isp_50/seninf/mtk_seninf_def.h    |   72 +
 .../mtk-isp/isp_50/seninf/mtk_seninf_reg.h    | 7747 +++++++++++++++++
 9 files changed, 9036 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.txt
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
