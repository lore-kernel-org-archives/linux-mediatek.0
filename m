Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DCFC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 07:50:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40BA7221E5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 07:50:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wKZN8bzM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OKQ95xJd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40BA7221E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kyZ5i9bepbcBZDaA4jCT555E5xWvAKtHaYpeQVjIE84=; b=wKZN8bzMB6MQtPQIAW3Z2Pjo8B
	azTODkx2GaFbsNjpTvqiH1eDNQyIbESSJ4INuyhNh6Stjne7ppDxH9qezNkPa5pKl/+TOYXpWTdwZ
	Q3snhPFG/47V5Jea29Lzjr99ftpPX8+U8U9uM/ohD3njBEfS4wHt9ETS4MoQHj8tFUhyAzGIZfaf/
	cRPm/h3X75+16Q2imxcl7chaBICsNmUDcj50rBXwQK8KJGt5YYBbxkz9FC8+hPIpJVVbXimpSsDrH
	CafI56vjavq3nKgf5CqyLcCzV5qfH9YoE4TetKGC7kO9KL6PKF2KGOPynM86oMgFWuaLYGYlOpaQV
	5f5lF/BQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3x8d-0000Yi-0w; Fri, 07 Aug 2020 07:50:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3x8b-0000XV-1F; Fri, 07 Aug 2020 07:50:02 +0000
X-UUID: ceea54363634474795e68270d1adfae9-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=yywh14HheHRN5nISdZsajtXKtu3fLmwV6Xvu2YjSk6E=; 
 b=OKQ95xJdohYz9ZaBvKU29/Va33HmHprd7NS0am77anLOgqMnsuV+/oBoeHFvH95B7V74d8QJuV+VsQBKzBTc7HDLkt6DxMU308qbgK0DvL4QP+5AS44ipM0dvFaH3JjejqY6UfyC2A33ytACTfghRPRkGakbTIJan/UotuQedYo=;
X-UUID: ceea54363634474795e68270d1adfae9-20200806
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 726595901; Thu, 06 Aug 2020 23:49:50 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Aug 2020 00:49:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Aug 2020 15:49:49 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 Aug 2020 15:49:48 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
Subject: [PATCH v3 0/3] Mediatek pinctrl patch on mt8192 
Date: Fri, 7 Aug 2020 15:49:02 +0800
Message-ID: <20200807074905.23468-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_035001_208350_A2DC1AD1 
X-CRM114-Status: GOOD (  10.67  )
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

 .../bindings/pinctrl/pinctrl-mt8192.yaml      |  195 ++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8192.c     | 1408 ++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8192.h | 2275 +++++++++++++++++
 include/dt-bindings/pinctrl/mt8192-pinfunc.h  | 1344 ++++++++++
 6 files changed, 5230 insertions(+)
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
