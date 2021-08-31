Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B171C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 07:10:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07F5A60200
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 07:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07F5A60200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKr9L5hXeN4btcI0PFQYC25YMBdEGi4LCRoQavJVuIw=; b=Elvh4ZcngAKI+c
	eIXx1g5XopcBEVCatWWZfIDUb4p+lG0K4Ip+n/MBMKwPBtXQ0gCurtX388+hxStMebk+LTm9rqgJX
	pWziolmLEFyIcRSAxkfO7RbAZrfw9IZvEWqDiFMp0ymxagFGMVJR198iNuJz9nP8uENYOd4gh+wj5
	SN3KyOc1P2m1GRrOOsJQbMh0oOcVIpbGfgmUHFUobMz90UMmmZhAmZy9wDsr1cQzXIkHz7pF0m7r3
	+lquth6YdXmnwwMmeiggB9yW0VT5BToJ3RMIVezKWqKG8k4SfNXb1YT8i1u0TumAQ+SmEPol7Dl2P
	1EeVvGadMXlihy7Fosrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKxui-001W9C-Nb; Tue, 31 Aug 2021 07:10:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKxtt-001Vkz-14; Tue, 31 Aug 2021 07:09:44 +0000
X-UUID: 4337eac080384f6c8d219ee51b3ab6a3-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=J96L/26DwaOBnwK8P5eJ9b8nroA/1GGE8cVfHO9YAqs=; 
 b=CMJzlhvlQq81syhXtqa0h7QAGjxMFoo8NA+5Y0BuA9DeSQft3vQb9AkCWiPigYF6OYESj3hHNo5c4pNyb/Q0l2IGobGDyNl832/6fqmOZ5EZSSsmOBPUECtXbj0e0Lc0BLRagUJ6IDSB7oGLIJrukxhDIaDQV6yRLU2uMmhhxR8=;
X-UUID: 4337eac080384f6c8d219ee51b3ab6a3-20210831
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2084970245; Tue, 31 Aug 2021 00:09:39 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 00:09:09 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 15:09:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 31 Aug 2021 15:09:08 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jassi Brar
 <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <hsinyi@google.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v7 1/5] dt-bindings: mailbox: add definition for mt8195
Date: Tue, 31 Aug 2021 15:08:59 +0800
Message-ID: <20210831070903.8672-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210831070903.8672-1-jason-jh.lin@mediatek.com>
References: <20210831070903.8672-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_000941_132217_4C3D7A5D 
X-CRM114-Status: GOOD (  10.86  )
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
 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index ac4245050d17..8e81916556a3 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -10,7 +10,7 @@ mailbox.txt for generic information about mailbox device-tree bindings.
 
 Required properties:
 - compatible: can be "mediatek,mt8173-gce", "mediatek,mt8183-gce",
-  "mediatek,mt8192-gce" or "mediatek,mt6779-gce".
+  "mediatek,mt8192-gce", "mediatek,mt8195-gce" or "mediatek,mt6779-gce".
 - reg: Address range of the GCE unit
 - interrupts: The interrupt signal from the GCE block
 - clock: Clocks according to the common clock binding
@@ -36,9 +36,9 @@ Optional properties for a client device:
   size: the total size of register address that GCE can access.
 
 Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h',
-'dt-binding/gce/mt8183-gce.h', 'dt-binding/gce/mt8192-gce.h' or
-'dt-bindings/gce/mt6779-gce.h'. Such as
-sub-system ids, thread priority, event ids.
+'dt-binding/gce/mt8183-gce.h', 'dt-binding/gce/mt8192-gce.h',
+'dt-binding/gce/mt8195-gce.h' or 'dt-bindings/gce/mt6779-gce.h'.
+Such as sub-system ids, thread priority, event ids.
 
 Example:
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
