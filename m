Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506B9C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 01:33:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 081F761214
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 01:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 081F761214
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E5ccgzgtF2gf/IXRbkpnfaJ3+5XfnEPvyPJbIEEvJEw=; b=ltOqUR38lB+Bh5
	l5XF83phgGPsCxlHlGQiJTmu5u7LRu4J147vFHOOWkez78x7kHa3asZE19xa0+emBLt1rwJszX1cv
	uZG9+ejiGaJGowe8PEq2WEAPNjUNrwRTnHVM3QJnbiPMRjMBzYypGp1oIkPemxBTgnX5TujH6Ajk+
	vXsXYmWKIzTlPTbICuTDlnfFQCQZefJuMsxvUOKfqcJ6OUnnOVe2vxIyGURmQhKvNIedeKYCInsYc
	i3UIB/UlwJFI7pEsWaFDRwUe8jzPr6BTanaiV6Mxc9OId3orH067Dy3aTOOWwxSiO+DqS2e+xIMut
	wgCcbDsdFGaKg8vsqeXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIhnJ-0055zK-U8; Wed, 25 Aug 2021 01:33:33 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIhnH-0055yP-Gp
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 01:33:32 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1mIhnG-0007sr-4b; Wed, 25 Aug 2021 03:33:29 +0200
Date: Wed, 25 Aug 2021 02:33:23 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] dt: bindings: net: mt76: add eeprom-data property
Message-ID: <YSWdv7ZKz7SBtF+v@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_183331_599683_982270D5 
X-CRM114-Status: UNSURE (   6.22  )
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

EEPROM data for mt76 can be embedded into device-tree as an array.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/net/wireless/mediatek,mt76.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 3e2c2e43175e5..1489d3c1cd6ec 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -47,6 +47,11 @@ properties:
 
   ieee80211-freq-limit: true
 
+  mediatek,eeprom-data:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      EEPROM data embedded as array.
+
   mediatek,mtd-eeprom:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description:
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
