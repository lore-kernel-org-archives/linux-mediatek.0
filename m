Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D5EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 01:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEX1YGcVxDgNIFoejCLV5rFM2ldJbR+P2IbY4aYrSQ8=; b=DlW5RItagKWu9o
	82AvHRT+YkKxDwdaSuiVvS9wXWyFstkxbvcTfZOA2I/GjvIK89GkVDjEPseqX9RIVcupvlGViK6sM
	+fg9lIUuS94sjMiRqCzHx4lNyjKkKuHWfsGO6MNlYeGS76KBj6vz26poNZVhqNQU4QPJC1G45Clwr
	UMpLMMtjGaT94NjOqx1Jl1/UlvHEArF7wSqew5cZ/3DGIAXUtyLKUnb8uOndn3i8jRl4HcF70EKiP
	UOIFG+ItqNzQyjSsqQBOuyod3oHYrJBybn83Qc8oUtLOXh44sc0JV11KvL8Heben/LGWFC6IIjTbO
	fDUmYq/uUH3y40FKc3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXCAc-00FItO-3O; Thu, 24 Mar 2022 01:21:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXCAE-00FIlq-4Q; Thu, 24 Mar 2022 01:21:23 +0000
X-UUID: 3d69f35aed6e47379070d3f7d55614de-20220323
X-UUID: 3d69f35aed6e47379070d3f7d55614de-20220323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 952899045; Wed, 23 Mar 2022 18:21:17 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 18:21:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 24 Mar 2022 09:21:15 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 09:21:14 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Biao Huang <biao.huang@mediatek.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>
Subject: [PATCH net-next] dt-bindings: net: snps,
 dwmac: modify available values of PBL
Date: Thu, 24 Mar 2022 09:21:12 +0800
Message-ID: <20220324012112.7016-2-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324012112.7016-1-biao.huang@mediatek.com>
References: <20220324012112.7016-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_182122_206083_DD6627C4 
X-CRM114-Status: UNSURE (   9.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

PBL can be any of the following values: 1, 2, 4, 8, 16 or 32
according to the datasheet, so modify available values of PBL in
snps,dwmac.yaml.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 42689b7d03a2..856cd0b7a5b0 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -334,21 +334,21 @@ allOf:
           description:
             Programmable Burst Length (tx and rx)
           $ref: /schemas/types.yaml#/definitions/uint32
-          enum: [2, 4, 8]
+          enum: [1, 2, 4, 8, 16, 32]
 
         snps,txpbl:
           description:
             Tx Programmable Burst Length. If set, DMA tx will use this
             value rather than snps,pbl.
           $ref: /schemas/types.yaml#/definitions/uint32
-          enum: [2, 4, 8]
+          enum: [1, 2, 4, 8, 16, 32]
 
         snps,rxpbl:
           description:
             Rx Programmable Burst Length. If set, DMA rx will use this
             value rather than snps,pbl.
           $ref: /schemas/types.yaml#/definitions/uint32
-          enum: [2, 4, 8]
+          enum: [1, 2, 4, 8, 16, 32]
 
         snps,no-pbl-x8:
           $ref: /schemas/types.yaml#/definitions/flag
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
