Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9FAC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 02:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1iyRbI9cDNFQuWWPUWMFSz1W2azM7Rn34BeH08ii1no=; b=TSXnm4IT4djyfseUBNDE8LCnLQ
	rYaqUOkmcf2g5qM9jjaRRhqVSUwHsUCy3fkCFExAVw8zqhu4WLAcTeMVk0UEZIr7bkAePlXzaPx0F
	xfdkt3jKKXQFTsYJNv/8QKvw7c+7Bkm02O5UqdVSjLLeorZshz8NWcYj10Yywwe8UHDIOFCT8aPdi
	pCb6LItL6iPYS+7w1gPluBormkp3Jv6i5ryTV7t6N31NjNe8HUA336ccKb5UH8xZshOoUSe9atYmN
	msdDfEhSXTCU2wCgsGkXif7TLumSCS9jw2MA5lIOFe6C/3Q/71W19ZuOZeLU9HfA5btAmVaUHp+AJ
	vWMoZ2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqmkG-002FoO-Vz; Fri, 04 Nov 2022 02:47:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqmkE-002Fnz-DL; Fri, 04 Nov 2022 02:47:48 +0000
X-UUID: 5e58b78b03c0434f85548dc961ce7882-20221103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1iyRbI9cDNFQuWWPUWMFSz1W2azM7Rn34BeH08ii1no=;
	b=SPw4/Z4GnU5Ni6BX0xZ+2jEnFTH7CbZndPwvyfL+Uzl+UQzeiIPj/pph7RB1z7FiXkBWrdv99TRgM2UXUhCkaUJf+O9LtPiXrI0IAXnMksmy9RRUNj/BDyklGSPQe3Vp85clb3MaYraLLrsojgIDOinwBuI2jsrPWYRRIEMIc3o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:f5a40550-c4b2-4332-b74e-8928dfc20b9e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-55
X-CID-META: VersionHash:62cd327,CLOUDID:8c5e64eb-84ac-4628-a416-bc50d5503da6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5e58b78b03c0434f85548dc961ce7882-20221103
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1897723680; Thu, 03 Nov 2022 19:47:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 4 Nov 2022 10:07:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 4 Nov 2022 10:07:02 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: <nfraprado@collabora.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH v4 0/7] MediaTek watchdog: Convert mtk-wdt.txt to dt-schema
Date: Fri, 4 Nov 2022 10:06:54 +0800
Message-ID: <20221104020701.24134-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_194746_480458_53B2F87C 
X-CRM114-Status: GOOD (  11.54  )
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

Based on git/groeck/linux-staging.git, watchdog-next. 
We use [1] and [2] as references to send a new series.

This series converts mtk-wdt.txt to dt-schema and contains
- Fix watchdog compatibles for MT7986, MT8186, MT8188 and MT8195,
- Fix the watchdog name of mt8516
- Add mt6795 and MT8173 watchdog compatible

Changes since v3:
 - Drop label for watchdog example in yaml

Changes since v2:
 - Drop merged patch from series
 - Rebase to watchdog-next (for mt8188)

Changes since v1:
 - Drop "items" for a single enum·

Changes since [1]:
  - Update the commit message with some details
 - Drop "timeout-sec: true" and use unevaluatedProperties
[1] https://lore.kernel.org/all/20221005113517.70628-1-angelogioacchino.delregno@collabora.com/
[2] https://lore.kernel.org/all/20220422121017.23920-3-allen-kh.cheng@mediatek.com/

Allen-KH Cheng (3):
  arm64: dts: mediatek: mt7986: Fix watchdog compatible
  arm64: dts: mediatek: mt8516: Fix the watchdog node name
  dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT8173

AngeloGioacchino Del Regno (4):
  arm64: dts: mediatek: mt8186: Fix watchdog compatible
  arm64: dts: mediatek: mt8195: Fix watchdog compatible
  dt-bindings: watchdog: mediatek: Convert mtk-wdt to json-schema
  dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6795

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 80 +++++++++++++++++++
 .../devicetree/bindings/watchdog/mtk-wdt.txt  | 43 ----------
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  3 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  3 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  3 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  2 +-
 6 files changed, 84 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt

-- 
2.18.0


