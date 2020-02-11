Return-Path: <SRS0=52uS=37=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BA7C3B186
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2020 03:22:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0A5F20838
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2020 03:22:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nmSO2beE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Bg7jYoo7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0A5F20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHCwGoCT3MmkuF0j1OGQeCRKyn5y2RioTKFj3yQ1NpU=; b=nmSO2beEcIHI25
	EmM+I9RGxByT1jP8fUWt5i4i3dlbznmKe0Zn+/6bHupIIMjr5csFk+WTfLBb1EnnLKoUd4KbNXGXN
	yREv9JdD9aEHrU/W3LYhan9cXkRZQv8SlLUOMphjpViOwO9NH4QcGQ8KzJ5RTd9lbU6FbMzsc8amO
	1y3THj/sBjTeSxUHIC8Ane5B5vy0pmDXANRIrI/0ff3uEhXySULSqIUeCkzQAbg7EZpgfvBaNJoh4
	ypG3p7OC6qFLLYbBb8sXnKZZQiAoPDXHD+sIJuannvXv+IvV2h+9pt1GHMHcH/19//A2CQ3IvMfMi
	QtfJia6Z8s/JRHluah9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1M7c-00013U-3z; Tue, 11 Feb 2020 03:22:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1M7Z-0000xM-Ou; Tue, 11 Feb 2020 03:21:59 +0000
X-UUID: a2c52d0752904c28a6e880fbb3a8a5ee-20200210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Wh/Fg1/l349rbKNkjvcOT9Th3fB69ZmWbpXxOpgu1fM=; 
 b=Bg7jYoo79vs7Bn4G1jEA1SVzTS1vlfxpp1SBF0rlIDpFzjfZw4Aozb7LPDtHRZZAwkHT1jpERbU9klbdQR79/tTILepUteZX+37kY6PhNQbbgwVRMS3nyGk9Q+AOl/bXi1GtI/TefPDLjpy3Y/Slo9LS5Gvg2EMcRCqslkQM3Mc=;
X-UUID: a2c52d0752904c28a6e880fbb3a8a5ee-20200210
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1109084021; Mon, 10 Feb 2020 19:21:53 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 10 Feb 2020 19:21:52 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Feb 2020 11:20:05 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Feb 2020 11:20:56 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [RESEND PATCH v5 03/11] dt-bindings: phy-mtk-tphy: remove unused
 u3phya_ref clock
Date: Tue, 11 Feb 2020 11:21:08 +0800
Message-ID: <8cf4fceb87e051b1a9245f4e8a432a699590f832.1581389234.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <bfcf6a4dd6829dfa1bd0119b34043db7364dfd8e.1581389234.git.chunfeng.yun@mediatek.com>
References: <bfcf6a4dd6829dfa1bd0119b34043db7364dfd8e.1581389234.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4869A515F4482D6EE9E2F7470DE5E956F6C45944D8315208F10E1C5AD67A56142000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_192157_814401_9160C4CB 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The u3phya_ref clock is already moved into sub-node, and
renamed as ref clock, no used anymore now, so remove it
to avoid confusion

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v3~v5: no changes

v2: add Reviewed-by Rob
---
 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
index 1f4a36dd80e0..48bc1a2e9299 100644
--- a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
+++ b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
@@ -13,10 +13,6 @@ Required properties (controller (parent) node):
 		  "mediatek,mt8173-u3phy";
 		  make use of "mediatek,generic-tphy-v1" on mt2701 instead and
 		  "mediatek,generic-tphy-v2" on mt2712 instead.
- - clocks	: (deprecated, use port's clocks instead) a list of phandle +
-		  clock-specifier pairs, one for each entry in clock-names
- - clock-names	: (deprecated, use port's one instead) must contain
-		  "u3phya_ref": for reference clock of usb3.0 analog phy.
 
 Required nodes	: a sub-node is required for each port the controller
 		  provides. Address range information including the usual
-- 
2.25.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
