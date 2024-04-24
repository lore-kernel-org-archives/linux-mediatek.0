Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1013FC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 03:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVDy5/ZsVM8z4DOMITGRoXpjJasjzOPGDsnn36hyu4g=; b=RXRzn++zNWzWHnOa/gkKgXDm8+
	ZuliNH9/kvYyJNAxiXnNE+CIdqm9Z1E324go1NB4xYOgTXtUsCHHI+O2MO+ZYwJU0Hlq3j7q7WMyL
	3mjx1OCTmny0m6OVML6dAX4gQ78JlMvTMJ0ku3OhNeFN2kto9lFcg/lNtTZVQB9p+/hbjxI8CqiHR
	88u/lojFc/rlxsxuX+PYIPKFTXQ+TGvJbsPu9iq27FFUXm2kfkDSjuQEhjh3zjVN4qrais28I7Loi
	Tstmn2I9JnMRo5rTgmOWmS5vugaEIWet4RwEVUUnAd4/m5tAOTWuwFAeVjPAbH/aM/H3y9k3EddUs
	Qg8kwVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzT5W-00000002Kry-29O4;
	Wed, 24 Apr 2024 03:14:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzT5T-00000002KrR-2ZxB;
	Wed, 24 Apr 2024 03:14:24 +0000
X-UUID: be586ca601e811ef96d5dfc950b7243d-20240423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YVDy5/ZsVM8z4DOMITGRoXpjJasjzOPGDsnn36hyu4g=;
	b=D933VinzE674GWPK/IWs01BE6LAX3dMgZRG6qLjIgy0UVZwQZzKR+0+AQM0q1d+aj75UWvn5cLjSAHXDUfp6yF5h9vobztapaDVzPZNyxmF7rxUa1ZqH/afrjpwooFLrL7C3fbkpjeHSyUQIn3WlK9AzqfuEMrMhOiUZoLrWwCw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:4ce3eabd-67e6-4c83-ad56-a2f4db63ab38,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:17f646fb-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: be586ca601e811ef96d5dfc950b7243d-20240423
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 24742829; Tue, 23 Apr 2024 20:14:20 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 24 Apr 2024 11:04:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 24 Apr 2024 11:04:15 +0800
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
Subject: [PATCH v3 1/4] dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP
Date: Wed, 24 Apr 2024 11:03:48 +0800
Message-ID: <20240424030351.5294-2-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240424030351.5294-1-olivia.wen@mediatek.com>
References: <20240424030351.5294-1-olivia.wen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.711500-8.000000
X-TMASE-MatchedRID: eTEFbZ6VJO5jVtAwIy+afmHn2exfZC4LdER46uj876/oFeE5MSxNMeLz
	NWBegCW2wgn7iDBesS0nRE+fI6etkpar3ceJGClgN1rcfctnT3I4Cy/AjbisqpGJB31mduCgnJw
	vO47B+KCM47hkifH+EQ6x/CJdSYheO29r+zoVSuuTp+MobLNv/ICE5xpCtDRTUbJFyh4XXyqYo/
	TPOlMB4bCh3zE4wqa8DUCRr8oin+k=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.711500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 51EDF03EB993C1CB263B9901CEAEEBE8EED93A620167DDC423AC0563D5D95B982000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_201423_666861_64516BDA 
X-CRM114-Status: UNSURE (   9.40  )
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

Under different applications, the MT8188 SCP can be used as single-core
or dual-core.

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

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


