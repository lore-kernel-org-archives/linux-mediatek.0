Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A78C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 03:41:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A8A61038
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 03:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7A8A61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gi6DZwlfOKBKytV2msIz0HWAKE1blOel9qieiHNDOM=; b=SGIWpaW29mBja9
	b6skaag4yYKxuq2EEDD7L+GIr9r2z7mumgO3kvSCl7hGjV8eNIRuHB9hf9sEpZz9NLNI6TY4ZtKGq
	dIhTJbVGGUB+Z5wamPB8Grxy94mBjt7uaDdVcWxEtE+q9Agp8jgaZQgfVP3KBoylP6zCSkq36h+b4
	EH3tEaS9iPWtWBSXaYrMfYbF8QNRP0y5zpGvGmZp8KHSmSqAr2E5IT8uVP66OQvqAzUA++icfJYNC
	jWLoxfa/pV6R8MaXgX683Y8GjJovu8PIFYMlVGq5bHZxrVf1Zs3ZFc/0UazMn2KTKRMzmpPRFqVfw
	Iu3eybPzqkyTNsqT9OtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTc5Q-00D0zo-2p; Fri, 24 Sep 2021 03:41:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTc42-00D0Nx-0P; Fri, 24 Sep 2021 03:39:55 +0000
X-UUID: 6fe6b7d0db7c46b5b5992dcc6c0ae372-20210923
X-UUID: 6fe6b7d0db7c46b5b5992dcc6c0ae372-20210923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1913656854; Thu, 23 Sep 2021 20:39:53 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 20:39:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 24 Sep 2021 11:39:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 24 Sep 2021 11:39:38 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
 <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v7 2/6] dt-bindings: remoteproc: mediatek: Add binding for
 mt8192 scp
Date: Fri, 24 Sep 2021 11:39:31 +0800
Message-ID: <20210924033935.2127-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210924033935.2127-1-tinghan.shen@mediatek.com>
References: <20210924033935.2127-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_203954_087971_34563894 
X-CRM114-Status: GOOD (  11.07  )
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

Add mt8192 compatible to binding document.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
index d64466eefbe3..88f37dee7bca 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
@@ -7,14 +7,17 @@ Mediatek SoCs.
 Required properties:
 - compatible		Should be one of:
 				"mediatek,mt8183-scp"
+				"mediatek,mt8192-scp"
 				"mediatek,mt8195-scp"
 - reg			Should contain the address ranges for memory regions:
 			SRAM, CFG, and L1TCM.
 - reg-names		Contains the corresponding names for the memory regions:
 			"sram", "cfg", and "l1tcm".
-- clocks		Required by mt8183. Clock for co-processor (See: ../clock/clock-bindings.txt)
-- clock-names		Required by mt8183. Contains the corresponding name for the clock. This
-			should be named "main".
+- clocks		Required by mt8183 and mt8192. Clock for co-processor
+			(See: ../clock/clock-bindings.txt)
+- clock-names		Required by mt8183 and mt8192. Contains the
+			corresponding name for the clock. This should be
+			named "main".
 
 Subnodes
 --------
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
