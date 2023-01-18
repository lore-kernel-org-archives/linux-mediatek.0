Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5BAC32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWKe6zW3OozMra5zW8Umlb+TgA2g/HpZDzkEf1yramo=; b=eB/WEL0tHPS6f2rNb98917IMeP
	gavHfhNFf0Nx57XBI7+a6K9dsPqP1akVaWLIoYlSlHqXGVnm42RWK0u9FhWvYlOz9U2dulp6Gnfyz
	5/MJoFFfKlHgpPU1kYftFJbrsQ7G5vB8+qM5ls8TaRuNiG5b98gogEzZ6wJDwUSNDZBcreOaa9lHS
	FXmrMgP6AmmJK3D7TiMLjmCHsz7gWejp9JPFX6ilIU6/6ixvI5El1Hgj+f1QBvgiWpbJJzrp10lQ0
	DeypGT26iptRNd6sVQwpzZDNNIRTxn2U/IRw977MLCrveZbGqhGiGw3brxvtQaXrapg5WMjuIjPJe
	KiqfAEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4bY-0003Y4-OU; Wed, 18 Jan 2023 09:19:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4av-0003BS-Ds; Wed, 18 Jan 2023 09:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BWKe6zW3OozMra5zW8Umlb+TgA2g/HpZDzkEf1yramo=; b=e3xnud6VI6dFb3cRQAgGC74qTD
	bTN2WeqWw1bZlZUDFW8ZLidvEvggWSXMy2MaJlbu7PX3QauDZAfTdMIw1ssBEGLG0hp7UJy5PiO1Z
	TOuSDvFF2tkDCGP4E1Shdvvy+aZ2Qs9VsW8EWkuLTFr1vtnWh3iRUE4jyetKRUSZdqIAdup20rOGS
	9Jg9sb6tHKjMBHCvi/fSBUujPNaz+Jg3MBghNhwm168fnrtJxvQfmF+zk4jXATHJls9F3Rvns2spA
	eyDNJ4XICGQsbgDc2o/3ffypG5OmalLvvnPm7f/FUferrgx7a1Bh2C6285Vt7v5DNWL62OM4TRqN6
	1RJGIarQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pI4ag-006DVU-1F;
	Wed, 18 Jan 2023 09:18:46 +0000
X-UUID: 16adeac8971111edbbe3f76fe852e059-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BWKe6zW3OozMra5zW8Umlb+TgA2g/HpZDzkEf1yramo=;
	b=ZFHC1vtEZxsGQ7ILDuZx+KCKKGQ2wxcwiHBqh6LoynmKg1WrzRzRLettj1BOHr85KNyNZODxX2hgHsxNSX33TvNykl+cHYAtmja0qtB+KPqWHOdxkmPNj1sKEQxo97X/lpQe2UEO9/yYnSmZ2SKoaZF2f8S458VmsZJ50gBbSEY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:2861df09-8833-4152-a283-ab83359ab770,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.18,REQID:2861df09-8833-4152-a283-ab83359ab770,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:3ca2d6b,CLOUDID:bb379b8c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:230118171837FIG1B5RY,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 16adeac8971111edbbe3f76fe852e059-20230118
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1964429031; Wed, 18 Jan 2023 02:18:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 17:18:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 17:18:33 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 5/9] arm64: dts: mediatek: mt8186: Add ADSP node
Date: Wed, 18 Jan 2023 17:18:25 +0800
Message-ID: <20230118091829.755-6-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_091843_265856_65E9D8DF 
X-CRM114-Status: GOOD (  11.16  )
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

Add ADSP node for MT8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index a0b7dacc10cd..2700c830316f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -640,6 +640,26 @@
 			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		adsp: adsp@10680000 {
+			compatible = "mediatek,mt8186-dsp";
+			reg = <0 0x10680000 0 0x2000>,
+			      <0 0x10800000 0 0x100000>,
+			      <0 0x1068b000 0 0x100>,
+			      <0 0x1068f000 0 0x1000>;
+			reg-names = "cfg", "sram", "sec", "bus";
+			clocks = <&topckgen CLK_TOP_AUDIODSP>,
+				 <&topckgen CLK_TOP_ADSP_BUS>;
+			clock-names = "audiodsp",
+				      "adsp_bus";
+			assigned-clocks = <&topckgen CLK_TOP_AUDIODSP>,
+					  <&topckgen CLK_TOP_ADSP_BUS>;
+			assigned-clock-parents = <&clk26m>, <&topckgen CLK_TOP_MAINPLL_D2_D2>;
+			mbox-names = "rx", "tx";
+			mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_ADSP_TOP>;
+			status = "disabled";
+		};
+
 		adsp_mailbox0: mailbox@10686000 {
 			compatible = "mediatek,mt8186-adsp-mbox";
 			#mbox-cells = <0>;
-- 
2.18.0


