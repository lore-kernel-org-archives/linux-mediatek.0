Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0762C41513
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 15:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXzCH48BHEAWfxgK4ieJIeZ+kmSa4+ei8BV2aqU5zMY=; b=n3c7rkghVIq1B2
	xkecNiPrJFqfv/EmJxH9H2LxeYtSOaAyAJ6qQ6oAoS8wtPoOJzZTKb53jVyUtwmx058J2XA7SueWY
	cVQ8dkOmnrFC+uEc2yAOf79tuVSjcDZXPaAreRIKjmsyWYanMokknXFKun56RFn95IzHypEXkQOSz
	6fWrpukEj3uA2TmEme+EbbBds8NPykkYgzeElwT705Nyo/phdcWypvyT4TkPxwxB/KHRUnWbXNCpC
	dCMUiC6fcC/5HOIrYB7awX2YDMTgldKFPj9nqXZDhjjaYlfRMJVOfXgCoRNMoC1I/V00CI6ts+oJ/
	UphDIZUTR5r3vS+5wi3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s55bG-00000001s8M-0UJm;
	Thu, 09 May 2024 15:22:26 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s55b7-00000001s2r-2HU6;
	Thu, 09 May 2024 15:22:22 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 40BA83FD4D;
	Thu,  9 May 2024 15:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1715268127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lXzCH48BHEAWfxgK4ieJIeZ+kmSa4+ei8BV2aqU5zMY=;
	b=CsVanhgo1+Wp54PNc+UpJU+IQELedE0NXKz6fC0ZTCDWHq7A50XSEApY2SgjZ7v2G6yZud
	2EbRTDyXWLBkEkd8SRwUPDHvEBbbVynJ/sE5Y6y464kR7h3VLnTiaB+DQTXlfOkb+qW7TB
	zmRV2qbuN+mSI8zH0H1gljg79+WJHwo=
Received: from frank-G5.. (fttx-pool-217.61.150.116.bambit.de [217.61.150.116])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 4208936052A;
	Thu,  9 May 2024 15:22:06 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add BananaPi R3 Mini
Date: Thu,  9 May 2024 17:21:56 +0200
Message-Id: <20240509152157.10162-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240509152157.10162-1-linux@fw-web.de>
References: <20240509152157.10162-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 2f5890f3-ddd6-4f82-98eb-158a8f612bb6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_082217_732876_8C45B54B 
X-CRM114-Status: UNSURE (   8.76  )
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
Cc: devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add MT7988A based BananaPi R3 Mini.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 09f9ffd3ff7b..d4640e2e5fad 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -91,6 +91,7 @@ properties:
           - enum:
               - acelink,ew-7886cax
               - bananapi,bpi-r3
+              - bananapi,bpi-r3mini
               - mediatek,mt7986a-rfb
           - const: mediatek,mt7986a
       - items:
-- 
2.34.1


