Return-Path: <SRS0=PvK4=BS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF889C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 03:05:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 719172087C
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 03:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wXKKeS6e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fUBVNHVi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 719172087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SgmvR8iGgMeac+IAwMfX1J71pruduG8z4V0/6ABVHp0=; b=wXKKeS6eHRHJ1qHCCnQbzJHD+
	j6c70B8wZiDkR0VY89o5rUnqdBRpKe9Sdw/b5UYXCz7hGherR6OUphkdqtsYzzPs3OE6uuYu0rsFY
	1DWkFMdcvXJQFv1jxwrRCZ5QstCsKSBrJO1ljEEMd+MoFWgRj1Gvn42mKU6iCfawQDV733ouFgCQC
	MgJminE95SxzyvKJIQ6mUIddL5rnPrgIeGqzvs0Wu54sltl9OWK0RuRbtI8wV9AWL+WrK4lF170UQ
	bPueCEQr7Hd+6UER1w74P3ArAvR5X99urIKH9S44m3eKKidOPzdMDKroWgtDzE/fZ7efj9dN8DhxG
	6fDuM7s8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4FAC-0007gc-RY; Sat, 08 Aug 2020 03:04:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4FA9-0007ep-9C; Sat, 08 Aug 2020 03:04:50 +0000
X-UUID: 718a1ac7bdb848efb92491e00a4e60f6-20200807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kWZieeEiWrI+QZxqM8iMJlo9waGC/mplSmKIIdhtLMI=; 
 b=fUBVNHViVDCM7D0iqDDCiAjq1EGx7BdtJ1iLalRXR5N0RZAId5P2hqb1BZ/9YYtTfUFAyOf+6DP9XZ8gXEPGBcjlsP+Rg8kVJnANs6WfE3cycE45wszmHOtLi9w3bnvV2ekj4LThvP0gZe9y9I8FUislvHpyjqxNpc3FtAWTxaQ=;
X-UUID: 718a1ac7bdb848efb92491e00a4e60f6-20200807
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1620613440; Fri, 07 Aug 2020 19:04:43 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Aug 2020 19:54:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 Aug 2020 10:54:39 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 8 Aug 2020 10:54:39 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RESEND v7,
 PATCH 1/7] dt-bindings: mediatek: add rdma_fifo_size description for
 mt8183 display
Date: Sat, 8 Aug 2020 10:53:45 +0800
Message-ID: <1596855231-5782-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_230449_485319_BA0896D3 
X-CRM114-Status: GOOD (  14.28  )
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
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

rdma fifo size may be different even in same SOC, add this
property to the corresponding rdma

Change-Id: I67635ec7f3f59cf4cbc7737285e5e28ff0ab71c9
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index b91e709..e6bbe32 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -66,6 +66,11 @@ Required properties (DMA function blocks):
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
 
+Optional properties (RDMA function blocks):
+- mediatek,rdma_fifo_size: rdma fifo size may be different even in same SOC, add this
+  property to the corresponding rdma
+  the value is the Max value which defined in hardware data sheet.
+
 Examples:
 
 mmsys: clock-controller@14000000 {
@@ -207,3 +212,12 @@ od@14023000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_OD>;
 };
+
+rdma1: rdma@1400c000 {
+	compatible = "mediatek,mt8183-disp-rdma";
+	reg = <0 0x1400c000 0 0x1000>;
+	interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+	power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+	clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+	mediatek,rdma_fifo_size = <2048>;
+};
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
