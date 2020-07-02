Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC850C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 09:37:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CEB920760
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 09:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OEWTX3TL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aAP8OUMW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CEB920760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0brV7b+7O40THat47Z+TBt5w6kzGmU4RD635wsY0a0w=; b=OEWTX3TL8QRjOkNjl5fKGGFsWE
	L8dersoTWeD4gLSGTk9s1ZQLwoBntYdL5TW+iau9cnV8zjvoOIf22QDzHtk4fm3vwRuBsNU5bA4Do
	9D2kVRiz1kUdKggJxG+dOsTmGoq0RX2NmUcMDb5NIkA8azWccmTXSRWkk6mAjY0Nxc2IJ1W0DE8nv
	y4i07iyKzKg0zlpbNMqo1w9P6qr4+Jem7PXlMzdyQ+vX7hdAFuihjB7PKsX22DtzBhjf45FDTI8Dz
	ze7xDTeySgOCctJBprMQCkXSpgXn0QPc6ljM9XMpiJqAoKQMOuRHWhdNkggyieaqb2a1bEzX8y7Bn
	4bMIZsww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqvf8-0002Eg-IU; Thu, 02 Jul 2020 09:37:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqvex-00027w-2P; Thu, 02 Jul 2020 09:37:36 +0000
X-UUID: fa7ffacde83a43929b87458953d2525c-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cHL3FGvns2Vq3Q+lzPqG/tPY0T/sEGYmRDbEd2Ph2NU=; 
 b=aAP8OUMWNABaV53coyztzIVJe+t/Oal+N9MJ8LiJub5xaQo5soYUr/DzsAnY/Txf2yMkwCiwrKGrmEMLKLJnmDBTN4FEaFu2MDf4TX78DmuN78hjeZ2FY6MIp1xy3TGaOLPWfnSfvdzbUstrK1KUsHehya4VDptg3WYZm5+UyEE=;
X-UUID: fa7ffacde83a43929b87458953d2525c-20200702
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1243899199; Thu, 02 Jul 2020 01:37:20 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 02:37:22 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 17:37:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Jul 2020 17:37:20 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH 1/4] dt-bindings: mediatek: add mediatek,infracfg phandle
Date: Thu, 2 Jul 2020 17:37:17 +0800
Message-ID: <20200702093721.6063-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 888036A33ECD69FCAC32F294B9ADA91343BDD3CA9220D418C65C109C141F4D452000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_053735_260575_178EDE4C 
X-CRM114-Status: GOOD (  10.04  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a description for mediatek,infracfg. We can check if 4GB mode
is enable by reading it instead of checking the unexported
symbol "max_pfn".

This is a step towards building mtk_iommu as a kernel module.

Cc: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
index ce59a505f5a4..a7881deabcca 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
@@ -74,6 +74,8 @@ Required properties:
 - mediatek,larbs : List of phandle to the local arbiters in the current Socs.
 	Refer to bindings/memory-controllers/mediatek,smi-larb.txt. It must sort
 	according to the local arbiter index, like larb0, larb1, larb2...
+- mediatek,infracfg: a phandle to infracfg. It is used to confirm if 4GB mode is set.
+	It is an optional property, add it when the SoC have 4g mode.
 - iommu-cells : must be 1. This is the mtk_m4u_id according to the HW.
 	Specifies the mtk_m4u_id as defined in
 	dt-binding/memory/mt2701-larb-port.h for mt2701, mt7623
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
