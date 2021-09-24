Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6618C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 11:41:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91A2A60F3A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 11:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91A2A60F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWfK4W9WqhE5wgUT+c7rSvduJYd1HjLZjd7YPQbaWX0=; b=NpyWsZAvQx3U48
	+2AYOtOZronUqRuqWVvL5kqwvoBYnlZw6v2rGUtgNgEtVC/UhotJz3gtAXsmXV0d+2SYmIcKd5Fo7
	R37PxqXGN96rooYegi8gC5aYDHrkojUZvtWxS+ZbVBLtOWS3vt9s6TqTRbzMTWMVfqwHPwJs1aLeD
	mO43n9iQgJXgSx54mkglqVerE+a0Egj5xBj1ZhY7e1Ma0ftUW83wuLnnzOuFNm6wvv41THGtw/Unw
	S0vzDQv0LeMg3ak3nyu+sGM3FIKZnY+sVpo/FlnaaK7RgSwijNu6NgYqCI6B6D0nzyEdax+BGQpuz
	DEz6e8j603839znSu/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTjZd-00ECWl-SS; Fri, 24 Sep 2021 11:41:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTjZa-00ECVz-Rs; Fri, 24 Sep 2021 11:41:00 +0000
X-UUID: 7bcf557ea2f64d3db36b6cf42288c47b-20210924
X-UUID: 7bcf557ea2f64d3db36b6cf42288c47b-20210924
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1131968958; Fri, 24 Sep 2021 04:40:57 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 04:40:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 19:40:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 24 Sep 2021 19:40:54 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: <matthias.bgg@gmail.com>
CC: <Ryder.Lee@mediatek.com>, <devicetree@vger.kernel.org>,
 <enric.balletbo@collabora.com>, <fparent@baylibre.com>,
 <gregkh@linuxfoundation.org>, <herbert@gondor.apana.org.au>,
 <hsinyi@chromium.org>, <john@phrozen.org>, <linus.walleij@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <linux@roeck-us.net>, <mpm@selenic.com>, <mturquette@baylibre.com>,
 <robh+dt@kernel.org>, <sam.shih@mediatek.com>, <sboyd@kernel.org>,
 <sean.wang@kernel.org>, <seiya.wang@mediatek.com>, <wim@linux-watchdog.org>
Subject: [v3,7/9] dt-bindings: arm64: dts: mediatek: Add mt7986 series
Date: Fri, 24 Sep 2021 19:40:46 +0800
Message-ID: <20210924114046.26070-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <9552b0dc-337f-7edc-2997-50603dfe8bcd@gmail.com>
References: <9552b0dc-337f-7edc-2997-50603dfe8bcd@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_044058_926320_0BA20552 
X-CRM114-Status: GOOD (  10.48  )
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

MT7986 series is Mediatek's new 4-core SoC, which is mainly for
wifi-router application. The difference between mt7986a and mt7986b
is that some pins do not exist on mt7986b.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>

---
v3: changed 'MT7986' to 'MT7986 series' in the commit message
v2: added an Acked-by tag
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 80a05f6fee85..a9a778269684 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -76,6 +76,14 @@ properties:
           - enum:
               - mediatek,mt7629-rfb
           - const: mediatek,mt7629
+      - items:
+          - enum:
+              - mediatek,mt7986a-rfb
+          - const: mediatek,mt7986a
+      - items:
+          - enum:
+              - mediatek,mt7986b-rfb
+          - const: mediatek,mt7986b
       - items:
           - enum:
               - mediatek,mt8127-moose
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
