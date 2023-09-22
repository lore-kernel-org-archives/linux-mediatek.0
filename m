Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9C5E7D0D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 07:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiI27+V+ohLLmanzh77to3I9813RIaJEzm1Zru/Co4g=; b=0LizWd7RWJgUWNs81tx6yPSEwU
	Si+kX+cyH2VovD+kWninUvTLZ0vN5cfqKvvFLDSDVakqKUFrGUxN3gMm5GTnmpXg7UekdKvbdeJs9
	hkCxhfkbBS+6cHhGDf2+GV2+fRpPSr4DXYz0XZeaEuxPPhxqLtCN4rfmxvzSOHRaxTpehThAFNH67
	ED5eerXQ3Q1mRYIq4Wrhu36jzwHCjAldnXFNdmDkMDgDrE4y+ljxxsmuzhfVwiXkXTNot/BWP0v7A
	uDM9bKNKZOjRTXuNLRUGknUt7DEDc3vpUu+zCEUMKZ/MHHQsHuvATLD6KRXT9no+icPKAEKie6ubU
	2hNsvRDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaUW-008An8-1j;
	Fri, 22 Sep 2023 07:22:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaU7-008ASF-2R;
	Fri, 22 Sep 2023 07:21:57 +0000
X-UUID: b3cabba0591811ee9b7791016c24628a-20230922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fiI27+V+ohLLmanzh77to3I9813RIaJEzm1Zru/Co4g=;
	b=HpdhIz3C4+con+AxvbodoKQ/D4KFuiApuYZs5vS1I1Z3IbuC3BRmw85CLby/XL5klUuKYSOW8edsxChXTjAgTgPTH/v9tlzKDhtjBbFpKGytnlfGDuKhiQWnVDtHX+5Cw0zWmAdEreilsilZENVpZbDybMEHZXZsejjqdZlY8BI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:9efc7f07-2ebd-4fc0-9cd4-fd4afb8578da,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:5f78ec9,CLOUDID:992b24bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b3cabba0591811ee9b7791016c24628a-20230922
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1678896795; Fri, 22 Sep 2023 00:21:52 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 15:21:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 15:21:17 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Moudy
 Ho" <moudy.ho@mediatek.com>
Subject: [PATCH v6 04/16] dt-bindings: media: mediatek: mdp3: rename to MT8183 RDMA
Date: Fri, 22 Sep 2023 15:21:04 +0800
Message-ID: <20230922072116.11009-5-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230922072116.11009-1-moudy.ho@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.283200-8.000000
X-TMASE-MatchedRID: U2rU8In9HlKuI2PD0uhaO7mR+C0l9vjVTJDl9FKHbrklx7HMaisSRZcP
	t/Z07RBs+QhtM/ILvqYRA4hwIn2MDXZW0C+m8SohdAg4yd14qAR9LQinZ4QefIWH8POvJNOW5tB
	Kje5pwd6OhzOa6g8KrfS+WWlyQsB9GHIVThySMugK3m9nZAOtYMKTUfX2jEl006N2TIBBWV/W2F
	EkjzBjZDusP+LCu/a/LwUTti3fuVC1EcCf3T9FE8GQYFMiVRG5ehcPPz6UzEWlb5ogMngNpHOTE
	n5IiRSOady5RJQR05c=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.283200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0A5194958697695E2AE7AB8A6EBE7735F1836A0EEFA22A11B2D6A6E5A91C263E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_002155_814135_D3E7E9DF 
X-CRM114-Status: UNSURE (   9.30  )
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

The file was renamed to support future scalability in response to
the changes in general properties separation.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../{mediatek,mdp3-rdma.yaml => mediatek,mdp3-rdma-8183.yaml}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/media/{mediatek,mdp3-rdma.yaml => mediatek,mdp3-rdma-8183.yaml} (96%)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-8183.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
rename to Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-8183.yaml
index 0539badc9821..74a1eebf668d 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma-8183.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma-8183.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek MT8183 Read Direct Memory Access
-- 
2.18.0


