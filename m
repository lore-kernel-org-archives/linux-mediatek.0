Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E56D1D88D
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 17:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UgTpErnoeVYsYbEDorkXZU0hq3Q/BVcz0mstioX+jM4=; b=efrliPcWQHnyl5rtHQ/QcNnTcM
	jCZEcoJYhNR+C9T5hTEazKL+V+ucBbBURLDh8YKVJIHA9LP4wr82oS9MU9+YKyv5mef3qqo30Y7Ol
	EIiLYTp5sQt2fznbWiwVizjZ/Yw6ClC0TcyXUwbpMdZdlADDTwekTyjHTBKQHhjHA7Qoz3OuHttHX
	DbrIDdv7pLr3HAPeGGC75gD8ks/QwUBR0GiljkiAXxQf5I7uICke1u0Iz4PO+8if9nipj8cMBU7Ef
	U5bcFIwUhLLM6ULFbzfKFAsh2aa2JMO1C+Sor6rrKf3Sj2G9d6eUpytSGpK5YYWuY6bSeyD3zSZ+u
	hGkNgBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lFp-0000000914Y-1mVa;
	Tue, 15 Oct 2024 17:22:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lEP-000000090tB-41Y5;
	Tue, 15 Oct 2024 17:21:15 +0000
X-UUID: ddd03a4a8b1911efba0aef63c0775dbf-20241015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UgTpErnoeVYsYbEDorkXZU0hq3Q/BVcz0mstioX+jM4=;
	b=Ej+nY04IFS+TRicSyAf/YSCnb20JGr/n3FdWOmij/o1+4M0WVuN5zO7HB89fRhsLTYBCSob3UJOOVq/MB7dPVtkKAEYGHYigs+AolsZfbaX6YtMvXSPPeXOGgeJPee601F+V5WCFJzZwwkHO5oYvkgKL4+Jn51mZiR14J47jx0E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:8fe64c2b-4fad-4fad-96c9-873a6bd0e01b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:f7e9d406-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ddd03a4a8b1911efba0aef63c0775dbf-20241015
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1362112982; Tue, 15 Oct 2024 10:21:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Oct 2024 01:21:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 01:21:03 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, ChiYuan Huang
	<cy_huang@richtek.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chris-qj chen
	<chris-qj.chen@mediatek.com>
Subject: [PATCH] dt-bindings: usb: mtu3: add mediatek,usb3-drd property
Date: Wed, 16 Oct 2024 01:21:00 +0800
Message-ID: <20241015172100.15150-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.054700-8.000000
X-TMASE-MatchedRID: GIpmbigRs3axuuum/MWy74sKNaNh88CQtMSM1a+1JW9+YesuCgkiXBVZ
	MOF9O5JogqVqNSWEmVr78dnxIA7Z1wzyMxeMEX6wFEUknJ/kEl7dB/CxWTRRuwihQpoXbuXF8nO
	jarwxetI07sAoSbfGL3O7+vMntQJx2pS1dNcT8ZTzc1eWqu+S9uyQAm3LvZdIuiYLxCZ6sl6ocU
	Ze0b27L2lQnEYqaE9qaaeeX2Q5bK9+HGPweyal2mGdUezV59DHQZpgl3CshRSeqD9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.054700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DA6EAF070114F080FC4D484CB9330DF6C2414915C8C698786916A40959916CCC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_102114_266539_D2838E7E 
X-CRM114-Status: UNSURE (   7.51  )
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

Add optional 'mediatek,usb3-drd' property to MediaTek MTU3 DT Schema.
This flag specify whether it is a USB3 Dual-role device hardware.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index d4e187c78a0b..1e70af0dac82 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -155,6 +155,12 @@ properties:
       property is used. See graph.txt
     $ref: /schemas/graph.yaml#/properties/port
 
+  mediatek,usb3-drd:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Specify whether it is a USB3 Dual-role device hardware.
+    type: boolean
+
   enable-manual-drd:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.45.2


