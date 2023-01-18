Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29F6C54EBE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 09:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PmesaT5LEuJY2z5WkzPQb6nGpARQUchY4IIwzlhfDw=; b=OEtNWRYDDkWdgtBHuGIcfOgPSC
	TDjj9RbQAXqQ6RQz38o0FyKXgPpyXu4YZXPjNm9cVXyetOgnyWl9uNFaVuLGMq5WlqQ9j6XNNowHn
	DxO/IJSBjvzbOcHBQkTWtxChBtN/x0COTpSdr97qIdFc86B3DwXeTaIV48esyQTdvJnDSkVMwRAZ9
	Gk/wxb5JEh+3HkBWfSVHGTkNmhYblHDS6xX09GH/rIUHWNWM3i8U07cJOcFg9fbrdvV/jJ/Vcw+oW
	pWQ6JWvjPlxa/QhG4Y3r/PI4nlm3EzgZDRU+qoURP9hJOusjGKNtNeCOQxLQTkpC93BmLsSfUdroZ
	ikPULyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4cv-0004HP-Qf; Wed, 18 Jan 2023 09:21:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI4bE-0003O1-Kr; Wed, 18 Jan 2023 09:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+PmesaT5LEuJY2z5WkzPQb6nGpARQUchY4IIwzlhfDw=; b=KimJBSA1AmcI3VEyoTc5U1pXMS
	EE5JDj5M0d0J3UvIbC+HhFjkVALUNxCGdsCiUtYbfOo9VDBzMi/0lg6FEq4FBt0OHanXNHiGjtkoP
	Z1mCpJBkDGBvXWp/m3n5Pv3nwMK8qBSFhgJruAi9ky9I+KoBheSbrEwrc8qLp2X0SY51C4sd/17Ux
	JKqDF0+36LeEcZN2ZdZ0lEzBwjeVx6hs6Ju+F68utusPhYAB8AeOfaqo0QNdMOYy/p4zdN1CxdT7O
	0TR/DAsE3VLWiNx/2DSZ+LGbH8gEAiFtC0r++Sk+bI1KEw7lj7CWvG6Dpe/gKuYJlLIhwYWdkaE3S
	qBKEKJ5A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pI4b0-006DWH-1V;
	Wed, 18 Jan 2023 09:19:05 +0000
X-UUID: 2898a610971111edbbe3f76fe852e059-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+PmesaT5LEuJY2z5WkzPQb6nGpARQUchY4IIwzlhfDw=;
	b=qhG/m6r7GZk0fCmEn/BChy6i1VbLhu6C1mfgoqJvfw4dhToZ5fDnwBWyDKlB7tiOOyGO904I2jyWOP6E5j8wm0m02XOHxKlSnnA3kr5qomIfAAgwuhREViyTBoObKY20TieCKnMlB4pBSo+MPZJCs5+xzvPbBPIDR+iD3kntepg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:dfe84f1a-6f22-403b-8530-121a68a0f40f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:631e2af6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 2898a610971111edbbe3f76fe852e059-20230118
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 935212201; Wed, 18 Jan 2023 02:19:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 17:18:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 17:18:35 +0800
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
Subject: [PATCH v2 8/9] dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr
Date: Wed, 18 Jan 2023 17:18:28 +0800
Message-ID: <20230118091829.755-9-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_091903_008717_137D48DE 
X-CRM114-Status: GOOD (  13.88  )
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

The mt8186-disp-ccorr is not fully compatible with the mt8183-disp-ccorr
implementation. It causes a crash when system resumes if it binds to the
device.

We should use mt8192-disp-ccorr as fallback of mt8186-disp-ccorr.

Fixes: 8a26ea19d4dc ("dt-bindings: display: mediatek: add MT8186 SoC binding")
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 63fb02014a56..117e3db43f84 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -32,7 +32,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr
-          - const: mediatek,mt8183-disp-ccorr
+          - const: mediatek,mt8192-disp-ccorr
 
   reg:
     maxItems: 1
-- 
2.18.0


