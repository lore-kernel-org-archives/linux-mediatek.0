Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C303C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:00:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D851864E30
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D851864E30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=52BrGiEQ76NHYGcG9Tui0nilpfbMKOkkqSuBfZGNfos=; b=2IfrwZTxnPFIaPi7pIkLpgEiT
	46pz/xcEXPhIXSONcwoLYTFrNYoIv/763DprIKnI3UpU0mWvHcWfycygzL5gKWwS1lgZKTxmG1Gur
	5fAHH8S1TDXc5pPJl6UeWRhkCY5FKwX+xGUxZIxevex0dtgM0Sp0GunwzmFyFWr8o0/MZn2iJ4JHz
	aUEBw33mB4gZkPjYTaa4qvoA5Ncc+4ekULBSKE31Tbr5er63TiUhr6H0CiwduSKA6V3mbk/2fiZ38
	1pYZurEUwI/DGcS/Yc7aL4yLQmp7uYozJ8ZcwNXiaPN0Ev2mOp+O8bD5NHsIImPZbc1TG/SdFfubB
	2Tpk3N1Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6TCb-0001id-Ia; Mon, 01 Feb 2021 07:00:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6TCV-0001fh-NX; Mon, 01 Feb 2021 07:00:45 +0000
X-UUID: d6f5969974f24ac39ca7d86275c33ad9-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=K8iBKh2qnkYP9IbeOkqQReHnR3NnrwC6se3UMPBGN4w=; 
 b=PFJxzBejwQjkURP+HWq6gaoHA9Ydnljz67RwQ7oVYPlLB/UF3bTDDiT1HeY3tXDLpmu+lq2rIcrAqswo39F6tJBbtvUk7ABD02OcyqCgNXH9hlxw8pXF1klVXu15G9ixYW5ax0UWVFw0bbpVFHqMci4VYixed4WBVEZbyESN6WY=;
X-UUID: d6f5969974f24ac39ca7d86275c33ad9-20210131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1504959220; Sun, 31 Jan 2021 23:00:39 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 23:00:32 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 15:00:27 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 1 Feb 2021 15:00:27 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH next v3 07/16] dt-bindings: usb: mtk-xhci: add compatible for
 mt2701 and mt7623
Date: Mon, 1 Feb 2021 15:00:07 +0800
Message-ID: <20210201070016.41721-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9CF50BF406F81D2B73CB864D7C136A162DC16D4C0FF7AE923B708A720C414FFC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_020044_340760_CF9E4FAB 
X-CRM114-Status: GOOD (  10.53  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add two compatible for mt2701 and mt7623;

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: no changes
v2: new patch separated from [6/15]
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 5eb8d7cd8155..46fe3a189359 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -23,8 +23,10 @@ properties:
   compatible:
     items:
       - enum:
+          - mediatek,mt2701-xhci
           - mediatek,mt2712-xhci
           - mediatek,mt7622-xhci
+          - mediatek,mt7623-xhci
           - mediatek,mt7629-xhci
           - mediatek,mt8173-xhci
           - mediatek,mt8183-xhci
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
