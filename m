Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0CAC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 12:26:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC052080D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 12:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QUj1Trpn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ubl61wd6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AC052080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/dKVD472CB6xLQE/TutXGRgcQAAeRJUgq0itqhy2lbE=; b=QUj1TrpnRiCnJRwdozEuHGm9qA
	Zip+f9VSlls8Vu8+X92u1WY6/MwJcVUgWBjaoBsmvkFpAQTyCX+amn1fJB2tv688kFC8lecylXkHn
	cmWboI5/RsJVH8dWYZxO/OVIGDno7BASjcbzLx8Ix8+jjhIa8R4zKYb7j9Ky1SVJ+cRVBNcwVrT9x
	Sh1dH2NMHBe+6A8L3615MHuxoRzpYZwc/dr4A14dSvvTQZtiQ+Sq0cpmAdRkO7YSsUjK+HOhDoZMc
	YuR5/AbTWUx5iSzWsobhKNv8sNfJW56wbJYeBRiZjr99ghdw9Qj4Ut0N1fGoDYNTliHxvEM82pqXH
	RRT7ll4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxrLG-0003nd-Nj; Tue, 21 Jul 2020 12:25:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxrLC-0003md-Ow; Tue, 21 Jul 2020 12:25:52 +0000
X-UUID: aab40d9f7ee84a4ca7b28a2c4587fbf0-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=I5qCZqBRV+2VOZzfioMnSvweQlA+vBG8FfwN7R6jXJY=; 
 b=Ubl61wd6rgkG2oZao19cCHm+RIZUPECS1UDYFiItGgEKToSCwmwlk7S3+PTI32u9COUwM7xVqXlxHI7vNs7uVkgBqpMjVfMagBRF66OjxmzPoJ21Iddc4QRSi2KIw2dhwPrbwCde/AmBSWOTZwmVAOoWu0zOjJXRwRgziosFWnA=;
X-UUID: aab40d9f7ee84a4ca7b28a2c4587fbf0-20200721
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 640241301; Tue, 21 Jul 2020 04:25:36 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 05:25:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 20:25:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jul 2020 20:25:40 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: spi: update bindings for MT8192 SoC
Date: Tue, 21 Jul 2020 20:24:35 +0800
Message-ID: <20200721122436.31544-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 72B095B7B8A679250F59B56A5CE529D5EEDBD1B4A214E6C132DBB5A7CD1C8D532000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_082550_934946_8075DCB0 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 "leilk.liu" <leilk.liu@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "leilk.liu" <leilk.liu@mediatek.com>

Add a DT binding documentation for the MT8192 soc.

Signed-off-by: leilk.liu <leilk.liu@mediatek.com>
---
 Documentation/devicetree/bindings/spi/spi-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
index 3a8079eb18c8..9e43721fa7d6 100644
--- a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
+++ b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
@@ -11,6 +11,7 @@ Required properties:
     - mediatek,mt8135-spi: for mt8135 platforms
     - mediatek,mt8173-spi: for mt8173 platforms
     - mediatek,mt8183-spi: for mt8183 platforms
+    - "mediatek,mt8192-spi", "mediatek,mt6765-spi": for mt8192 platforms
     - "mediatek,mt8516-spi", "mediatek,mt2712-spi": for mt8516 platforms
 
 - #address-cells: should be 1.
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
