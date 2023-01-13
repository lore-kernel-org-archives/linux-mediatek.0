Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB30C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 06:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5rgmV5TKGoKI0b3P3GYs/Z2ViFG3wO+dthkB0GqVuw=; b=F8C0pzy0w3eX5i2sfDmYLjI8kM
	OdUbYZYFgOBO+9o6Juh7ZIwhxGsW6toK1El8xJxXVJkKcdvFYAmqqNZUAj40IgyckRjP7SLjPQOG4
	d5uVUdOgP7Pc6M3WrT3Uu8SBmpge6UWXQk7MponqhRyf62x1AIyyaLzkGZov9vtiusbvPDQHZyCO+
	S8mi148HZzkDZYsnVGEdzYJgUPXzKdRNrmRCltyqkYsdhCr+HJ/NO3AdL35GDA8ikCWa+eWeT9a/W
	7S4gNF1beogmhy61VvfwG5bphREwNcDnPh7VTtHio6xcos3B+kXaEnZ2rOYvG9/wfLs8pu+JoZZGF
	o4AMjyXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDDZ-000gc2-93; Fri, 13 Jan 2023 06:07:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDAP-000etQ-73; Fri, 13 Jan 2023 06:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g5rgmV5TKGoKI0b3P3GYs/Z2ViFG3wO+dthkB0GqVuw=; b=HX/daAzv4aPnJ0VLfNIlL6uCNC
	pRwm/JUC15Y1dsmGcRuZUQZv3E5vbDioxU/5Yf85S+lravwh1C8mgLZJUbEHmZEgLH69zPUhlXx+q
	4w9lx7Ko/hy+oumK7VUV9mVqN5T6OQbmiNvwdZlPPR5f79QnAeWfCwtVAjE2Ogfjko7oNu31J/UWI
	6XagFR5q4QFKthlDerFst0uL1LNx3yB4M+Dt8ZnHS0MMs+evtePDh3njWg2TXRIzzVsA3rjcMT9ms
	9H7X1qoiBj7PnZYMv9ST3JKFF6Mopxdf6uCBRlWe4E/8zD44bSgPZ9VpvylM9cyxe3dZEzPLr8t3n
	wdEAx4iA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGDAC-004FPW-2i;
	Fri, 13 Jan 2023 06:03:43 +0000
X-UUID: 09e07430930811eda08d4d6090ec5a5c-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=g5rgmV5TKGoKI0b3P3GYs/Z2ViFG3wO+dthkB0GqVuw=;
	b=NXIimd2Ji9uxU2R19jcw2Qh6hVaj8lZVfy+vGYAaJb41ssr5N99kAuGf1mp9aiiNuGiXMUfCEJpcloI77SghxB6ReunNKMWw7TeHk7DxPvopnwRt4JlI/o38Yqtg9dl1yIcTeHzOkyVR9OYm9CW+Xao2gFZHksEpmO7kfRW9QH8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:9e19f72f-b5c0-4fd2-afbf-00b583d9e3ef,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:9e19f72f-b5c0-4fd2-afbf-00b583d9e3ef,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:9afb8a54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230113140315AGN2NENT,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0
X-UUID: 09e07430930811eda08d4d6090ec5a5c-20230112
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 65151928; Thu, 12 Jan 2023 23:03:45 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 14:03:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 14:03:10 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, <nfraprado@collabora.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <libo.kang@mediatek.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>, Yong Wu
	<yong.wu@mediatek.com>
Subject: [PATCH 09/10] arm64: dts: mt8195: Remove the unnecessary dma-ranges
Date: Fri, 13 Jan 2023 14:01:32 +0800
Message-ID: <20230113060133.9394-10-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113060133.9394-1-yong.wu@mediatek.com>
References: <20230113060133.9394-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_060341_471025_E06BD323 
X-CRM114-Status: GOOD (  10.95  )
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

After we add the dma-ranges in the parent "soc" node,
this property is unnecessary for the leaf node.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 175eb7a25307..8f745442eef8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2137,7 +2137,6 @@
 			power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
 		};
 
 		vencsys_core1: clock-controller@1b000000 {
-- 
2.18.0


