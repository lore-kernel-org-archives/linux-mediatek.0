Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA43CC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UuxxWvZVFUfEaJAG7ExDAsmMHlbWAFLt8LUNtSrlwLA=; b=MSISsYl7AN5fAX
	65aP2AOx5pKpzHhkXllceXL04lF/85D4zMmqDpIiFkxOz66VdPOgaxCHtjbrPKcXbe21wwLYXmakO
	RX6yDMV7HQuseBCUIU2mC+NDbQ+dLJ/iLq0cPRl41f1j6+iEv99XeK33W/kKAtkv339Kpb8XrYjtT
	kkHKc8oSfWW3QukZmW8UjghINvwaBT8CAgPUBxmsk2tMGmiD0bnNntKpklHgCB7iED4S05gPkFObS
	7SZKirBpO8gVonSLHa0NGYO5NIhdGzZWxjMCoh9pMsdZGqUnF1+StJwPbEQMOAZ5vGeGI7ecnYZOH
	9gNUumcv+EADOatHT4JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpJy-007mOw-Em; Mon, 13 Mar 2023 21:03:06 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpHD-007kob-9I; Mon, 13 Mar 2023 21:00:17 +0000
Received: by mail-ed1-x52c.google.com with SMTP id y4so24573261edo.2;
        Mon, 13 Mar 2023 14:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuxxWvZVFUfEaJAG7ExDAsmMHlbWAFLt8LUNtSrlwLA=;
        b=TiwAd0i7trObcgTPCERsP0D7Oo6UU8BEmhgrxSFQ0IsHTMvbvVOc28RelhSr5YtZcn
         11idIAXJLVz2b55TyOS0twaCuBUduRhmcHKyh3TNACXCatiWJwSoldi9TIc/VZ4UPTDV
         f9ZSkHvB/G1iLSXKN7WgKSEAYhi/hYk0QzsALT88OApz4kv5DAHgUSIR51dwdxbvm0K4
         ++GpxjOO6JSMQ59Za11yrfEw1QhU1D9YVQRCEjCrthc0uw1pQx8T1FjWBrRdKqxNxNd2
         oxeq8+zZL3OWqIJ/dPFKA60tZSt+Mjd9R4p2T+J6lxBzXzpchn/yYimaczkp9pBAW33N
         G6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuxxWvZVFUfEaJAG7ExDAsmMHlbWAFLt8LUNtSrlwLA=;
        b=W88gdAXuXR5em/b//b0JnUF6mYtMtnUHUgIMl5KHBSM9EqthQ6b9l97qIMXI2VqAlr
         8nqpDPAQ+4R9yoVSzv/PXtODil7o6cdT06YB4QSeFoHHwlAdflX7QSwH+HC7oZc4M83l
         HKtygnfFFZ8pvnpTap7KlzSjVU6o0TaLv5o77NPpTrc5/az3Awte3z6LLaAIbLpH37s9
         nCZIxe/yIGiNAWlFggkNlVPd/fJviSNxhZ/zboVhR7KwSVcjHqWvJgW3NtMVL55ewbm/
         NkO0eDByCLFjDhgSNRSTuoAjXv54RzjMLlCKU1ed9qYaxtJTdavnJ03gtYbOByqjW+b2
         N60A==
X-Gm-Message-State: AO0yUKVcKq4kaFkxLfySTi29DaRo36mAsGCYqLahUuDcUfJemBIKpoGn
	tOCaumoUWMZQnXULACEwhtE=
X-Google-Smtp-Source: AK7set/V5D2K3JFT4+XsVS1knoZEU48FKRfirToOZ+MhXdc7pPPbll3Zt314m5x6nQI5xClM35Chng==
X-Received: by 2002:aa7:c51a:0:b0:4ac:bd6f:cacc with SMTP id o26-20020aa7c51a000000b004acbd6fcaccmr32274330edq.12.1678741212066;
        Mon, 13 Mar 2023 14:00:12 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.14.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:00:11 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 08/21] dt-bindings: pinctrl: ralink: add new compatible strings
Date: Mon, 13 Mar 2023 23:59:08 +0300
Message-Id: <20230313205921.35342-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_140015_770737_1F54538E 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Add the new compatible strings for mt7620, mt76x8, and rt305x to be able to
properly document the pin muxing information of each SoC, or SoCs that use
the same pinmux data.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml   | 4 +++-
 .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml   | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
index cde6de77e228..09ebb8ac22ac 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
@@ -17,7 +17,9 @@ description:
 
 properties:
   compatible:
-    const: ralink,mt7620-pinctrl
+    enum:
+      - ralink,mt7620-pinctrl
+      - ralink,mt76x8-pinctrl
 
 patternProperties:
   '-pins$':
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
index 8b1256af09c3..23fb82f9959c 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
@@ -18,7 +18,10 @@ description:
 
 properties:
   compatible:
-    const: ralink,rt305x-pinctrl
+    enum:
+      - ralink,rt305x-pinctrl
+      - ralink,rt3352-pinctrl
+      - ralink,rt5350-pinctrl
 
 patternProperties:
   '-pins$':
-- 
2.37.2


