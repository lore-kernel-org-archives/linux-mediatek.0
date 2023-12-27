Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C26C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 06:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qBKHfc8i14d6XJhRnuWE5dChDSzj6DCcNgKR3axeCs=; b=JHpz83rC3tS/n8/aV9R6MmfBFT
	XQNAVscYx8l5lWaEgQ0YSLJUfhqJq+40sJJ7Y3SKwTf0Y6R8/9OR/i5dEPSNiyJB2WDjawomAS9ls
	qrmIrpcZdDh5qNqiHUylDvfr2RWd5KRsRcgP4x+DhDVh36J5MOw/pEcsKNuFaqfqyTJpIAySnIvVQ
	ETZIdzRJ+DqVexuxB+o9lWc4V1yr878N8zAFeoW/dUkShJ5HU7/DT7DOPMDFnJX3TO6J/zxG3SnwC
	MP5//EQCLbmhXozwVIXeQQ2aHxAKeredTMvFzN1pwayKd8lwLl6uIUMCKHFx/ZQwVb6hkPuECcNW5
	OvxJr6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIN1O-00E1gI-1l;
	Wed, 27 Dec 2023 06:04:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIN1K-00E1dw-08;
	Wed, 27 Dec 2023 06:04:01 +0000
X-UUID: b41ff182a47d11eeafd70d0b34820190-20231226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5qBKHfc8i14d6XJhRnuWE5dChDSzj6DCcNgKR3axeCs=;
	b=LUHhn5xnyJcqn3ecl8vx/aLGhOo4silXeEevSTsZbkbzlQbNk/5i0W4Pmoge3AE1/U1MxSPzaGi4dyxjGnmMb7Lo4ZJVRySTFOiDFBGpqFFoD9d5d/DfqQHSl7u/bBqYXq/nNBcKypprfSjvIkBRXqHqGkWIwsoeG+4NRPcb65g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:656084d3-4d10-449b-94a7-d8b82a999f3d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:5d4a9d8d-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b41ff182a47d11eeafd70d0b34820190-20231226
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2058172778; Tue, 26 Dec 2023 23:03:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Dec 2023 14:03:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Dec 2023 14:03:18 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Mathias
 Nyman" <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH v4 3/3] arm64: dts: mediatek: mt8195: Add 'rx-fifo-depth' for cherry
Date: Wed, 27 Dec 2023 14:03:16 +0800
Message-ID: <20231227060316.8539-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231227060316.8539-1-chunfeng.yun@mediatek.com>
References: <20231227060316.8539-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-2.825800-8.000000
X-TMASE-MatchedRID: ZzsyKKMlPmWLwgJA7qJvFEf49ONH0RaSGSqdEmeD/nUQVRHC3B6FYFfe
	kLFvP8UVQt2470g7vecqScZQsLRFpNRvK63SVd6gQPrPw3WbUAtRnscLnNAC7BjQD3m2MCf73j3
	TOgY19l5UK0FnzcPd0uKOmN63egZIr78SC5iivxwURSScn+QSXt0H8LFZNFG7CKFCmhdu5cWMli
	PzJGLy1pXHFyiI0uGzANmR3/AtY5RjyzFNloJjQSJjvR2uj1AQfnRrx7yt7dn7QvrLnS2+q5yUI
	XNmAxUvnsnNd1zv3CVpp55fZDlsr34cY/B7JqXaYZ1R7NXn0MdBmmCXcKyFFPqy+VVvqH2X
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-2.825800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F39E914BBC51F28300BA942E2DD319AEC74CE0379EF1859D1C1E66BF5D291F672000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_220358_094888_39792779 
X-CRM114-Status: UNSURE (   9.83  )
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

Add the quirk property "rx-fifo-depth" to work around Gen1 isoc-in
transfer issue which send out unexpected ACK even after device
already finished the burst transfer with a short patcket, specially
for a 4K camera device.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4:
change property value, and put before supply
add reviewed-by Angelo
v3: change value according to binding
v2: use 'rx-fifo-depth' property
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index dd5b89b73190..00fcde60300e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1183,6 +1183,7 @@
 &xhci0 {
 	status = "okay";
 
+	rx-fifo-depth = <3072>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
 };
@@ -1190,6 +1191,7 @@
 &xhci1 {
 	status = "okay";
 
+	rx-fifo-depth = <3072>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
 };
-- 
2.18.0


