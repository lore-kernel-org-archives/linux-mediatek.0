Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CDEC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 02:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crufHaBJqDwuFiPQOlCXJvq1DOxDaZbIVtDdwONvRV4=; b=U+BxJDEXBoVLf9k6RTfYFefGkK
	ZjwXZ3MTs191a5hi9tgd1yOeiYI846fxY8M1E+xIf4tazPoa6X4Abg86k1fTAu9c0gxr/KmBk5eiG
	h7tRsoWjn6jSsB3zzwYL9HiyHQrpThjv/mgXIgvFqPSPkSwty1qPaufHZ/ULxWtlbM9pG2VB3e78I
	DBUs/o9UueEHS64PfI5JFghBcxpFjRA+5+z4o1FTtGGTUKfDw1IAqXuvhD1KmR/wNVNJaDAxr4VE5
	1gCxifUvbdnnhOrA8A/Z6KAa77IadlyGASAwR+ZvJ7G/82uvxo4G9D3jLnxalz3lPr2k/6ZQee8iT
	rU8HF0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oing4-00AGJI-Dq; Thu, 13 Oct 2022 02:10:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oinfE-00AFtZ-1w; Thu, 13 Oct 2022 02:09:38 +0000
X-UUID: 83d99b2b731742acac2bd39e664b16e0-20221012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=crufHaBJqDwuFiPQOlCXJvq1DOxDaZbIVtDdwONvRV4=;
	b=CaW8kaqsrbvhtT73VzeJoynMmkuHZz0CGTS6A8NCAIsdPnDfMlni7GC81hn2NRMrU0R8Dm0XBfMCZw8NlRxBA08aXEfT3TsjqKAUAS4FnYYogKOYbVeIccY3mBY8zsiHnB/wogECEHml2d75MDLj831nRtLGe7NH2goTinOSIiY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:9b116df4-9e23-490d-82fb-40d94dad89f5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.11,REQID:9b116df4-9e23-490d-82fb-40d94dad89f5,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:39a5ff1,CLOUDID:d1985101-cdeb-479d-93af-53f947adce9d,B
	ulkID:221013100335DTOR77OQ,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 83d99b2b731742acac2bd39e664b16e0-20221012
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1032907772; Wed, 12 Oct 2022 19:03:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 13 Oct 2022 10:03:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 13 Oct 2022 10:03:30 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v3 1/8] dt-bindings: arm: mediatek: mmsys: Add support for MT8195 VPPSYS
Date: Thu, 13 Oct 2022 10:03:22 +0800
Message-ID: <20221013020329.8800-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221013020329.8800-1-moudy.ho@mediatek.com>
References: <20221013020329.8800-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_190936_179884_EDEFBF93 
X-CRM114-Status: GOOD (  10.62  )
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

For MT8195, VPPSYS0 and VPPSYS1 are 2 display pipes with
hardware differences in power domains, clocks and subsystem counts,
which should be determined by compatible names.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml     | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 0711f1834fbd..493aa9e8d484 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -48,7 +48,10 @@ properties:
           - const: syscon
 
       - items:
-          - const: mediatek,mt8195-vdosys0
+          - enum:
+              - mediatek,mt8195-vdosys0
+              - mediatek,mt8195-vppsys0
+              - mediatek,mt8195-vppsys1
           - const: mediatek,mt8195-mmsys
           - const: syscon
 
-- 
2.18.0


