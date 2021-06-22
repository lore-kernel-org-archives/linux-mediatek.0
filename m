Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4774BC48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:28:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D334611BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D334611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yESPpl5lXkULW/4hgoBUu19JYgBc2sBWtUxOAdShC0w=; b=rZTAvbt/RxZLvt
	nl4ytPHop4FYVs9dJqt4IdNaoxg8PSQYNrB+cGThlgwYHzZRu+2w1rL8A9OG973Kl2e1455AARl2G
	M0ceRtZFwN1gLH9IZhFAyObJ/2o4VROvx6ifq/UwG488mdp102xA2kEU/ELBWEBRe3SOYDwiyQxmK
	9gnYeD+zcvNEV0JiMeiWqmASWbmEdua6pgphNCuKMTdYo/y89mzC6CTdWDqQnNRFxBNsYQg8+YeKv
	eGmbJvAlA8LPZbCpgaBi9Scc4yqFLzYUCdycV4q3UBGgJoIjAABbowe0yjOCxiBcUC2lmwOfSf4i/
	ml0jLhiZmpaFR6aY5Vsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lviK1-007h5E-CW; Tue, 22 Jun 2021 15:28:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lviJa-007gvQ-8O; Tue, 22 Jun 2021 15:27:51 +0000
X-UUID: 63aeae724cfd407b92fa832d9bef3b74-20210622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0LcZeLEddqgeXo2eLx6vCab58kj7T9Vue7ZTlbx9Mik=; 
 b=no9YhV5LXUsZ/lx1j1/pvvYuAxLvAfy+LUSfhSB71FgjCmnaQvGQ5x0iF3ehBuVJpxleY0mNEnHL6H8j/5e7/f1Fx64xFpFZl+l3RQ8jpq+bYzASmrDE1OpQ4YFR5EVRnualsuni01LDWayBZLuz17CnU2kA4dTeWSbkJY6IAb8=;
X-UUID: 63aeae724cfd407b92fa832d9bef3b74-20210622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <christine.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1023174189; Tue, 22 Jun 2021 08:27:46 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 08:17:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 23:17:37 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Jun 2021 23:17:36 +0800
From: Christine Zhu <Christine.Zhu@mediatek.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <seiya.wang@mediatek.com>, christine.zhu <Christine.Zhu@mediatek.com>
Subject: [v2,1/3] dt-binding: mediatek: mt8195: update mtk-wdt document
Date: Tue, 22 Jun 2021 23:17:32 +0800
Message-ID: <20210622151734.29429-2-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210622151734.29429-1-Christine.Zhu@mediatek.com>
References: <20210622151734.29429-1-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_082750_327243_B9159ABF 
X-CRM114-Status: UNSURE (   9.36  )
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

Update mtk-wdt document for MT8195 platform

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
