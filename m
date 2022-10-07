Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712BDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pYIbAyz6HbYQgtKtIhV20aPi9wJEofR31nByYyAEfSI=; b=tW7sfjueElXOjbgXheohxQfsN8
	Pu+5OL24rv/kpgPmU/M44dOw0mbqR42B0g97/AwToRMRZ8n6Jc+y5InxFPs8WNB+z3H28XAOrH6fV
	lw9Sc6D8GsbsWxJtVttPaS3DAeHuVkwGSBSOsE+oTbyE35apReHxwCbLKL7X19CXQGktOx6t/Ln4D
	CoLwKGY0OIlayWGmDzcDoW1U3n8nGQr8dRMVUlquLlBuaK4QDucDl5d4uSyfqEOk+ECq1dAI9cfRq
	FLcoOHtnzc8kdUpzG6KV9DdoZ2N1tdHYIYjbjBYExg0VOIVfApwXJCiiRiM+cUaKVVlD/trWoe86p
	FZOGxgYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogkhV-008XED-Tb; Fri, 07 Oct 2022 10:35:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogkhT-008XDo-Na; Fri, 07 Oct 2022 10:35:29 +0000
X-UUID: 4ae7f009a86f457092a072ad0ea59e8b-20221007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=pYIbAyz6HbYQgtKtIhV20aPi9wJEofR31nByYyAEfSI=;
	b=L65Ac25YLZnUTBcrXsTxj9yL/mhGMMogl7ETi79YynsxM+XvgY8aTTqd0K7k9pPDi27bswkkPSu1fpa6Ef+nX5mhI6FdDnGnXOUK/J9G2CrmWgEu/oc3t/jUCjjUeQQQ+40x8rYvsbCMWh0m6vNUvYiQKkqmOFi2lscFekXhqNA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:fc38a9ac-9f58-4f23-acce-9a1c4a6ec29b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:eb993be1-2948-402a-a6e4-b5d31fe11eb7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4ae7f009a86f457092a072ad0ea59e8b-20221007
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 205787811; Fri, 07 Oct 2022 03:35:13 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 7 Oct 2022 17:34:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 7 Oct 2022 17:34:39 +0800
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
Subject: [PATCH v2 0/8] MediaTek watchdog: Convert mtk-wdt.txt to dt-schema
Date: Fri, 7 Oct 2022 17:34:29 +0800
Message-ID: <20221007093437.12228-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_033527_797645_F06A6FBC 
X-CRM114-Status: GOOD (  10.65  )
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

Based on tag: next-20221007 linux-next/master, We use [1] and [2] as
references to send a new series.

This series converts mtk-wdt.txt to dt-schema and contains
 - Fix watchdog compatibles for MT8186, MT7986 and MT8195,
 - Fix the watchdog name of mt8516
 - Add mt6795 and MT8173 watchdog compatible
 - Add support for toprgu reset on the MediaTek Helio X10 MT6795 SoC.

Changes since v1:
 - Drop "items" for a single enum 

Changes since [1]:
 - Update the commit message with some details
 - Drop "timeout-sec: true" and use unevaluatedProperties
[1] https://lore.kernel.org/all/20221005113517.70628-1-angelogioacchino.delregno@collabora.com/
[2] https://lore.kernel.org/all/20220422121017.23920-3-allen-kh.cheng@mediatek.com/

Allen-KH Cheng (3):
  arm64: dts: mediatek: mt7986: Fix watchdog compatible
  arm64: dts: mediatek: mt8516: Fix the watchdog node name
  dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT8173

AngeloGioacchino Del Regno (5):
  arm64: dts: mediatek: mt8186: Fix watchdog compatible
  arm64: dts: mediatek: mt8195: Fix watchdog compatible
  dt-bindings: watchdog: mediatek: Convert mtk-wdt to json-schema
  dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6795
  watchdog: mtk_wdt: Add support for MT6795 Helio X10 watchdog and
    toprgu

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 79 +++++++++++++++++++
 .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ----------
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  3 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  3 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  3 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  2 +-
 drivers/watchdog/mtk_wdt.c                    |  6 ++
 7 files changed, 89 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt

-- 
2.18.0


