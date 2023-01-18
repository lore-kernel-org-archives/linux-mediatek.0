Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD4AC00A5A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 03:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifg38jsHZ5BkXiCbGKdBNAbLJn5lRjxgR90wcI2X0zY=; b=z2RX2e4AIvBuz0jOFgfFuubNXk
	agAVhszvW+JcuNfTIMsevT6p1dRiwzFhDjknVJmGmVJ+xIa+9Qd/yyKMuJPq6+6NrLu+jmqJe2rrE
	VNyeCOOJR1WIXOSuA6fwjSLgHnE9hngYHyW5s/ITe3yYUSBiV8Z0T/SB9bdh7p0ifsQ5bJ1Zs0q70
	HjySQzE754G5iQkehHzo4RuCEFq97Wvh+F1v3p1AcQPFNTstwWhFy3qV4rJZxfcEy95fEgh8xw0jf
	iP36BdNiDvDXrfbjeO+nlALh9TdodloHQGK6VNXUDQ3EcZPBzE5xtajTwOQzjuMd7iiVmJeBkLQSM
	4kQQiFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHz5M-00Gjrl-HT; Wed, 18 Jan 2023 03:26:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHz5K-00GjqX-Nh; Wed, 18 Jan 2023 03:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ifg38jsHZ5BkXiCbGKdBNAbLJn5lRjxgR90wcI2X0zY=; b=DAepuYN/mL1yER8qlnywonPw3E
	Qw8p0KunnFgu2qtmNeCjOZHQXIb9bOn+OMePtYo6x0EXkMn+8y+5rPJ6e35LYMG2EhDRkxFGjEm3r
	By8tQXtvjVa8h8RZK6QNXx5QBftCNbX4ODcRVmmYr92N/FFGNEYS1wCj2/hYyO1kSy/cfuW8ziXvC
	e9oqB3JEpUkPNvwWxqiy20nXkAokLvFqEA1mytJZF+RJhCjcslkEDdRQZK4v+Mcw6LDj0iwS4S2Bp
	6HkwvozzgwwnPDLNiH3T8q7g8aZ4wYhim+ZefUKStOGQK02h+wyttuORpMhpyJd93xtkqCNxgvlqX
	y/DyW7Aw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHz53-0068lM-3C;
	Wed, 18 Jan 2023 03:25:45 +0000
X-UUID: cb6918a296df11eda08d4d6090ec5a5c-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ifg38jsHZ5BkXiCbGKdBNAbLJn5lRjxgR90wcI2X0zY=;
	b=gVyKJzQ6yZaNhrDszApX3UEKyk5IEBgOxgqzqgDHA4D7VcyoCQymngO8iKQH141yeSLlyrv64PwY5Sl2QScFGxbP2GyCKDL0okHFHv8Uv3MB7gjnTuB+6IyDSbDI/OlJcH68KJdd7DRhjFpZf9O/y0cbNhG7/vGDyE/6Vkf/tns=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:b219d1b2-8d9f-46ec-ad26-1cff975ea650,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:104b20f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: cb6918a296df11eda08d4d6090ec5a5c-20230117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 9245187; Tue, 17 Jan 2023 20:25:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 11:15:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 11:15:10 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v6 2/4] dt-bindings: arm: mediatek: mmsys: Add support for MT8195 VPPSYS
Date: Wed, 18 Jan 2023 11:15:07 +0800
Message-ID: <20230118031509.29834-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118031509.29834-1-moudy.ho@mediatek.com>
References: <20230118031509.29834-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_032542_500555_2E7A8CB3 
X-CRM114-Status: GOOD (  11.71  )
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
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 84de12709323..b08ae7405b1a 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -33,6 +33,8 @@ properties:
               - mediatek,mt8186-mmsys
               - mediatek,mt8188-vdosys0
               - mediatek,mt8192-mmsys
+              - mediatek,mt8195-vppsys0
+              - mediatek,mt8195-vppsys1
               - mediatek,mt8365-mmsys
           - const: syscon
 
-- 
2.18.0


