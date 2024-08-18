Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DA7C5320E
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Aug 2024 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8blFZbfnGlvrrpro9Mt+fDTe8etw4wnb+/lJOb2V/Lk=; b=YMXSgq978yMRzVZr5ilmLf7qZr
	YoPIfwffOlF0kxyOckN3pR1MhoIsp5SWrJLdsrtzrRpz7DiQBs0pIu21U5Bob4FxP7CLci0dIQqPe
	2dplHBpoclmDTo6gjNWDBtMh2Q65ksPdmVtpINSv/QeCkr8wMEc/ClMzIE+IiQBSqDZEvCl/mvBSs
	lWZGXngdEo+JBCacaNBJhm9kE2UIssmF0OcfmitV4dCaJ8I0Md1DwoqeU1orYn9GWmWIbaoJryiyv
	wIVh+I1wIEn0kbmISjNOJcseaj7ByvaqUQ3VMviL4RmAFJGChChowsPtnbwbm52Seum2WvQiQay6p
	owQjxOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfjnA-0000000GuMh-0UaK;
	Sun, 18 Aug 2024 17:34:12 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfjiM-0000000Gsi9-0cUL
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Aug 2024 17:29:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4280b3a7efaso27301375e9.0
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Aug 2024 10:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002152; x=1724606952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8blFZbfnGlvrrpro9Mt+fDTe8etw4wnb+/lJOb2V/Lk=;
        b=KDFbLjJpLFOF98ZUnfPb/fjl8GdryQ5slOf4xA2Gurw17KLIkOVatA8nvRgSNde4CP
         Oan7JpEsY3e8U0fvvaUkuSEh1Sdbss9hFOjubv03pK0vSw00YNYbhN2iF50Rtcmp2F55
         OZvDW4fw1xHitCY5WphzQD1shf6EIYDOa0Oso3wogvEtOaRtG4JdZU9HfBkex9mGlsMF
         kqdOSuf8RNM3y6f7/K3DVpXeYCTlDjdsZH99PRzbhoUUQHadaISGkQn9jIJ1J65Y9Kcy
         DH7LDN4NqLsR+t4GjpjckfSo6+ShNwXdaJmJNBzsD4N58O+O5sLZcz6v2KwhOFcfPdcJ
         +ZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002152; x=1724606952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8blFZbfnGlvrrpro9Mt+fDTe8etw4wnb+/lJOb2V/Lk=;
        b=YCdcNepH4ZoQSg/klETX+4i7k7jpBxZw8pihsN50dQgynCtPV6W+x9LMB32rmwUlac
         A2SwBnrcW4vMBw+BduI3co2Mx1R3dC2DHWJq/OXFsX6bu3p7+R03Nb5HBwx8f6usBk3/
         //QTnDPnVmrB/iGKDe3fRsEowGtAHUx0PKuR+oSrGKCP84ogOw+GnEo3pr5oW/9Pjbmo
         +o+XSW4lQE9o2Ors7nTEbMFMCktSz4Vs3ooPx0yv99m+joWjIdaR6Z154+J93DcgAaoD
         1KEUcAiocDQBQsdaYrwmUKmnJ6OY1Et5oUXr/t3icWQPfRhu4n+OFPnKTNgV8eMzDd9q
         /r4w==
X-Forwarded-Encrypted: i=1; AJvYcCURDbPKk210GA9w+fssPd7JrCF4AULIP6Wi5nlEPawk/3rfsxVu6Y1Jfe0yBmeuTP4P2QOkxWIGKzHLk/1Kf9j9tDsSEmOhCtAYyU3k6VCnNzN1
X-Gm-Message-State: AOJu0Yz36iotgA7kJjYF820g5yOGrq8M0iKIYJvpH2ImAHWiXrcbRCYc
	4qlcvOSw9szvPLnbn8VS506mlp72RXV3+UKx1Jlsn8ItyuWbEXVYTaHR+59w1VE=
X-Google-Smtp-Source: AGHT+IHZWNYxDr1n2Hm+4Vk1yE2Q3KfSWgr7knMmpEN6fGiOFgE6l7GIrD+dz0zW1NTTiyyy6UNsPQ==
X-Received: by 2002:a5d:408a:0:b0:371:8e77:92f with SMTP id ffacd0b85a97d-371946dc42emr4545780f8f.61.1724002152245;
        Sun, 18 Aug 2024 10:29:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a35fsm8510315f8f.59.2024.08.18.10.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:29:11 -0700 (PDT)
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
Subject: [PATCH net-next 2/4] dt-bindings: net: mediatek,net: add top-level constraints
Date: Sun, 18 Aug 2024 19:29:03 +0200
Message-ID: <20240818172905.121829-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
References: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_102914_200287_B3027266 
X-CRM114-Status: UNSURE (   9.94  )
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
for clocks and clock-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 8c00a6f75357..9e02fd80af83 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -30,8 +30,13 @@ properties:
   reg:
     maxItems: 1
 
-  clocks: true
-  clock-names: true
+  clocks:
+    minItems: 2
+    maxItems: 24
+
+  clock-names:
+    minItems: 2
+    maxItems: 24
 
   interrupts:
     minItems: 1
-- 
2.43.0


