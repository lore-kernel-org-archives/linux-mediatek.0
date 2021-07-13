Return-Path: <SRS0=Rt7e=MF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E43C07E9A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 02:16:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1432611F1
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jul 2021 02:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1432611F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQOPvoi4r3ikHa2cCcUz6uU/NuB/A1MJe0f9uG5sXsA=; b=beN2Rys1ms8WQE
	4Cy59eyMsBbr1Ezb21YfvCC6hTkdLPJ6bEHL2AUbXSdN+rKx9lqyhedhuoGoZ2LzLgPc7lf8NHhyN
	MXC9EfvTv1davqpWFEQL2hZft5hSqwVKQSALHyiuEQOR0zioS9nhLePdhjUCJR6E72ar012J77N2N
	87YKWuY7F81nUF0SUgoDcf+eMT6WGleocuGE6GxQHeu3RjI5vGykcJsIIuxbDyhaKUWJHjqFnq4Hv
	tCJiA2g9ZrIhzHD1tM1OmD7VV5JdYiCUG5jojqEsDyxwvuPASfWMhaH6nNuwGcnSREoMe4qveC3Am
	brNnpx+VKrR/jH3Yciww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m37y4-008vDl-C1; Tue, 13 Jul 2021 02:16:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m37xr-008vCg-Oz; Tue, 13 Jul 2021 02:16:05 +0000
X-UUID: f6b9ed815b70447580b1a0863ea46e67-20210712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9AxfjGHysYDxKb7sU+QWyQOwqB3WI40p/qjDJzBQ30s=; 
 b=E3UZ5Fp0MkixpN3+kpcaisCwF4MHIxn24biY0KDcDLFJNKAOHBJYY8UHwyv4ssClkLFj/uzt7KTk5NQj+Cvk9PZ7G20exwPOTVd7nMnl7rVWBvHy1AQ5nkku/FpGxJBViMUMRVWYYh/ykY95z/pE1r+5t4s+ipE68wNwkiRozKg=;
X-UUID: f6b9ed815b70447580b1a0863ea46e67-20210712
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yt.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1896045469; Mon, 12 Jul 2021 19:16:00 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 19:05:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Jul 2021 10:05:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 13 Jul 2021 10:05:56 +0800
From: YT Lee <yt.lee@mediatek.com>
To: <yt.lee@mediatek.com>, <roger.lu@mediatek.com>, <matthias.bgg@gmail.com>, 
 <eballetbo@gmail.com>, <khilman@kernel.org>, <robh+dt@kernel.org>,
 <drinkcat@google.com>, <sboyd@kernel.org>, <p.zabel@pengutronix.de>
CC: <srv_heupstream@mediatek.com>, <fan.chen@mediatek.com>,
 <xiaoqing.liu@mediatek.com>, <charles.yang@mediatek.com>,
 <angus.lin@mediatek.com>, <mark.rutland@arm.com>, <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <linux@roeck-us.net>,
 <louis.yu@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: soc: mediatek: add mt8195 svs dt-bindings
Date: Tue, 13 Jul 2021 10:05:51 +0800
Message-ID: <20210713020552.18667-2-yt.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210713020552.18667-1-yt.lee@mediatek.com>
References: <20210713020552.18667-1-yt.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_191603_859849_61567A0F 
X-CRM114-Status: UNSURE (   8.23  )
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

Add new binding documentation of the mt8195 svs.

Signed-off-by: YT Lee <yt.lee@mediatek.com>
---
 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
index 59342e627b67..fdd656448454 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
@@ -23,6 +23,7 @@ properties:
     enum:
       - mediatek,mt8183-svs
       - mediatek,mt8192-svs
+      - mediatek,mt8195-svs
 
   reg:
     maxItems: 1
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
