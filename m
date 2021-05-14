Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A72DC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 07:08:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CC4061354
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 07:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CC4061354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LjYwC3w4J1g5uP6FzJWIpT7ChZy5klKc8aYIZIvUdYw=; b=W4jr41DJyNSz2bxV3JLsRSCZS
	geSMOzU9e5HVzaweNdAI7iv0tMoU9CNqueqHwJxVFTGuWyBRqDnj7KR9ZzREwyMv3si89g8Ty+DKV
	Wkw4X9Clh0s4g1XXWawOwyIi4X6Eq71uKHrZlqXiUvFzcb7N7/TqVEaFVVZqqW08K6Gj0wMy3vYD9
	YirHhcAWEjfGc2ODCLMh2K54sgfHRKwuF0WAaaK3o2BRPSp8Ga7L/jlnErT/4vqXtE5dMmT089Ssh
	NFov/1em9n6pNFow+7NXhIb65femYL8ZK/DAkHje7FaUAh3GDI8hy83l+AffxdNrlz13kRYzC13FW
	2iWhq68Dg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhRvf-007MRY-2e; Fri, 14 May 2021 07:08:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhRvP-007MOp-Oo; Fri, 14 May 2021 07:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=2OpPUjsG9vQttqlnWelphqlEM+Gl5t4d13Fbi2UEltw=; b=zPFypvav3g8UHcWnPK3BJhQlLu
 X6LOKK280yKqIoDfGlLpqGflcW/qpNT+PSpJaTBnXlE6RZrhVuOQMZLjmcRlfOx5KFI63WEQE7Tgo
 VCyur0j/MAay8m0l0PXLnJCSrOhiqZ8b4kpgUuaZHCQN/8NCJIkW2grqw0lIsMX7vqYl6jb36PQTz
 anUGokXcscdKPxAGuIcyFQsQUP282V4pfriy8ZQuNOCuCH1Up8frdTIxTCGrAaqwiQycevJr0NjyK
 EACt71eQRqAqLaRVpxNFux1sXXIauSQDWb+ve7am9alvgLMAy9vF2vYrfo3Jph9iChXDh0aozuiDO
 AqA+DXZg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhRvM-00Blaw-MG; Fri, 14 May 2021 07:07:54 +0000
X-UUID: 432a95b5513e429aad201fc3c8253947-20210514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2OpPUjsG9vQttqlnWelphqlEM+Gl5t4d13Fbi2UEltw=; 
 b=BS6Yn70BcVnCruAk78FAx6WwsYLpNiC8FtSUOJdGV9xoJgxcwvscgYfETV7bYuaEELZhZ8BezH27oS43Sj6XXk4aJSJzg4TWUUMD0K8vEHyriF0gm2Fny5x33LJJBuPYYhvHmCdIZbNWW/fKnAaH6cIPUkVggqG8Q0Si803S7rU=;
X-UUID: 432a95b5513e429aad201fc3c8253947-20210514
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2086737578; Fri, 14 May 2021 00:07:45 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 May 2021 23:59:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 May 2021 14:59:52 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 May 2021 14:59:50 +0800
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
Subject: [PATCH 1/2] dt-bindings: PCI: mediatek-gen3: Add property to disable
 dvfsrc voltage request
Date: Fri, 14 May 2021 14:59:26 +0800
Message-ID: <20210514065927.20774-2-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210514065927.20774-1-jianjun.wang@mediatek.com>
References: <20210514065927.20774-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_000752_748154_3D5E7748 
X-CRM114-Status: GOOD (  10.88  )
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
