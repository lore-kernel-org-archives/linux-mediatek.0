Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3BBC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jun 2022 13:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q9zL8236gWO6o6ugEEN6cNjcsAeQKbWbLzxXXnjQ5l0=; b=FRAJJWac4a5ZCh
	V6mrTOFR/GkVa7P5g8GlqlNLRUQTtBZTz7yMOXHBwYvOcHdNby17e4bHrjtbOxtlB2yg9ZF+SK8Cn
	7jEGl2DSy83Hhotd8CYHi/jheys9qjvH5YGf8JukiesTVTL4H0mWgMN2yXkJe5OvEPou1aveBwPTk
	m97G2r1xtq2k9hwKgJ1+SmF2DtIkjcaVwUBFwsy6IZwzzVURvLuwBxcI+zdB391L6ZEm/k4xecyPI
	xMSo9HT4oJ6EHnEbWijmJuRmeI/6WodVqyx6hkrrSxTlR974l1ENM8Jr/b/UyiIcGJBQ7jeOFr/7S
	rCCW5b34ska3GQAdQy2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0O34-00Gh8T-O0; Sun, 12 Jun 2022 13:54:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0O2s-00Gh5q-Cu; Sun, 12 Jun 2022 13:54:27 +0000
X-UUID: e08fb336ed6947dd9a97cc1c471ff13a-20220612
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:7dca7833-7e4a-47e0-9f1e-28dfd6291712,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:cd8f96e7-1f03-4449-90ad-e6cb8f3d1399,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: e08fb336ed6947dd9a97cc1c471ff13a-20220612
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1541833043; Sun, 12 Jun 2022 06:54:19 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jun 2022 06:54:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sun, 12 Jun 2022 21:54:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Sun, 12 Jun 2022 21:54:16 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>
Subject: [RFC PATCH 0/2] Introduce MediaTek frequency hopping driver
Date: Sun, 12 Jun 2022 21:54:12 +0800
Message-ID: <20220612135414.3003-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_065426_480024_8C3B15EB 
X-CRM114-Status: GOOD (  10.07  )
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

This serie aims to add support for MediaTek frequency hopping and
spread spectrum clocking (SSC) control on MT8186 SoC.

Johnson Wang (2):
  dt-bindings: arm: mediatek: Add new bindings of MediaTek frequency
    hopping
  clk: mediatek: Add frequency hopping support

 .../bindings/arm/mediatek/mediatek,fhctl.yaml | 149 ++++++++
 drivers/clk/mediatek/Kconfig                  |   8 +
 drivers/clk/mediatek/Makefile                 |   2 +
 drivers/clk/mediatek/clk-fhctl-ap.c           | 347 ++++++++++++++++++
 drivers/clk/mediatek/clk-fhctl-pll.c          | 209 +++++++++++
 drivers/clk/mediatek/clk-fhctl-pll.h          |  74 ++++
 drivers/clk/mediatek/clk-fhctl-util.h         |  24 ++
 drivers/clk/mediatek/clk-fhctl.c              | 191 ++++++++++
 drivers/clk/mediatek/clk-fhctl.h              |  45 +++
 drivers/clk/mediatek/clk-pll.c                |   5 +-
 drivers/clk/mediatek/clk-pll.h                |   5 +
 11 files changed, 1058 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
 create mode 100644 drivers/clk/mediatek/clk-fhctl-ap.c
 create mode 100644 drivers/clk/mediatek/clk-fhctl-pll.c
 create mode 100644 drivers/clk/mediatek/clk-fhctl-pll.h
 create mode 100644 drivers/clk/mediatek/clk-fhctl-util.h
 create mode 100644 drivers/clk/mediatek/clk-fhctl.c
 create mode 100644 drivers/clk/mediatek/clk-fhctl.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
