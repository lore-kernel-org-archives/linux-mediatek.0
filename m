Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55324C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wuqy1hMTeZu6Bp6O+Yhh2t/FfLhJ7df12NX9Rgk+tQ8=; b=G3iQr3TM/yFZAwtcLr7kRPf0vC
	7/uH+UmZUUW1p2fPKSXbJSv7M40oUf8rIgGOFO3Sisk4Vd4TTlLI7fGlcrw+z8DdDlJ1YvhfPV76I
	35y4ygRq3ifp1ZJ2ADRyHShEn/WpEyIkwoDhCDa4i1G6Dl8W03kx8/fEEyDFL//v0dczM5XyAWHQA
	X9yhLq66DRlmt4nEfAyTfZQgKQryxrjnRekYDHcm7FT59FypF5BjAZdyzCTsQjdfp0K93bpQFBB19
	8FO1JqczEYTgFdXYjdR1bUsLUuQQZGkJasHwPGMdVXy1ObtvZNrBuI9yZWMwkS1/u4mO2Yu0lE+k9
	S+nyhQvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE2hj-002Isp-1o;
	Fri, 15 Dec 2023 07:33:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE2hg-002Ire-26;
	Fri, 15 Dec 2023 07:33:50 +0000
X-UUID: 441c659c9b1c11ee958cff29c719f35b-20231215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wuqy1hMTeZu6Bp6O+Yhh2t/FfLhJ7df12NX9Rgk+tQ8=;
	b=t/PtFAc9i8U9RTUdwsU0natjryglq3g9UUtwekhx2DI/RSvWcI3jzbpac+M2pcBBo06U4kDOdiF2UzJBTgDS6YbAA+zQR7QASN8EkqGkdz3hk4w3RaTpba+fq/qKKAhAxNb2djS1Tj1rnJ1qoprPhoaCWqMXVQpryH/QOlx6+4E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:8470c393-d350-441d-a8a6-478bd7f41be2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:5efa35bd-2ac7-4da2-9f94-677a477649d9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 441c659c9b1c11ee958cff29c719f35b-20231215
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 80676395; Fri, 15 Dec 2023 00:33:39 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Dec 2023 15:33:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Dec 2023 15:33:05 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ben Lok <ben.lok@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: add interrupt-parent for mt6360
Date: Fri, 15 Dec 2023 15:32:52 +0800
Message-ID: <20231215073252.21586-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.356500-8.000000
X-TMASE-MatchedRID: 1uypKmLkdmc6xeGwKgJtJov2/i8VNqeOh+w9Wz/xXDqdwU/qXYxHvE/3
	ZkXeY1OAsdosXJJWMVzBxVNeNzsv2R9J5bZqJbIJhK8o4aoss8oj3JVwc0NTtub59Kr2OlMmo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqtEfvfpBK/uQoV1xzfrGKVLSvrrpz74+KsntWQqRKRLQ2l1b
	bYDEPZgxQSOnu3diL+lNiqWPzXo3LY9EVSutGyk/MY2/Am1+M74sOrsb4iT/K/bbEolHIgZUOc7
	GjOamnWv5a9cmIodEszD8HZ4XvJ2ZRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.356500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8D9319EFF555C22B70A702C8A5D19EAFDCBF723E3B96DD491DB3AED319B88BDB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_233348_701646_A93B9EA3 
X-CRM114-Status: UNSURE (   9.11  )
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

This patch fix the warning introduced by mt6360 node in
mt8395-genio-1200-evk.dts.

arch/arm64/boot/dts/mediatek/mt8195.dtsi:464.4-27: Warning (interrupts_property): /soc/i2c@11d01000/pmic@34:#interrupt-cells: size is (8), expected multiple of 16

Add a missing 'interrupt-parent' to fix this warning.

Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/linux-devicetree/20231212214737.230115-1-arnd@kernel.org/
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 70b465f7c6a7..00ac59a873e8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -238,6 +238,7 @@
 	mt6360: pmic@34 {
 		compatible = "mediatek,mt6360";
 		reg = <0x34>;
+		interrupt-parent = <&pio>;
 		interrupts = <128 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-names = "IRQB";
 		interrupt-controller;
-- 
2.18.0


