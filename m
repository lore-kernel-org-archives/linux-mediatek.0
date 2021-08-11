Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205FCC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:38:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C107E60F55
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C107E60F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Q06slZy0ppsaOGeTZTCPRDzCgJELDJ8Y2MVTDY7I3g=; b=MTWSA8c1WBtWSW
	Km/Xla97J/ZpfrUDCk1ovmQBtkrEVdlQjZjWdirzXIP3yTHiDm5DuhBbNqxwUKL9WiDt6LV0zYSPv
	v6qtUJUtoMFMBE9p51BfvODd9N+G/cI4j83bYgv6vGDpRdJ0u4fXvfRCldGD5NQyssKkvPwQOdMks
	Q1qc1Ph4mt7C/mOedTGF85uKxAp4AFYkXEjWRBdMZk8HDH8p6UDWo2+ugwHCncRFGml7O5Ix+l8lo
	hap6RZNh/JJkgbpKOxi/W45UkZNy0ixR8MWKMZiczkjoFtUIA62E4jftHIxpJyT+cG/t1Ne3FtefP
	FGf5zqtHZAkhTU/fokeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkgf-006M4C-UJ; Wed, 11 Aug 2021 09:38:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDkS1-006Gsf-Ih; Wed, 11 Aug 2021 09:23:09 +0000
X-UUID: 4877bced13f448f5ac032ae085694874-20210811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=CPwv0Pd0N5+fg6bXna9PWx2jyZZ1j9kl0ucpy5BXS1U=; 
 b=VmzF+EvMM/rUj/RGcpNnfonVl4euXZsBVbmIEsBnHGVKfShKAmvb5TE1qMddZcbEh7jwaJQyhAeyItUKljwk3fLtmRxzQyQXIFwbH8qX483Vs8LOOTYOpEoSRNCOB+GPQrw+nqIZXS3vXhzlQUbnjGgUY6cl2ymOEUIK/S0YtTE=;
X-UUID: 4877bced13f448f5ac032ae085694874-20210811
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 895320840; Wed, 11 Aug 2021 02:23:04 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Aug 2021 02:19:30 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 11 Aug 2021 17:19:28 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Aug 2021 17:19:27 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/9] dt-bindings: phy: mediatek: tphy: support type switch
 by pericfg
Date: Wed, 11 Aug 2021 17:18:32 +0800
Message-ID: <1628673520-23537-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_022305_703278_3CFDAF8F 
X-CRM114-Status: GOOD (  10.45  )
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

Add support type switch by pericfg register between USB3, PCIe,
SATA, SGMII, this is used to replace the way through efuse or
jumper.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add reviewed-by Rob
---
 .../devicetree/bindings/phy/mediatek,tphy.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 838852cb8527..9e6c0f43f1c6 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -201,6 +201,22 @@ patternProperties:
           Specify the flag to enable BC1.2 if support it
         type: boolean
 
+      mediatek,syscon-type:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        maxItems: 1
+        description:
+          A phandle to syscon used to access the register of type switch,
+          the field should always be 3 cells long.
+        items:
+          items:
+            - description:
+                The first cell represents a phandle to syscon
+            - description:
+                The second cell represents the register offset
+            - description:
+                The third cell represents the index of config segment
+              enum: [0, 1, 2, 3]
+
     required:
       - reg
       - "#phy-cells"
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
