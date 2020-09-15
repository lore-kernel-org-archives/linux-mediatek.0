Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97A7C2D0E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 06:14:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A0E20732
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 06:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0sWIX/ja";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Dl1+pVDA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65A0E20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GPC9J/OKvWusjmG46qfnOVXpEXteGvUrCTEBQNN7IBc=; b=0sWIX/ja4Q+bnBnVrHGri4nS+
	Y/P5pC+32ee1doKVQJBgEoVOp3NeCrexV4PA31CA4UCCxSQmSOXZMmbufYuXhs018BI+0KdIS6PjA
	ln1jGkUS0VUA5zaNTm6olnHGq7tudNM3mKrGJ2i4rkrO6C8D8UZy9VAUiIVCBJm060+p9tbViSsOI
	Ba+MyQby1BJKDKDI+pz0B7Tyf8Toybr5b8iooL0LauTdzhQ4yCtDBQe8RLm24zLW4x2XvV08vd0A0
	EntlR84WkcLNzXgUbQK5WCAp+8sk5IlbkCQJ+6jMFc94TOK5If/funyJzC8AIR/dpHkzlIXtuRq0I
	EHXXf6Hgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI4E6-0006f0-Ut; Tue, 15 Sep 2020 06:14:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI4Dc-0006U7-Jh; Tue, 15 Sep 2020 06:13:33 +0000
X-UUID: a79a8e9f3a1e477b9e9d94d6fa08ae01-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=iHk/Tb8hmYsRyxGTjsN+iuA08DZBLpkgjndj3Jtnz5o=; 
 b=Dl1+pVDAF0qAv0GimU5TaPG9A8HBzxoKtNUSfS13aXxpYGsi8r1HngPiS4fPVbYr9MY61O7hZlaU2S9sAdi2ZGkL7najwMrac34LO6fKDwNOBX7w0gs23tSD0NuIbBOsXAVP13YrzsiKtbH/1v7OX63P4kPfsgL7vGsoXSOX3gY=;
X-UUID: a79a8e9f3a1e477b9e9d94d6fa08ae01-20200914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 470425809; Mon, 14 Sep 2020 22:13:23 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 23:13:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Sep 2020 14:13:19 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Sep 2020 14:13:19 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [RESEND 1/3] mmc: dt-bindings: add support for MT8192 SoC
Date: Tue, 15 Sep 2020 14:11:08 +0800
Message-ID: <20200915061110.25833-2-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200915061110.25833-1-wenbin.mei@mediatek.com>
References: <20200915061110.25833-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_021332_865890_17369D14 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: devicetree@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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
