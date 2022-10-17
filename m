Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D75C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 10:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEI4bX6ZbGFvxrOMba7516wjM479jvcDqzWDjK5rS6g=; b=SE6czfdXnWstEz
	7iDpdOYOF9pfuQsATjAehLngV9JJswuMJkqr/k+UNiHIZrjD2abgp3eKb4bwbS795Kyae1/lM6Ds8
	LGkqbZnEhlNszbawHZCfSXsL2DuRB3uCOCxdSuv+dj4dIWsZrQvna5HTnp2LYHNprG292Yv1cNQ5y
	a5wrst2O+w3kgboEhLMapJQLE5PWeG+r4noGoUP8jMI7c8dWOn8nAs6vfLZuqmsOcX1el3MxEQMYF
	WK0ARbm3vhS0JYIcBtYQYLlke/iV5foCiFFov/eIzNCyWUvnXqsQmJVXHsOCDL8lffQ6MgBp4QiPs
	aybMgWpKPpEBCENLulyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNZy-00ANs8-2c; Mon, 17 Oct 2022 10:42:42 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNZJ-00ANAJ-Eo; Mon, 17 Oct 2022 10:42:04 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 322065FD3B;
	Mon, 17 Oct 2022 10:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666003316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SEI4bX6ZbGFvxrOMba7516wjM479jvcDqzWDjK5rS6g=;
	b=M0/pk2bTesW+o7AOCiQ5KeHg1OBsvf88AXPIQy2aKtUmc1MagcxmMG/cPstS/FQo+JuycX
	YV/75dkoIRYWE+sM67UDEIeiSTlaz+w55JK9WfBvSKZeSjvI6qFU4MReAX87ikV5mZ/ZqM
	TbT3ze6I6p/g6S0kUsbYbx8ybg93vmI=
Received: from frank-G5.. (fttx-pool-217.61.154.127.bambit.de [217.61.154.127])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 881C2403ED;
	Mon, 17 Oct 2022 10:41:55 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v1 03/12] dt-bindings: usb: mtk-xhci: add support for mt7986
Date: Mon, 17 Oct 2022 12:41:32 +0200
Message-Id: <20221017104141.7338-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017104141.7338-1-linux@fw-web.de>
References: <20221017104141.7338-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: d4a49531-55bc-4153-86b7-32f2ccf90420
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_034201_674274_66409740 
X-CRM114-Status: UNSURE (   7.93  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible string for mt7986.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 939623867a64..a3c37944c630 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -28,6 +28,7 @@ properties:
           - mediatek,mt7622-xhci
           - mediatek,mt7623-xhci
           - mediatek,mt7629-xhci
+          - mediatek,mt7986-xhci
           - mediatek,mt8173-xhci
           - mediatek,mt8183-xhci
           - mediatek,mt8186-xhci
-- 
2.34.1


