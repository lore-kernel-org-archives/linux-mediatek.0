Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7F1C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 06:49:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85B4E600EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 06:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85B4E600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K3M1NxLOlfl9WWgSqL77KWGbgstq1Hj4tT6yQNt7rtg=; b=b07av6DeT5YnO6NG8hwPvjMF3t
	vVmN5SCXYKaWGdJi0rpacVLxZp1AJAnf8vfN5zOVgouQT0bMxMncvzwMUJPbY2qVLTA3knQ/yWzlr
	OKWhtyFRLHE5zCdFdG3QrWlHxkCflF58/HERm5CAwjDmsWBHHRg3hcxMqA9xNkjI35on+oDn/8b6B
	Wg8hTgg0D4sCS0yuWQj84nrtvfZi/ZLtOT8erAAk9haRhMEqdJRCcPEJb4YZIZ3Uddsgs1lQ2+qDY
	KIEkwfYXvzWKzTliULgsAtIVyANccsS2tO1cpCfLJ+NiZTPz9cMf4vp5aZoRvqlx6rI3ZoREGcm0P
	m6qEyzqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRr92-008jQJ-Kd; Thu, 01 Apr 2021 06:49:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRr8w-008jOF-Oi; Thu, 01 Apr 2021 06:49:29 +0000
X-UUID: 4c8d281707e3412699be5e306b02e72d-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=He1Vhj5ooUsj08GOsw7nKzSovHLkTDqTM31qUkokjw8=; 
 b=rj7iyMC8Dyhxc+ceqKtqsVNdg+V43AMnUl4LI4QpMuZVUCrSPZ8GvoU+2JDDLOzWyVH0ptyJ2oR66/dd8dY5qt3r6+JpRINk9lDm1sahk3xXtelkPBRIcq2VvFFxTKVaf9IN5hUYsrNEpCiJ74LLTVxZetsl3WF4Vt0xmiwGO6A=;
X-UUID: 4c8d281707e3412699be5e306b02e72d-20210331
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 525739513; Wed, 31 Mar 2021 23:49:19 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 23:39:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Apr 2021 14:39:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 1 Apr 2021 14:39:09 +0800
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Nina Wu <Nina-CM.Wu@mediatek.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
 Neal Liu <neal.liu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Jackson-kt.Chang@mediatek.com>
Subject: [PATCH v2 1/6] dt-bindings: devapc: Update bindings
Date: Thu, 1 Apr 2021 14:38:02 +0800
Message-ID: <1617259087-5502-1-git-send-email-nina-cm.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-TM-SNTS-SMTP: 580A08974BAFC9A6A81C47BC47B66CEFAAC52E26F7B27EACDDAD88708ABEC6EC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_074927_175589_0513FB04 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

From: Nina Wu <Nina-CM.Wu@mediatek.com>

To support newer hardware architecture of devapc,
update device tree bindings.

Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
---
 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
index 31e4d3c..42b284e 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
@@ -20,11 +20,17 @@ properties:
   compatible:
     enum:
       - mediatek,mt6779-devapc
+      - mediatek,mt8192-devapc
 
   reg:
     description: The base address of devapc register bank
     maxItems: 1
 
+  vio-idx-num:
+    description: The number of the devices controlled by devapc
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
   interrupts:
     description: A single interrupt specifier
     maxItems: 1
@@ -40,6 +46,7 @@ properties:
 required:
   - compatible
   - reg
+  - vio-idx-num
   - interrupts
   - clocks
   - clock-names
@@ -54,6 +61,7 @@ examples:
     devapc: devapc@10207000 {
       compatible = "mediatek,mt6779-devapc";
       reg = <0x10207000 0x1000>;
+      vio-idx-num = <511>;
       interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
       clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
       clock-names = "devapc-infra-clock";
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
