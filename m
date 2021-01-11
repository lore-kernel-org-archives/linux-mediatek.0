Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E66EC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:21:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA3CC21E92
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA3CC21E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/7zp7OkBtkDnrjyEQGNYU1MQC0wiGUC9Ea6caPguedU=; b=SPhOOypwd8E/v1dczD/ywN9yU
	NFvyWCu00HaoGkW7GV8X40r5teccEr3Xqc50FNhAGLzmZIjHIZ7SrzAs+5b1Di3T+85FrLvuyk9ef
	+dSdfj82MmnnnIuj9v2gIZGhrZh/rGrnkuSpXP1DX9fnZZHnRaCKADcPIhl8E6wgwHS/Xyu41ipgF
	BzWnElUKjyJBf1ytgZ6cgtmCwUpGvslpoMPo2O++LplRGTTZzxv6RHm23pqrz2tGTGUnhL7j3cEkh
	UGZmL0dhnRDuSxbJR3CxIq/i4ynWtVCCTzUGtY1aXdWBCMBN3nsS9x/cUPO1azjgB000ZaE5Txk68
	IWhMInyJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyvG1-00030q-D7; Mon, 11 Jan 2021 11:21:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyvFx-0002ym-Ih; Mon, 11 Jan 2021 11:21:06 +0000
X-UUID: 1794548dbcd44f60a207d3221b493970-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=v6b5sPLaYD7wcculrdKAA9p9HTxR4cjegEK+cgS50GE=; 
 b=nH84tGW7ZFeDAPHW4ki0deOeOg9dJDEqgNTFFZgSdB+akcWnru8YYnIfNO9WjJusuI9mLLrrEBuWIc5+Ncr2QYJjUPw66D4q7cKcT/fTuWTCA5K5Jh1xbzTlJ3qFIafMjdt364CwHYoEG1m1wliKuf7N2Z0lblvE++eb/PMWA3k=;
X-UUID: 1794548dbcd44f60a207d3221b493970-20210111
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1607339320; Mon, 11 Jan 2021 03:20:01 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 03:20:00 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 19:19:58 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 19:19:57 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v6 03/33] dt-bindings: memory: mediatek: Extend LARB_NR_MAX to
 32
Date: Mon, 11 Jan 2021 19:18:44 +0800
Message-ID: <20210111111914.22211-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210111111914.22211-1-yong.wu@mediatek.com>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_062105_778322_D017E13B 
X-CRM114-Status: GOOD (  11.58  )
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
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Extend the max larb number definition as mt8192 has larb_nr over 16.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 2 +-
 include/dt-bindings/memory/mtk-memory-port.h                | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index b9946809fc2b..ba6626347381 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -99,7 +99,7 @@ properties:
   mediatek,larbs:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     minItems: 1
-    maxItems: 16
+    maxItems: 32
     description: |
       List of phandle to the local arbiters in the current Socs.
       Refer to bindings/memory-controllers/mediatek,smi-larb.yaml. It must sort
diff --git a/include/dt-bindings/memory/mtk-memory-port.h b/include/dt-bindings/memory/mtk-memory-port.h
index 53354cf4f6e3..7d64103209af 100644
--- a/include/dt-bindings/memory/mtk-memory-port.h
+++ b/include/dt-bindings/memory/mtk-memory-port.h
@@ -6,10 +6,10 @@
 #ifndef __DT_BINDINGS_MEMORY_MTK_MEMORY_PORT_H_
 #define __DT_BINDINGS_MEMORY_MTK_MEMORY_PORT_H_
 
-#define MTK_LARB_NR_MAX			16
+#define MTK_LARB_NR_MAX			32
 
 #define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
-#define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0xf)
+#define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0x1f)
 #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
 
 #endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
