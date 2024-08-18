Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCCFC5320E
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Aug 2024 17:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0CjQK1KNzHVntTC0DMWrSHcz+PiTjzfj1MSfy1NDuc8=; b=jVLAlHm6IuZ/QZ/H1OigYF+y+8
	nCUN3utR23BpsO/UTtB06lMK88vMlLx3oQ6PxbwK/eyvJs/ejHc0j6PQpgKpyhLcOgqvwBTi+VGgk
	oqN9nZlnshwZLYan35O/aUxpDKihvxAYYZVrj3et6cHVQQ4kfyZSWqyfhEMYHED/cOMT2eRSBefVw
	lGHdsFGn+XW2QS8DUfzZd005hCKk32UG2nsjga5RnwGFxFFDdqwLbjLaNQBwI4fo3pdGqz23FIGBf
	hlGujy86uwyZAYUyncXXj/PwNY5LnE5i82igc/bLIHysNgii0hzx4OJcH3M6/L4HZuNqtRoCOWWvZ
	mc4ThivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfjmW-0000000Gu9F-3ISx;
	Sun, 18 Aug 2024 17:33:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfjiK-0000000GshK-00rP
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Aug 2024 17:29:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-428ec6c190eso29568995e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Aug 2024 10:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002150; x=1724606950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0CjQK1KNzHVntTC0DMWrSHcz+PiTjzfj1MSfy1NDuc8=;
        b=LR6jM7/Cl/Y1OvYBDSMUr5qvfnHPSyetX3lkQI8apJ2GbJXA3Aw31t3ofNe4Asvufm
         YQSXwRvfspGqWNPpD8YzBOM6jqGCy6H9v9b64kAcFmfp14HicThcQj1J0HHJEfHit2Nb
         yxfwu8N6et/wAQ+hX3GC+zipmAsYDe6NWO0Q71iyWCAGHLRRaxawQg3gCmLq3LzItK0e
         N0Oufeq3q6m/tdwsstACDGSYz/wpv8ptvGhX8YWf5bu+a254XXaRCnCbLqvDzwnUrwKc
         sj/eJJTkdhXrXTpR1+TI6FYJlIEYTBPsPvTCvccEikBSFmhCaoh9hYGw24xSnOMlyOn6
         uuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002150; x=1724606950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CjQK1KNzHVntTC0DMWrSHcz+PiTjzfj1MSfy1NDuc8=;
        b=a8UG0GfA5atM1c8BZN9/bYCZMgiBUA6HZ/u8XYPYUWjukhWfZ2/C20qAM8ILJ9x8Y4
         /HSfm9bwUGPcTq2qk+m63kEdgxs2FPV6w/5SGDDWw12aFkbAqvySMzKnKlUOEfP9fIyd
         L+2epCs9IER6n9RtfPJ9GFlSUwrDDwKmC5/PzAu90/fRN4r4JU3WviLdsSxQmAz3TTW1
         AEIuYkD8iPZCjTwq9F9I61hUbWdnPSkqDAc2DV9H/MGPJb4ixluTwiQxRthFQhIuIrx/
         eNFGFvz25RJVVfNmYliDFWg4hrpTIehvzDHj0kmsa+40tI8D+hnXlba34uNP0zrhNF3u
         cqIA==
X-Forwarded-Encrypted: i=1; AJvYcCXh5ykJK6y423PgXkVpveIk7NZjwoLVTrE1O0V+OL7A13tR6y1lI4yR2LHPFaBcp1jS5xJbfDaT2cDJskFklRZ8zHPSyMcjH9RWe8vhulfIoWOh
X-Gm-Message-State: AOJu0YyVJ2wsFT/yNOHjjpup4zmTxB9ijf/9euFjdzRwMvVwhoiRql6h
	HvzriZbL0/2FJPf7R/gZT6eU0hOOxlZ/gBaY3+S7+9UAReeUnG2VLoUx9f7Vcbg=
X-Google-Smtp-Source: AGHT+IHVSICVAMx+qHSqk3Vlj4Vd8bvZ+oQ57yyU7L62VJrgm0bid26o1BgKAEh04NfnNQ975R706A==
X-Received: by 2002:a5d:6848:0:b0:362:b906:99c4 with SMTP id ffacd0b85a97d-371a74784a6mr2851156f8f.58.1724002150234;
        Sun, 18 Aug 2024 10:29:10 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a35fsm8510315f8f.59.2024.08.18.10.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:29:09 -0700 (PDT)
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
Subject: [PATCH net-next 1/4] dt-bindings: net: mediatek,net: narrow interrupts per variants
Date: Sun, 18 Aug 2024 19:29:02 +0200
Message-ID: <20240818172905.121829-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_102912_052781_239CF770 
X-CRM114-Status: UNSURE (   7.96  )
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

Each variable-length property like interrupts must have fixed
constraints on number of items for given variant in binding.  The
clauses in "if:then:" block should define both limits: upper and lower.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 686b5c2fae40..8c00a6f75357 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -127,6 +127,7 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 3
           maxItems: 3
 
         clocks:
@@ -183,6 +184,7 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 3
           maxItems: 3
 
         clocks:
@@ -222,6 +224,7 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 3
           maxItems: 3
 
         clocks:
-- 
2.43.0


