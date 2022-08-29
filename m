Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CA7ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fddcS5Qpd6bb0n2TJsDRcQnWLDAHSEi1n8zkVWqgBTg=; b=JMvAJrcxOsikMqpuyUZTgTkcrD
	6M0bvSgJ4dXY9IfcFmNDFPhDtuPGvnSGD3JnOrkfd3tEodUHej4P49VsDx+C5pSg/mBNi3y9Z5FKX
	3dm1M0X0CkgJ73QRelWU0z+K/KDOLSfBj6dWGkH1pjWJHkQeynU47mttbBao8mTInhYhYpX+W8b3P
	c9qJw5KcCxSaPuiJ9vIoRdJz7XXhOY14dqEtuapEYt4z9E2MJ0wpd1pPJD1zCQvhodwm0LG9RtIMb
	0BCnR0WfGkerZjmqDMTfeFNkvWuEFVgRz68OaFD6rkZMUEvOlEFR3SleOkr/cO6fNg0wnnX5BC1/F
	cHs2zI/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSalo-006YOA-5y; Mon, 29 Aug 2022 09:09:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSalg-006YHd-0n; Mon, 29 Aug 2022 09:09:17 +0000
X-UUID: abc996a208854ca68cd7f27f33145544-20220829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fddcS5Qpd6bb0n2TJsDRcQnWLDAHSEi1n8zkVWqgBTg=;
	b=BJDhh7ou3r9mEbnlvkRJN80VRyw7JWkY5xP2P0L7mY7yIgu35U/X+9xc2G1iXLktSoDUZdKlh/ChW2uta4ic8vaoIndbP7b2tLIHBDEtwW9DKnR8DlNx836longeM+6gCiwCi4ZXPCDPhadKHa6a8KwKD5KXOIb7+Bi6gg685Mo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:bb1036d5-314d-41a5-b490-ea3598f7c2a9,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:ed7cebcf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: abc996a208854ca68cd7f27f33145544-20220829
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1211946177; Mon, 29 Aug 2022 02:09:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 29 Aug 2022 16:08:32 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Aug 2022 16:08:32 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@canonical.com>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v2 2/7] dt-bindings: phy: mediatek,tphy: add property to set pre-emphasis
Date: Mon, 29 Aug 2022 16:08:25 +0800
Message-ID: <20220829080830.5378-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_020916_139097_8D83AC8D 
X-CRM114-Status: UNSURE (   8.45  )
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

Add a property to set usb2 phy's pre-emphasis, which used to widen eye
opening and boost eye swing.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: Add more description suggested by Krzysztof
---
 .../devicetree/bindings/phy/mediatek,tphy.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 848edfb1f677..e0754fb44451 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -219,6 +219,16 @@ patternProperties:
         minimum: 1
         maximum: 15
 
+      mediatek,pre-emphasis:
+        description:
+          The level of pre-emphasis which used to widen the eye opening and
+          boost eye swing, the unit step is about 4.16% increment; e.g. the
+          level 1 means amplitude increases about 4.16%, the level 2 is about
+          8.3% etc. (U2 phy)
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 1
+        maximum: 3
+
       mediatek,bc12:
         description:
           Specify the flag to enable BC1.2 if support it
-- 
2.18.0


