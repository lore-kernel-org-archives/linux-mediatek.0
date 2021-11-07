Return-Path: <SRS0=P7oD=P2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B384C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Nov 2021 07:57:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A44D60E94
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Nov 2021 07:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A44D60E94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A9bfgtGtTLUpYk/ThBnbGWHUfyRQYnA3qGQd8bl2+SA=; b=Au6M3Pux1nLW82
	KcSbwneaBFyNfidzC/oubaBn5BI++RyB0Upv13etafCJSSFv55poLDuObqdR0xf/57PpCDzZUsp3m
	UrAC3dtbfV1OGDzcOK2HiuYKc3P/USrpveElC+uMY058CBx6eXb0v5WKNlwqOqsfMOZDxcgSc3FSq
	DZVhoOAMLgEZUV48D+N3dZPQOZ3dNM7siDZpijiE48yTgqbTRc/EhgXiWiaEc3BQDqyZVWAhzgKKG
	0hJIfPq6Aya10qPgci9Otw1rfz/CWBW3X3RkvJaa/+NLs8MPi7JT+gQtFXRZu8+xm1xR5ugePf7xx
	PR02vuElt4ZsVc8DBfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjd38-00E5iM-T8; Sun, 07 Nov 2021 07:57:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjd2t-00E5e8-K1; Sun, 07 Nov 2021 07:56:58 +0000
X-UUID: 070c1e4415be431898c963081b9f8366-20211107
X-UUID: 070c1e4415be431898c963081b9f8366-20211107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1800466806; Sun, 07 Nov 2021 00:56:51 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Nov 2021 00:56:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Sun, 7 Nov 2021 15:56:48 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sun, 7 Nov 2021 15:56:47 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yz Wu <yz.wu@mediatek.com>
Subject: [PATCH 1/6] dt-bindings: nvmem: mediatek: add support bits property
Date: Sun, 7 Nov 2021 15:56:41 +0800
Message-ID: <20211107075646.4366-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_005655_689137_D0380524 
X-CRM114-Status: UNSURE (   7.63  )
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

Add support bits property, will satisfy more consumers.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
Need convert mtk-efuse.txt into yaml first?
---
 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
index b6791702bcfc..ec70c5b7a340 100644
--- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
+++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
@@ -10,6 +10,7 @@ Required properties:
 	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
 	      "mediatek,mt8516-efuse", "mediatek,efuse": for MT8516
 - reg: Should contain registers location and length
+- bits: contain the bits range by offset and size
 
 = Data cells =
 Are child nodes of MTK-EFUSE, bindings of which as described in
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
