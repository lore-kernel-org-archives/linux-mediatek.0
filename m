Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E242EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 07:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cti+2251drnoe42CDipHrRl7YxLiSGYiQTChaRDnbyg=; b=FvC/OtgiZ2BxU2I2tekAyjJT5v
	Jh8QLDhuiQ+hgmTT+WxUvjsww2ZWFqPVtZsaZR5eo7lWzSzlTqcx7Cm49SOdbhkiEzaeuPjHfYyHJ
	isPbJpXHYC+beC9oH2pdmxYYzW9Ee1yzarKDhM9FOmb6a0F8/021G1KhhooKuGmWtRPfBzTS/PHlv
	Rtm+PhnQ1UNi3Z4QmvONZQ8fiQHXtwkdUwXqQuMteHfEAS1hyf0o7XmIm9GwIgylYTyut1+5jnkkn
	nqaSPO+nxYFjmtK2lNW1PU89sPH8dWJ5x6dZ2euBzmY02JzKLJk4FAcy2qqJALqjnpWHQpI2RWVpa
	YlexlVaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbZt-00HRHB-0W;
	Mon, 11 Sep 2023 07:43:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbZn-00HRCZ-2d;
	Mon, 11 Sep 2023 07:43:21 +0000
X-UUID: dfd16852507611ee9b7791016c24628a-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Cti+2251drnoe42CDipHrRl7YxLiSGYiQTChaRDnbyg=;
	b=aY2h5tJOPEItLlKS93ybnD6p6s8743sXUSXwBnFfleNHPHs/aDgb7EPTn0zDRzaB9rbpuhExY/1siNi9rWf5EVXJrhB1JhQDcVD3aWL2awXQ4DIsl0UtQTLVoFprVDnLI7QjTDOutWsautzxXNeXbGh5msn2/M3SBMo5ZyFSZPE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:98359dde-ccf1-4588-949a-e991db87aaac,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:7324cb13-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dfd16852507611ee9b7791016c24628a-20230911
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 468680593; Mon, 11 Sep 2023 00:43:18 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 15:42:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 15:42:44 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, "Jason-JH
 . Lin" <jason-jh.lin@mediatek.com>, Hsiao Chien Sung
	<shawn.sung@mediatek.com>
Subject: [RESEND PATCH v6 01/20] dt-bindings: display: mediatek: ethdr: Add compatible for MT8188
Date: Mon, 11 Sep 2023 15:42:14 +0800
Message-ID: <20230911074233.31556-2-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230911074233.31556-1-shawn.sung@mediatek.com>
References: <20230911074233.31556-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_004319_860502_86BFAFA2 
X-CRM114-Status: UNSURE (   9.57  )
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

Add compatible name for MediaTek MT8188 ETHDR.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,ethdr.yaml           | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
index 801fa66ae615..677882348ede 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
@@ -23,7 +23,11 @@ description:

 properties:
   compatible:
-    const: mediatek,mt8195-disp-ethdr
+    oneOf:
+      - const: mediatek,mt8195-disp-ethdr
+      - items:
+          - const: mediatek,mt8188-disp-ethdr
+          - const: mediatek,mt8195-disp-ethdr

   reg:
     maxItems: 7
--
2.18.0


