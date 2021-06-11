Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B27C48BE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:49:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49922613CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49922613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SOwzhDYEr+bWxMnWNmOM33vKdING2MVgyVfsx/Frdw=; b=JdlWaeHwvNTrVA
	JHYCH7x65Ft9sEMA01w1GpBpKN2SLywqK434dNhjY3Jat5crsUaf9N2yMtt1cLLOf3K5Xsaju9sFC
	mStyXSBnse5+AyfpgL/qPJfTObOjP/kSlCzOod48nVlo62cnYSNmCx2ooysLgbGcWyFIxgJhFIwwf
	A5yKM3DHbchQLg9IBf7YbRo5RLX1CK2kCQH23mupAwP/VPV7V2nn/2zux/yXFGIYvFbPkRTiKpA7K
	8a103xvL8XoIKH9v+clYookJATulO9NOvBsxlTVqwFAxZbKSSlxGX1Zgw34oOW9njyg6Z1uASoPWX
	WMqNtt7JOI4TPbzrHFww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrfem-0056gb-4y; Fri, 11 Jun 2021 11:49:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrfei-0056f2-36; Fri, 11 Jun 2021 11:48:59 +0000
X-UUID: 7fc21778089d48829e546b81edb2774e-20210611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5qlv+aTSXOykboIk5MWfCBoktuOBzsU2lWo7Y39Pf9Y=; 
 b=MTopX66G0mcF+b7ViO/Za/+zhZ4nPlo4+MKhtMzK3BxLEw5lUQB2DSoZT83UKNTDlaXHaQOa1DpakA4y/8S/LkJxXUelkEJCfD+cnUr6mKGjBWcbWfADx6APN5fA+u42G0TXZTykvdOlYRs6RvNR4MgUgy7/lTm8OW2ja4I2LWQ=;
X-UUID: 7fc21778089d48829e546b81edb2774e-20210611
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1165751587; Fri, 11 Jun 2021 04:48:51 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Jun 2021 04:48:38 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Jun 2021 19:48:37 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Jun 2021 19:48:36 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <sin_jieyang@mediatek.com>, <drinkcat@chromium.org>,
 <Rex-BC.Chen@mediatek.com>, Krzysztof Wilczyski <kw@linux.com>,
 <Ryan-JH.Yu@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: PCI: mediatek-gen3: Add property to
 disable dvfsrc voltage request
Date: Fri, 11 Jun 2021 19:48:23 +0800
Message-ID: <20210611114824.14537-2-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210611114824.14537-1-jianjun.wang@mediatek.com>
References: <20210611114824.14537-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_044857_564552_E252E34D 
X-CRM114-Status: GOOD (  10.83  )
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

Add property to disable dvfsrc voltage request, if this property
is presented, we assume that the requested voltage is always
higher enough to keep the PCIe controller active.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
Reviewed-by: Qizhong Cheng <qizhong.cheng@mediatek.com>
Tested-by: Qizhong Cheng <qizhong.cheng@mediatek.com>
---
 .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index e7b1f9892da4..3e26c032cea9 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -96,6 +96,12 @@ properties:
   phys:
     maxItems: 1
 
+  disable-dvfsrc-vlt-req:
+    description: Disable dvfsrc voltage request, if this property is presented,
+      we assume that the requested voltage is always higher enough to keep
+      the PCIe controller active.
+    type: boolean
+
   '#interrupt-cells':
     const: 1
 
@@ -166,6 +172,8 @@ examples:
                      <&infracfg_rst 3>;
             reset-names = "phy", "mac";
 
+            disable-dvfsrc-vlt-req;
+
             #interrupt-cells = <1>;
             interrupt-map-mask = <0 0 0 0x7>;
             interrupt-map = <0 0 0 1 &pcie_intc 0>,
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
