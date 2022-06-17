Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E8CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqSA+qlLVzxMJi7osQsOWwi7vD2OZz4on3w6mvoGHX0=; b=OC80fxHjV9W1sUo0sYaRHih/lD
	37F2o+62vgv1mWhbdm9niCY3/duWCzelgOPAhbv0EetmioQAytUbEqOxKCZZ71w6TAvMlboL2mAHT
	9hB+fVt6XC9qMRO/VXGHxf8u/gM52cmi2AnCkedNyH92ilRiKVo21fRUSorpa9ypVuobK9t9Lnwcv
	QfpUMoOlk8GB2Z5RoG2FOhfoRVVkoGwMvJ68/Setoqqc9mCxjKkmMfvRvuhfxaPwnOwlg/D0eDYPm
	L06d26cGI/hkhRjKhVaOFksYuM8ptF5A2QKaHMp8OP7MF55AAQDwmKl4xpeDth9FlwLSUmy00QGPK
	slzGjwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28US-006lT6-6E; Fri, 17 Jun 2022 09:42:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28U2-006lHo-57; Fri, 17 Jun 2022 09:41:43 +0000
X-UUID: 6e0ac29b333841eda6c4fcf3a7bfd8c1-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:6dffdb3a-a8da-459f-8c7d-d816534a0699,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:5115a3f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 6e0ac29b333841eda6c4fcf3a7bfd8c1-20220617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 750444973; Fri, 17 Jun 2022 02:41:35 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jun 2022 02:31:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 17:31:36 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 17:31:36 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, Chunfeng
 Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v6 3/4] arm64: dts: mediatek: mt8192: fix dtbs check warning of efuse
Date: Fri, 17 Jun 2022 17:31:31 +0800
Message-ID: <20220617093132.22578-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617093132.22578-1-chunfeng.yun@mediatek.com>
References: <20220617093132.22578-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_024142_277699_40B26D89 
X-CRM114-Status: GOOD (  11.48  )
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

Need also provide a specific compatible "mediatek,mt8192-efuse" at
the same time when use the generic compatible "mediatek,efuse".

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v6: no changes
v5: new patch, sync with the series:
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=640196
    porting from [v4,3/3], but abondon mt8173's change;
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 733aec2e7f77..8726b66e7fcb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -911,7 +911,7 @@
 		};
 
 		efuse: efuse@11c10000 {
-			compatible = "mediatek,efuse";
+			compatible = "mediatek,mt8192-efuse", "mediatek,efuse";
 			reg = <0 0x11c10000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.18.0


