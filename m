Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A69EC5320E
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Aug 2024 17:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8es/l2u9z7YHRxm+My9mNPpeISEV38hkj5XsiYsgUE=; b=zSqga6QzTw0See7iTcyVahl51y
	lKLKdKj/fX50kYntzlGF5LPQ2D545fPlQvK1t+Bp8Xzyz/S7mxJ4zjKRt2kc6Ve9Wh+TGVBdZQHBk
	VNqpKi5ahEw6fbmvDjj96k1yIJVu/4GtcV45lQXpIz679yu5l+LTd5bO3PfAdXSg9HVQ5bzNoXNCz
	jdhIGch43/liJZ91kx1ssBbdPAX6rFPbnbHb0PZuD0yTXSIQ+jaCtbIK6Tjq5U70SgfIyyikOyEr7
	JD3XPm+I7fTSxqWejKs6dyXHOsJWpSQ2NNsfb9J7oBjdeDwsrwG5I7feTACXT4PS6ECeHgw2fEXvd
	SgsRqptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfjnn-0000000GuWq-2naB;
	Sun, 18 Aug 2024 17:34:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfjiP-0000000GskM-44GJ
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Aug 2024 17:29:19 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3719753d365so1551619f8f.2
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Aug 2024 10:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002156; x=1724606956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8es/l2u9z7YHRxm+My9mNPpeISEV38hkj5XsiYsgUE=;
        b=jtfJk5L+xjjxeFH3/xghUu/rl4P1SGqPsBaLdcAZVOm54sbElZJrJzimgFMrreL8Oz
         dtE1NXvRnXS1N+3rUklR++FzRehJlfX/dDMApV4ytFvoRvinsMsd90A6g98rluJDx4tz
         /JmWkiv22dC63y9SJSXjuR1v1Kqu9i8N0UbSB8T3hXughUzpKyPJZMAGb8yDP9iRW7kE
         r64EYuExZj8kKSKsEsQHQuxos6b9+zyev5ZLEchnwiqQEiAG4vEsxY1RhWPxZY88zrAu
         gGYNzqRtW/qKk8W0cvBgtHXP5qYof1QD+zmigFhISUHa4UpjJ3pXO8RHrDDpbDfTGSuu
         O4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002156; x=1724606956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8es/l2u9z7YHRxm+My9mNPpeISEV38hkj5XsiYsgUE=;
        b=Jk0fgZ0XeVHLudQ8GkvFJJPG9gKpTkNrjI9iVa9CUOcMa/R8NAd7iKLoxa2+WqqYeM
         wXNlGngqj/CRQCS+s0yh/vl7kmIKz/so4KK4ovVNdIJp7RQbWOQO0DnlDa58DDl43zcE
         CYrAXKBZNueVKrW0cewwOw1OmCg4nEgwzhdlYVL2rLtqFNTbirhXBjFnXxc0bVr/xbi9
         uieltfM8usc1qAK+43H01kr+awhr2UkHOQyqQZmncrPZyGbvEBMuwfxOnTo/3L1rP9QH
         rmthmSbX3R8dnsKB48VmYEXKsmQQz0fRWFalgBD+U/C1YWOPHn1bvzneSiUEAvEKi0Ff
         Ccwg==
X-Forwarded-Encrypted: i=1; AJvYcCXqRKhSGQ9fVxRktJ0Kcnb9afUBYhDkH5e+UJyPzLKK43gOo8jYj8AVF2LygfTo+yH4d9G2PpUFrkTA0YBFrGyOJKB+nzISCkhYMLlQPA+qC16s
X-Gm-Message-State: AOJu0YyhH2QOzIwqeMt/GELTdG0qr/3WW1ZvwuFyYLBvmOHO4Bp2wbjv
	12bSJyUGQa1oiA6c4HwjgR6fnGtYA8eWIut5qyqqznCar7T6ZYLqEyBGRPpdXUw=
X-Google-Smtp-Source: AGHT+IGDihqENsu32+YwhVnlSe0afwAWIr3NedxRFUFDhgEflC/5EBBcl/lZ8aHqbdVFXfdVdizpFQ==
X-Received: by 2002:a5d:4f0f:0:b0:362:8201:fa3 with SMTP id ffacd0b85a97d-3719465e8a6mr7100101f8f.34.1724002156139;
        Sun, 18 Aug 2024 10:29:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a35fsm8510315f8f.59.2024.08.18.10.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:29:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next 4/4] dt-bindings: net: socionext,uniphier-ave4: add top-level constraints
Date: Sun, 18 Aug 2024 19:29:05 +0200
Message-ID: <20240818172905.121829-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_102918_216709_25CDEDC2 
X-CRM114-Status: UNSURE (   9.76  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clock-names and reset-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/socionext,uniphier-ave4.yaml  | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
index b0ebcef6801c..4eb63b303cff 100644
--- a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
+++ b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.yaml
@@ -41,13 +41,17 @@ properties:
     minItems: 1
     maxItems: 4
 
-  clock-names: true
+  clock-names:
+    minItems: 1
+    maxItems: 4
 
   resets:
     minItems: 1
     maxItems: 2
 
-  reset-names: true
+  reset-names:
+    minItems: 1
+    maxItems: 2
 
   socionext,syscon-phy-mode:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.43.0


