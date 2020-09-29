Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECD6C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 03:24:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFB1F216C4
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 03:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UaPmTC5I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="faeEEExf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFB1F216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bnvaZZ29ydbAlYXmEDPEBmA0MN5032XRmqawFu33dEM=; b=UaPmTC5I+toVcx8m+Wz1nhA8W
	Bt8+WKL1WDdBIzggBcD+baF6TW2Bd2cvc0/tyMFVht7TzCWv8SXVU1xX8nBbACLhU+lMhnE/mcOtl
	hNK4jOyba8G1imDU44Wz+Curq1Ru3IS1nUt4BCSP38UGUZ2++24z1Eud9ZLJoGyC6XDEq+xCj2Ezs
	rRL4tuLCTCNDW9cWFnPVJgNzQlA80CL6W8ERO/i2VhDUtKi3sOaa/pKL9/vwfIJM1jFOaRyy4MSEs
	WyFc/OiI+aVRihx7kACY6lk2PB9AEotofK+6mFFq6B690sI0FzB/qrh64X2UPukiCq4WwUCVk1xom
	yJQ5w11NA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kN6FB-0002dV-BC; Tue, 29 Sep 2020 03:23:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kN6Et-0002Wq-RP; Tue, 29 Sep 2020 03:23:41 +0000
X-UUID: 28ee55b7a7c646419d46290f352b033b-20200928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UUXMeFr2hHlJSZLi34HcTDGs0TPXgBJAsi0hvj0UIoM=; 
 b=faeEEExfi/HkXMsHEV7WcCwAEEqxOgY2fn3LnRwlxPkG43SK1ZfofsSX3Yh18YZdy8op+CqGJnG4jGkv+HAwEK0Z5GxKwJ1sH1XiY5+an2BI6DT5xcnzlTWDUtzENbv2PdyHjAK04CdWNZoIPw04h3vbVhmmNmL4Fa73OP+ieds=;
X-UUID: 28ee55b7a7c646419d46290f352b033b-20200928
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1962135372; Mon, 28 Sep 2020 19:23:34 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Sep 2020 20:22:46 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 11:22:41 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Sep 2020 11:22:40 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v5, 1/4] dt-binding: mediatek: watchdog: fix the description of
 compatible
Date: Tue, 29 Sep 2020 11:20:02 +0800
Message-ID: <20200929032005.15169-2-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200929032005.15169-1-crystal.guo@mediatek.com>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AEDFD2495232231D73CA3DB330A350D1A49A6FA4DAF699D989BEA3844F8671392000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_232340_044898_F308744C 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Crystal Guo <crystal.guo@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The watchdog driver for MT2712 and MT8183 relies on DT data, so
the fallback compatible MT6589 won't work.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index 4dd36bd3f1ad..45eedc2c3141 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -4,13 +4,13 @@ Required properties:
 
 - compatible should contain:
 	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
-	"mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712
+	"mediatek,mt2712-wdt": for MT2712
 	"mediatek,mt6589-wdt": for MT6589
 	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
 	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
 	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
 	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
-	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
+	"mediatek,mt8183-wdt": for MT8183
 	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
 
 - reg : Specifies base physical address and size of the registers.
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
