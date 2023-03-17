Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F0FC7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 22:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=831eezpQQ1y/Bza6SFUBg+0j0MfEOywRdTuqRTBfi2A=; b=b/Q+gvBtTdUMDV
	nQgbhFWrFjpyfGL8cUDxf5WAy3AbgySY3UyDrZXVrVZ6mxnoC+gEXFkcGavf640jA95Zs0HHNG4kM
	ZcSylpeUto3GTO2GOGeCXjSmP0k49M0di/Or4O7IMciw3VfaAtACatEcTUZr8zGpHu/5Viw6sUN1y
	v4N2ecidzMuyU4pq4yXZKGhbpBdwLuxaFTBtjdNOdrSqiZoPM55H1u0muy6ke4fVuosD6P4P8oCaK
	fB79iLRC7k9gx5SbmVKaDsO29CRZfUcbFxbFtc3P2KQq9p81JNeQrG5aypERqPlVojCAxvsy7f5G8
	ed95kREYEbJl9aaCrcyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdIbY-003ZsK-1m;
	Fri, 17 Mar 2023 22:31:20 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHen-003S2c-2o;
	Fri, 17 Mar 2023 21:30:39 +0000
Received: by mail-ed1-x52a.google.com with SMTP id er8so13705885edb.0;
        Fri, 17 Mar 2023 14:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=831eezpQQ1y/Bza6SFUBg+0j0MfEOywRdTuqRTBfi2A=;
        b=FZP2v4NhwY9EMcMyXAOB/4mR5Uaqqjjjo/eSIVX3nNmoMsoG3W3WauJzviFMQdrPuv
         r0ax7LrM9Dk5vxnQ1buyq5JGDDbJBGz8Frn/iuIKVRm3sOlZ3lfkjUKfYgdj1uE5CEWP
         247fcpcKXb1cjGcN3Z03xaBrwA/YnYLqP0DZDL9FlKU+W3AQajMzHi1b/aUMthaIy03g
         iVK9ykoOZKd2+krO7312/Cgopejv7cSGOuFQ4Fd9/ldnfMlUGgoohOE3eRPDjABBgl5m
         34AkRUg08tKXJuWes5+KJmO7dbZbehsxCSJslayDahtQneaAkjheCgw3ROMuDJ8Qasry
         04Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=831eezpQQ1y/Bza6SFUBg+0j0MfEOywRdTuqRTBfi2A=;
        b=BFzofG6Nd9GMgGMzWXTk3ZOXAmRft7+dI+PHyUC0i8Y54/0onfHqGxT4ud1qoD3L7j
         oA2J0sa+Lx2ciK5voInaFHThk81ql+lZ71WooGjdjmBHb0UWJcpJDYkaPRK3nZGIIITf
         EtpmHxrzbX2n2MnDcfogXlDjCBk8+Z4ImAZ/r9ec8790f3yMC0OPdu4rCzP2sZOncZ3h
         wIwRzeRe4ZPphwXYY5bCy48dwNPaLF+TKSXTTJzMLBGsgDEIOxK1VVwHw5RXSf+yQfQV
         /JYJKTQxvZlIxFlQHr1t/ZX9hGDuNe2qbyO+snP228VR0ZQcsQ9iBNb2rbrxt3Otx/1d
         wD7w==
X-Gm-Message-State: AO0yUKUw8XGLglWiizgDimJOIuvyswW4V3Vzop3ZOjinQTFPF6XQJ6Wz
	14ifeJnQztIOK2m2bJon9Mw=
X-Google-Smtp-Source: AK7set9JPZMCF+E0gStn6M7piSEshol9kTKXaImBhSCtm+waAogNmPksEqhtUxggIfKyH7peDZgUJA==
X-Received: by 2002:a17:906:51d0:b0:92f:c6b5:de08 with SMTP id v16-20020a17090651d000b0092fc6b5de08mr711214ejk.76.1679088636688;
        Fri, 17 Mar 2023 14:30:36 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:30:36 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 08/21] dt-bindings: pinctrl: ralink: add new compatible strings
Date: Sat, 18 Mar 2023 00:29:58 +0300
Message-Id: <20230317213011.13656-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_143037_915669_2AA5F986 
X-CRM114-Status: GOOD (  11.18  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Add the new compatible strings for mt7620, mt76x8, and rt305x to be able to
properly document the pin muxing information of each SoC, or SoCs that use
the same pinmux data.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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


