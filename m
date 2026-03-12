Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609D6FED2C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 04:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfQVAwu90WVWHQAGRueCitKle/Ck+lGKT93AOgn7lLs=; b=kQ2g6SQmla4ipy8P2V02eISkH7
	s7nhJ0PN2xVUI1iVxP0VSDW0mdOGyqcLonhvl3pO9DP2c51yaMCN+Hnea+PbPuhwvb/unKwez4g/q
	0eIZSoYRAVQt/khTs/lB3aOcZ2tiaSdSd30HUme0Pn1/3ZakCXlXn7SUg547DQdn9w5lHr+HUK6aG
	6iQ51PiBvUfEcc1dTV/QHjexx5yqCPZRI5q9KsM5oIq5jEJNpwdF7GXHZfJwb5xPj0rVRWF3rElho
	CUxryNXYCujKqsrhYBsRwCIYBTRFEA1j46kmFENAH3UxCwE9Q4s4jgv2oc/c2EwKKDiJuNDXHxNL/
	J3sufcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XTK-0000000DEU2-229O;
	Thu, 12 Mar 2026 04:16:30 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0XTE-0000000DEOL-45lE
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 04:16:27 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso334782a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 21:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773288984; x=1773893784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfQVAwu90WVWHQAGRueCitKle/Ck+lGKT93AOgn7lLs=;
        b=aY4uywCtDnJwGgR8ThIu+X5RQGDkuMbCRYT5HKoc6WaFp+mweatSqkAjky5xza6tWN
         FB+PQn6OR8kbTE0zxnFxkgb+slIT0Y+ATUIkTavPz5bv6HU4gzQHL/bky1UBYwRU9PCW
         wT3ISvkbcFZawCjZP44QUvfOXA91mtOTleWCB4buz4xwiyf3WeXo0dnFZZn15HX91Ll+
         UJllFZv5uBfiApRhsvcsJ78BKNj2AbxZ30K3kQjF4uHQP4C3AhpF/GrhngH7sasmaITD
         +w5o8mtUSXqlaVzFXQ9yG0DKKe9DV9ch6XyJPecnp2kQqBhZeJp6xx8fLIrGLgGC285E
         IY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288984; x=1773893784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EfQVAwu90WVWHQAGRueCitKle/Ck+lGKT93AOgn7lLs=;
        b=vAkqx59IZt6m45C6S5jiabvBCGW7aYPeL0ddZ142As4mnlgwUEt5xnMigeTTA68NHn
         QJWVaL05MI+glyfQxQdxVBfjX97wvguW9tLu7ZBffuhudz4D55j+w4Xcw6D0yrQJ2TXu
         2E2XK3S55CRToJH7lRZLProWOkvvQKFJRMsL+MnOfy2H9corQm2lyoFNQFpbhdo2fevC
         6D9f0qM6NFWhgOG02XT96rF2ajtSkensmu4v1SlFUe3lloSHBsjfCXDiWpmx9iGfyn0G
         gU4dbX/9ZkYK15EnoYkpMrviVKJswiwptknO0IZEGfklxh20TyVH6C2xFyXE79gtnG24
         qM5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUznTNZYe9xO/PN7pufYXlOj2fxnoVlDKKJw5uf0ch5XDolGpoN2ZDqBTHcbUPr2yP8guYSL6vi56FSlc2muw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn7YSqURlBvEc123tE1mM6t4OG1CU519yzdOH8OS5kW+fja/gy
	0MhCx5FRBnDDNLOy5wqZCTnw3CZoRTp4uddANGImv5NPiTgrPJCWRWtQ
X-Gm-Gg: ATEYQzyXFhagRmG7Cm5W+9iJaUvRJLISyvKV0BWQb+8vRZgNau1Em0s36EMV7dCNnvp
	60aK7kyHOEA8XAniOXUk51BFGKWZ8h2cQPwI+mk4PDzg7WZPx8WKARzt6XPQPz3FfWga2qE/jPN
	pf+Qit7iMUsMsJLUPl6inT58er7cUCVldiw4lU+ZOJusTZq2vlneNJP4qjxnL7wZZJLwQ6G8mDW
	b3aRjEDovFOCDPwPkQLeZqmtS4vVA8gTKXToX6MwGZXg9bs1Kd6IozmNj6ELht7EHjGRz+QvFOo
	ndmT6nUhOo+Qq491ACNQuJnHXaDGnKfiuCV29cDP+G8dWAW2HPHUoFfbzUAv8Pztqjo2ER6OWBg
	BC+qCjcPwzV83Jpc1OcPmoUbz+cO8R4Mjq9pH0TK7GtwdD93MO3k9Du9JoQVpkRW5Hh50Glt2KC
	+WVT35lvyiaqD380Pc5/rX3O/Wt196YClYgCJjFjI+iWen3tYv9gS/chNQ6IF3q72CzD2xHOhfG
	iETJpc=
X-Received: by 2002:a17:90a:e7d2:b0:359:f43d:4a78 with SMTP id 98e67ed59e1d1-35a01284a88mr4254615a91.20.1773288984290;
        Wed, 11 Mar 2026 21:16:24 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fca40bsm5018229a91.10.2026.03.11.21.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:16:24 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linusw@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	hui.liu@mediatek.com,
	nfraprado@collabora.com,
	linus.walleij@linaro.org,
	mars.cheng@mediatek.com,
	andy.teng@mediatek.com,
	hanks.chen@mediatek.com,
	sam.shih@mediatek.com,
	rafal@milecki.pl,
	ben.ho@mediatek.com,
	erin.lo@mediatek.com,
	zhiyong.tao@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 5/6] pinctrl: mediatek: mt8188: Fix include guard comment in the header
Date: Thu, 12 Mar 2026 13:15:32 +0900
Message-ID: <20260312041533.187553-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041533.187553-1-akkun11.open@gmail.com>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_211625_622952_8973FA99 
X-CRM114-Status: GOOD (  11.42  )
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

Correct the mismatched macro name in the #endif comment.

Fixes: 11b918d90aeb ("pinctrl: mediatek: add mt8188 driver")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h
index a487323748e2..a688e919b32c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8188.h
@@ -2256,4 +2256,4 @@ static const struct mtk_pin_desc mtk_pins_mt8188[] = {
 	)
 };
 
-#endif /* __PINCTRL__MTK_MT8188_H */
+#endif /* __PINCTRL_MTK_MT8188_H */
-- 
2.53.0


