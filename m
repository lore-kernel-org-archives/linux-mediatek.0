Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264A0CF3189
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 02:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBo18OY7jIH06kEmNWA17AbP34Khga3KC/4P2QqJSMk=; b=vEoRzaUGtC083r6PqDyl3jhE48
	jkxTA3gKXEEK+6i+RhT8VY0cWopi1VE2hI2FH2LAelk/EkqYhZMPUG2iGsBL7Uuao6c5QCaPt2ccU
	ZiSpMxzk+RKKvP8L+FK3qkoIh5IVVLvM3mnXNb90aHnSAjkPGxtncnFhtnjdh4SfMTfdPwQeGPF92
	Zb5KP0VxDfkB1T8vtiQzQ6VpqKUGI9TeUMYCXZDCM4R8jfABU/2QnvCAie/eEuBn+9KgburrhVAwa
	A2TldNGhRuLTgFm2bFR5l7g25VStBR/e30K7Muk9+TLewI15fhAYDjiL2eAWozS7ZfqLpR5TQ/Okz
	ViAZIryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svp3d-00000004cYc-0iOi;
	Wed, 02 Oct 2024 02:25:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svp0A-00000004bzW-1DEY;
	Wed, 02 Oct 2024 02:22:07 +0000
X-UUID: 1bbd7364806511efba0aef63c0775dbf-20241001
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xBo18OY7jIH06kEmNWA17AbP34Khga3KC/4P2QqJSMk=;
	b=CT0twVsaQ8/v6JM2OXYjamGF3rqM5LyLFeM/fAxfca0dHT7RSYmpnTgrRrFDw9f5Zfh7QmWtRku0fCWNvoiyuVR1tQxv75KuAA1bOwi8nM2PjavvQHvwAeRjHHI+67ikBH0Xztu/3/G9kqSxfVkjbTFygEKmJ2HDbIUEqMyc2hU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:4898ada8-9866-4457-a18f-fad6dfdeabd0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:12009018-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1bbd7364806511efba0aef63c0775dbf-20241001
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1469749374; Tue, 01 Oct 2024 19:22:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Oct 2024 10:21:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Oct 2024 10:21:58 +0800
From: Pablo Sun <pablo.sun@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH v3 4/6] arm64: dts: mediatek: mt8188: Add efuse for GPU speed binning
Date: Wed, 2 Oct 2024 10:21:36 +0800
Message-ID: <20241002022138.29241-5-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241002022138.29241-1-pablo.sun@mediatek.com>
References: <20241002022138.29241-1-pablo.sun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.854000-8.000000
X-TMASE-MatchedRID: 6mUaupESUidDEf2XTEVmBuEbUg4xvs+wuLwbhNl9B5Xjud2x7TPVt24m
	YyZykPQLUmRjgBcG9aHVL7DIQyVd77BAQLqGlKivDB+ErBr0bAO/zKpacmFSwWtMM0lBc7ENo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqtvYleIqFvs8A2phfZsYdfLs+HApG3JERBShvfteGq5ePyVC
	DhCBZnzg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.854000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 40DEB7F6E06D7E7ECE8520CEA621040041A387B66122C541676612DCC12965B12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_192206_366809_75B0A354 
X-CRM114-Status: GOOD (  12.45  )
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

The OPP table of mt8188 GPU contains duplicated frequencies
for different speed bins.

In order to support OPP table, we need to provide the speed bin info
in the efuse data so the GPU driver could properly set the
supported hardware speed bin.

Same as mt8186, the efuse data for mt8188's GPU speed binning
requires post-process to convert the bit field format expected
by the OPP table.

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 02a5bb4dbd1f..2d9378c16e42 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1744,7 +1744,7 @@ imp_iic_wrap_en: clock-controller@11ec2000 {
 		};
 
 		efuse: efuse@11f20000 {
-			compatible = "mediatek,mt8188-efuse", "mediatek,efuse";
+			compatible = "mediatek,mt8188-efuse", "mediatek,mt8186-efuse";
 			reg = <0 0x11f20000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1752,6 +1752,11 @@ efuse: efuse@11f20000 {
 			lvts_efuse_data1: lvts1-calib@1ac {
 				reg = <0x1ac 0x40>;
 			};
+
+			gpu_speedbin: gpu-speedbin@580 {
+				reg = <0x581 0x1>;
+				bits = <0 3>;
+			};
 		};
 
 		gpu: gpu@13000000 {
@@ -1763,6 +1768,8 @@ gpu: gpu@13000000 {
 				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
 				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "job", "mmu", "gpu";
+			nvmem-cells = <&gpu_speedbin>;
+			nvmem-cell-names = "speed-bin";
 			operating-points-v2 = <&gpu_opp_table>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
 					<&spm MT8188_POWER_DOMAIN_MFG3>,
-- 
2.45.2


