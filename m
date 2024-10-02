Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3AACF3189
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 02:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sx3Vdwociw+7bgWqHeh3LpMurxRj0XhtssaWVj1YGYE=; b=tOXTojc4Qc/6KtqgNxchQze6am
	foeuV5/M+VeNDkBrstPkzwvDdnYAhaW2KVZz+XulqR4/29pW9DTIweChbe2gEsEkcWXWPBHPTt3ro
	ypaN66R6qSgllli8qiSFpFw6PefZg7JDPt57UAD6er3FpRVHv1M5y2wgTdKYh+Th8t/jlslAU3Ijx
	MmKF/9o5BNqHSElJRbyzBVW7S53YeC5Scw/vSWBNUQh9SB7ygH/IixdtNosshedE+JC1FcWf5qCCV
	OFTea3FSWy4f0sjUV08HcpQOV0Abng0UDqQ5iEHoPyWONPEdyCvbx5Nzam2zejQAHyRm+qEiG6/Am
	CKZCxoDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svp1F-00000004cDu-2AnM;
	Wed, 02 Oct 2024 02:23:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svozz-00000004bw2-3ldX;
	Wed, 02 Oct 2024 02:21:57 +0000
X-UUID: 14f497d8806511efb3adad29d29602c1-20241001
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sx3Vdwociw+7bgWqHeh3LpMurxRj0XhtssaWVj1YGYE=;
	b=ICfCR4S1l6K7avnpTP+noOXhCmb42nmsI/n7oizxGtdB9t5sEGKZkyGWaDhrKiFhM6L7h2njhjKjERMjCb2sAU+0escZDPNfXmWqo3m+oq+rlBBqzOXyLsQlBwOvKt5l2YJdcJn5ZUu5PdH6IU1JS07179V7Ya6Uz79K1Hilbuc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:e67b6f84-43cb-4cc5-9604-00100b4572d2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:21bf2988-3a5d-4d9e-b012-e875acfb157d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 14f497d8806511efb3adad29d29602c1-20241001
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 912363097; Tue, 01 Oct 2024 19:21:50 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Oct 2024 10:21:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Oct 2024 10:21:46 +0800
From: Pablo Sun <pablo.sun@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH v3 1/6] arm64: dts: mediatek: mt8188: Fix wrong clock provider in MFG1 power domain
Date: Wed, 2 Oct 2024 10:21:33 +0800
Message-ID: <20241002022138.29241-2-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241002022138.29241-1-pablo.sun@mediatek.com>
References: <20241002022138.29241-1-pablo.sun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.548300-8.000000
X-TMASE-MatchedRID: PcZ0mOXO/jwPRVepDWIjx/fLKp/JCt7h6SXuwUgGH0iyrCkM9r1bWnTv
	v/bTZRlobaFo1bdWCGaQJkPYvdXnnwzyMxeMEX6wFEUknJ/kEl7dB/CxWTRRu+rAZ8KTspSzetP
	JfHqWaH9JLwBSa8cIhAW80jAWz86QWJqqfG38YMr34hqv8Qa5Lzd2iAQV2uozvjeXXjV9ouogrK
	mwTJoL/Ns19EgxHqqiF0aD5ljt43pMcHZD6gqu7wxMjfifIXfowkvVoA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.548300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2E5731F8DCEDE1326F76D329AE748F85559A3ABF2C5A0CA0200AF644AB264D732000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_192155_989038_DC0AE185 
X-CRM114-Status: GOOD (  11.42  )
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

The clock index "CLK_APMIXED_MFGPLL" belongs to the "apmixedsys" provider,
so fix the index.

In addition, add a "mfg1" label so following commits could set
domain-supply for MFG1 power domain.

Fixes: eaf73e4224a3 ("arm64: dts: mediatek: mt8188: Add support for SoC power domains")
Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index cd27966d2e3c..02a5bb4dbd1f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -956,9 +956,9 @@ mfg0: power-domain@MT8188_POWER_DOMAIN_MFG0 {
 					#size-cells = <0>;
 					#power-domain-cells = <1>;
 
-					power-domain@MT8188_POWER_DOMAIN_MFG1 {
+					mfg1: power-domain@MT8188_POWER_DOMAIN_MFG1 {
 						reg = <MT8188_POWER_DOMAIN_MFG1>;
-						clocks = <&topckgen CLK_APMIXED_MFGPLL>,
+						clocks = <&apmixedsys CLK_APMIXED_MFGPLL>,
 							 <&topckgen CLK_TOP_MFG_CORE_TMP>;
 						clock-names = "mfg", "alt";
 						mediatek,infracfg = <&infracfg_ao>;
-- 
2.45.2


