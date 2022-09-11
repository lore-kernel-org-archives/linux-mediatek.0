Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15720C54EE9
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Sep 2022 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDXTI4k18EJfx3l923GepQjG7TruZcdsfijbeW9PjtI=; b=1bwmxmEkm/6aSwBeIzXesMNO3K
	vxaN14YypLdc15adidxOklpm4x8dsbbm63tutQdDd3Vh4c4VUymlZFikQoeEqq4M/0UuTvw1yjrRe
	kys3J3YkN3ovMldQh1jzMgQ4v9YQSHmqhAnKqV43GY6gXSqAKcfj7fSYCOTMqAjmPWzTtmtzBfE6R
	KJSbk6XplneyEE90cXprmAs9AtZzUmjHICJz0P6Ooqk4puXuf8Oor7zsJiZE4lhoQXBGijXQ4/TFw
	d6bzAq70Sp4fzi/esiJdtb0cQrZsRHfPxOvnfrmqdO/CXGQXoqPaPwVHzX446qNOUzG64h8Qhewo4
	dXvGNc5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXP2D-002ptc-Qc; Sun, 11 Sep 2022 15:38:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXP1r-002pje-KL; Sun, 11 Sep 2022 15:37:53 +0000
X-UUID: 5cdec04106d342b4aa62ae96ce2e3a2b-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IDXTI4k18EJfx3l923GepQjG7TruZcdsfijbeW9PjtI=;
	b=aWkdGOwbIEUGvmPrZmoVdxe8qIQLjTAKWs+Nxcp5DTN/QBKKrkC6MYuTtEfL+k4ynVIELzaPvlddLQKbq+Vl7sdzTMazHAwWcTjLce2MzKGOnjfe+ejsl5tldFEn99kch8Y4UbjdzWvafQUaX4GvlPSioXcg0ClYboLrdz2IHmo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:147902e1-a222-4c48-8f2e-c15d57af9703,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:404f06ec-2856-4fce-b125-09d4c7ebe045,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5cdec04106d342b4aa62ae96ce2e3a2b-20220911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1596431197; Sun, 11 Sep 2022 08:37:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sun, 11 Sep 2022 23:37:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 11 Sep 2022 23:37:43 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, zheng-yan.chen
	<zheng-yan.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>
Subject: [PATCH v3 2/9] dt-bindings: mediatek: Add gamma compatible for mt8195
Date: Sun, 11 Sep 2022 23:37:27 +0800
Message-ID: <20220911153734.24243-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_083751_787211_E382D144 
X-CRM114-Status: GOOD (  12.62  )
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

From: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>

mt8195 uses 10bit-to-12bit gamma-LUT, which is not compatible with
current 9bit-to-10bit gamma-LUT.

This patch thus add constant compatible for mt8195, which means that
mt8195 should only use specified mt8195 gamma driver data.

Also, delete related compatible from enum, to ensure that
mt8195 will not accidentally get others' gamma driver data and thus
cause fatal error.

Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index c3631a3e3f05..bc20160d6b68 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -25,11 +25,11 @@ properties:
           - enum:
               - mediatek,mt8173-disp-gamma
               - mediatek,mt8183-disp-gamma
+              - mediatek,mt8195-disp-gamma
       - items:
           - enum:
               - mediatek,mt8186-disp-gamma
               - mediatek,mt8192-disp-gamma
-              - mediatek,mt8195-disp-gamma
           - const: mediatek,mt8183-disp-gamma
 
   reg:
-- 
2.18.0


