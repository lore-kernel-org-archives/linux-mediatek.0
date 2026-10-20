Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90204606A33E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 17:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KjjHtNuY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=q7kNIyqD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rx5uyr1x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=; b=KjjHtNuY8m8LYeztBVYYveHsnx
	nf77nmHy1kOCKcmVQwCq6NvWxNLJ4cGYcUj5WURqOcpwxMqfSxO5o7ejJIVL4fYmJbq/Hn6Q7IewJ
	tBwldtj+TUuNqWA7dj2Q+EG3FU2ZDUkMEZPrqPT36a9pWOhOZwSyp5vnogXF3H1uoAd2zRzoFOsuJ
	ncj98rYjTZadeYqbEveMgBUI0mBzSveQh6rRwbqV3NcUlGx0z8TbeCVKd7rmishOmVPbWUxw02+Uw
	AGN/dQ6OqGi2A5gQXXfHCO78QaefoL9sz1Gg2O0T2DdxKRUcp25jkbib52Pt3y0C66/ilrlIekjW9
	A09aOMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDln-0000000AM1v-0j6j;
	Tue, 20 Oct 2026 17:37:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDlc-0000000ALy4-46hw
	for linux-mediatek@bombadil.infradead.org;
	Tue, 20 Oct 2026 17:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=; b=q7kNIyqDBVUXDesCPrUMpuniVs
	BdWt1EPmkhvNX8yTGuAz6ZKpGUd0fatarigqhcjlz2jPEL/xhUNsOv0KGgDnBlNt0U/erYAcV+XEr
	7RlIB4y7SdXBA/eWD/s6Lxgc8HSxrY4y4Bwgf9Sk8/eREF8PNQ+jVlcDyeUZBDsUGoCxALyK55Sun
	ZgJltsCAEUhPu6jBAVA9MA93lfWwkPlt8iDQfur/VC5jDypbNP7NcOBtv43pGVv4JnXDhTg8rngXB
	/WwwOuAwSTSqo0fKgZGnrWlV6wxBdKAZRImP4I/4qqFONxo7T4xwCwg/76TfTCcPMqXeEumItFOnL
	tnKHBggA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJDla-000000051Xf-0la9
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 17:36:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso38503365e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2026 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517808; x=1793122608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
        b=Rx5uyr1xreySAgfQ1kfc3sWqS1eW8NGLwNznV3rkkBY2+KyPawI0S3K5ngoPUx7Dk3
         c/HII4sNnn8+g4T44YPJybuznRdmfWXkGpEwv4KXA9WqF/eyUgKzHwa3TSJVgIAkfeRr
         jZQkYuliHwIB+gGkgggq7x2p/9k521TWZgonJcHOu6c7UdjJF+2IVbn+LYQLmNqYtDb+
         CrcTzjJVtzInbR2fwowVojPnUKGrk19naUtsIkDgS9gAwB6/Z7Z1jqUjG3Nlwm3LTx6A
         NfLV2Yh/Rr0piaDQ027smcv+RJJLzFfg+mUZ6DJxsQ9KW68BWjzj3wtbQSPMx6N2ktXG
         +XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517808; x=1793122608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kijXjRsFxIz61TGzfhqMzMbAL3j1T85jYXxc+SR+4Y=;
        b=nHiQqX8raD9fkj/KkkxvH3xvr2RYbAczBk1J0bsHGmrtJoilkxD5NQaSVJxv3YIryE
         qoim+X/RKa+Pgf4tkEBz1QOPz6Nxixibfn34PLH/cbuaPbBajM8alXRv0W4cQt2K1Ugz
         xeR9BBWlBQkDYLcKwUs8AkZ5lgxU1EgW5CORxNnr34UYWGXVp1adWhTgLdVWjlLiwqY2
         KkeLFPBM7wOHXAiMTt4aYAX/3C72ebPOWluHlYBzVzsE3CCt9aActm2bjrFgwSUzTwoD
         ylP0klYNiZcSSuxUNgj/5zdWemfWdwXfYJrg9GrRx0IXDfSdLL9Le/4eL9+FtJbO/7m7
         dFpw==
X-Gm-Message-State: AFq9FYKlMsZKUBLH5s3y/dRcNeRGpZ/W1s8gGUP0oAgjdiIjyK7MPYQD
	L3+AXVo8IBY8HIFdXEKLIsyCZyyWtC67znGR4mBHvlS9NrNz4Vb8Ta53q79iI4Qx
X-Gm-Gg: AYBFou0ShVncg+f5JWcyrU/j+j06+i6ZbeZxTwgIBXOVPl8SLds5CHTpP4do2ojRnc8
	5QwX5JMvRMknHtEHbu9iG3UG5DKfxI3iv+GNb/p49QojbbAjPFS46ROvzDO1JsHVK9UtnMc2K/o
	GAA+wrEVbW456VtwS19HYZNY/A9pkglmew27s1qQcM0AH2e8ByqvaXRHVYXh5dgVzESAgl16cFj
	97vTGxz19jydvz/KyadjACcqjaNw8LlmFKIFqPJB2TKWS4LVJ9blZA+KV13oDg/2qgCWASUZlw4
	lSxvstk8dR7WzyZ/v/LCI4AW5MM5xE/q68AUjTQjNvs7cK+ynu4I572eoU5R5LLufkcn9CxUD3n
	mJCl7iyStsEK7A/XGV6n+WLF5v8QQV/tuh3hCMQDY3FCPXAnbq8ZNtTKbJfBkYhiPBI4ByCknD3
	kLK7bWlaxt+urTT12F+drx8TalNI8lju+pLrEJa0kqCdC1i1UnQEQyZrAmVRsxp90WYg==
X-Received: by 2002:a05:600c:19c7:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a1d761b90dmr248715685e9.30.1792517807739;
        Tue, 20 Oct 2026 10:36:47 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:36:47 -0700 (PDT)
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
Subject: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Tue, 20 Oct 2026 19:33:22 +0200
Message-ID: <20261020173556.632798-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_183650_284963_9AD0E48B 
X-CRM114-Status: GOOD (  11.26  )
X-Spam-Score: -0.2 (/)
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
 .../bindings/mfd/mediatek,mt6397.yaml         | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..06e93c545e3b 100644
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
@@ -663,3 +669,69 @@ examples:
             compatible = "mediatek,mt6397-rtc";
         };
     };
+
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6392";
+
+        interrupts-extended = <&pio 28 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        keys {
+          compatible = "mediatek,mt6392-keys";
+
+          key-power {
+            linux,keycodes = <KEY_POWER>;
+            wakeup-source;
+          };
+
+          key-home {
+            linux,keycodes = <KEY_HOME>;
+            wakeup-source;
+          };
+        };
+
+        pinctrl {
+          compatible = "mediatek,mt6392-pinctrl";
+
+          gpio-controller;
+          #gpio-cells = <2>;
+        };
+
+        regulators {
+          compatible = "mediatek,mt6392-regulator";
+
+          vproc {
+            regulator-allowed-modes = <0 1>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = < 700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-always-on;
+            regulator-boot-on;
+          };
+
+          // ...
+
+          vadc18 {
+            regulator-allowed-modes = <0 2>;
+            regulator-initial-mode = <0>;
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <1800000>;
+            regulator-boot-on;
+            regulator-always-on;
+          };
+
+          vefuse {
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <2000000>;
+          };
+        };
+
+        rtc {
+          compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+        };
+    };
-- 
2.43.0


