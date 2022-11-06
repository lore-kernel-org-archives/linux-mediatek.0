Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA2AC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 08:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZ8mFIVx6mijmNh29uWlZjKXwjB8cckQ5XfP/ZRP6SU=; b=GwUv30MR+oioAw
	j6EJRUEtILGZZnwDy7FjKmgHb3WZRK/sKOnz2uX4QUg4GhUuzdxgBWfLzsdMClYRlNTEDaxa91zjG
	U5lShgRRDf8FFgmiB/DdeDYLx/QxmwJKlx9hWsq+AnBec5dEeXr9D/yo5H+UyiPofIF9kD80Wdayo
	IeXfEdKZkOy0DcARqfnjboW5ZtZDThVDhO6/wAcZEDqFYkLjbdJ/NpuyIm8SmON7lAeDkHF2IYu9n
	xBg/SrRE2UkYwYMswCS4plfoxa+Ycnawx40bxVVTdUPNeJQlJsuYdIwPWRgTILyQONufGbVXWhOZv
	5MLQq6cvOHpE6RiMHdFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orbOg-007lKl-9E; Sun, 06 Nov 2022 08:52:54 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orbMe-007kBl-MO; Sun, 06 Nov 2022 08:50:50 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 6322D10078B;
	Sun,  6 Nov 2022 08:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667724645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZ8mFIVx6mijmNh29uWlZjKXwjB8cckQ5XfP/ZRP6SU=;
	b=s90nOqLME8sbBBMAdVI5RCFi9ks9089R3pgKe2lXKCzGAWTQtITd+I3WiVJhrij4GjpJSn
	UyyGJjMYgQmzAsMJ0CuoZmLasiv512tFBn+m50f/+oHiVQYpsh4drJcC5u/Nnx2NMVFk7Y
	fdEPgm3phORcnyJzf14r/5V56DfBHcc=
Received: from frank-G5.. (fttx-pool-80.245.79.199.bambit.de [80.245.79.199])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id B9FDC36054A;
	Sun,  6 Nov 2022 08:50:44 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v3 08/11] dt-bindings: arm64: dts: mediatek: add compatible for bananapi r3
Date: Sun,  6 Nov 2022 09:50:31 +0100
Message-Id: <20221106085034.12582-9-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106085034.12582-1-linux@fw-web.de>
References: <20221106085034.12582-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: c18c1903-24ee-4cf1-9ef9-e337a5f0395e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_015048_946647_BD0EBEC7 
X-CRM114-Status: UNSURE (   7.55  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible for mt7986 based BananaPi R3 SBC.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index d76ce4c3819d..7642f9350d2c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -83,6 +83,7 @@ properties:
           - const: mediatek,mt7629
       - items:
           - enum:
+              - bananapi,bpi-r3
               - mediatek,mt7986a-rfb
           - const: mediatek,mt7986a
       - items:
-- 
2.34.1


