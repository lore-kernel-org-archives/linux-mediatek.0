Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434EA606A32C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p+2wobTI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m7OsL8XV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=; b=p+2wobTIMmnK7lNUD7JKfo3lVE
	rtIsp3bTSS/zX0juklAmV8iw0QFk/F5yYg9No9jnTSUnQPA54oSaFtbWcPLSzwa9ozN+Zm4NZJivL
	Wi8s1jpsnzG6x2nt57PzfjIWgCyLCzmq3OW3fibnzRtqUTvUS0G02Vz9t3pT9Ix4tb32yWmJOfM+z
	PBGGXITqK7XUCMVL/pkb/+K6SpxCOC7YxpJ38U1CM5NL5snrk/5mwUbT34YJh2NkjB86x2v86taNo
	b31apC/7XfIHV20sf/CbTLD6tPxjJZsXaPpEsftwwH4o/Rz7Esch1T5UIKtIlr0fnV8G4wtkX6QRp
	xVfRmrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTvH-0000000Bejs-154S;
	Wed, 21 Oct 2026 10:51:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTvD-0000000Behm-3C8y
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 10:51:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so4083825e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579910; x=1793184710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
        b=m7OsL8XVRD4+5qV37y/uygsnLXueQTv3lKJqlB3ZQV0vOX6hJxG5FnFYNZ0qrhhlY/
         i5HepTkV5FoLLUTjtOVJov/sy/3kYFalL+a4QkAbkURId6iJ6RkYFgLqwDFTMF0dI1DE
         aIsUDE2B5TkLWNFKkZWosA3Tp6SmjMtPeHjc4K0q5fE5rYby17j2K/M3LbaEkarWJoVp
         7Wb4P3J0WYVLZ4n09Duh5qbY5wheqvuXD+MtBgStf7VBnERol+WMwXy9THrIqf0V1FWl
         OJb/B6wJRVy110AbRI+7exFwua3g32uQOX+yOdZZzl4zPQcUeS/UmfO5ytrh0UnlEtGI
         /goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579910; x=1793184710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
        b=uDDvAlBlk3p4kq6zfq4GVdDG2mLKSUkkv/FZokvZeSQ8+fw8DoSSbRUwfJgDu2o8ak
         whStN9Kl/rUuBjNa5lBaDFdqBtC1KF85d6+rmeKG7HaWxZa/PXPIgldN7R57fwj2uXrl
         vNUoYgGMtBnPn6vFqsoogvP9EeEEXGfff5oNP12Z3ZJ1a52fg1Uw7FvtpwWzhwHuNcrP
         cYRNflnhj1D0XFL+rLYBwUfL4oUluPB39xV37BYIdzy+NAZrSxdjRGeyShCCiksdx0gU
         1OL+xintX+Y4aD7Aa+xIYbN7nmEMIXLcw6JM4NbDaiG3o5JuT+CREdxq4IPd5uudS94L
         zXQA==
X-Gm-Message-State: AFq9FYIJXzUQPEhoZHS87zwhdLXHWnrotKyLhC8Seo2UOtTkOtWhqwLO
	7PbwJgkjLiIQzEAunjUo2z3BZDflVpIHIAg+pwkUUV8XjjrFhZZlNUWqpqn9Zo6Q
X-Gm-Gg: AYBFou0UHK3NbZZqNAgmsZwENBPnrlpABKNO0PJcjx4IXJrUYnZoG3rIa8r9qbLV1cd
	Z2CQ2F0yZp6yEBUeyI6IfXq/RdnVW5fpM435+B5r00CVIjg+UTAHmAAkWR9OVD3be+knDZ0libw
	inc1uogmvgPlf2+L30vH/JpuOTbaV6Uo4Vaem7eJo72UQMSZqq7Qllmb3dv9pyZW5ezUBbgjCMS
	9eO9L+GwX6Gh5Aj86zgMy5YvcE6n0nYqF/MklqqJ45ylkptyM+ITJw+GaHnXemIin08bP5EK1lW
	Lqyxf1CGweAfCwyD4GQ83HO+bQpfU7POpHKXWkp4s4a84YmFIulRFuoPMNjoIPfiIT7w1PNXuaO
	huVqt0eYxoWrtqHjrJOO3d9izfVbIrBR3t3zSruxYnNtY02QPVwWP5W2455mk4/G9a6JdoDME7h
	vEbi8AuWwJscDUDikXqKJtsPg/6Lb5c2iltnoTjMuTJm7XI4IZgChtLLYwTzJQr188VJ9aY6qC/
	HlGlrWFuMG6zho7xSTJs1ONu3CImZlYB7ToinMWF87ayIoGxN0=
X-Received: by 2002:a05:600d:4447:10b0:4a1:d1f7:bea with SMTP id 5b1f17b1804b1-4a1fdd1e568mr25614785e9.17.1792579909764;
        Wed, 21 Oct 2026 03:51:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:51:49 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Wed, 21 Oct 2026 12:47:19 +0200
Message-ID: <20261021105109.199886-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_035151_818860_FF925879 
X-CRM114-Status: UNSURE (   9.03  )
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..da534fa324a8 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0


