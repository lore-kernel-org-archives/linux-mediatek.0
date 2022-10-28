Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97264C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/c962wLBz3jwOt0DTXoQo5h9XxAFZISj22YocQOqFA=; b=mZrLj/U1MGK/LtvEnap40ifj6+
	xOz2g/CWL8p/jYKFRnFhUUjOX/6YL1B+tIAihRGvdJbiGjq/OGDroZaYoTqei9f5/d1aSOM4JHr0a
	0uDagE8uPXUXLBaPxyY4gmKNmbtYNVuoP5YipIyYaF+oU8e41/YIQSfjYCBP98QVbd7DMLa0CRtRg
	eCaMIa/d+FFkHpKFXB/8d7VP05J9MMS3CT1hXFotWfCs+svuDaps74H4FkfPmKGf2ROpO5pgGUPIs
	0ddhkZ63iqvt+JVKkA9SA90JlFbqaMGuUWIYVy/uNM+tOM+e7LdTzmhw51fPWfAWUyBjh5ckc2sbH
	iTqO7GrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRQe-000Z9R-V0; Fri, 28 Oct 2022 15:37:52 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROQ-000Y7Z-K0; Fri, 28 Oct 2022 15:35:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id kt23so13745044ejc.7;
        Fri, 28 Oct 2022 08:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/c962wLBz3jwOt0DTXoQo5h9XxAFZISj22YocQOqFA=;
        b=MtVvEBTivA1ttdlsg5yKdUZ64LflhtWSZlKxObBCtgFUYA5lN9vhTEikPFDwqckQak
         Qa8KILIOh9SP43ZP25ewJc0IGzUS2BvDHn+wguRGw2FUHHFO6ZrKkXHi8Pan2IcYbUmd
         9e3WHRMlWteSqZywc2z7GkmhBGliSIERKBwJ3RfefURwfOighqPdSaW5qeDr1XSXuIDP
         +oGVfaiKhoa/Tz0wYd8TFXPFPNWzGCuEGmSdQjfzLcEAja7ZrQ7H2KO84cjqAZ0aNGPX
         i+y4Ntrfv5IHlNdyBAbPrjv2LUQUoUR4371U5vtK8w8yT481bfW+nn2uotekAjLG2o5y
         0HvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/c962wLBz3jwOt0DTXoQo5h9XxAFZISj22YocQOqFA=;
        b=RjDMUXC3IdycL8JKA3p+fYwU7OgAdxbZAgCxjhINioKIug6PjdvBU4PNkhdu/H4eeI
         qIjQghdxgtaKtGaS1nf2ivr6pAnyC5lGOrLsPYvaMNp52718CRVzby/XDclcfroNmhe8
         NO+3Yb32JkAinwKqJ7v+im0wLaA2TzAUDynNk4SmjBWzFm9+UQj4LM39Sp4KO4IS0a5a
         wPJUmkE+kHDOe21b/0ZLaTda/NvLJXcNP4shcElpCKIFt6m5w3XAJQWp9Ti2KtXgjEnT
         aIr9HYqjtdPa/iH4mkI36HIshJPubPPyFFKB0HJLrSEZWBp599qyjRhP4FmkzdWMNy2R
         +Arg==
X-Gm-Message-State: ACrzQf3qoecOJBAD8STqLHCqa0NeKxlMhn1/b0CUw1xaJx3ykpnawQzy
	egyCpik8EmAZKAW5E3spqqc=
X-Google-Smtp-Source: AMsMyM7dK5jbLdR3FyoZhjAwUUdBWDcpVaroS5nQ1v4sTmvceLtXEQLQUFKx28sLPQQ1KMiNBnnLJQ==
X-Received: by 2002:a17:907:7da5:b0:78e:2c3b:55a2 with SMTP id oz37-20020a1709077da500b0078e2c3b55a2mr46839745ejc.96.1666971333035;
        Fri, 28 Oct 2022 08:35:33 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00461aebb2fe2sm2830635edb.54.2022.10.28.08.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:35:32 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/13] dt-bindings: pinctrl: mediatek,pinctrl-mt6795: Improve interrupts description
Date: Fri, 28 Oct 2022 18:34:58 +0300
Message-Id: <20221028153505.23741-7-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028153505.23741-1-y.oudjana@protonmail.com>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_083534_725543_1D49ECFE 
X-CRM114-Status: GOOD (  11.83  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Clarify the meaning of sysirq to avoid confusion.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
index a3a3f7fb9605..9399e0215526 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
@@ -46,7 +46,7 @@ properties:
     const: 2
 
   interrupts:
-    description: The interrupt outputs to sysirq.
+    description: Interrupt outputs to the system interrupt controller (sysirq).
     minItems: 1
     items:
       - description: EINT interrupt
-- 
2.38.1


