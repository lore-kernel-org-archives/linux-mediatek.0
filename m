Return-Path: <SRS0=+xT1=ZE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F119C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 08:39:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D176421783
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2019 08:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OXcgPm5k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="I5PhNk/J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D176421783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nr9kyERNG/2lNy45P5zOw7IwexCWTeRtxk1RXuGnDAA=; b=OXcgPm5kfbUM8Q
	tcbTeLNQ4G9FCV626PWwsVZoDd6AIcNTAVmgDu6+X1vvaEMU5OhNleq46Qu69jaudXzbKMU+b/vjz
	ptR9UzhRvmlE1LVOmKVDHgZb8JPM2f/+HiKWd9xELEUnwKJGwLF12bS3S8odR5yaqA9cXu8Am+bZu
	L5qW5SjcdgpnVqRZ27rSNq9kBv2mNogi9IeGHIU7WOTQOvcTq8WA8ICim6CJ1WScaj646DNiLH2W3
	lR54+oBwCi9MycBpG/bEoOo2MqkgMjh0q5LJbhcnkwKlZ+awD/qMT7fxWFqVgEqGMpEdJGr2WJ8vl
	PVVw4N6uRS5LR7QbnJ5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iURi9-0005vY-9X; Tue, 12 Nov 2019 08:39:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iURfj-0003Pi-3c; Tue, 12 Nov 2019 08:37:14 +0000
X-UUID: 7ff9b305c153461b80bbef0e4dbdb944-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YDyC4vE1LT6UGA9FokW0xuntnFb/lqIksmsfb1iEmGo=; 
 b=I5PhNk/JL48bqjvsBqnycqcDqaM+/B8GoMQ4hHfi4S8xPckq0RVPut8HS/z2QSAoWSlUqnmE4FIsNmyp5KfzcIeNs80ukaOCclomGoweF1LZPHciOGG0RzNOrJlNcvKk9Bg5P9s21sUr1Md7sZJHMC4Fg7pFDUbLLgiD700oECo=;
X-UUID: 7ff9b305c153461b80bbef0e4dbdb944-20191112
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 907768974; Tue, 12 Nov 2019 00:37:20 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 00:37:01 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 16:36:57 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 16:36:56 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 05/11] dt-bindings: phy-mtk-tphy: add the properties about
 address mapping
Date: Tue, 12 Nov 2019 16:36:30 +0800
Message-ID: <1573547796-29566-5-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1573547796-29566-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1573547796-29566-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D837A91406C3E759364983B3845125D4B80AF8610B8E41D50E5E5F4FA87F14902000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_003711_288367_5C8AA8F0 
X-CRM114-Status: GOOD (  12.65  )
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
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add three required properties about the address mapping, including
'#address-cells', '#size-cells' and 'ranges'

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v3~v4: no changes

v2: add Reviewed-by Rob
---
 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
index a859b0db4051..dd75b676b71d 100644
--- a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
+++ b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
@@ -14,6 +14,16 @@ Required properties (controller (parent) node):
 		  make use of "mediatek,generic-tphy-v1" on mt2701 instead and
 		  "mediatek,generic-tphy-v2" on mt2712 instead.
 
+- #address-cells:	the number of cells used to represent physical
+		base addresses.
+- #size-cells:	the number of cells used to represent the size of an address.
+- ranges:	the address mapping relationship to the parent, defined with
+		- empty value: if optional 'reg' is used.
+		- non-empty value: if optional 'reg' is not used. should set
+			the child's base address to 0, the physical address
+			within parent's address space, and the length of
+			the address map.
+
 Required nodes	: a sub-node is required for each port the controller
 		  provides. Address range information including the usual
 		  'reg' property is used inside these nodes to describe
-- 
2.23.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
