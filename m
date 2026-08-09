Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FC6C5AD4E
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xUHnKBUv58Kqq5PRHzJhB8jsL9UTHk6ZnI77mqbe5zM=; b=n4HNvttdjq6Te7i7a0hLI4c4TG
	wV9N8YFmoh36zECm2MD4UW6z2e8ByaqIbVaUgMyKn3Cw6U7HHFMhvS7mNu+hbOLBXEnBS7MAEfyat
	7bWMzRyPWmKu4NASwVUVXxcY0FYWGceGOsWPDlLIoPVQASQr7K0B3hj4/pFFWcvFsH7k2XGKuTfyO
	6JuQ28Gq0VH28RhPKkkMsL0TmaUiqem43l9isLpQ0Lwuu4hyvF4LHWGBM96zgEbFkHSAKK4WkTlsA
	sKg44q25331TQqAxtsKAlz+aBc+yqiaYBj3b2ccOJnq37/+1InELxc8hPBGu8fT6LJT1smmWnR+HE
	v4onnrSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63S-0000000ATKP-0Y2n;
	Sun, 09 Aug 2026 16:07:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63N-0000000ATEM-3GNm
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4954df200ddso7051175e9.0
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 09:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291632; x=1786896432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUHnKBUv58Kqq5PRHzJhB8jsL9UTHk6ZnI77mqbe5zM=;
        b=J4T5PCsmRoH+SR5nxx/qRpIBV8js1xqXxbLjggvtjUtkh2rWz46+AeVATN3nkA/kfC
         bUTNTtVuEnFM9Im6AeidcMpNJ80nRyLWrl2FBMgBcBiiLnlPvkQEF5TD6dj1aydtp5qq
         kLuLOZ71CM3F4bRK5vdGijBoV/FQYJBODwCJRG0kvHOqGkZLOUsEMF4B02nvZGfwjvY7
         Fc2Alq6RCbnpyb1hf5so8estFeb6coHmxzOAnmuLQp1w5mZ8paHX+ev0OMz33Wd+0UHP
         yLT5vxdJdwRLHtNQrK9kFTMDAjKZRriE0TLObigv3fNLF3FUMDW6t7L51m5C1mpMAJuC
         Cv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291632; x=1786896432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xUHnKBUv58Kqq5PRHzJhB8jsL9UTHk6ZnI77mqbe5zM=;
        b=at67jDeQ9uhcZYkDz9Di8OrqI3mqQzW5s5VBM/mtXlt9l8hF0Xd6EHr9bproHuh8d9
         2r0KI4lx5nNm1MZtB8+cMLmHhImZJseywPFfYFO05zhciYImtYH/WvZYMD4zKfj9qusu
         Fh1UFdHxmikHcs0OR0svvTxTJlOXQkbFGBmYxXvBPot5LUAwYFSZTc/Q7zGkKfRSWQXB
         Rmuyz1KZgcMsnM7ZSsKc6MC+Wm6dNr0U72eEEPwXYiOEyynEJfuGbZZ9fb8xvGPhC40k
         VLmEQM+1+Z/P7sam8yxEg1bKnw5BtNhG+1SJmdGeRvutued4cOO0Zu9TNY3VhCwfHAlJ
         gwsg==
X-Gm-Message-State: AOJu0YyABZN9F/TZtum8HvdU16L4P02mzJKlLBW5VldJUfkm77s58IHq
	4iylqMc/fZZhBJPDWsAdqAbMRcM3adCTlgwRBLI84cfEok+CVpw41Tf/jED/PbxDzZXhhg==
X-Gm-Gg: AR+sD102BFK9Nx9zgoYL4y/FccMy77zQC6LTiEbVvJBZZIY1G8LGjLc9ENMqhlx6hgW
	tvDB66ehVlU8WmQPyidXPjX3OBnFMdwUAzTQ5E6GDeiJWaRdeojjiut3bCHfpQVcnrjgl6ug1e8
	FFOYjo64WU1yKPc02RzKriwRehkukMUCidu/Kc0BPfONnZ561MQmTziEO72uzhdr7A+p4fE4ukU
	sNjfDfJkssitwnTUXcpmB/yIp3i3ngFv/GiWeUxhEoVozaLg8GGvgpa8paLCrWk9SMqwNbMZ8b5
	bIrqWhtHgY63zwusT2JTuiX61oTiB2mUvwvkPDaJRuWbDycX0SxaTPvqFMDRP9jNWSeX80jl2RH
	YZ8vPs4poQYWrbTONWv84WaxaAtL8FPUsvb235yj1+zXMHJ3Vqm7fMa3AiR3bJMAQ79IjqVkL3M
	zMlhgY4E5tyYJtBxvFPZvM+EEDIiBEl/vh6SvoKuspX0Ik3GMipwJH/g==
X-Received: by 2002:a05:600c:1c21:b0:493:e460:1f6 with SMTP id 5b1f17b1804b1-4994e6fe377mr488271375e9.0.1786291632103;
        Sun, 09 Aug 2026 09:07:12 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:11 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/8] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Sun,  9 Aug 2026 18:03:28 +0200
Message-ID: <20260809160643.33991-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090713_838771_2D85D6CF 
X-CRM114-Status: GOOD (  11.01  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the systems to which
each reset bit corresponds are different from mt6589, so the reset bit
constants are different too.

If the number of resets varies between SoCs, the watchdog driver becomes
incompatible. Update the wdt binding to add a dedicated compatible for
mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f514be8a5851 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8167-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
-- 
2.43.0


