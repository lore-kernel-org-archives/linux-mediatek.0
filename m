Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D259EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 02:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4JZXGwaqgiVk9kx6+mbob/fL/CJEEXGEBYv/EI5zPY=; b=mgmgsFCUVpAo9a/PBzk4DBZ5rV
	/xekiOJw7DbrcalJ7VWtL5TVnafzR5mPzg/QcY0VP3tLAduOkcZ4fl7u/WXqQ5iLuhHi7Qfe+Rkva
	w5vC3u0dnCNg8MkrqKeWgI+3DCQOf5Wno7TG8aGE53Alry04Los/XQGm6EQlaJXSzHpKbPrNOgowK
	O7GL3A3QFvbzcKJPjptUV8lyeCCU1rGBBb4mHA0Vy4b9B5UGLPRak6lKr4UB/Zmk5jb07htrAxf0G
	RZ45kvWCaC+qsjv1y5uHYxH5VnJdLyyPWIA71QA+mWL1xszvttsSaXNLKcFuSb9EirGCMXXYZxYqS
	c/5siT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ3ID-00DLcz-1S;
	Tue, 11 Jul 2023 02:39:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ3IA-00DLbd-0e;
	Tue, 11 Jul 2023 02:39:55 +0000
X-UUID: 348c42f41f9411ee83ed1395ce914268-20230710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=E4JZXGwaqgiVk9kx6+mbob/fL/CJEEXGEBYv/EI5zPY=;
	b=rFkJmzeWXlQ4b67VN5UCrAIfnDSUwQcw9SQk86i9Iom/0tulqUNxvZiG4AMovSPAOPaGWptiorjqwZnWNQbN0lCaK00fLXQV8+PtdSuMRTxdVVOl+yv+gq5jwKhs6Dea6odhUEJPLj0p+xQ+0pjyF6oC2A/UtxkG+QQ1Zr+tuL4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:3fe9593a-8cb2-4405-8022-75796590d53f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:213dca0d-26a8-467f-b838-f99719a9c083,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 348c42f41f9411ee83ed1395ce914268-20230710
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1253574042; Mon, 10 Jul 2023 19:39:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Jul 2023 10:39:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 11 Jul 2023 10:39:46 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>
Subject: [PATCH v2 2/4] dt-bindings: arm: mediatek: Add mt8188 pericfg compatible
Date: Tue, 11 Jul 2023 10:39:27 +0800
Message-ID: <20230711023929.14381-3-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230711023929.14381-1-jason-ch.chen@mediatek.com>
References: <20230711023929.14381-1-jason-ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_193954_245514_88A5B4C7 
X-CRM114-Status: UNSURE (   9.82  )
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

From: jason-ch chen <Jason-ch.Chen@mediatek.com>

Add mt8188 pericfg compatible to binding document.

Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
index 26158d0d72f3..33c94c491828 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -28,6 +28,7 @@ properties:
               - mediatek,mt8173-pericfg
               - mediatek,mt8183-pericfg
               - mediatek,mt8186-pericfg
+              - mediatek,mt8188-pericfg
               - mediatek,mt8195-pericfg
               - mediatek,mt8516-pericfg
           - const: syscon
-- 
2.18.0


