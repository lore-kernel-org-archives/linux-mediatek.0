Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD8AC43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 06:11:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA274206B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 06:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jpqEw9ez";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GGRcZNpT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA274206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GPC9J/OKvWusjmG46qfnOVXpEXteGvUrCTEBQNN7IBc=; b=jpqEw9ezwwnZrvCToJgSrKirr
	g9g54h5FhTtrE/mJ+2zoY5T3CSEnqVWkltgfNaIQmkQAyyErT10A+kEVIc/l6XMeZzHFyBbxxBCN3
	C4zKgUps1Gg6gf6kxWNXSVWseeJh6AFIsHnfSCSG/Ri7LRvRagDmep0eqSlXxxGsmUR3mVRxvTzvf
	fOEbyAOmxtnDz0IGLtMqF8fjdJwiysR0k994FD3EouxctdOOKqpH4UfNz24KN2/WbD5av/O4SHDhX
	Q9F27C/qcQWwDHw077ciNLSEUDcvclqNoI+xH6YqNMMo00j9iFH2c2lDPkf8hk1YqgMDi4zw4y8jS
	kbZJ7I4+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI4B3-00062y-Gv; Tue, 15 Sep 2020 06:10:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI4Az-00061y-Vc; Tue, 15 Sep 2020 06:10:51 +0000
X-UUID: c808474d71b446d2adb3847a4f3411ae-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=iHk/Tb8hmYsRyxGTjsN+iuA08DZBLpkgjndj3Jtnz5o=; 
 b=GGRcZNpT/LvqPJP2ElaNa822WvYBDcRhLbsBSY7L3aNQda1xPuI5ERHrA8E+UFdjcvm1MVW515CQtR3UqXcH8iwONBpPMan72nxXKgX+5xacyvga5ej3+fs4E9fB5mmj8HwLneIPL4T+4Y8xZbJMZ/kdHuFvtcyBxIgZas9JtGw=;
X-UUID: c808474d71b446d2adb3847a4f3411ae-20200914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1761968399; Mon, 14 Sep 2020 22:10:47 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 23:00:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Sep 2020 14:00:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Sep 2020 14:00:43 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: 
Subject: [PATCH 1/3] mmc: dt-bindings: add support for MT8192 SoC
Date: Tue, 15 Sep 2020 13:58:33 +0800
Message-ID: <20200915055835.25590-2-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200915055835.25590-1-wenbin.mei@mediatek.com>
References: <20200915055835.25590-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_021050_310316_87DA7734 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8192 mmc host ip is compatible with MT8183.
Add support for this.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
index 26a8f320a156..6422ad7d439d 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
@@ -10,7 +10,7 @@ Required properties:
 - compatible: value should be either of the following.
 	"mediatek,mt8135-mmc": for mmc host ip compatible with mt8135
 	"mediatek,mt8173-mmc": for mmc host ip compatible with mt8173
-	"mediatek,mt8183-mmc": for mmc host ip compatible with mt8183
+	"mediatek,mt8192-mmc", "mediatek,mt8183-mmc": for mmc host ip compatible with mt8183
 	"mediatek,mt8516-mmc": for mmc host ip compatible with mt8516
 	"mediatek,mt6779-mmc": for mmc host ip compatible with mt6779
 	"mediatek,mt2701-mmc": for mmc host ip compatible with mt2701
@@ -27,6 +27,10 @@ Required properties:
 	"hclk" - HCLK which used for host (required)
 	"source_cg" - independent source clock gate (required for MT2712)
 	"bus_clk" - bus clock used for internal register access (required for MT2712 MSDC0/3)
+	"sys_cg" - msdc subsys clock gate (required for MT8192)
+	"pclk_cg" - peripheral bus clock gate (required for MT8192)
+	"axi_cg" - AXI bus clock gate (required for MT8192)
+	"ahb_cg" - AHB bus clock gate (required for MT8192)
 - pinctrl-names: should be "default", "state_uhs"
 - pinctrl-0: should contain default/high speed pin ctrl
 - pinctrl-1: should contain uhs mode pin ctrl
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
