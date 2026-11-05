Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EE3606D810
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aqmp3cQ4;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aa3bXK+z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GLyW+wsd3C3ATj3CVMuJf8KfUTB7e6UqhqMzErsAQ1g=; b=aqmp3cQ47D/uhe
	E+Km9wGW2b17aOXV3TCkjGcuilnG5thtAZMEWZkK+RixAu4aX2TU9gSyA6ol1qpAJkMY/w4Pt8pEg
	bIVNKwA0kkshopg6kA/TJODEAfeSEpTzrbAyYFBkWMMQb/zEY0kiNmSL78fc0MDXIBcPubyJuTFrM
	KOA7brFu/lLV7FP5HKiRIwxlz1y8P6CwWzh2KaLV9eNVK/u/pADImNxHzF6lyz85OFx7WQlgdTUug
	I6zxQ4IbKmLf7NQEbga4gFJ3Crrgs8B9X50jhK2o34n2AK9/ZDMo6598nx7GkGfMaF6QdTOaOoKPc
	TEKe9ZQkFLnz3EdFQlUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gR-0000000AgEu-1MTv;
	Thu, 05 Nov 2026 21:07:43 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gL-0000000AgAf-0lE4
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 21:07:39 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so182736a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 13:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912855; x=1794517655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLyW+wsd3C3ATj3CVMuJf8KfUTB7e6UqhqMzErsAQ1g=;
        b=aa3bXK+zUDu/55pEUdJvEOw1zC2383WfyNnjtRycQlGp1UsVSkGvWZQWLDYxiNRGOg
         KKe6sI2Z6LZVFj9PWASMLM7JFSot6UhMUShPqPuPwsu+BiIVFbGWx1bpd6Obxy5tagUK
         gh3nCV6OxYDkV0lSFj5tJ+DAElkptqw9y1741WS/sxYb80QQ6RL6bSCJMc1er2vVq70p
         vIGyYSsoyqQ7lIRdbWiqVR5LRSYcx+33qeFLRw5iuRFX6GjLPiSKcLObx/1ChH3yHp4z
         FcoJkCDoGPYM6Le6sw3bBUZVbqR3PaPrJHnIYgAOQkQAs5DIkxhbz5e1+cUpRcksY0BI
         BYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912855; x=1794517655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLyW+wsd3C3ATj3CVMuJf8KfUTB7e6UqhqMzErsAQ1g=;
        b=RGFtuNKmLe4QfCq58gKGuSg0b4qwdqOYMKEIhgJGNR28xF6ttsWmRxjqg1+/z+4Rqk
         vXX2031qaUATGxaQIPB9k55eq80N4fkdCQI4ta8bBZa9JSR4P+2xpHB8i0wDZcu/2JFk
         UUVJv6eqrG/cEYVyDbqLDYaiGDmJmYBrSb2DQTGK5Atv3QzLPaOa3wngfKxo71ghYeHP
         su7mMG9cfs0NqJ+c1aTrYNE+t7PQIf30+RBJdHHbhRqyRA2hmwoAhq4t3ucnXloSgYWs
         bEVTeeolf5kfQE09N4+8CuJlpgI1i84/VcuWeojFbL/yr4gWTALcmWLEUZqyOJ+EvhZR
         gUYw==
X-Forwarded-Encrypted: i=1; AKwUvBwQsmlsmpWhVFKqTIowgSocXaq/mwAjTucg+H2/2diTfHxa95guIRWjb0/xP4LolMoSwKDKJzEHXeoA/fbmGg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+vflUH3wIWWTDvqpWAWu7MMdVs8n0Xzxk9S1jR51OCaLoDnQJY
	MsFQFlDtY7lTlcXcaZpxIITKthiOokhDkLRWHV1RCVoXMlyVyxz6hkUne2am8Pg417HAHC/S
X-Gm-Gg: AYBFou1iDiJlsYbEbZH6ZmGnP0/VL1C5yoORnX+MsTopW+eOcWozYAbrYBiaYBtBRjF
	yNVoUGbiZsQwJ653IOmz6Tb1C1PPODHJ3JZBjkeRFz/f2ZAqC6xQJBqHtOEMr+kl6kuqhoFcKWt
	2HnhW5bblPL3OQYKvQHWZEQtXG9PXqx+Rftt0aXeeafreSFIYdiMN42+ffgRye4lfo30b6YVrYR
	N6cSYvYhPuSWe0ICJ9MtMpj7rQ9nbE/rX9w4B82Yg/GaxXQdvdQDicNh9et4Q2zpFJU+ZLiVRm8
	wjYD7Tk3Np7ryQQvWtTwq6sEeUMzUgQd+bl5c3PPKBrjZatVxpiNY45dD0CfUdGl2SdCPJW79F4
	A+0NCnnXLveFESQcqOg6B+LEj0TgWrIGC5u5sMW0DPenaGZT6SYJirYJnVXf+kXveZqC/GIep/Y
	UxIk6D3KjI6nwcOTpSGJSm6TZD3Z0YcOjGgc1aQ0xWpoyvExdT0rlxHICwaYPx+97g0nSEp6R7D
	kFg9lpCLYbHasS0GDr5l3II3bflSVde++q1u6GwojIu/fwxXhKdbztz0NDUqbsSZoJnmr/lYHAB
	7kTqYVzT3iw9ed2Ivvrsk93GuCUA1Ox1Be9lVFtM5CfD34c4V88U9idLIxXdr7sJpM5UQ/M=
X-Received: by 2002:a05:6402:234b:b0:6b4:bd6d:2eef with SMTP id 4fb4d7f45d1cf-6b597475582mr314181a12.0.1793912855525;
        Thu, 05 Nov 2026 13:07:35 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:35 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zakariya Hadrami <zkh@mailbox.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi Poco X4 GT
Date: Fri,  6 Nov 2026 00:05:59 +0300
Message-ID: <20261105210622.523747-2-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_130737_265645_75DC4C59 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Add the compatible for the MediaTek MT6895 (Dimensity 8100) SoC, along
with the Xiaomi xaga board based on it, which is sold as Xiaomi Poco
X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..28180ed0e815 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64
-- 
2.56.0


