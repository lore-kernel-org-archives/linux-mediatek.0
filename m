Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E330FC7618B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 21:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=277v3QDHxGQ1e2vDSHNJ1RgrCQUtqjYsBl0P+spQaKY=; b=ju2l1CkfVh1/TX
	X3eRW3HovdHxC+tQgtDhHf34w/2p1U5Pt3anQdMcKIgMW0cZySqRAjRsTRRUAN9+u8jbfuQcE1e6T
	9yKXs46/JAK0iS2m+vRdYKH7+VU4Anqxr3VwM+Aqx0cxorxu8clkxHOGjG6wHk4Bs1HLprhyzZeMg
	0XBakSaPlw2A/+iXee/gMY/SkmXbXzlLIzRBnyXk6f6s5j99nk4K78fuNdD1n6kr1E2LAFyVpmAE0
	t7Ab9gVSzwF/kvHYsnQAZnzdEYeYZtj6AeW4ZjlflAR85iHi89R7xqw+eIaktvEsW4if204X9njKb
	e/pHZE54z/iYRVI80t8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHgP-003T6d-00;
	Fri, 17 Mar 2023 21:32:17 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHf7-003Rwu-24;
	Fri, 17 Mar 2023 21:30:59 +0000
Received: by mail-ed1-x52b.google.com with SMTP id eh3so25371483edb.11;
        Fri, 17 Mar 2023 14:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=277v3QDHxGQ1e2vDSHNJ1RgrCQUtqjYsBl0P+spQaKY=;
        b=AKZeqzQtnCUfHf+sC2z6FujqATaMDElVe1Kb7asiqi2gApeooDYo+dvNc18Yi1rnaC
         1vzmZ//1f4NHby7q8Imaq7/tO3LMrIp45cKpL2wo466wrDA7wX6rQiPdWNgztj+59QwC
         OgwCOtJfLbmTScN4eySQ0Uu+fGls2BB6afCCIYzyZeqaP1BwFGCe+IVy2NSdZCJnYDwv
         /6Q22L8kwHDYAGEj8fwePcOXZsQqI3Es/o7xX2TB7Y+W+0hgsap8voTvZt4F6vDxNpzO
         iV5XgWUyGF6rs4pf45z5M5Eqfa5PTm+DzXL8alzLyJsJ5pOxdfcVGWvSqa1RfmsgJCg/
         PyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=277v3QDHxGQ1e2vDSHNJ1RgrCQUtqjYsBl0P+spQaKY=;
        b=hiCc2ONo8o5eLOrC0VwVIqsItWwn3Xb+MiqU+syb1Hdj2WhWp0UgMfjDsuClQvikrt
         0kSk7+xYPa73ZXSP1HfxKvm8qmKtVkB8yjezpRQSbMjV0cCvlZipaBRsLg96N956+x9N
         ktcJOi+SQv0tvYYppps3BJbFb4itOWCAMgzkBtA28hhh2HEaVsGGTlIdVuq9eFQtrAtS
         8mJUkdA92unMaxcgHzDm3JzA5uN8ixWetLj5/dVUObTIKmaINJ4PBs76kaMfD35J0h9Z
         Wbwav3V89rgJu6yZ91x0XbwEc3Zx/v7tNtpMa4mEQk8tEbiw2Z1vFpM+Po2hANGyYz+2
         edqw==
X-Gm-Message-State: AO0yUKWeQY90H/EMBxBvWMUmJNtJlQCwyMLx6o5HS1hWz+XWUvUiRt06
	w4Ph7DmSqXC8hS8usFOYSFI=
X-Google-Smtp-Source: AK7set8J5Y0Ip/HTJOArW+lQprOCLQawHAUMxX8XoeiqqznMShgkzJGiK4AMIN4ygknSUFodhayigg==
X-Received: by 2002:aa7:d6c8:0:b0:4fa:785d:121 with SMTP id x8-20020aa7d6c8000000b004fa785d0121mr4391276edr.16.1679088657090;
        Fri, 17 Mar 2023 14:30:57 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:30:56 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 16/21] dt-bindings: pinctrl: mediatek: fix pinmux header location
Date: Sat, 18 Mar 2023 00:30:06 +0300
Message-Id: <20230317213011.13656-17-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_143057_689489_9AA3A359 
X-CRM114-Status: GOOD (  11.45  )
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

Fix the location of the pinmux header files mentioned on the schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index 5e80621800a9..3b3d59140073 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -90,7 +90,7 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and are
-              defined as macros in <soc>-pinfunc.h directly.
+              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
 
           bias-disable: true
 
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 1d038f6f8971..e5e7143674b5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -131,7 +131,7 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and are
-              defined as macros in boot/dts/<soc>-pinfunc.h directly.
+              defined as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
 
           bias-disable: true
 
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
index 51b3d1247614..028146fb173f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
@@ -88,8 +88,8 @@ patternProperties:
             description:
               Integer array, represents gpio pin number and mux setting.
               Supported pin number and mux varies for different SoCs, and are
-              defined as macros in dt-bindings/pinctrl/mediatek,<soc>-pinfunc.h
-              directly.
+              defined as macros in dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
+              directly, for this SoC.
 
           drive-strength:
             enum: [2, 4, 6, 8, 10, 12, 14, 16]
-- 
2.37.2


