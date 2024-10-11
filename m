Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731D4D24463
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 02:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SALh9hOsK54vErFDn29jQk1l94WOB1hPU+0EjGmHCWo=; b=IhpK+uofTOoR/4HZ8gai0bUClX
	4cNc/imp19qv6/6EScQix6cwek0hbzd4c06G+a9RbrQU2GdtsSIsqAhmONXwu/qF3KaAkNVPTvMcK
	6gpRzgQFagonCtSkImKiBZSjH0UPz7oDPIye3Qvx7OHtW2yqzXBldfRhSiq0Ko1ti+0aHrL7f+Gbu
	nib/iTv2w/Ldzj5A/B6mfl+uYdx8l0rGrAJwZ3HNqSlATdPhm/b94h02zGFib1CGKCkRuAa9cJVc9
	TxE26OD6FW3vPdE2uiWaCy1Iw85F5WSSnd4mQ7i9vXeyMKT2S/VY2hAsfCpXdfJPmPtKRQHaIuZs0
	xsZ7llRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz5mS-0000000F5vb-1mSm;
	Fri, 11 Oct 2024 02:53:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz5j5-0000000F5QG-2dXS;
	Fri, 11 Oct 2024 02:50:00 +0000
X-UUID: 8013bea0877b11efba0aef63c0775dbf-20241010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SALh9hOsK54vErFDn29jQk1l94WOB1hPU+0EjGmHCWo=;
	b=XwzU1TTGfdXxOlEraQKor/+DNUi38Sp6EVCjB5NkbfAvUKAl1K1L0IleCFwA7Nq+7zyW41pdtN34BU6UhlFpCyyGzQcSXzGlGXxuYr4nBi4nepjfsLrIJQl3RcLPpkXF3e72HzdUwxV6g0aUuIejRQtMsdaKipDDjKelnIHQ0g8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:d863cb02-2552-4b1e-913a-3f05c9ce4d3a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:aaed9c26-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8013bea0877b11efba0aef63c0775dbf-20241010
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1076867263; Thu, 10 Oct 2024 19:49:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Oct 2024 10:49:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 10:49:52 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Andy-ld Lu <andy-ld.lu@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 3/3] dt-bindings: mmc: mtk-sd: Add support for MT8196
Date: Fri, 11 Oct 2024 10:48:36 +0800
Message-ID: <20241011024906.8173-4-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011024906.8173-1-andy-ld.lu@mediatek.com>
References: <20241011024906.8173-1-andy-ld.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-3.010100-8.000000
X-TMASE-MatchedRID: uVuWzlu52Rkh3Xy1KnQIRMnUT+eskUQPkos2tunL8DSKvSwHZ9zxVEgC
	lCIX2gewLYexjI/F2s5WZCdNM8s+D7BAQLqGlKivngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPInxM
	yeYT53RkzZYRPaI6cs3HdO5DeoK+VQnhvAgn814E14Xf/AzddUsWxi9xyl7z5uuTQ/d/i9EEpgu
	IlSZIj9U4rrOJPbCTVDpJPrFflb/Yc/j4aI5S1Lnr9GD0zfOvEAaqvv/mhgrEIcy9ODq9nmcPIN
	hwTXBeZ
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-3.010100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 608E7277F4E668B5AC2F8EEEE4DFE76C873C22D78087C497745176D5C448464A2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_194959_690590_0DE12771 
X-CRM114-Status: UNSURE (   8.60  )
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

Extend the devicetree bindings to include the MT8196 mmc controller,
new tx/rx would be supported from MT8196, and the register settings
of STOP_DLY_SEL and POP_EN_CNT would also be variant.

Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index c532ec92d2d9..9281a0326891 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -24,6 +24,7 @@ properties:
           - mediatek,mt8135-mmc
           - mediatek,mt8173-mmc
           - mediatek,mt8183-mmc
+          - mediatek,mt8196-mmc
           - mediatek,mt8516-mmc
       - items:
           - const: mediatek,mt7623-mmc
@@ -190,6 +191,7 @@ allOf:
             - mediatek,mt8186-mmc
             - mediatek,mt8188-mmc
             - mediatek,mt8195-mmc
+            - mediatek,mt8196-mmc
             - mediatek,mt8516-mmc
     then:
       properties:
-- 
2.46.0


