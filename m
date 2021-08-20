Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABED7C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 02:36:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42B0660E90
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 02:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42B0660E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Oaac7yBzqVGkJdqfe4V3GrllMcY2eCu/ff/Zd/dD+z8=; b=EuaCKJ3P60SWTV
	dO2kY6l7ZpUd6yRslfqTPfqxmA/3WuvSOR2hnt0P+LmRCy/hRxOb1jrAXaGFdGc+Koopi22dmRkWv
	MW48mGj15f3eK2qZsn5ny1vYMBrUVI/oJAMEJH2OpfxPoi3/AqyCv5LgkaPpv6B6E9CnrgDtDy0mR
	sfcmt4nSeMVFlpueMWUGhyQIxbUDz0jhu5B+6f2tW/GuuCwI2H7agzIwmOtWjJmoerreo8dsmz7Ny
	jA19COp8vjTmX8Bq5J908Pz3m2imqBXzoFfheo2VGhpbuZJjhe7yt5uTN+m+5zH7Y7ev0S3GrlAiP
	XbHPAII2Ta6YO0y8L5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGuNm-009v0l-JK; Fri, 20 Aug 2021 02:35:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGuNV-009uz7-QJ; Fri, 20 Aug 2021 02:35:33 +0000
X-UUID: 92d49c2350c449319b72182b1aa88633-20210819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tgkI4mKUnI8RVPNUiTa1OdKhd8xito3u2qQFNzPNJDw=; 
 b=ifoR+S4WVLMqvu+OL7PBwyaVbq6AHk9+GINBLCLrAv61vo/8bpoapMQQjQAt4RHm8SoXdPUi74Ew5eac6TLZx6NoUBuroR1V9ZqmvUIpUGdvfxojzlgjDBt29cQ7IvqlBnfkOFVTE0y9ReWuH01AWWo5mtz1gs5xeYDGxqQi5OE=;
X-UUID: 92d49c2350c449319b72182b1aa88633-20210819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1171013177; Thu, 19 Aug 2021 19:35:26 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 19:35:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 10:35:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 10:35:22 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Jianjun Wang
 <jianjun.wang@mediatek.com>, <Rex-BC.Chen@mediatek.com>,
 <TingHan.Shen@mediatek.com>
Subject: [PATCH] dt-bindings: PCI: mediatek-gen3: Add support for MT8195
Date: Fri, 20 Aug 2021 10:35:21 +0800
Message-ID: <20210820023521.30716-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_193529_902743_37F81C41 
X-CRM114-Status: GOOD (  10.98  )
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

MT8195 is an ARM platform SoC which has the same PCIe IP with MT8192.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 742206dbd965..dcebb1036207 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -48,7 +48,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt8192-pcie
+    oneOf:
+      - const: mediatek,mt8192-pcie
+      - const: mediatek,mt8195-pcie
 
   reg:
     maxItems: 1
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
