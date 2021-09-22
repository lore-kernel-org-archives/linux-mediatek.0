Return-Path: <SRS0=6VVk=OM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5195DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 07:12:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 175276120C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 07:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 175276120C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dxdifaauPVxHxtJn9AO8Y6kHf3ac54k/PrSCsJCDb0k=; b=cW2nabd6pDCpM8
	4WS1QvhZX3IZ6RTfwswVPjJQ+CclbE8QfdN41CkLEdmO5WchsixLdFDwy27uayrF1YdOQyQ8y3HXx
	WV7mTqOEoE4YApQnQisQaSz6fp/PmqvsZOKoZe2aqfPNaPM4b9XVi5dvwS/iWEcf5Gf5lLGOI9HJX
	F9NJn9YAvhUG+bHyNLFOts2onxQKMWtpntT79WixtN5rDXnSMqKaQDa8xQkBPegZ5dQqxM9pDZiEw
	8bcsSBAwMPUILXpSZ18Fhjy5bDNt5mRBA2B+mDc8N8hCFEH4ZjCxv1nL3i5Fo2sSRfgYbDn1vE3VR
	nKY134tgn0g0BoMNs0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSwQB-007GMR-4z; Wed, 22 Sep 2021 07:11:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSwPq-007GGw-8W; Wed, 22 Sep 2021 07:11:40 +0000
X-UUID: f65b01a1761641e09f96c147ce495f7d-20210922
X-UUID: f65b01a1761641e09f96c147ce495f7d-20210922
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 450651428; Wed, 22 Sep 2021 00:11:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Sep 2021 00:08:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 22 Sep 2021 15:08:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 22 Sep 2021 15:08:46 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jason-jh Lin
 <jason-jh.lin@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>, Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] dt-bindings: mailbox: fix incorrect gce.h file paths
Date: Wed, 22 Sep 2021 15:08:45 +0800
Message-ID: <20210922070845.5108-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_001138_364158_D44FFD40 
X-CRM114-Status: GOOD (  11.11  )
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

A few *gce.h file paths are not in 'dt-bindings/gce/<chip>-gce.h'
format. To fix it, replace 'dt-binding' with 'dt-bindings'

Fixes: 0553fb51686e ("dt-bindings: mailbox: add definition for mt8195")
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index 89a59b9c81f9..98fe37e8b17b 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -40,8 +40,8 @@ Optional properties for a client mutex node:
   defined in 'dt-bindings/gce/<chip>-gce.h'.
 
 Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h',
-'dt-binding/gce/mt8183-gce.h', 'dt-binding/gce/mt8192-gce.h',
-'dt-binding/gce/mt8195-gce.h' or 'dt-bindings/gce/mt6779-gce.h'.
+'dt-bindings/gce/mt8183-gce.h', 'dt-bindings/gce/mt8192-gce.h',
+'dt-bindings/gce/mt8195-gce.h' or 'dt-bindings/gce/mt6779-gce.h'.
 Such as sub-system ids, thread priority, event ids.
 
 Example:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
