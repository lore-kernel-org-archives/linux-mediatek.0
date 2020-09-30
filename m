Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49146C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:13:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC5D2075F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZHxPSMMT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A4xDjLPj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAC5D2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/ki9mrKVBszCSAFlHA46xF82Fjr5rh06znvCTMl/5lc=; b=ZHxPSMMT0P+Dk5Do9FCjVQHgv
	+2ze9Jff/UaDHGlT+CtMArbGYW/oxn+Sg8LdWReidZ02U5NfwbwFWuZznnCVepiUQNWaCh2HJGKFC
	sYZ5zgwFDYZmHR12eYXYZ0Wt0/mpio6rsaEEjHPDcGx8qkqokOz+SXaCadvAWdZXj/oVMCw5YVufh
	GXWZXGnzkS2DbC/lPYJZkD2L14XaHK5+IShyBeNBZwHU0Le5+LLnNKODhD7Ffex8mm1mvnGIzIqLr
	u6mAZ7TTOS8ePo5ZPcqKVdpNpsTI+ePFZV5qIefVrz7yAx4ov1K1nYL3WVCwjlX9fCRPcLY3c9BHT
	Xax1FEBQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWIg-0008W9-ET; Wed, 30 Sep 2020 07:13:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWI9-0008EG-Sv; Wed, 30 Sep 2020 07:12:47 +0000
X-UUID: 74761f54e0824e05a1b5e688a44d880e-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=axtHnh7qKvv1KMMgmnGRSN/KcSTs8AdXhfI9O+e7IvY=; 
 b=A4xDjLPje7yMZ29HFTNKHE8JDYvaizpz8Z6OUz2x2RJMdaooy6HM948P3AAaIOlCVV03j+qtWL3LR3TPL9YxY5TysaS0j7kdBzhVlIWEEoydEvO2lLjoILxhCtQlAXxmtM4a8T1VHckrzsOVJMHvFTZNBeDyV6KuDamioL0bwFI=;
X-UUID: 74761f54e0824e05a1b5e688a44d880e-20200929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1813293280; Tue, 29 Sep 2020 23:12:34 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 00:08:07 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 15:08:05 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 15:08:06 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 05/24] dt-bindings: memory: mediatek: Add domain definition
Date: Wed, 30 Sep 2020 15:06:28 +0800
Message-ID: <20200930070647.10188-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930070647.10188-1-yong.wu@mediatek.com>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E7D6746DA1C6BD03377D3E4B8E29DEB562679DA890B32B4FB83C13859582B8F32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_031246_117519_45C721FD 
X-CRM114-Status: GOOD (  14.04  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the latest SoC, there are several HW IP require a sepecial iova
range, mainly CCU and VPU has this requirement. Take CCU as a example,
CCU require its iova locate in the range(0x4000_0000 ~ 0x43ff_ffff).

In this patch we add a domain definition for the special port. In the
example of CCU, If we preassign CCU port in domain1, then iommu driver
will prepare a independent iommu domain of the special iova range for it,
then the iova got from dma_alloc_attrs(ccu-dev) will locate in its special
range.

This is a preparing patch for multi-domain support.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 include/dt-bindings/memory/mtk-smi-larb-port.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/memory/mtk-smi-larb-port.h b/include/dt-bindings/memory/mtk-smi-larb-port.h
index f4d8e3aed0bc..d00f5de8438b 100644
--- a/include/dt-bindings/memory/mtk-smi-larb-port.h
+++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
@@ -7,9 +7,16 @@
 #define __DTS_MTK_IOMMU_PORT_H_
 
 #define MTK_LARB_NR_MAX			32
+#define MTK_M4U_DOM_NR_MAX		8
+
+#define MTK_M4U_DOM_ID(domid, larb, port)	\
+	(((domid) & 0x7) << 16 | (((larb) & 0x1f) << 5) | ((port) & 0x1f))
+
+/* The default dom id is 0. */
+#define MTK_M4U_ID(larb, port)		MTK_M4U_DOM_ID(0, larb, port)
 
-#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
 #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0x1f)
 #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
+#define MTK_M4U_TO_DOM(id)		(((id) >> 16) & 0x7)
 
 #endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
