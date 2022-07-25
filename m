Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C022C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mlf9EhHZTQ/FtMgVi3agYyshvZ5HElxir68bzNQOyhI=; b=Km+6tN1XBk5D9xirQ9qe43R3EE
	/343DeGmBkVl8mt6v2sNojefoGjgSJCb+VzqQ5h2dozSH3BsnNItWHYg1lnXzO7BFHbC4+u0a3PV0
	v/I/fjxst7GPnyKveU3KpCL/WzZO5PxXJZpdNOiEmNGYgJQgzIvESSQdWoljouYWAGybRu8OpBRl6
	pvKOHv8SWBvEy9yNYhJ9ovLC2KeGhpb4/vcpztV6qB4USkWe577Sd3eE+lMRHq84qd3H6CwhO9rw5
	zRHUeqU9PV73HIGwBoQ33sugwxqHcoyFhR9hH4QXiJTdCSTUPe97TeUX5xR22p7TKcbFsquZkgYAC
	2kGdREQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvYz-008OMp-4e; Mon, 25 Jul 2022 10:43:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvYw-008OIB-6K; Mon, 25 Jul 2022 10:43:47 +0000
X-UUID: b5688110e44a41d2b1051334301a92d7-20220725
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:4f097210-4fb1-4819-8aa0-67f98d62ea44,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:6bbac229-fd69-41f1-91fc-8b8a329d3a88,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b5688110e44a41d2b1051334301a92d7-20220725
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 775712362; Mon, 25 Jul 2022 03:43:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 25 Jul 2022 18:03:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 25 Jul 2022 18:03:02 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Chen-Yu Tsai" <wenst@chromium.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/2] MT8186 pinctrl properties adjustments
Date: Mon, 25 Jul 2022 18:02:51 +0800
Message-ID: <20220725100253.10687-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_034346_256447_2BDA45FA 
X-CRM114-Status: UNSURE (   7.12  )
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

Based on tag: next-20220720, linux-next/master.

In commit e5fabbe43f3f ("pinctrl: mediatek: paris: Support generic
PIN_CONFIG_DRIVE_STRENGTH_UA"), added support for using
drive-strength-microamp instead of mediatek,drive-strength-adv.

We replace the custom mediatek,drive-strength-adv property with
'drive-strength-microamp' in the mt8186 pinctrl dt-binding which
have a clearer meaning and is more standardized, also add
gpio-line-names property used in devicetrees to describe pin names.

Allen-KH Cheng (2):
  dt-bindings: pinctrl: mt8186: Add gpio-line-names property
  dt-bindings: pinctrl: mt8186: Add and use drive-strength-microamp

 .../bindings/pinctrl/pinctrl-mt8186.yaml      | 31 +++----------------
 1 file changed, 5 insertions(+), 26 deletions(-)

-- 
2.18.0


