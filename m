Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2442C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 18:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKwn4pI+xbCMED6ZrjRNts/9bUc9vmXTiZ+7Mh6MCJo=; b=1xYU3Z3jHEKU++
	tA3/UiLM0dkqN0nLj8s5tr+Olt3fcPbcQfsNQRxy5sfbe+XgV47WOrjJplsfsFNbJpzx6DuojO+RP
	AlujpRqQaC9/BPez1K0FcIRKGM6hMZ2vYAMlI9RSgUr31gmM8uB2lMWnlK7HSbCq9Shwr8Qfz1+yD
	n2qWnmUQUBLzOhSMaRR7MktOQ0tQ/9eiv6fEcpeQQaWx1S9mdHaZL2OO4jRVV9GyrkjEzV/YCFKTK
	zQ5Il2pLktKBGB9YJA8A7km1Oe/9Wy2Ko2orA2bCkpQPCPrqagEfPIJVgVxWkpkHSsJMXxjlVENiL
	vWfzDGV4DJZVXwQRaKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEwcS-001nU2-09;
	Thu, 29 Jun 2023 18:43:52 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEwcD-001nNj-0Y;
	Thu, 29 Jun 2023 18:43:43 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id A99DF605D2;
	Thu, 29 Jun 2023 18:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1688064213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KKwn4pI+xbCMED6ZrjRNts/9bUc9vmXTiZ+7Mh6MCJo=;
	b=IuoPkO4nES4sD7aKHkl3yJuMO9wW83z8euR0VrDgqxiD4ItrWnf57ouhYuJaBZxvn7Awcd
	tosMG8V2vFIr8FsCGgrRB+ucVrOwuzr7W6gmpfqDmh5KydHrSgF6VohYv5O4ANOqpcWYRq
	+H0bMt/M9A8r6wQyhcwS1Xu8ysdteoQ=
Received: from frank-G5.. (fttx-pool-157.180.227.241.bambit.de [157.180.227.241])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id C0D411007BC;
	Thu, 29 Jun 2023 18:43:32 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: drop assigned-clocks/clock-parents
Date: Thu, 29 Jun 2023 20:43:17 +0200
Message-Id: <20230629184318.551317-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629184318.551317-1-linux@fw-web.de>
References: <20230629184318.551317-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: d645d265-62e5-466c-9f7d-58ccb7702d42
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_114337_373231_0D8927CB 
X-CRM114-Status: UNSURE (   8.69  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

MT7986 has 2 clock-parents and these properties are not needed in driver
binding. So drop them completely.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- drop assigned-clock* completely based on discussion with Krzysztof in v1
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 46eefdd19a2c..3fffa467e4e1 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -91,16 +91,6 @@ properties:
       should switch dat1 pin to GPIO mode.
     maxItems: 1
 
-  assigned-clocks:
-    description:
-      PLL of the source clock.
-    maxItems: 1
-
-  assigned-clock-parents:
-    description:
-      parent of source clock, used for HS400 mode to get 400Mhz source clock.
-    maxItems: 1
-
   hs400-ds-delay:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.34.1


