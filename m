Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEADC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EeyaOo54fPxOcIoJe9lpW4nrY7cxutzPE4CIQFSAjFc=; b=CNoZQTY8RPrpo3f2w84aQ8PITu
	mP971uJ+z2x1vm2bgk4RqmCTuioJCBAyHRdg2ZyzqVKMhI0wnJ49oMEg4BghFljOvE3893cexwcRg
	mPiOcUN/FNwLLfV8NRuYvNTJBiZOTa36kdMyHSIGrN0Qp8sfGz2vHPGiMlo1BePJbvgouUimtUnOI
	R1iPmh7VlvskTkt5vMdex7gC8ubU+9tC7Avj4O9iQXUdgnKyBHHDFJRyhdEwUSsXdsRIq260VINqR
	JIH0EtzQer0Ymk3fKD1A6vfnxNCnrecEBfRihnzrxH2G2lLjy3iKTOhCrzPwNRQYl3McIfXuyCrB5
	JjbFnS/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9K7-005fPZ-3G; Wed, 20 Jul 2022 13:01:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9K4-005fNR-6s; Wed, 20 Jul 2022 13:01:05 +0000
X-UUID: 3d3a0011ea49472c8499a02594b6c57e-20220720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:8bd1f4e0-09a3-40ae-8f42-8fa24d73ffc1,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:8f7400d8-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3d3a0011ea49472c8499a02594b6c57e-20220720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 533341916; Wed, 20 Jul 2022 06:00:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 20 Jul 2022 20:50:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Jul 2022 20:50:16 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<nfraprado@collabora.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 0/4] mediatek: watchdog: Fix compatible fallbacks
Date: Wed, 20 Jul 2022 20:50:11 +0800
Message-ID: <20220720125015.13797-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_060104_417526_1C85D9CC 
X-CRM114-Status: UNSURE (   9.29  )
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

Based on tag: next-20220719, linux-next/master

Beacase there are some PATCHs of mediatek wdt waiting to merge,
I remove "Convert binding to YAML" PATCH to not cause dtbs errors.

We will resend "watchdog: Convert binding to YAML" PATCH in the future.

changes since v2:
 - remove "Convert binding to YAML" PATCH from series
 - fix example
 - change cover letter title

changes since v1:
 - fix dtbs_check warnings in dts
 - use enum instead of multiple const values
 - remove timeout-sec
 - rewrite examples
 - rename schema to mediatek,wdt.yaml

Allen-KH Cheng (4):
  dt-binding: mediatek: watchdog: Fix compatible fallbacks and examples
  arm64: dts: mediatek: Remove mt6589 wdt fallback string from mt7986
  arm64: dts: mediatek: Remove mt6589 wdt fallback string from mt8195
  arm64: dts: mediatek: Fix the watchdog node name

 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 9 ++++-----
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi              | 3 +--
 arch/arm64/boot/dts/mediatek/mt8195.dtsi               | 3 +--
 arch/arm64/boot/dts/mediatek/mt8516.dtsi               | 2 +-
 4 files changed, 7 insertions(+), 10 deletions(-)

-- 
2.18.0


