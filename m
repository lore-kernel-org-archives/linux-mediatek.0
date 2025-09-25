Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BCCCAC5B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 16:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOcrIoNr25HDz/QJv/9nz1km8B+JKQd3A3tnWDgtjkQ=; b=M43UZmZXkgGvQ2J2ESY3HSkH+G
	3YK6CAisjEO2vetpqPq4FQlTn2TovOjTuGJApBY6EXuI/CKwDTA40YRZmntbEVsYwLwwWNPgeud67
	tyVE5zanhSnvxVIMRrarLs3kXA+5Pol2BZBE26yhv3TrMD8icLb/mp7OoKyWOar7yFdKlHwePD3TW
	xgHA2crPD247rb+Inil2SaluhtdEl4EL0CKKvk39bdLTOGR1zpxL+08reJct4Ncdi5pqb0tfcEu7E
	SjcEqvMss57ct9DQJHFq04pb7Ki9yf+iwgAbal7g5yTcS365dk6PqVCSzCzV3LjgRZsXeKMSVAGJ6
	IEimGUVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1g-0000000BD6J-1HEC;
	Thu, 25 Sep 2025 16:41:00 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1d-0000000BD0T-2uW0
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 16:40:59 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3f3a47b639aso743866f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Sep 2025 09:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818456; x=1759423256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOcrIoNr25HDz/QJv/9nz1km8B+JKQd3A3tnWDgtjkQ=;
        b=crwu2+kTzIBbK8sz6fIaqx2zunQPkXdlfIrthUYhZXd6wbTEzQQBrJHRpvz5frIHQy
         /PMUxY8VG9D7vr9eonQ9o1e/lW1+np04tUFAF4VhF+y9A774Ckf7hCG7mcsxOjE5Edw0
         MZ+/sCGs0KJhZ5bLCA2GMoP9CFOUKxrHzwYNbUPkdh+3x+l8E5a1NGrBu00AlwQXL/wc
         0YR0FX7t6Mry0kRWQuwSuDs/MYpAiK8dItJvzWPp5I+vzdlo5Vz7E46KHs3r0ys1+PdC
         CHTmW0md7lB6XLP/S+ZNgDPMwTkGichS5w4Krf+tIiqFto1ZJH2N75E8GL4RR6VKtzxn
         ShCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818456; x=1759423256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOcrIoNr25HDz/QJv/9nz1km8B+JKQd3A3tnWDgtjkQ=;
        b=m+UTkrpbju8f0AeOZbd/KMleG0d3xx4Wd/sBFp6pnysZNXEvxqbTu34ldEw7MtwsmH
         P7Y/NNUKZe8SMQK54WeYDMzom5RGBQ6RXfIgfm7XBJ6+JUNpIGtB49fYVt5yQBYGpdQA
         AVGWlMaNm2IyNuODGhk5HNy5BYsGKK1cBfLBeZhZSUXZMz5Enk9gA09ivTQWUV7wjAjD
         WqSkBfazNQYKMk96sSImNVgoJF4AWCGjJRh3zMqPRRIyeaIsLOjKmD1HrHnBtiFhXHpl
         qVpFKagYXZ83k/+4cyk8Z1v91/jCDSiQJEy/gwYvOb3ht0zoJSrbk30c+isPJgzUE6oi
         ixbA==
X-Forwarded-Encrypted: i=1; AJvYcCXU1zikFs81xDhKxRR9n1DEJ9f/gQ2wy6WDHA051fP8rSUeaPmhthl0WXtQHrUZ+tZSb4zzvdVvLXLYRp+0Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YymG06047dNBggxC/3tUu1nAh9EUegKUuyxDiCpJMin8Cz+H8y3
	yzmY2wnFJ79aY9z5dOj2S63CxNzpX0+/Gz+NPHuSZBSl1baqa3hXb+nn
X-Gm-Gg: ASbGncvaocsKdsGSF3tQY+XvMXiaTeYjSSD1QGQiLVI+YG8sPFvCYVw4bKDIjfKchE/
	r2i4JrOl8lwEBfb4M3VLd9nXVjMDH6wjN1675otZVv0oLiPCww/nEcShzFus6UxzqH7bf6hToFz
	69cptxE5HqL239wCIUaR4kMH/5FOdh29ItE8M7X29ziGeTyOF4Yx1yzmx9UW3ZiFwuWK+40aXdX
	ej9cOiS0L63Jw46NXVz0QFvGBF4YEgU2muWD9W/htThx05XUCFZY1WxXgaoFGV4Ix/TooXOkBFD
	Ft4z7m+I7KojytpWNZm8ORlVdsXVY6c7KrMDX+rOJOmRXtdFI0q2WH3WUjLM2bHfg+8WQu2Tobf
	uKVDKzUnjWh089eqUtlIZFE8gT7919LmL0tBxkcc7iP4r9qVk2692qy9/92inCnS6Yl4CGQg=
X-Google-Smtp-Source: AGHT+IHX/CI2L/vfg9Dj8p1oMbt+FsoCRcXjcK4DCzITBXnWVWzmuBAbvqxNfCx8Z5RM2iRB5ODlEw==
X-Received: by 2002:adf:8b88:0:b0:410:3a4f:1298 with SMTP id ffacd0b85a97d-4103a4f15e3mr2182661f8f.15.1758818455924;
        Thu, 25 Sep 2025 09:40:55 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc6921f4esm3591904f8f.44.2025.09.25.09.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:40:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 3/4] dt-bindings: arm64: dts: airoha: Add AN7583 compatible
Date: Thu, 25 Sep 2025 18:40:36 +0200
Message-ID: <20250925164038.13987-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925164038.13987-1-ansuelsmth@gmail.com>
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_094057_941091_4CF42ED7 
X-CRM114-Status: UNSURE (   9.96  )
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

Add Airoha AN7583 compatible to the list of enum for Airoha Supported
SoCs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha.yaml b/Documentation/devicetree/bindings/arm/airoha.yaml
index 7c38c08dbf3f..df897227b870 100644
--- a/Documentation/devicetree/bindings/arm/airoha.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha.yaml
@@ -18,6 +18,10 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - airoha,an7583-evb
+          - const: airoha,an7583
       - items:
           - enum:
               - airoha,en7523-evb
-- 
2.51.0


