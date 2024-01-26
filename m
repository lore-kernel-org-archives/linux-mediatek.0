Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D584EC47DDB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oTTl0kuIE0sGIGedIYHJhdAzFdP8/kOBtYd/88i2hU=; b=wcUx+CYHvXD+jKUrq63pi1S1YP
	rGaz7OcYVNEUdRmqkpsZcCjXnXsT4zff9UfB6+wMPkHGvtkymU848nL1h3isdWVdgaOMz+q63PVCc
	H/FfjtaxRK1XlYtmtwAZFMX1LXXju6DCz0afFO/zGH0KIX1dnV/HAD2ROzXhNKvfNvQyx7N+QiVug
	/qnrCd4drnLXeWjxA+jkuXff2cGm+0h7FD/TVosZQftCLa9s9OtCyYK0/+V186MO4VYZ6PcUvlqI1
	e1FLGTI+U8kBhnnetjHKfIJDaVeHWZ1PiAkb583UkUkeFAa7mGK3TNNFnAZMvE6Kr6Bj4o2mx7yhT
	RnV3TsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHjX-00000003Ss0-1V2j;
	Fri, 26 Jan 2024 08:38:43 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHjH-00000003SfB-1yJ5
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 08:38:29 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d893950211so607065ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jan 2024 00:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706258301; x=1706863101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oTTl0kuIE0sGIGedIYHJhdAzFdP8/kOBtYd/88i2hU=;
        b=JItmshFDWGj4YkABsea/wcOdGU7z3YgXLToH5rAbLL0joYIZZDlI6Kbx+wu53bgasP
         etzLri84CVppzR8NHBEHGjoVMmNezcJGLRGVDTUx3mL4JyZ2uMQir5vdq8mFSi00yEX1
         RAHLDv/mst/YCbsOLW+ui15KvyRgj1Icyr8ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706258301; x=1706863101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oTTl0kuIE0sGIGedIYHJhdAzFdP8/kOBtYd/88i2hU=;
        b=bIYuEjuUZfpA6mtny2Ij7hLSWMnlukB7/xtCoAZSL25rW9dF7P+RKO/A0k/2Yk9HEz
         NFNQOR6A92b3nt5xX55vdkaGODXrSK/Ma987n1KBQbkRvgaoxdtbPyzc6wnx/5LXxQrh
         bo+hrrDY1cx1tgGfIixw3RZC49Dv7M9KMLqHSbcYpcg/WrrsMhiEWDPrLj2Ud6u9MbPJ
         dH0hno/Ns+pKDjumGjLcWU+NCSNwHKxxCbULCAgs23z80vokRPOd9PveuspuxHaEIjiM
         TW2Qq41Jn8lpOzf4UIPx/v1K733unx/COtvLZ9r/5JR6lhl45XDYn0T+vxzEr57v6Ydx
         GVeg==
X-Gm-Message-State: AOJu0YxmqJVD60JuDqY3eLzjli4xI20eB3z9GReWFlYoWAKt++PY9kEw
	R78XTTlPxrugZ4xXg5kNm6W+Ik5pJsoNo30ZH/ZGh4wNyCEWDevfzyCGm1eJ5Q==
X-Google-Smtp-Source: AGHT+IETHH1fQVURJgrJ4iOrJNkKJ3noS96sIPlIi5X44S4MZUtWIcs1NtUNftj3yuO6DgF0WGtHgw==
X-Received: by 2002:a17:902:c403:b0:1d7:4d4f:db24 with SMTP id k3-20020a170902c40300b001d74d4fdb24mr944475plk.0.1706258300840;
        Fri, 26 Jan 2024 00:38:20 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2614:bbbd:8db2:1f54])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902a9c200b001d6ff1795aesm589529plr.8.2024.01.26.00.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 00:38:20 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 3/9] dt-bindings: arm: mediatek: Add MT8186 Steelix Chromebook
Date: Fri, 26 Jan 2024 16:37:52 +0800
Message-ID: <20240126083802.2728610-4-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240126083802.2728610-1-wenst@chromium.org>
References: <20240126083802.2728610-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_003827_694150_79EEA14B 
X-CRM114-Status: UNSURE (   9.19  )
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

Add an entry for the MT8186 based Steelix Chromebook, also known as the
Lenovo 300e Yoga Chromebook Gen 4.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v4:
none

Changes since v3:
- Collected reviewed-by from Angelo

Changes since v2:
- Picked up Conor's ack
Changes since v1:
none
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index d9fdc1196b10..23acfe5ed940 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -235,6 +235,13 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
+        items:
+          - enum:
+              - google,steelix-sku131072
+              - google,steelix-sku131073
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402F)
         items:
           - const: google,tentacruel-sku262147
-- 
2.43.0.429.g432eaa2c6b-goog


