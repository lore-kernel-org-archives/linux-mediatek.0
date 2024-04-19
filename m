Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D05DC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 08:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAv7xsk4dMZg8O12CSjg7d5I237JEwcCQAw88TJ7XB8=; b=VuN9UEOy3T/URwvjqDvTmEThSx
	BKMOHjLsBKBGBr5plpnRxublMMhRbUnyivPN5xuyaFnfSazpJcGBrNuYJa0k6cqnvXWyi9wLkfP3g
	lUy4P+JPn4HB9HeRcTbxhn9F6//6K3SCx1AVYaAI6W9BQuLqoonqILl4PEHWP2Xk1Rqh4p7ib0las
	lyh0etNSzH72pXlqeBtmDEe4qlgZknPqJHt4VdpdTtenb3HAkgE4pzqsCbvBFV0krfmd7D78PsBsy
	SK+3vlHr6UJa9EQb5k2nEMcHbvGalTcAK7KY3jq50Wdv5dzeXGW99Oigs8fHCj0xDhGLSjqdX1mPL
	P78WIL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxjpw-00000004yGk-0Tob;
	Fri, 19 Apr 2024 08:43:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxjps-00000004yEt-3sFW;
	Fri, 19 Apr 2024 08:43:11 +0000
X-UUID: d53233dafe2811ee96d5dfc950b7243d-20240419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eAv7xsk4dMZg8O12CSjg7d5I237JEwcCQAw88TJ7XB8=;
	b=L9oiBrfWmhDUFUxUvUlia7Ib0BRO3e68m05gBqsFlZC4kCKeRFhQqK5LSYvsgDYabp9uLMMNafYdb87c70clCWeFm3fOEd7dQAiEVpZCgMaiME/A6yMefDjFRLHEmk5bPYnDwW1+g/Ibu8I9CIbn+29CIAg7rpQ9fCu6jl2VI2s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:fc7d6774-6495-4006-b946-d89fa9582303,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:cf17df82-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d53233dafe2811ee96d5dfc950b7243d-20240419
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 845957479; Fri, 19 Apr 2024 01:43:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Apr 2024 16:42:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 Apr 2024 16:42:23 +0800
From: Olivia Wen <olivia.wen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Tinghan Shen" <tinghan.shen@mediatek.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <olivia.wen@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP
Date: Fri, 19 Apr 2024 16:42:10 +0800
Message-ID: <20240419084211.31901-2-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240419084211.31901-1-olivia.wen@mediatek.com>
References: <20240419084211.31901-1-olivia.wen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.679300-8.000000
X-TMASE-MatchedRID: UHRyBqsVSvp0BEBFOTiHn1QQ0EgzIoPRmyiLZetSf8mfop0ytGwvXiq2
	rl3dzGQ1Km7bFwpLlIgo10iBMPAt5xGQBR4wbgQDfi9EVwd+Ihh6foJpzBXqTqbAGcRZbBzXfVV
	OfiWwENdvy5usIFo8Mc5bvLLRwMDNndCRkxk0cZt0BNB20+SxH7f8mJY57oZddJaBDYald1lvF9
	+X2GEIHA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.679300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: AA43DF781759B6C48867241917EB748AAE5CC2A08526FD2F677B4151BB1D102E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_014308_989258_6438D2D1 
X-CRM114-Status: UNSURE (   8.70  )
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

From: "olivia.wen" <olivia.wen@mediatek.com>

Under different applications, the MT8188 SCP can be used as single-core
or dual-core.

Signed-off-by: olivia.wen <olivia.wen@mediatek.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 507f98f..c5dc3c2 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -19,6 +19,7 @@ properties:
       - mediatek,mt8183-scp
       - mediatek,mt8186-scp
       - mediatek,mt8188-scp
+      - mediatek,mt8188-scp-dual
       - mediatek,mt8192-scp
       - mediatek,mt8195-scp
       - mediatek,mt8195-scp-dual
@@ -194,6 +195,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - mediatek,mt8188-scp-dual
             - mediatek,mt8195-scp-dual
     then:
       properties:
-- 
2.6.4


