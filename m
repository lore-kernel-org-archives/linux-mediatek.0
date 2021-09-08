Return-Path: <SRS0=79RL=N6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F67C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 01:42:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D22261139
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 01:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D22261139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBw2ESw3iQbQSdcvxEKMPWvv5lL+kj5lmS7KRhBV1Vc=; b=T3zjwf2W/S+2Ff
	sJVIcxEX4kuGapoI1JHNlsxMooCVb9SbYsffnE5Ch50/QncV4xYPfyIL0baDkPkWUDCZ9co1DhRO5
	qyHNrUAwRtQlYI/kVUO4BGbFkGTNCZ2Sb80DTd//6Ca40ilZEKd3UNIef79Cr4pYfBBABKu4wRFHp
	+RCIk80NoQqAwXqlPAiIC3OLkvykq8yCMl94P/D6cAmpJmwQdlcedj6e2Pl1rE9KEPDVo5IRCV/Nn
	pE6fVESxzr32F5WQNec+/u+gaTry8opF82JDDPHAqAIKpABSPrvkavOXjo0feEnhJaurE983XIR0Z
	cX2nZiBBNriXejZcqt1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNmbC-0059Lm-BY; Wed, 08 Sep 2021 01:42:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNmaz-0059KW-Mm; Wed, 08 Sep 2021 01:41:50 +0000
X-UUID: 94d752a99b8f49538039ead6daa2e0b4-20210907
X-UUID: 94d752a99b8f49538039ead6daa2e0b4-20210907
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 149907670; Tue, 07 Sep 2021 18:41:47 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Sep 2021 18:32:21 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Sep 2021 09:32:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Sep 2021 09:32:19 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Chaotian Jing <chaotian.jing@mediatek.com>, Avri Altman
 <avri.altman@wdc.com>, Wenbin Mei <wenbin.mei@mediatek.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Yue Hu <huyue2@yulong.com>, Bean Huo <beanhuo@micron.com>, Adrian Hunter
 <adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: mmc: mtk-sd: add hs400 dly3 setting
Date: Wed, 8 Sep 2021 09:32:17 +0800
Message-ID: <20210908013218.29702-2-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908013218.29702-1-wenbin.mei@mediatek.com>
References: <20210908013218.29702-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_184149_773336_D1A5EFFF 
X-CRM114-Status: GOOD (  12.62  )
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

Add hs400 dly3 setting for mtk-sd yaml

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index e866e985549e..82768a807294 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -119,6 +119,18 @@ properties:
       If present, HS400 command responses are sampled on rising edges.
       If not present, HS400 command responses are sampled on falling edges.
 
+  mediatek,hs400-ds-dly3:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Gear of the third delay line for DS for input data latch in data
+      pad macro, there are 32 stages from 0 to 31.
+      For different corner IC, the time is different about one step, it is
+      about 100ps.
+      The value is confirmed by doing scan and calibration to find a best
+      value with corner IC and it is valid only for HS400 mode.
+    minimum: 0
+    maximum: 31
+
   mediatek,latch-ck:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
