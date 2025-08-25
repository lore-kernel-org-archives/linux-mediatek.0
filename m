Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E297ACA0EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 03:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ou2C/zcmNmDM+9xeKUZQlGrujbR/kb6UxxUv3SCOO+s=; b=Bl6gaRJQmBWDgPkAE25k2Fc3Ar
	dpfnP1xOHsBiXhMc3U2qzgC9/YGDSpPOpaTuG1/7PLipTkpMC7ScV4MGrAB6DJolvMyUzoxXIfvzd
	RAxBdgqvqduXkzFP2B7h/pNj9aFANwEm37ZvDxYZtd1EwkCPGNd4Tfnhfb2qQ/WBVi8aREwmf9Ifu
	lvg98shskG5WFyH+ZlGcJsP/PU2cNhJvxj8nGrv4XolQ3zQnMf1UAFwA6hGEd6557VtqTyJCUEBUM
	D3swrO+9O15+/9oQdqx51LHfymVJ2mtw1dN75x2hOf2E/Fw5RvjlzfoFkpFEr3TkcxjxBs7GyLUs/
	H8c45ASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNws-00000006oLO-0til;
	Mon, 25 Aug 2025 03:32:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNwp-00000006oKw-3IKI;
	Mon, 25 Aug 2025 03:32:44 +0000
X-UUID: 24a47e36816411f09eb0dd999d3936bf-20250824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ou2C/zcmNmDM+9xeKUZQlGrujbR/kb6UxxUv3SCOO+s=;
	b=pgXBssemJlUu9KzDGjs3lZUyePFTpvzRUTshs++6qQOHtY5feiNpkALoDtjb5pu9WuL+q8zPNMNjWYW4bm+V3fEo6lkQGMivrYlmNje3ExuUMXmtDe2t+rsgLuJa4irukPcs6SdetUZkxBfMqB9Mep/hOBuO8YNOFjoCNGTiWiQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:32d2b3b1-286f-47e9-900f-fcea3720ae40,IP:0,UR
	L:0,TC:0,Content:50,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:50
X-CID-META: VersionHash:f1326cf,CLOUDID:f39e7b7a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|801,TC:-5,Content:3|15|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 24a47e36816411f09eb0dd999d3936bf-20250824
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <zhanzhan.ge@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2105217404; Sun, 24 Aug 2025 20:32:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 25 Aug 2025 11:32:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 25 Aug 2025 11:32:32 +0800
From: Zhanzhan Ge <zhanzhan.ge@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Zhanzhan Ge <zhanzhan.ge@mediatek.com>
Subject: [PATCH] dt-bindings: timer: mediatek,timer: Add compatible for MT8189
Date: Mon, 25 Aug 2025 11:31:13 +0800
Message-ID: <20250825033136.7705-1-zhanzhan.ge@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_203243_835384_C745E322 
X-CRM114-Status: UNSURE (   8.65  )
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

Add the compatible for mt8189 timer to the binding.

Signed-off-by: Zhanzhan Ge <zhanzhan.ge@mediatek.com>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index e3e38066c2cb..5ceedc3a4f91 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -43,6 +43,7 @@ properties:
               - mediatek,mt8183-timer
               - mediatek,mt8186-timer
               - mediatek,mt8188-timer
+              - mediatek,mt8189-timer
               - mediatek,mt8192-timer
               - mediatek,mt8195-timer
               - mediatek,mt8196-timer
--
2.45.2


