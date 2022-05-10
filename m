Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB2FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 13:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADHvKeYNv7SNLbuGc9wlV/r8JaLKraFRDwKxmfP3ocY=; b=o3TW+qBKZqgkl/
	6VKJemAU4G/CBR2d7jlly5RDmo6ecZxi30x0sWUx536+Pc0COBN7YpzJd5bJjkdSpTNmTP50/peVc
	acUTDdd2IbtENCm/XwWPaBQHVDG5R08VH307jITl+kl3J1vK9b/6ase1EAmLHmbnuEbWLWUeubMWf
	/EbH180rmB8Jhj0xkoIlym/0yHKHqy/XyTdcP7N43ZXuD1A64zcg131va3E5OzemTfaRgiNcnxWTN
	lXh0MuBUQ1EZyP3crKjKtetAo/0gz7tiLrDq7CfS/Xs/yKVzgfUG67Gb3DGrtPP3kbXbxFCjtdA3F
	YQgObbKL6Im2I0/XKIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noPxw-002Frt-Ki; Tue, 10 May 2022 13:31:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noPxJ-002FTQ-3L; Tue, 10 May 2022 13:31:14 +0000
X-UUID: 6f5e58adc83c43c3947dd251558b5bd7-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b788b525-0050-40a2-9ee5-d3728051bffc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:e22a4ab3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6f5e58adc83c43c3947dd251558b5bd7-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 66117584; Tue, 10 May 2022 06:31:04 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 06:26:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 21:26:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 10 May 2022 21:26:41 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: Lala Lin <lala.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH v4 3/3] arm64: dts: mediatek: update efuse compatible fallbacks
Date: Tue, 10 May 2022 21:26:37 +0800
Message-ID: <20220510132637.5864-4-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220510132637.5864-1-allen-kh.cheng@mediatek.com>
References: <20220510132637.5864-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_063113_161595_BA53502F 
X-CRM114-Status: GOOD (  10.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

dtschema expects mediatek,efuse to be a generic fallback. We add
mediatek,efuse fallback for mt8173 and mt8192 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 3 ++-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 40d7b47fc52e..a62fb810d2a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -594,7 +594,8 @@
 		};
 
 		efuse: efuse@10206000 {
-			compatible = "mediatek,mt8173-efuse";
+			compatible = "mediatek,mt8173-efuse",
+				     "mediatek,efuse";
 			reg = <0 0x10206000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 26dbe9ecc528..4a5af1ed3abf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -911,7 +911,8 @@
 		};
 
 		efuse: efuse@11c10000 {
-			compatible = "mediatek,efuse";
+			compatible = "mediatek,mt8192-efuse",
+				     "mediatek,efuse";
 			reg = <0 0x11c10000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
