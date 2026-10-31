Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C93B606A31F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2026 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UmUhcAGy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0RpEKKU5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=n5fn2TQdNGCA2VZcSuyjatq9JArIEf2Cj7b3OdvPmrY=; b=UmUhcAGyuSolJMBj5LW69GwAYb
	SFSpmj2zd7261YxWWiEqI5yFLrxjAmAvUSo/iD0I5Gs1GZAnKnMlqwE9/LIKHoZVJ7HawUJn2Kven
	Vlhf4UaJvbe6xZsyCEYsoKKjieqagy3lB/563NFKaNHQFkWLI/HPLnzgPCEzGE18gzc39aW5W9uS6
	VUXeVvuNgHWXnRbtqgeA2uool41Y/9Paw+cJDKYysBvQ1T9s6zITrKKHA9FY6YUhreibUQTg2Uazd
	LZYIzPSXoFOEjSgFXZTN0/CQlxj787UTpNillXK9PaNgiLzSlrtExnth5w7ee4QpkE+kL3RQYKQ4k
	cdjuwvkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6IX-0000000DDAd-2NQg;
	Sat, 31 Oct 2026 10:26:53 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6IU-0000000DD9K-1hnk
	for linux-mediatek@lists.infradead.org;
	Sat, 31 Oct 2026 10:26:51 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so12816335e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 31 Oct 2026 03:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442408; x=1794047208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n5fn2TQdNGCA2VZcSuyjatq9JArIEf2Cj7b3OdvPmrY=;
        b=0RpEKKU5VdfNrA3iQvErwSF6Aus962Di0hoeivZ7LaVX69BFlvUiJ7gpAHNy0eH5I4
         EdSzcZGl7QcBPJ8GyrOn5ATvLIErczB8yw9XB/o+p/0WQqmKDB/AjJvn8AehBnjxN3j5
         vOhKKB5KS8Z5KC52YRUr20At/LU6QLfBOC05yljaJ7VzkDGGHHMpAO33RyLoBNhipXnY
         P9jy3n4dqtNVfXvo1d97L8+Xg9oB/sa6NhzWUopcIyKJPR3MaY7bQXZHIjmroCMQMU17
         mySYDDu24685DsOShVZVtH6LoUJsG9Fydu7UXVzF/g5bc71RMF96+xoPyTNaWNNge3HC
         gz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442408; x=1794047208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5fn2TQdNGCA2VZcSuyjatq9JArIEf2Cj7b3OdvPmrY=;
        b=AivkfYfTF6/96LSI1D1feFmiBLevOXa6bTtvjPbYCLb1XuAicQ6Z3qx5yMMNmH+znS
         svQjniXkjcBFPUqPSceISvhMT7lyxoh7cmy3ZvUmm428iErxO4bHNnVrYcshJNpFSk0m
         sPqSioC/SqsliS+uFNpn6Hxhgr6hLda5lx0QzfDprVrUJkJo/sKJatVTEWxwsLz5AzOT
         /m/Y0ymf4GO24VWdsz2cslhZBgouGnjPRbWMm5E9Y0wgXhdpXJKkIJgNfGgNWResX0iO
         Xhnj8fwOhr9MPttUOaXJpt2KKj8sV7fuivTaPoV82b7EC6amdt3dKZF/rH0JYNtlP7h2
         S4dQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrujNz6Gh/SoGYj1HXBAuDN+bJDId5GgHhzs2rqrV7ZD2oRBE7j8jwgDCcsFkbV1zqSnmHM1Xu8EVKGqOJhg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJOlcF1xrk6rYYof3niR98IalXEEl6sZnJPvqf/ay3TyjCxvqNq
	TTWhNQITthrvW4+RgbbzZwXrjtGSQcKDem6ZX1v9UAt7rYzf4NXiX5UsfzLa3Q==
X-Gm-Gg: AYBFou37Zl39FMZbJgdACBYBzq2V8csoccecvkudasTiDcQ1SWV/sXbAhZV40o1UE1Y
	uVW3BO/kGeF+dKMVvDHGVJFSSn0Y4cwYLHKe1Emrr4Y4vUBlzopHwsZAcSNOCYefHWJ4F03op15
	DsdMpeujFxbAowSFCryHG7+lTIyPcUNfPunPubKrZoA4nmITy+MsRsoibk5YkkvIX8rVROUiiv1
	R+xrEr0eQ9d2WKOeA1tonRgboM7kt+RIMGhsvHGHrPpffPBMBkFITBqivav30K3ZykTE73s1EQ5
	qDo863Bl5NdpPKyPdfNO4NOVrUG6BDT1TkR6IsTw8fJc/WJlW+IPAFjRuYnX1yTSxyQ02oHVv24
	Tlc20mFIH62kZw/OHQfxA2z+tZ9GcJ76VhUM/RqWtAL1a95T/09e/6zCOxSN3pHfN/jvjZWw8XJ
	oi7PXBqOULtuZxNzQ0ARS7eqdxRhRLqmrC58HLTFqkY8KMi7gQEZcaymutI3BoO0aBnkGgv+7W2
	TNiPequCAvJxS9CO11gPpwwyoYgK/Zms+7pfqQdqN6lQpVC9ndUDs0e08It2HuysrwU/OkUNi5c
	l6arAdYD9z28P/5oOI44hogL9+wEQldOQ/bwix69hA5IJP+XiIvXvpEi7ThtRPmor1whKq5ajYK
	Rk1JIIYSXYoPw
X-Received: by 2002:a05:600c:4e13:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4ac1228978cmr101856105e9.0.1793442407739;
        Sat, 31 Oct 2026 03:26:47 -0700 (PDT)
Received: from Ansuel-XPS24 ([2a0d:3344:54ec:1210:f1b7:9ece:c6e2:5df8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm90903535e9.2.2026.10.31.03.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:26:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: i2c: mt7621: Document an7581 compatible
Date: Sat, 31 Oct 2026 11:26:39 +0100
Message-ID: <20261031102641.12649-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_032650_442849_AFFD75B0 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Airoha SoC implement the same Mediatek logic for I2C bus with the only
difference of not having SCL_STRETCH bit.

Add a dedicated compatible for the Airoha AN7581 SoC to abbount for this
minor bit variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes v2:
- Add ACK tag

 .../devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
index 118ec00fc190..e6ea5bc1c681 100644
--- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt7621-i2c
+    enum:
+      - airoha,an7581-i2c
+      - mediatek,mt7621-i2c
 
   reg:
     maxItems: 1
-- 
2.55.0


