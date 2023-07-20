Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90B6EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 08:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qm5KdnmI2NQxAsRiyAJeJgT+IiS3U8R2/O6sl1QAf1E=; b=AAGn9zuv4FYjQlN2SAvxROWi9A
	XAaLNakjMxgwXFhVEYk6XW22eiPdqBGqBFwoQZehwoEito0fwwyxUuCCSKhPrP3vJ7Qup67tE9a8s
	1jZTzUp4x8T3QTPnUghGBXT0vFHL15h82EOZJe0Rvfk7AC/2ia6JiKVIEeNFeNtC5Rw9/bNs30KhS
	h81iOQEHFhlH6WbI5PYfgpVg6/AhOUmtYKUhdq3fYI9tKTAefIpmEwZbFyTNPp/XZkDRRL2h/MLH/
	laLJKychU5ohEXalpk6K0MrHgi3d08hWb+cG9e4cxY0b7BZ6UxnbWRptwzxe5v4Jw839kFcF7snqy
	Jm9walHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOzi-00AIrz-2l;
	Thu, 20 Jul 2023 08:26:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOzf-00AIqs-29;
	Thu, 20 Jul 2023 08:26:41 +0000
X-UUID: 226f7d4e26d711ee83ed1395ce914268-20230720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Qm5KdnmI2NQxAsRiyAJeJgT+IiS3U8R2/O6sl1QAf1E=;
	b=aUSwjlLLoYd3oUL+Cu0MSVu8KhimAlGTkgUb9lt3+85K8gxjDDXhyij1MSZ/W7wYRC5+rXwAPsnTbJklDo7b+Ye+KHZDVwNk2PYYOWYrCoX1ZGiI68n1tanrbErF90XJBMiNrMX3RtLzLVKgWb9Iz1ND4x4snGsDkOLgNJWLG9o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:29cc02a9-bd0f-4808-a46d-93b8cc6f2b3b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:db19e18e-7caa-48c2-8dbb-206f0389473c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 226f7d4e26d711ee83ed1395ce914268-20230720
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1837283769; Thu, 20 Jul 2023 01:26:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 20 Jul 2023 16:25:56 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 20 Jul 2023 16:25:56 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Shuijing Li
	<shuijing.li@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3,1/3] dt-bindings: display: mediatek: dp: Add compatible for MediaTek MT8188
Date: Thu, 20 Jul 2023 16:26:02 +0800
Message-ID: <20230720082604.18618-2-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230720082604.18618-1-shuijing.li@mediatek.com>
References: <20230720082604.18618-1-shuijing.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_012639_709487_7E6B757B 
X-CRM114-Status: UNSURE (   9.06  )
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

Add dt-binding documentation of dp-tx for MediaTek MT8188 SoC.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2:
add a mediatek,mt8188-edp-tx compatible per suggestion from the previous thread:
https://lore.kernel.org/lkml/c4a4a900-c80d-b110-f10e-7fa2dae8b7b5@collabora.com/
---
 .../devicetree/bindings/display/mediatek/mediatek,dp.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index ff781f2174a0..2aef1eb32e11 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -21,6 +21,8 @@ description: |
 properties:
   compatible:
     enum:
+      - mediatek,mt8188-dp-tx
+      - mediatek,mt8188-edp-tx
       - mediatek,mt8195-dp-tx
       - mediatek,mt8195-edp-tx
 
-- 
2.40.1


