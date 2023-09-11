Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB02EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 08:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MCzMA/GKqrIMNYCo11r8rcE/gg74N+QZEyVO4RIJqXA=; b=zeVMjzQOJFFkvkd0bPP877y1C0
	+re2PLVl7gs6i2em0qA0qKluCUdzBf7sTdzun7vFZL+ITpIpCh43dzob3+G6Daa9HIChkZ7iGGEM/
	GImxk4kg4xAIJpQoLuruMdbwOLOKuXnSvo4wGiFLDy34wbb49liCKgH4bJz3RmBOYkbU/enAafc+n
	eWbiWavqUtDVNrUBYU3rmu8MCr0mW5bNY8zJp7SPqXYto85LctjSbMWFppDjhqWzQEqrG89ntdjNr
	z3p2KHyGN8XLyqBy9KDPqbJ3Nf6HBskqV2PWXWqcMtIpGW3x58bX8+KoXYucc4vql5bGhDmcnLXIP
	OvtPrXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfc1k-00HW7s-1B;
	Mon, 11 Sep 2023 08:12:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfc1h-00HW6I-0h;
	Mon, 11 Sep 2023 08:12:10 +0000
X-UUID: e3e085dc507a11ee86758d4a7c00f3a0-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MCzMA/GKqrIMNYCo11r8rcE/gg74N+QZEyVO4RIJqXA=;
	b=blKIeseZtv1iF6cZ/3PUZjowugp603e+9fSlSEST4OPVPNW8XtPE1J8hgF5uOZTf+ZOi/PK+ewMQAAj/bcTTdB6PeoNokGDMU5HGcnvue1NngCOrkEjxomL3jRQXv0L+VyTxkGkoIzgQ2k6gjAxWxAgx4najstg7Iv29szLtfhg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:6c90f914-068d-4d4e-a2d1-88a87c80d844,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:965ab1be-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: e3e085dc507a11ee86758d4a7c00f3a0-20230911
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 78582; Mon, 11 Sep 2023 01:12:03 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 16:11:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 16:11:28 +0800
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
Subject: [PATCH v2] dt-bindings: arm64: dts: mediatek: add description for mt8365-evk board
Date: Mon, 11 Sep 2023 16:11:26 +0800
Message-ID: <20230911081126.18463-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.991800-8.000000
X-TMASE-MatchedRID: v+sphrBU45FrtoObOqfJT2wbuvhCHs3cnF8rflXuiRVcKZwALwMGs5dA
	ax/AUFGFEkRA7FpRUXDGSpNZ5mudiuwAaNLqXHEqGVyS87Wb4lxUENBIMyKD0Zsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNer8b64MjOU7NxIZfPBYfs3PxUHo/8SRSO/9bGTORaX+PzWVQViFxV655u
	o7QuyaKruiuncE07wHQyzVzkrZQ0NxuBXbgRj7dk9Oyzyjz1pl82Gj2QC3yG0smXVK/H8eHzG7s
	r7xobSAsPEFD+rZA81DDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.991800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B89D0CF8A93DA5404C3D0C43E5887390FB7D8EC9D4090551A434DC8120325C802000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_011209_264682_C9FC5D72 
X-CRM114-Status: GOOD (  10.69  )
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

Fix the missing description for MediaTek mt8365-evk board.

Fixes: 4f5fc078ac6f ("dt-bindings: arm64: dts: mediatek: Add mt8365-evk board")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

change for v2:
 - rebase this patch to follow the v5 patch set of mt8395.
  - depends on https://lore.kernel.org/lkml/20230909132819.21626-2-macpaul.lin@mediatek.com/T/
 - Fix description as a single board.

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 2e8ad49c3479..b163995e32d5 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -244,7 +244,8 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
-      - items:
+      - description: MediaTek Genio 350 Board (Genio 350 EVK)
+        items:
           - enum:
               - mediatek,mt8365-evk
           - const: mediatek,mt8365
-- 
2.18.0


