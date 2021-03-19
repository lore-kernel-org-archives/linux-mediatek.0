Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0C7C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 02:37:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B684E61580
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 02:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B684E61580
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kjlaBR9wHhmy2mu7s4T+sGBGT8dwLvMXyoOmSls+LMs=; b=Oe7n4Lg+6KUuba1FA4emPfsl8
	vk0i9uQP/nVx5SEOSMnJlWhutyHRA8HqFRUqx0XsLTGkYq2/2y16TL+zjagiHPajUSZHn7kfqkWRS
	s8w+z9oDHi2Ijjaw8ZwAT9uHrLpOzbIZXxO47ymRLfD66ZMMB324agQf63M5wUDkEuuQOW/nBjNBZ
	dtQ6ZxT6j0Pi1SLwLQamlzrZev8+rERmSD7BS5lVw7RsJtt+houVgaix4NNxcTF1E/yMl5cxnScGf
	WMvotqAgsbcwx2u/DT7R4jOkUzD/juudceUHpB0JrBlcaVdEkY7THr2yPoSvT272fqrK2Ff/bUE6/
	RA7KmL9WA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN50g-006KhP-O2; Fri, 19 Mar 2021 02:37:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN50N-006KZF-Ra; Fri, 19 Mar 2021 02:36:54 +0000
X-UUID: de01f88ccfcd4c12ae6b89a24b825e55-20210318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UTJSpM0ipGHXKegjFAS6NQX/9z6Yq4vMTZr2xZKLh+I=; 
 b=A/tRY95JLkau8ZAQ4RKfkc+UmQ6Dydkj4M2kPTMGmGLGgLeEVpviY8CIqwkLpZBjcNBfEOTTpjFUdjtg8/rOpskts9VUm/q5X6U4fgre1ZoVRfR1UpFKU8F5vNI+0lBh4R9RZwGOIj/cOjqohGcT+naBd19KGdKFVdq3RBy0ui4=;
X-UUID: de01f88ccfcd4c12ae6b89a24b825e55-20210318
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 179709657; Thu, 18 Mar 2021 18:36:48 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Mar 2021 19:36:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Mar 2021 10:36:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 19 Mar 2021 10:36:45 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Ulf Hansson
 <ulf.hansson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 "Enric Balletbo i Serra" <enric.balletbo@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Seiya Wang <seiya.wang@mediatek.com>, Fabien Parent
 <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao
 <zhiyong.tao@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v2 7/8] dt-bindings: phy: fix dt_binding_check warning in
 mediatek, ufs-phy.yaml
Date: Fri, 19 Mar 2021 10:34:26 +0800
Message-ID: <20210319023427.16711-9-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210319023427.16711-1-seiya.wang@mediatek.com>
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 16B6F3E0B1145B5C935B2BD6375BDE6750CB4D037C14A96FA1220AB1C58CBF842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_023652_530445_515238F2 
X-CRM114-Status: GOOD (  11.52  )
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

This commit fixes the warning messages of make dt_binding_check from
newly added mediatek,mt8195-ufsphy in mediatek,ufs-phy.yaml

Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
index 5235b1a0d188..74cc32c1d2e8 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
@@ -22,8 +22,12 @@ properties:
     pattern: "^ufs-phy@[0-9a-f]+$"
 
   compatible:
-    enum: mediatek,mt8195-ufsphy
-    const: mediatek,mt8183-ufsphy
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8195-ufsphy
+          - const: mediatek,mt8183-ufsphy
+      - const: mediatek,mt8183-ufsphy
 
   reg:
     maxItems: 1
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
