Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64321C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 02:27:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26BCA60ED3
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 02:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26BCA60ED3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=knl0n4FAf7Z0DUHbe7g5l4B+33kF6YKR4b+rwvh5LAo=; b=FAQOrYdV8KNXMM
	NP3zoCgNY0jAjh9iYqTkCDLc0ViE7PsUIANauB4YEK7i2uMXqQhSxKUdkAxkiAgZNr6JLMrqOhICi
	yLW35cqU0l/2LxlAQJSlM/DQQaXWeBXXD1EZvYXpqQ7LN8AQGrmUodlggclEblmIqo0hgQAuHa8c5
	jHNxZ4iKnjJA7qg5ZcAiFJkkCwCrSmammdSAmjufv6xCmpnS2DFILhFiZUH4qpFxv1ibAWR/TiThm
	rOCJ8r0IZ9vhBLJRjZvK1D7owj7hhIV/D1hQkhMa0jUKzQhzGBQ31/yoL2pVCGYAxNf4uYrhnCdhP
	4SxRIObsy5FIxFF1pw5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJRaR-00BMXd-GG; Fri, 27 Aug 2021 02:27:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJRaB-00BMWX-7k; Fri, 27 Aug 2021 02:27:07 +0000
X-UUID: 3232fdfe10b347dbb7b59e14abf04e9e-20210826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=wVyL/gNGckXkJsKBt1SHmBTYgloQc7w8N8BYlLGR3VA=; 
 b=Gq0FtchQelvpSHXfog0+Z1dapYMemBfSY0QZmFYTyy8k2ct4SPli3lE8xIPEZiZ5AfuHeYlE++8JV65Y7niLB5NWbTVyGvg9oyXQ2At57oLuIbYtokcss7ljztGkjbQI4SiJsq33Txplu1XyanVsdIlmfFhG2aLB1WbXVUpZ5pE=;
X-UUID: 3232fdfe10b347dbb7b59e14abf04e9e-20210826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1492160727; Thu, 26 Aug 2021 19:26:55 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Aug 2021 19:26:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Aug 2021 10:26:52 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Aug 2021 10:26:51 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Jianjun Wang
 <jianjun.wang@mediatek.com>, <Rex-BC.Chen@mediatek.com>,
 <TingHan.Shen@mediatek.com>
Subject: [PATCH v2] dt-bindings: PCI: mediatek-gen3: Add support for MT8195
Date: Fri, 27 Aug 2021 10:26:38 +0800
Message-ID: <20210827022638.3573-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_192703_324348_E579E520 
X-CRM114-Status: GOOD (  11.23  )
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
index 742206dbd965..93e09c3029b7 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -48,7 +48,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt8192-pcie
+    enum:
+      - mediatek,mt8192-pcie
+      - mediatek,mt8195-pcie
 
   reg:
     maxItems: 1
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
