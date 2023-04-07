Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D26C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ur5gBAQUU5sWkYwoSsgIt09ft/hZck63dNnALmT94k=; b=KDXHT8etxInn1Kr1uv33L+L/gT
	30lsoGzfcXJ75sEqcp6DKfl2qHodCTHo/v9aE2LCKF+1O4tjzCWJHemscfUC2WvvwnopPBLXbw8bX
	rF+FjEhhlmsNjLskiknyhs+fHpMudGJfmFejQln9o6IpeMaLHHwJHhmix67W7s6hyDyY1PPirX72+
	pzKlWNAWyWe+vOTLpe537J8XsfK+FRkEPjgXwvBzbqm/JGKXmgolzO/5Di+ZM5TLuytgcv1wyzz84
	oZIwlMxie4jVVFnRrXdDAWNE6r8dSAz63PlVzVG0L1def1Pbnd73iLT34lm9Bx1EGIYWQmoBycNOM
	trbeNniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklYE-00ACjV-2w;
	Fri, 07 Apr 2023 12:50:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklXz-00ACXq-0f;
	Fri, 07 Apr 2023 12:50:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id p34so23987614wms.3;
        Fri, 07 Apr 2023 05:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680871827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ur5gBAQUU5sWkYwoSsgIt09ft/hZck63dNnALmT94k=;
        b=jmvLvlSuptupcp8j/tpJaul5eWm4fGvzbfGMuWKm2lEUq8411XoYEJK5VMyg+S5FFt
         TjuZGCLe30zV4PkL/yCQzNQmmN00nSbINDsnQPOaTcjBK0B5/AAogmRdiJLjfiPbv9o+
         WVO9o3NyW9h+lmQlzw4eeTi/XPEHlEgMemwsoq+TKAOuSXYt/5kqjaTPCqCfsXCewN/z
         TN8n2RJF3V3q1Igjm0oaaau5wMgYwqps7laLiP3Ym+UhDtkuaVgy3FNneYVtAXTQB4HA
         7KTTsKztjnVlXvdu/6ZvDUARAo5qW+HL6UtjpR2wRNyHXzx9ttq5S6qgiDm4Ec/YrNWb
         APnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680871827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ur5gBAQUU5sWkYwoSsgIt09ft/hZck63dNnALmT94k=;
        b=qgwCDXGWpIqarCcb0BiSteEXtCc3KgyHhVT+zJ3LaobFA5LW/wOQRQhtMpdRmM6EwB
         VY3xZhWOgoOY5SemFjCfva4CFF87/ZfgqgTsqaVqOTHrEIYWnw7v9SDiwh3yxFhZc6GI
         vB2NySwxgt8eMO3BJi+8RgmSxDl4lXxecASQm5QaweYhOGT9E1v4XyV78USzUgqfSgyX
         SaxEs3OvPwrSAvzbYp+ZNjvOdZW/Xsc1XeTkl+Q/unRMBSf9Zm7KQ2vLNB0voEmVrmva
         erTOgMB4XvkdqAPRhPy2sFEv93THK3+KA9tesNPB3MkeeZDyQL7rABorH81PdbwRjr7o
         KllA==
X-Gm-Message-State: AAQBX9e7oEibUGtvRCvVUbTZ8G0OpUoTvvO7P5WP94Sut2YmHEuvJH6a
	UCVJ6U0jn5YYGMZkKwpKLG0=
X-Google-Smtp-Source: AKy350Z1cjauAcBYmc41Vrlz4XKvFh5rNTJy7A3QvYqcUzeBpe3Yy0sjgBW5eKKQw0VJPdb3knNE6g==
X-Received: by 2002:a1c:f609:0:b0:3ed:316d:668d with SMTP id w9-20020a1cf609000000b003ed316d668dmr1176048wmc.5.1680871827427;
        Fri, 07 Apr 2023 05:50:27 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id n37-20020a05600c3ba500b003f0652084b8sm8176596wms.20.2023.04.07.05.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:50:27 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 5/7] dt-bindings: net: dsa: mediatek,mt7530: disallow reset without mediatek,mcm
Date: Fri,  7 Apr 2023 15:50:07 +0300
Message-Id: <20230407125008.42474-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407125008.42474-1-arinc.unal@arinc9.com>
References: <20230407125008.42474-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055031_260384_1BE1D5BC 
X-CRM114-Status: GOOD (  11.67  )
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

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The resets and reset-names properties are used only if mediatek,mcm is
used. Set them to false if mediatek,mcm is not used.

Remove now unnecessary 'reset-names: false' from MT7988.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 79ddd16e530b..b5db0f50aa59 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -274,6 +274,10 @@ allOf:
       required:
         - resets
         - reset-names
+    else:
+      properties:
+        resets: false
+        reset-names: false
 
   - dependencies:
       interrupt-controller: [ interrupts ]
@@ -316,7 +320,6 @@ allOf:
       properties:
         gpio-controller: false
         mediatek,mcm: false
-        reset-names: false
 
 unevaluatedProperties: false
 
-- 
2.37.2


