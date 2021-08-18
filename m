Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0722BC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 02:41:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B22E860F39
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 02:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B22E860F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeRUkhuBPPGSI7FYWmAb8mdvstX2xYu9cfyP7zfuhXE=; b=dIUd8adrxIejH3
	5IjXILZ5jDPhuh1TJ0cur8LFoDBTKpyF8o5Zzf6Uwia2l/xmJOCLgYhY1qahc+66K7aYDC7GqW7IM
	CY1+r6g6fmvYM/atFRO6paWf1fpoUvNVi85mke90L9sZJSPpHxA6LL0Ule5nnnphlw8E0J3otOjzb
	f25LGNVoObkRD2pt7v/duyGPHXJDNPjKA+ERJ+h8RREgTlVU5GhdxHFFFMMQccbxdNLpj65cPPLEe
	rkLaijDdkFXFfluLG6qNBszJ7jKBnQn4oPQm84YZDolGTW2C9nIAOcJrkMkgbqVQ5OsvSrkP3mYFx
	QViM2kZ9tRIHzi4rRLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGBVd-003ybw-Vx; Wed, 18 Aug 2021 02:40:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGBVW-003yZu-Nr; Wed, 18 Aug 2021 02:40:52 +0000
X-UUID: d731c17b3f854b0d917b2f54a0172b63-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BhBz8D9XsYKoCbsNTLQpD3iG7k2SXLZSrE8tbyEe4Fk=; 
 b=C9kjpSxQebSWeO7KEDiingmHYvlW0D4BLz0FZ5SsdGOMRVQi5XOkFmX59C1gKKDRBTp9I5kn78sv4P1mQV5pV2tG7Rv4HzYQR9h/BOWaBxQJgJrlzCKQjA8QH8q3CBCjc1FYGpaj0F4O7KwZd2oOdascdO8coNjYTbosXpREKOw=;
X-UUID: d731c17b3f854b0d917b2f54a0172b63-20210817
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1159855982; Tue, 17 Aug 2021 19:40:41 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 19:40:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 10:40:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Aug 2021 10:40:38 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, <chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <hsinyi@chromium.org>, <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>, 
 <singo.chang@mediatek.com>
Subject: [PATCH v5 1/5] dt-bindings: mailbox: add definition for mt8195
Date: Wed, 18 Aug 2021 10:40:33 +0800
Message-ID: <20210818024037.11396-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210818024037.11396-1-jason-jh.lin@mediatek.com>
References: <20210818024037.11396-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_194048_229002_01E46E62 
X-CRM114-Status: GOOD (  11.74  )
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

Add definition of compatible and dt-binding header for mt8195.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index 7771ecaac586..a036fb5407bb 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -9,8 +9,8 @@ CMDQ driver uses mailbox framework for communication. Please refer to
 mailbox.txt for generic information about mailbox device-tree bindings.
 
 Required properties:
-- compatible: can be "mediatek,mt8173-gce", "mediatek,mt8183-gce" or
-  "mediatek,mt6779-gce".
+- compatible: can be "mediatek,mt8173-gce", "mediatek,mt8183-gce",
+  "mediatek,mt6779-gce" or "mediatek,mt8195-gce".
 - reg: Address range of the GCE unit
 - interrupts: The interrupt signal from the GCE block
 - clock: Clocks according to the common clock binding
@@ -36,8 +36,9 @@ Optional properties for a client device:
   size: the total size of register address that GCE can access.
 
 Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h',
-'dt-binding/gce/mt8183-gce.h' or 'dt-bindings/gce/mt6779-gce.h'. Such as
-sub-system ids, thread priority, event ids.
+'dt-binding/gce/mt8183-gce.h', 'dt-bindings/gce/mt6779-gce.h' or
+'dt-binding/gce/mt8195-gce.h'. Such as sub-system ids, thread priority,
+event ids.
 
 Example:
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
