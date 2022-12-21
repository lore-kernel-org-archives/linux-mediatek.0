Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF987C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 03:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpKkQlPxOc+D9lcuAshw5hI22iECWZhtKc+FVAsWhts=; b=YprordoaxFTZgmFqQNUicXT29/
	xQHRArg1F1PQFfx50pzfstS7pLLR4QQ++4U5Md6tJWLp2MXXChAU+KxXOPi6BU4p0yOLyArLD4ik4
	NwTfkR9zFuiIxgCp5NbAv+oq5EfOS4J83eOf2weMOqUzAxbp1HC659Twu5Sx9p7tIf6YEWvsA2Cim
	0ksvDLL4T5byuShs9fCekW5kXxtZjvf26bDKT5+epP1rP/fBifgUCzy53OJpn/Mrpu8gUw9MaRlTO
	NxQ2VwrF+bn44j++I6dzes6gPF8Oqdvxo1AuarkUpOfNhUbkpAYOh9bmaNk3XFxgbF059iPhD0bCN
	22Ce+KDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7q2N-008vWb-DC; Wed, 21 Dec 2022 03:44:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7q2K-008vOa-7G; Wed, 21 Dec 2022 03:44:57 +0000
X-UUID: 3ac8d4377f464620a8e8af5ad4627bfd-20221220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vpKkQlPxOc+D9lcuAshw5hI22iECWZhtKc+FVAsWhts=;
	b=LP6sXgJnkSvwyguXIjlgbxcyM52n/T/zhfMlZ+lvodyPXsVGr0EGR/p5qFdb8upVDCCgsgblf79oToRKh12yyZwPKKNaloXfCGGC/7zoT/RellZSFPHM6vVYf84LR/Kooh0ss/u0Qxd35zUlJr3DZnxfsLK+5DGbyTEpekjYx9E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:b04e37b8-264e-47da-9a9e-c99242a5c771,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.14,REQID:b04e37b8-264e-47da-9a9e-c99242a5c771,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:dcaaed0,CLOUDID:7ca1f489-8530-4eff-9f77-222cf6e2895b,B
	ulkID:221221114438OZCJK6JO,BulkQuantity:2,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 3ac8d4377f464620a8e8af5ad4627bfd-20221220
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1399071790; Tue, 20 Dec 2022 20:44:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 21 Dec 2022 11:44:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 21 Dec 2022 11:44:14 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen
 Boyd <sboyd@kernel.org>, Ikjoon Jang <ikjn@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 6/6] arm64: dts: mediatek: Add the missing ADSP power domains controller for MT8192
Date: Wed, 21 Dec 2022 11:44:07 +0800
Message-ID: <20221221034407.19605-7-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_194456_313802_B2796842 
X-CRM114-Status: GOOD (  10.49  )
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

Add the missing ADSP power domains controller for mt8192-scp_adsp clock
controllers.

Fixes: 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192 clock controllers")
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 6b20376191a7..6ee60db3ac23 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -511,6 +511,14 @@
 						};
 					};
 				};
+
+				power-domain@MT8192_POWER_DOMAIN_ADSP {
+					reg = <MT8192_POWER_DOMAIN_ADSP>;
+					clocks = <&topckgen CLK_TOP_ADSP_SEL>;
+					clock-names = "adsp";
+					mediatek,infracfg = <&infracfg>;
+					#power-domain-cells = <0>;
+				};
 			};
 		};
 
@@ -574,6 +582,7 @@
 		scp_adsp: clock-controller@10720000 {
 			compatible = "mediatek,mt8192-scp_adsp";
 			reg = <0 0x10720000 0 0x1000>;
+			power-domains = <&spm MT8192_POWER_DOMAIN_ADSP>;
 			#clock-cells = <1>;
 		};
 
-- 
2.18.0


