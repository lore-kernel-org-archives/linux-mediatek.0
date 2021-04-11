Return-Path: <SRS0=mAey=JI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2A5C433ED
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 09:37:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8A1A611CE
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 09:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8A1A611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GqCON5Hsi5JR3dwIsvHfAXR5JTlAGRnvTkWJ9cSYVAk=; b=NURUnhOs8eBOAVGmX7yQ5plvpQ
	Ffd6Vxk7LAPFQTls+vZph1hq//vWKRxJsZpTIuxp8YL516ALUU2hT9QToo+cjwVEN62eKLwuYvWMy
	DKEZQoGyEtHUEdmX1uuO6qoksRqLhXGcbl0HB9VcmRak6kK24qbFk9U97AR9ZR5UYcj5vry0i6SBK
	T5Udo4/LQXNQVX1vGluwckBHlvF6JyhiA2Bb7S+XnYSeM1S9RWSn/GDM9CXtDkS1VI3Bq/GX6J1Xe
	Y+XJXjDD7HtakAuUTyFDQSvtuIUWA9k00ZHGMUeGb4RicJb+dtWaGZf+aDDx9EbjM2kE1ibUEs8XF
	thMLw2RA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVWX3-004FfX-JX; Sun, 11 Apr 2021 09:37:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVWWr-004Fax-Ce; Sun, 11 Apr 2021 09:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Pak9IJTRQAdgPait5VeBfLlRg8Lc0GrfTA9KduSFqZM=; b=gcT+JtRtwN6QHLxl/pFT3IsiJF
 FPUew8tJHsl5LT8XoRFSrA1qmL/EuxgpLq9EH12c2tux9i7IljB5EOfaa8T2QjxBNTAswGJtojn/Y
 TfbNhOEdygK3IDhza03/W8eHHyu0EXunIqGtIwOmCiG6Er7ZaSB1ThpRoQ2j1HID7F9y/DkFXjUkY
 AXuUyGLV/dBf66DLeMH0a7+C1fygLdx2zoopG597e3tuQlkvx9i/aH3QUi07g91eisKGrwSNcDpV8
 Ut3A01lRhMq8+FW9NbQkIshmssIOFKmyCMWZgBqETJOt0k7ea9ecG1TPu/FDRMvMs7ZeE5SPKsjSF
 WpbY1ZKw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVWWo-005RDZ-Sc; Sun, 11 Apr 2021 09:37:16 +0000
X-UUID: 2191910ba88447f7a847fde8f5fc7c1c-20210411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Pak9IJTRQAdgPait5VeBfLlRg8Lc0GrfTA9KduSFqZM=; 
 b=OLX9zfy+nhaAhv/cGBZogB8h/XPNoxDvttxArAmwQsBG8+vI70Vu7Tq7JBvyQAIPOfln3BSKGLRxhMJBHkA5JWEJ1k/0Xh0vQ4sGRvvMDwYGPKgnvO+aepH3v57vxbvU68qb3Yqd8Cf3xqA63hUrz6E7RXJj3a/DD/REdRQStUI=;
X-UUID: 2191910ba88447f7a847fde8f5fc7c1c-20210411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 835343153; Sun, 11 Apr 2021 02:37:12 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 02:27:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 17:27:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 11 Apr 2021 17:27:00 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <erin.lo@mediatek.com>, <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <sj.huang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v3 0/5] Mediatek pinctrl patch on mt8195 
Date: Sun, 11 Apr 2021 17:26:54 +0800
Message-ID: <20210411092659.22838-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8763930F8ABD6FD9D5F4CE88446A048F7706056405D0011918180CF2D4816D8D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_023714_951188_49B0B19B 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series includes 5 patches:
1.add pinctrl file and inding document on mt8195.
2.add pinctrl device node on mt8195.
3.add pinctrl driver on MT8195.
4.add pinctrl drive for I2C related pins on MT8195.
5.add pinctrl rsel setting on MT8195.

Changes in patch v3:
1)change '^pins' to '-pins$'.
2)change 'state_0_node_a' to 'gpio_pin' which is defined in dts.
3)change 'state_0_node_b' to 'i2c0_pin' which is defined in dts.
4)reorder this series patches. change pinctrl file and binding document
together in one patch.

There are no changes in v1 & v2.

Zhiyong Tao (5):
  dt-bindings: pinctrl: mt8195: add pinctrl file and binding document
  arm64: dts: mt8195: add pinctrl device node
  pinctrl: add pinctrl driver on mt8195
  pinctrl: add drive for I2C related pins on MT8195
  pinctrl: add rsel setting on MT8195

 .../bindings/pinctrl/pinctrl-mt8195.yaml      |  152 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   21 +
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  872 +++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   28 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   15 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h | 1669 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |   16 +
 include/dt-bindings/pinctrl/mt8195-pinfunc.h  |  962 ++++++++++
 10 files changed, 3742 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8195.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h
 create mode 100644 include/dt-bindings/pinctrl/mt8195-pinfunc.h

--
2.18.0 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
