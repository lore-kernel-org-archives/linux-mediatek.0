Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E4DCA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LiDUTfzrawFh1EWKsCkz9kjpZ7OgtmwnDfS5wYzBFpI=; b=P4UpixvjSF2BTlQrwDDsPaUP4q
	qiu45p7SFJczoLCtmoXVcD8NHTI/KqyKbOCWKy9zqNptFmM+jPhmsMm06cNpOPW5EP6BrTJzH4/6Y
	8AqZA+yeVBXcfbNhQG/hW2E+8l/9mavB3kQ93uSU2KP9dghnqqycNkJ+F8ZwgdxLj5N+kNvoVxsNP
	haTO2qlbofHxOk5LPDSjtK+DF5U3thwCVkNCEXtx4Vbw8NhuZmcQrApGX/eHcKbV75rSf3F9jpWAQ
	Ort5W1J0P+lZ3BOHkl8KuhTPgs8poFMJgjvQol54cwDFSdryeroA4bnxyg+ENnObpzjb4nxx9tH7J
	S/F+gTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzeH-002j2d-01;
	Tue, 12 Sep 2023 09:25:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzeE-002j1Q-02;
	Tue, 12 Sep 2023 09:25:31 +0000
X-UUID: 4d608a24514e11ee9b7791016c24628a-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LiDUTfzrawFh1EWKsCkz9kjpZ7OgtmwnDfS5wYzBFpI=;
	b=cQs1XLG8jLaW8Xjc2YhhfbAxieBQHf7LfyiXt6nPjnV7+xDmb76/5QbasGuUW0l5dIxix1xD+byCaQy36PA7snqRJB3jiAV10ppv9zo/36orYlod4uxqUCMMx250f8jgcqJi3ieD6fTdumlcvmREiyzsAhb54YgwnUK9uRNq5J8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:0b483e0c-c7c8-4f99-8a7f-ffca7deccf30,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:56659aef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 4d608a24514e11ee9b7791016c24628a-20230912
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1029205242; Tue, 12 Sep 2023 02:25:24 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 17:24:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 17:24:47 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Macpaul Lin
	<macpaul.lin@mediatek.com>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?=
	<bero@baylibre.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm64: dts: mediatek: mt8365-evk: update compatible
Date: Tue, 12 Sep 2023 17:24:43 +0800
Message-ID: <20230912092444.31635-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.873600-8.000000
X-TMASE-MatchedRID: i01+YSiNUzMcqJwtUHLtOe0yyL51qL/R+KgiyLtJrSBh2fnHe1cilw2K
	u+gP3kxise0eJxE/UVXuev+YFA//bWsV28ESZOe8A9lly13c/gFVbRdL8GjdzZsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNZivyg6Bk2T/JSOWtCLDmch82R3XsjC3oQuz+bKasm9tJFbIY5p5bKPvVa
	y2kO94Fmb4YhaEgKYKAz08CGQC6VFhCo0f/eBiT6Wn1XP+V4+Y82Gj2QC3yG0smXVK/H8eHzG7s
	r7xobSAsPEFD+rZA81DDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.873600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1275F8D9617010498F2A59E9806A8072146B814A40781A02B725653987DFD2632000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_022530_050858_18BC267E 
X-CRM114-Status: GOOD (  10.22  )
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

Update compatible of 'mediatek,mt8365-evk' from 'enum' to 'const'.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

changes for v2:
 - rebase this patch to follow the v5 patch set of mt8395.
  - depends on https://lore.kernel.org/lkml/20230909132819.21626-2-macpaul.lin@mediatek.com/T/
 - Fix description as a single board.

changes for v3:
 - rebase this patch to follow the v6 patch set of mt8395.
  - depends on https://lore.kernel.org/lkml/20230911115717.26184-1-macpaul.lin@mediatek.com/T/
 - drop "Fixes:" tag in commit message.
 - drop platform description update for mt8365-evk (Genio 350-EVK).

changes for v4:
 - Replace "Fix" in commit message with "Update".
 - Fix 'make dtbs_check W=1' error for 'const: mediatek,mt8365-evk'

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 2e8ad49c3479..9031160ef41b 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -245,8 +245,7 @@ properties:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
       - items:
-          - enum:
-              - mediatek,mt8365-evk
+          - const: mediatek,mt8365-evk
           - const: mediatek,mt8365
       - description: MediaTek Genio 1200 Boards (Genio 1200 EVK)
         items:
-- 
2.18.0


