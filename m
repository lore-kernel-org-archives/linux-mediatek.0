Return-Path: <SRS0=w4bH=ZF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208E9C43331
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 03:40:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6B04207FC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 03:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aJhsa2hU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="de+DJUBG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6B04207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyZoLaiNMI3ZixAxFcfK3zHdWNk2Fs8BGSDdUOyk7xo=; b=aJhsa2hUtb6y9W
	rV42k6bb9Zm68O7qLNyPIrXGUFRP2HftBD29eVLnZp5P6wyf5NeLWLjxiWWR3fFt8hrKO56gkcdIm
	j5mtoRvXeCbayx8VA3cSYXX+4a+jFsjdEOA/WSyjFu7zxoIAOx7bO/vB1IXWN4/8gU9gP7JNw6++z
	OLp4C7zss4PLeRCIMctSC+0TMwIwkJPb/vYpo+YzLr302Mzp0/J1Jbn4LoMrw5d1Ul3xcQrwYE0wl
	NYQivqJST0D2nUTP39RJPadZwY6faNCUNtrtCkC4ofhbxpboPuEhr42Si5BCw6KeedtcmmfN7iQ9Y
	OzeTV45nrKQQJy5vKoRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUjW5-0005LB-I7; Wed, 13 Nov 2019 03:40:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUjVQ-0003Zn-PP; Wed, 13 Nov 2019 03:39:46 +0000
X-UUID: b0195e6669a04cf8b90ddce4846b0a27-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bfRQ0Dzw2bXkHJSpdBAaflQgVggmHGlR1uabujVny0c=; 
 b=de+DJUBGAzxk2cLrk8w0YUgyK7sdZmXC85wUysWQYOJQ/srVgguIXQB4oNfWcFMRJQVTA0b9OOSd8AgJkKjxU0ts//f1jdz9D07MnqGQhfWiTrt6oxHzAlVS+YY8BN1o4a4FXsBQS3zFGdYSsxBrPQsniVcdp8n+t8RWBeHa11I=;
X-UUID: b0195e6669a04cf8b90ddce4846b0a27-20191112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ming-fan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1206725115; Tue, 12 Nov 2019 19:39:32 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 19:39:32 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 13 Nov 2019 11:39:24 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 13 Nov 2019 11:39:24 +0800
From: Ming-Fan Chen <ming-fan.chen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: mediatek: Add binding for MT6779 SMI
Date: Wed, 13 Nov 2019 11:39:21 +0800
Message-ID: <1573616362-2557-2-git-send-email-ming-fan.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1573616362-2557-1-git-send-email-ming-fan.chen@mediatek.com>
References: <1573616362-2557-1-git-send-email-ming-fan.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 18B0C01BE9F437EA852D0133948A87BA80A87B372A75DD0B5CDA87B20C5DC0AF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_193944_843961_7AF0C733 
X-CRM114-Status: GOOD (  10.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Joerg Roedel <jroedel@suse.de>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, linux-mediatek@lists.infradead.org,
 Ming-Fan Chen <ming-fan.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch add description for MT6779 SMI.

Signed-off-by: Ming-Fan Chen <ming-fan.chen@mediatek.com>
---
 .../memory-controllers/mediatek,smi-common.txt     |    3 ++-
 .../memory-controllers/mediatek,smi-larb.txt       |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
index b478ade..a5a7273 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
@@ -5,7 +5,7 @@ The hardware block diagram please check bindings/iommu/mediatek,iommu.txt
 Mediatek SMI have two generations of HW architecture, here is the list
 which generation the SoCs use:
 generation 1: mt2701 and mt7623.
-generation 2: mt2712, mt8173 and mt8183.
+generation 2: mt2712, mt6779, mt8173 and mt8183.
 
 There's slight differences between the two SMI, for generation 2, the
 register which control the iommu port is at each larb's register base. But
@@ -18,6 +18,7 @@ Required properties:
 - compatible : must be one of :
 	"mediatek,mt2701-smi-common"
 	"mediatek,mt2712-smi-common"
+	"mediatek,mt6779-smi-common"
 	"mediatek,mt7623-smi-common", "mediatek,mt2701-smi-common"
 	"mediatek,mt8173-smi-common"
 	"mediatek,mt8183-smi-common"
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
index 4b369b3..8f19dfe 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
@@ -6,6 +6,7 @@ Required properties:
 - compatible : must be one of :
 		"mediatek,mt2701-smi-larb"
 		"mediatek,mt2712-smi-larb"
+		"mediatek,mt6779-smi-larb"
 		"mediatek,mt7623-smi-larb", "mediatek,mt2701-smi-larb"
 		"mediatek,mt8173-smi-larb"
 		"mediatek,mt8183-smi-larb"
@@ -21,7 +22,7 @@ Required properties:
   - "gals": the clock for GALS(Global Async Local Sync).
   Here is the list which has this GALS: mt8183.
 
-Required property for mt2701, mt2712 and mt7623:
+Required property for mt2701, mt2712, mt6779 and mt7623:
 - mediatek,larb-id :the hardware id of this larb.
 
 Example:
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
