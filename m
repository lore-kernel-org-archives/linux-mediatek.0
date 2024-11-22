Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F54D75E23
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2024 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrinVQn1Cbi8/ijEcpv1A5N1VQp4jJYPom9JnVjcWsM=; b=x0V/RlPIqAaE4FZyeW4Ck7nU2J
	kkm4beN8eFmGPWp4cmYsTxRkPvlA+z/GS6hoevddTwfMl75/b+qxD+Ktt2xgtEuHKaXF0filZoZen
	hREMZqQyhjjeMaBZWtrCjQmLamitpvQHp4Csb6fVQhsnL4SMrdW+P7Zy6t01uSxEI4Nqp+sWa2f98
	ZoB7B125SeQxOAs3qhAnf6ppR+KrYIE9aT9LVsOhEacol2W0rQ0kVn3wj5+/8fhIoIPaLZDEXV/cZ
	/1Q9cJNflVL2n6ivdKPXdNbmPtdXWGaHqQfPWRuAQbASVQqPnOkdy8dFbmhjHzwrWObi+K1iEv6IL
	g8h1sstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERFR-00000002HLL-0evf;
	Fri, 22 Nov 2024 10:50:49 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEREX-00000002HB5-17VL
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Nov 2024 10:49:54 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5cfc19065ffso2321390a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Nov 2024 02:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732272592; x=1732877392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrinVQn1Cbi8/ijEcpv1A5N1VQp4jJYPom9JnVjcWsM=;
        b=E0zhwZWHlNjRVaxhTE8NVCYaQ1pmWoPEWLJZc1k1f7YEO4zrbANixcQnIv5T3IYIP0
         i5Q3UZIlOEBwJhGDC4Y5Tgb+0VMSWRdNqNW5aGdWDvLB+77nOsyV6nJrV4a//CJv2VYM
         SxWf5Bh+JxaIIbb3BCyLvhPpDTfj8jw0rOuDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732272592; x=1732877392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrinVQn1Cbi8/ijEcpv1A5N1VQp4jJYPom9JnVjcWsM=;
        b=FADCN15tKEfqsbxGXCmEaW9YgYN49xhy8JLTdTYQZSpGx/zL8k7Fw4UofBlaKn2KMn
         vnRM9ZIJniEI4Wiy+W6CwfReFZfftqFidtg2bu3CLO2m0kTlzVdyM9jQmQ8PO1xSGE3g
         +o6/LRRlETGRRtSBLO2Uhm6BXxdTf4SSPF1uP+cYjL54p9vqckQRRm/XNrVvM25JKvyf
         nJMoVjNdkGK8jVUur4rs3SfUPY7Ub4sIE9Nm7DkngfiqUKLevBp+IBw8KCG4Co+9uTld
         r6RLLEUwDgtPTRvR1AGu8mVnmpbNF+njgnJCH/HWPclM+7+pZkJkiWJd4Z62tEUce/k4
         iIIw==
X-Forwarded-Encrypted: i=1; AJvYcCVKcjyxqHZtHw09aA/J8xPpmoCp6z7B4dRO8Xhhz8KV/2ECFF/0TAISUTxyGgyjnLGUdA7K9JG4AXn9F8XQXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDzJHsKKUc4SfzNW8AEqwkf4EovpnB/r2lqD3PkUNLlGQqygUy
	0E2EOCNYsf2JfLEZ8igLFB5/VYpHV4/SCD8v6vFeek8A6KjbD2oFfwM0R/CzVw==
X-Gm-Gg: ASbGncuteggkrbPnUn9Ko/4XUrf7DyGhI36lnem6DwYYWYFhaLfE9Lfzi70PeMjTBLN
	zW9zn7B1qLUXD3yYJX2LLcoS7IcxsDsYOMhvn/OISrjt4Uij03y44Y5O17aOd3ax2idPbbpktFk
	Yz82jqtRkpAbQaCQ03hp5h44/SE+KXACjt5SW4F+RM3kq8/2eL9XshY6leWUN7aMBt3Br9YqgQu
	a9sYGfRDmbyWanh+Y8EaagZBDM4DEC/HlKc5JQGOoAhK3skPtEB/HOn5JC1nngyxAPgPyfw0kZ7
	a0npI9vq
X-Google-Smtp-Source: AGHT+IHZnZfKf7gehP3fB8C/hlSWOPVc1U3PpxHVeONSc0QcHH0SfvWm4T58Y60rMJ4GvxkG1gycAw==
X-Received: by 2002:a17:906:1daa:b0:aa5:73c:8d33 with SMTP id a640c23a62f3a-aa5099fc310mr200688966b.35.1732272592002;
        Fri, 22 Nov 2024 02:49:52 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa50b52fe87sm82614666b.117.2024.11.22.02.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:49:51 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v1 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
Date: Fri, 22 Nov 2024 10:49:37 +0000
Message-ID: <20241122104938.1437925-2-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
In-Reply-To: <20241122104938.1437925-1-wmacek@chromium.org>
References: <20241122104938.1437925-1-wmacek@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_024953_302408_4F1EDFEE 
X-CRM114-Status: UNSURE (   8.59  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also known as the
ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
a tablet style chromebook.

Signed-off-by: Wojciech Macek <wmacek@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d9..df38bcf7c1b61 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -263,6 +263,14 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Starmie (ASUS Chromebook Enterprise CM30 Detachable)
+          - const: google,starmie-sku0
+          - const: google,starmie-sku1
+          - const: google,starmie-sku2
+          - const: google,starmie-sku3
+          - const: google,starmie-sku4
+          - const: google,starmie
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:
-- 
2.47.0.371.ga323438b13-goog


