Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C1CC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 03:11:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F162F2229C
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 03:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F162F2229C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tzpA01LiAaJknLHig44hkmpiyNgVNgKtSVxW7WXMyEA=; b=aqj38ZoewJlJsSaG5CstftRgq
	sxJIQ/xtl9E1Bpb1GX9vpAs0rLFkctUZuNAbe8/QSl9DCDxEAsCiRxhTXjZSa3TdzS8duXn2S/5So
	CZ/C1/870Lj2gKIJl0RecqIQaBW6kYX9wzzUuHniXx3TjrxFNre3ylLXAASWje41jvbSGOA2KR3zc
	J96H3xU2iuij5vIY/mKVKV/vt19tkySBXk6ZtjeELAJbX31YFzg4WQ5nl7YUK5eS70I8DqYEwYtSV
	7m+9mZAQG9dBHXsiRPEf8zKej7GMbQGFttQkgXRi6lFLSNWVeCzF3ohjoa1XQkwLkXhVdWia8XKO0
	mXjPEdTKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxLi7-0004vv-LT; Thu, 07 Jan 2021 03:11:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxLi2-0004sD-Cq; Thu, 07 Jan 2021 03:11:35 +0000
X-UUID: 18847a80a83545e1a67263e4f0c0d407-20210106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DLmbR46hjL0Bvq/ri+jBhrWRgmnJu6zrINXXP0Sf6+A=; 
 b=AB+V0y2ugZMuWdRvMsUbsXIdUAgihDFU7Rbk+nC36G3USqpVG2N3aMzcPiim5+k6SCAdPJ67YwA7rK/2FADTUEZ+qt5vaxe8/gSBfcGT95tfiVczE+wsQ814mH2K3LC+JunJKa20zw8pHsipfd07ZYuC+V/hnivmrUrN6KP7LJU=;
X-UUID: 18847a80a83545e1a67263e4f0c0d407-20210106
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 256815143; Wed, 06 Jan 2021 19:11:28 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 19:11:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 11:11:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jan 2021 11:11:24 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v9,
 01/11] dt-bindings: mediatek: add rdma-fifo-size description for
 mt8183 display
Date: Thu, 7 Jan 2021 11:11:11 +0800
Message-ID: <1609989081-29353-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_221134_653469_85EEFF19 
X-CRM114-Status: GOOD (  13.86  )
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

rdma fifo size may be different even in same SOC, add this
property to the corresponding rdma

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 33977e1..b07881e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -66,6 +66,14 @@ Required properties (DMA function blocks):
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
 
+Optional properties (RDMA function blocks):
+- mediatek,rdma-fifo-size: rdma fifo size may be different even in same SOC, add this
+  property to the corresponding rdma
+  the value is the Max value which defined in hardware data sheet.
+  mediatek,rdma-fifo-size of mt8173-rdma0 is 8K
+  mediatek,rdma-fifo-size of mt8183-rdma0 is 5K
+  mediatek,rdma-fifo-size of mt8183-rdma1 is 2K
+
 Examples:
 
 mmsys: clock-controller@14000000 {
@@ -103,6 +111,7 @@ rdma0: rdma@1400e000 {
 	clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 	iommus = <&iommu M4U_PORT_DISP_RDMA0>;
 	mediatek,larb = <&larb0>;
+	mediatek,rdma-fifosize = <8192>;
 };
 
 rdma1: rdma@1400f000 {
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
