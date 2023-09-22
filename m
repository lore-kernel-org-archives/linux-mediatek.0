Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921ACE7D0CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 05:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdjXDLLf4xtrNUzt8GcD/GV6BJ5U7aPo/HDDEtqI8z8=; b=0lx+BRTqwUnlK4
	5x0j8urakzYU/qaqxP4EGA4LLb9IB3yXRdWLayTS/NXe0Ay1LEFCNvShkM1IZGgPyrjBt8lfSgr0Y
	uW4neHoaVcGOZUcVZY3moHefiftGKVaLM0ycFsQUCCG7Aqcbw8YQbcoCJqZHRmDbv/pN+/TCArxku
	RtulaKj73uFjSpVhOB1GS2flGejYYd+chTAkD9ik8qLsCb6g2Q7YWqxFXPNekQMe4giQGVgCZvPJ3
	wpjLvC+4eBGUcMztlZQrEN8V2WedO1UxC4Vt9H2i7eo5q03SRMDFDXV0KuchEoPDhVc5bZGv/eQ3K
	Bqh2XkUqCMBvoIqUEp7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZ3s-007xfx-1I;
	Fri, 22 Sep 2023 05:50:44 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZ3g-007xXY-1q;
	Fri, 22 Sep 2023 05:50:35 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id 68B421009F0;
	Fri, 22 Sep 2023 05:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1695361826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wdjXDLLf4xtrNUzt8GcD/GV6BJ5U7aPo/HDDEtqI8z8=;
	b=KHwvkIIX2yzZ2xdkLxlaYzZ0TlnyBd26c6GLYiEn3QwqDR9UqE3sUP9sn2maLbHwIHrzRt
	xc0DxRj0GZO9pODwSfYbaaA+ZaD78FjNH0BRZh9cIQTrHxV85y0jRQPDMoEfGw40bK4lp+
	EzA1+ut8uiVHXBI/urwLEC56VrU1W8w=
Received: from frank-G5.. (fttx-pool-217.61.149.125.bambit.de [217.61.149.125])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 72252403BF;
	Fri, 22 Sep 2023 05:50:25 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/4] dt-bindings: thermal: mediatek: add mt7988 lvts compatible
Date: Fri, 22 Sep 2023 07:50:17 +0200
Message-Id: <20230922055020.6436-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922055020.6436-1-linux@fw-web.de>
References: <20230922055020.6436-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 16933f30-6449-450f-a84f-4f76d6247f3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_225032_773799_CF5CC8D6 
X-CRM114-Status: UNSURE (   8.71  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible string for mt7988 lvts application processor.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v2:
- change mt7988-lvts to mt7988-lvts-ap (Application Processor)
- not added Ack from Rob because of this change
---
 .../devicetree/bindings/thermal/mediatek,lvts-thermal.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
index fe9ae4c425c0..e6665af52ee6 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -18,6 +18,7 @@ description: |
 properties:
   compatible:
     enum:
+      - mediatek,mt7988-lvts-ap
       - mediatek,mt8192-lvts-ap
       - mediatek,mt8192-lvts-mcu
       - mediatek,mt8195-lvts-ap
-- 
2.34.1


