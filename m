Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2090C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 02:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcgV1aFJZyuT4duG4UGVRTSzUC7rIMfUP49ozcB4b38=; b=wMo9xuWyVr0YZVVuzq5BtktHLL
	HBc8kMP5b0YIhEY+kgBFCGFHpifoIaVV2jOvhAby2yXvEx26w7twwR+JANItbrZwFlHwHM08Fs0jc
	Oeit0n1y9oeZ1sPyqHGtAn1omiP+nguLMpFXe6epry/M+eqvbmd7KB1/Q1n4aluX/TNczBe7hLO7E
	M+ja0NG5ZhT/MCfK7f7vhpr4ZEMdPxqc89hQ/+TC0Nt1BoPeuy4QIbxO46JVk33/0iV1iUIAa3Ndk
	hOqSwkcDwEEQ5B+tFmqHaQ5N0utNP2FmdvCmS5RSso/oybBfbTwEfN/oBM90/awlDS1BmSRUSrjQ7
	FLrLXOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWwX-003M1m-05;
	Fri, 24 Mar 2023 02:14:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWwS-003M0Z-0M;
	Fri, 24 Mar 2023 02:14:10 +0000
X-UUID: 68f2c1a4c9e911edb7d8d11f642b8e78-20230323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xcgV1aFJZyuT4duG4UGVRTSzUC7rIMfUP49ozcB4b38=;
	b=mTaDNjV7c3NTdok3f2G/Ma9hqRMUjDXu0d2Kce0GnNru3kqAFwxsqONdk4yklehMyPUqNN9Gv75hbZXVOGEAZFq3OMdJkxHCgM7hMiO819t+qTMO7h6tWMmUDxQ71uVc6vGQS2GF2dPSKXt1HV6TZrw2qYwzMoQ6ulOzwrMFyko=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:5931c4ea-62c1-423c-8ae2-cc3d7db4a292,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-35
X-CID-META: VersionHash:120426c,CLOUDID:0a455329-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 68f2c1a4c9e911edb7d8d11f642b8e78-20230323
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1366515622; Thu, 23 Mar 2023 19:13:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 24 Mar 2023 10:13:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 24 Mar 2023 10:13:01 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v5 4/6] arm64: dts: mediatek: mt8186: Add ADSP node
Date: Fri, 24 Mar 2023 10:12:56 +0800
Message-ID: <20230324021258.15863-5-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230324021258.15863-1-allen-kh.cheng@mediatek.com>
References: <20230324021258.15863-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_191408_159493_BD5A1F9E 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 0e42bdbd2cb6..337bcf3c1571 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -633,6 +633,22 @@
 			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		adsp: adsp@10680000 {
+			compatible = "mediatek,mt8186-dsp";
+			reg = <0 0x10680000 0 0x2000>, <0 0x10800000 0 0x100000>,
+			      <0 0x1068b000 0 0x100>, <0 0x1068f000 0 0x1000>;
+			reg-names = "cfg", "sram", "sec", "bus";
+			clocks = <&topckgen CLK_TOP_AUDIODSP>, <&topckgen CLK_TOP_ADSP_BUS>;
+			clock-names = "audiodsp", "adsp_bus";
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


