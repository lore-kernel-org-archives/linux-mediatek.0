Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2A9CF3189
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 02:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPGZar9sjhXZt1snnZn3u5dXojBi5Z4anWFQOljWfHg=; b=aLKimFS6XaDWGtmpBdZIMRCFQs
	/bCVzH+HhsHnwrBjIYjBF7v+ItYia5WhBt2Rmls9u1/pcFLnYZX4Vh1cenfeBS3JeuXKQZe6ZMTu5
	xbxeRHgQQi8e+N1zNh3+Xbrq/YS1ib9eSWYk37e1Kc04djSnDHopYbij4R2seO1Woqwi5Tggaiqs3
	0O16r8lsb5h0f/8mcPveHo+MEX8JZcHE6zubUtYeQQBRrTRnZAcBkrnIqZpXi2HX8llT4+eY067iG
	E8LR95nfRIqgQcN+lbtTDQL5dGFmO4FKlBeoETotqQc8imKZJq3wx6myyXli1sHIYNqlB2vs2YeE/
	QTg5bfww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svp2S-00000004cRI-2Fm4;
	Wed, 02 Oct 2024 02:24:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svp02-00000004bxS-1Z9V;
	Wed, 02 Oct 2024 02:21:59 +0000
X-UUID: 172e8f18806511efba0aef63c0775dbf-20241001
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fPGZar9sjhXZt1snnZn3u5dXojBi5Z4anWFQOljWfHg=;
	b=Z1YxjTVObFjr3WYOOEeSWxEZSAXN1iTEMmWyC9gkpFsuz7/EMJzknhRbDeWFMAC6PMe4gY/ftBG5yvX+3B51Dy5REMvNOcCrCY2CXHTm4I0n+HKNmEQx721A7OALO1DTGZbskKM7H6IGujAUMD2o2MYptdl2BwzbXzH0Yt/pycc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:784c8015-5560-43ae-adf0-0870d705888e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:fb94a6ed-33c7-4396-bf34-2026ee4f15f5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 172e8f18806511efba0aef63c0775dbf-20241001
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 813119135; Tue, 01 Oct 2024 19:21:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 1 Oct 2024 19:21:51 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Oct 2024 10:21:51 +0800
From: Pablo Sun <pablo.sun@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH v3 3/6] dt-bindings: nvmem: mediatek: efuse: Reuse mt8186-efuse in mt8188
Date: Wed, 2 Oct 2024 10:21:35 +0800
Message-ID: <20241002022138.29241-4-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241002022138.29241-1-pablo.sun@mediatek.com>
References: <20241002022138.29241-1-pablo.sun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_192158_663652_99F0B1A8 
X-CRM114-Status: GOOD (  11.24  )
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

mt8188 has the same GPU speed binning efuse field just
like mt8186, which requires post-processing to convert to the
bit field format specified by OPP table.

Add the binding for the compatible list:
  "mediatek,mt8188-efuse", "mediatek,mt8186-efuse"
so mt8188 uses the same conversion.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 32b8c1eb4e80..70815a3329bf 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -39,6 +39,10 @@ properties:
               - mediatek,mt8195-efuse
               - mediatek,mt8516-efuse
           - const: mediatek,efuse
+      - items:
+          - enum:
+              - mediatek,mt8188-efuse
+          - const: mediatek,mt8186-efuse
       - const: mediatek,mt8173-efuse
         deprecated: true
 
-- 
2.45.2


