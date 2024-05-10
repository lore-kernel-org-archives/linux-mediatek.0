Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF28C25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 May 2024 09:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/Hoj7MJiHi8HmiwMQBwdoIi7cvTzX37sRigg09M4hc=; b=HdDdjoa/H8KZr/
	lc6sVwFTO/KG7LBJYTw6/QZ9rUUTJp7y0G8kDCf5qCZ48x+vwpRs2gt85sYYMbjo6EJFvNY9SkoD8
	wGvzah6ibOrrEzMT8WKf+9SH/8DAku9/MCBMqpbzFcy+pptfY9lLMPHHXEkOB3cAmbHDd/ChRI1Ma
	FY7NuwZaLB5F5fqn5zDa2PQdaVHSi1DuIjXhzl3rnXokblR1fnJbDC0ttnRsBwP9YvIXvQYqkCZah
	7Zla5nSyU4BLVjIPMwoSWplLCwqStKATi7EmnB97F1SMZG/mTidG67KE3IidmXV4c9UGtFrXOl/7l
	3miOoRypf8/8Y+6/rksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5N0F-00000004lkW-35aK;
	Fri, 10 May 2024 09:57:23 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5N0A-00000004li4-2SHI;
	Fri, 10 May 2024 09:57:20 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id 3C3A2616AD;
	Fri, 10 May 2024 09:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1715335035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c/Hoj7MJiHi8HmiwMQBwdoIi7cvTzX37sRigg09M4hc=;
	b=ipH0V/WGfGA3XJ5W8wKXc3CACSlXLq330jLwqa4DrTRiEZbloukQ35YfDtrJSlhsCcm6Or
	n6atVUJdYcaudULRrtYYbQr8e/K4HnIAXCuTpWHy0+d+xT9ChOHHGPaBEx6k+ZJtAjN4eE
	AIVkIjsImT4iggQcL0OiSAtkIg8wmOM=
Received: from frank-G5.. (fttx-pool-217.61.152.152.bambit.de [217.61.152.152])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 2AF4240075;
	Fri, 10 May 2024 09:57:14 +0000 (UTC)
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
Subject: [PATCH v3 1/2] dt-bindings: arm64: mediatek: add BananaPi R3 Mini
Date: Fri, 10 May 2024 11:57:06 +0200
Message-Id: <20240510095707.6895-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240510095707.6895-1-linux@fw-web.de>
References: <20240510095707.6895-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: fadb8d33-81e3-4bdd-928c-57f3030276a1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_025718_912247_55FE358B 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add MT7988A based BananaPi R3 Mini.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v3:
- added ack-by
- dropped "dts:" from commit title
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


