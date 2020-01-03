Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338C0C32771
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 03:13:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0608622314
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 03:13:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pDRsGW69";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oJPf5XEd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0608622314
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3Na7BN/AlgLi7zyOSDvgNHBK2WgswvBhMHP4ESY248=; b=pDRsGW69gW5gEA
	Htqpr/ThP8+oh1kkHiu/1lMcLt7mr9nBDWQd+UOtVtqz9+vZrnxTCxLTAmn6s0EPgIHUIeiF+YrK2
	wJDjhbkHRRaPoykwt1r7FITRKqEvKkZkQKnyELxVdEbfNFLItrQsVscKuU54RvnpaFuaKE6fEoDqA
	4KWnfUphxi9GExYdA2btWIHddGZL/whxTxbKYNpt8/fQ6BAX/wd/T0Vn4iSQMgYSNJnCI8vqXb6mL
	sgg3aNrNpCk4w+eZFF6dPnZkt09+Ixb4DUkKfbHbpTNsY5CB2CLOGxuJkYL/M9Pq8IjbnY2nC00ow
	p93S//3+ivnNawU/8wog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inDOt-0003xf-Cd; Fri, 03 Jan 2020 03:13:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inDOL-0003Ei-FY; Fri, 03 Jan 2020 03:12:51 +0000
X-UUID: 422a4979eb3844149b9f3323d958b3d7-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Il1d/CuA3QdNQqOpUCl8h23dQ/u6yF7EK0/ELQERR1M=; 
 b=oJPf5XEdhkCaAgnVNo2DoziuMn/ScN2HMmGpvLaGm+Hg/6J72syP4IHUAFirbfhAurtUiP8+YRh6pAsJLRT1ZsND7ahPfy9HFI8LZLKr9URT/KjqO/XXL9klvzF/CzC86XDxM52f+GLhIPWmz2VRqDM7wx0YFT4whI3yzwsewpk=;
X-UUID: 422a4979eb3844149b9f3323d958b3d7-20200102
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 360713236; Thu, 02 Jan 2020 19:12:38 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 19:13:02 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Jan 2020 11:12:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 3 Jan 2020 11:13:04 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RESEND PATCH v6 01/17] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
Date: Fri, 3 Jan 2020 11:12:12 +0800
Message-ID: <1578021148-32413-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1578021148-32413-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_191249_522545_3D6DCDB3 
X-CRM114-Status: UNSURE (   8.70  )
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Update device tree binding documention for rdma_fifo_size

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 681502e..34bef44 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -70,6 +70,10 @@ Required properties (DMA function blocks):
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
 
+Required properties (DMA function blocks):
+- mediatek,rdma_fifo_size: rdma fifo size may be different even in same SOC, add this
+  property to the corresponding rdma
+
 Examples:
 
 mmsys: clock-controller@14000000 {
@@ -211,3 +215,12 @@ od@14023000 {
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
\ No newline at end of file
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
