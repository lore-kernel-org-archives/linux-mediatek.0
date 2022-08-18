Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8457DC00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 07:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vX2cKsWvqrnEhdZf9O25sP1+ldbSuDmn4Zp0hffNaYw=; b=rzFfTCb7E4biZq/HsvctAaC6CX
	5yyXVjbsb75BnwXKP6JdK4+YJG8vepCznGHp5psvC9Gbf9XfTKHlHNjIvFuJt1fgWUbggP7ibnxl5
	Zzr8tk69t26g8tNlkQK4lAI3rHVKpsgFjn0SyPpzSOOMbn/hyADEm9pXTYcS//9zcr1HbI9gT5wom
	1YdadV2fgzbKWSRoC0VVqS2VZnWjFe+HBSgCaBTGGiA5EG1vivYHCIBschf8bJTpcLMAR08xcKOtc
	RZNSkYR8Nr7Ec3oby+WV5IU8rOYuWokT0g+hr/DfDMfnhbv2t3sDs8yRyhXMfUE3d0ukx7X9c1QKp
	xtliNtkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaIw-000NMo-BU; Thu, 18 Aug 2022 07:51:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaIt-000NFG-71; Thu, 18 Aug 2022 07:51:00 +0000
X-UUID: 27bb68b1655c43fb802a46685a1a25f2-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vX2cKsWvqrnEhdZf9O25sP1+ldbSuDmn4Zp0hffNaYw=;
	b=QwwstUszz1fDHp5xQxEZkxNKfd3bC4i5HgLWyctQSYz+uG1kSuKWe+hmZ/pi/xfViyV8MS3/0WIQPRshaYhZhykc/J1Qqt52k1TwnNPZb5pBbZ/cmCmlguYZRsRP/xCuA8QdJkXh+a/A356G6UNuvwoX4HOkmpYQpRIIO0qwQEU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:5c589554-830e-4e2b-b36e-4eac003c9cac,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:83512daf-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 27bb68b1655c43fb802a46685a1a25f2-20220818
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <hui.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 256591066; Thu, 18 Aug 2022 00:50:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 18 Aug 2022 15:50:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 18 Aug 2022 15:50:14 +0800
From: Hui Liu <hui.liu@mediatek.com>
To: <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <wenst@google.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<hui.liu@mediatek.com>, <jianguo.zhang@mediatek.com>,
	<zhiyong.tao@mediatek.com>, <sean.wang@mediatek.com>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v6 0/2] MediaTek pinctrl patch on mt8188
Date: Thu, 18 Aug 2022 15:50:10 +0800
Message-ID: <20220818075012.20880-1-hui.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_005059_336115_0FBCA735 
X-CRM114-Status: UNSURE (   9.51  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series include 2 patches:
1.Add pinmux definition file and pinctrl binding document for mt8188.
2.Add pinctrl driver for mt8188.

Changes in patch v6:
1.Update driver file's coding style.

Changes in patch v5:
1.Move ref pincfg-node.yaml to the child '^pins' node in binding document.

Changes in patch v4:
1.Add gpio-line-names in binding document.
2.Fix typo in driver files.

Changes in patch v3:
1.Fix binding document dt_binding_check fail issue.

Changes in patch v2:
1.Change pinmux definition file name to mediatek,mt8188-pinfunc.h.
2.Change binding document name to mediatek,mt8188-pinctrl.yaml.
3.Update yaml description.

Changes in patch v1:
1.Add pinmux definition file.
2.Add binding document.
3.Add mt8188 pinctrl drivers.

*** BLURB HERE ***

Hui.Liu (2):
  dt-bindings: pinctrl: mediatek: add support for mt8188
  pinctrl: mediatek: add mt8188 driver

 .../pinctrl/mediatek,mt8188-pinctrl.yaml      |  226 ++
 drivers/pinctrl/mediatek/Kconfig              |   12 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8188.c     | 1673 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h | 2259 +++++++++++++++++
 .../pinctrl/mediatek,mt8188-pinfunc.h         | 1280 ++++++++++
 6 files changed, 5451 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8188.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h

--
2.18.0



