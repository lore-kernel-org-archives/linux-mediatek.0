Return-Path: <SRS0=SDo2=LO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A880AC48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 13:50:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F63061007
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 13:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F63061007
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1WMPpnNVl1uvwFCI8khXtwFIRhBqAkfSS6fm/PbrPU=; b=PVRY4Sye0kM9ab
	sjKEarm/h3GhOl/4nm+VoCaltS+GqxErHoOi+JpmoO7As0LvixYJJNxiwGRD5N9DsnMm4kkQxV8ad
	lew1mbZvQX/pF0C017rI6d3NBF9SEX3i4qZYZovQ/jlm62EHa9ZtUEdjF7Bam/ajy55dz/IyQ/FhR
	ww8bWz35ZHdFFanhj8xKf86KZ9mN8ObSeUt8+Yh4Ipy0xTxwS6ay9zp55WyTbuUPZ++AxAvrRCeEl
	CvXZq1ODizCsvw1VOZnDsLwhYNGfAf7MTugxQKG1OODL3eTp9GhY6NHjBNBnv3x2WydLeHOiwvYs1
	iNXyv1U27XeAHNjc8Lhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luxq7-0016od-V4; Sun, 20 Jun 2021 13:50:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luxpu-0016l4-J8; Sun, 20 Jun 2021 13:50:09 +0000
X-UUID: 505b48844af44f40ad98a942b180e1d8-20210620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TXVhXisbhASATXnSBYoXbuxknYHTEMkC/hOJ7HsN2ec=; 
 b=gctAjimazj71tC8JfLN0NO0dReKt9nF5LwH2UEJoZjhvYTJUMrYIlBifWQ0EfN7OyMuaZEQLFieXGAN7PAvCXDolt8bDutrJ1MhiOm0cIjnizGnfellqLexgq6OIxUurmxJV7gZFqMiA4EPDfJQpAud2z3z836QG1DhoV4VZrTU=;
X-UUID: 505b48844af44f40ad98a942b180e1d8-20210620
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <christine.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1563345; Sun, 20 Jun 2021 06:50:02 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 06:50:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 21:49:58 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 20 Jun 2021 21:49:58 +0800
From: Christine Zhu <Christine.Zhu@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <wim@linux-watchdog.org>,
 <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <seiya.wang@mediatek.com>, <linux-watchdog@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <srv_heupstream@mediatek.com>, christine.zhu <Christine.Zhu@mediatek.com>
Subject: [v1,1/3] dt-binding: mt8195: update mtk-wdt document
Date: Sun, 20 Jun 2021 21:49:52 +0800
Message-ID: <20210620134954.15233-2-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210620134954.15233-1-Christine.Zhu@mediatek.com>
References: <20210620134954.15233-1-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_065006_678950_9BA770A1 
X-CRM114-Status: UNSURE (   8.74  )
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

From: "christine.zhu" <Christine.Zhu@mediatek.com>

update mtk-wdt document for MT8195 platform

Change-Id: Id18393e8deff2c3492e21c85e97a28e88bc9ca0f
Signed-off-by: christine.zhu <Christine.Zhu@mediatek.com>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index e36ba60de829..64d812893dba 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -13,7 +13,7 @@ Required properties:
 	"mediatek,mt8183-wdt": for MT8183
 	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
 	"mediatek,mt8192-wdt": for MT8192
-
+        "mediatek,mt8195-wdt": for MT8195
 - reg : Specifies base physical address and size of the registers.
 
 Optional properties:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
