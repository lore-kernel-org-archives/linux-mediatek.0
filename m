Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BEDC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 00:28:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E96206F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 00:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dEK7vXLt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="td2cgV+p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E96206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hGsHY9SY3l7LHaLymhqaNmCnWZOZ3J06eJN4o4scusw=; b=dEK7vXLt7+ucrsWDY3kFSATffe
	xpVxHdsqE+Vwcp17OBuEmPBQJRk1gszAzsyFSrOAIRt9knvxCIkUj9r0pAcNVIoxL4kdilSh5J6D1
	yhV05mXD9lE/U5kfIthw9oobmt1ZHmy3dK+ZrwLcfJttKy2M5ZUb7zupLS52v9OVzcgCbd8b/i5ji
	y/+ItCN6MNo1GIf5vK0alrBN4NmAGV+xa3pABYgJ//3b46MP3EwtDD8KbbiuyoLvVaZOnl52fOaui
	Cm2hVdShUA20ZzsirCffkvhdjNDWusTG6HjPK30iJHfpBCfo91zXZFZihmaOWz2wIoiUTsW5UMLHN
	b2YQwkFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7T0e-0001bP-NG; Mon, 17 Aug 2020 00:28:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7T0c-0001ac-7B; Mon, 17 Aug 2020 00:28:19 +0000
X-UUID: 3e38b98ce0fb4460ae27751dc7a9ed87-20200816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1S+vYeTE7vu8toawaEc6xhSra2zzhzuKWQJjR/BQbsg=; 
 b=td2cgV+pOkmYb9/beDcFY+zTPmR7NsU/df4SnAUl6RmGZCP0fea54+vTeZvaZ5HXW6HtJQZlavbdPZLE245gqtQatSQL08M6X7qQivW1biboYakYg4QqYfGXW7Z17WxTJk0q0PsniQcpZSsp1iZf6eAYdgEMls9Mzpu+NUy3Jlo=;
X-UUID: 3e38b98ce0fb4460ae27751dc7a9ed87-20200816
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 166168583; Sun, 16 Aug 2020 16:28:14 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Aug 2020 17:18:18 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 08:18:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Aug 2020 08:18:06 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
Subject: [PATCH v4 0/3] Mediatek pinctrl patch on mt8192
Date: Mon, 17 Aug 2020 08:16:59 +0800
Message-ID: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200816_202818_882207_4EE1C036 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: devicetree@vger.kernel.org, sean.wang@mediatek.com,
 srv_heupstream@mediatek.com, chuanjia.liu@mediatek.com,
 biao.huang@mediatek.com, zhiyong.tao@mediatek.com, erin.lo@mediatek.com,
 hui.liu@mediatek.com, seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 sin_jieyang@mediatek.com, hongzhou.yang@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, eddie.huang@mediatek.com, jg_poxu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series includes 3 patches:
1.add pinctrl file on mt8192.
2.add pinctrl binding document on mt8192.
3.add pinctrl driver on MT8192.

Changes in patch v4:
1)remove execute permission of 'pinctrl-mt8192.yaml'.
2)change '$ref: "pinmux-node.yaml"' under '^pins'.
3)add a pin node sample in 'examples'.

Changes in patch v3:
1)fix running 'make dt_binding_check' errors.
2)change 'node' to 'pincontroller'.
3)add an actual example.
4)change ref as 'pinmux-node.yaml'.
5)remove 'GENERIC_PINCONFIG'.
6)add 'addtionalProperties: false'.

Changes in patch v2:
1)change maintainers name in pinctrl-mt8192.yaml.
2)remove unused description for "reg-names".
3)change 'subnode format:' which is not a child name to "^pins".
4)add ('|') after "description:".
5)remove "i2c0_pins_a: i2c0" and "i2c0_pins_a: i2c1".
6)add properties for pin configuration nodes.

Zhiyong Tao (3):
  dt-bindings: pinctrl: mt8192: add pinctrl file
  dt-bindings: pinctrl: mt8192: add binding document
  pinctrl: add pinctrl driver on mt8192

 .../bindings/pinctrl/pinctrl-mt8192.yaml      |  155 ++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8192.c     | 1409 ++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8192.h | 2275 +++++++++++++++++
 include/dt-bindings/pinctrl/mt8192-pinfunc.h  | 1344 ++++++++++
 6 files changed, 5191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8192.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8192.h
 create mode 100644 include/dt-bindings/pinctrl/mt8192-pinfunc.h

--
2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
