Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19744C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaKDRIi1mwiob1WvFjjM3OHDQMYuXFWnH3kW9ZW5SAg=; b=wtq9TyA9RyJTVTlKVqa7kPpui7
	TFH+mZ+cEWPhUI/zCUMmMao8Z3OShb760vRjjqVXmq5eiMikAKU2OjOSypQ0UYNeDQ0xVfxbAERbK
	eScjNsWjH1k2q33ZsqlQGw4jTGoii2uEQp9tFJWo7lPgWzgYUdX+EM1T6W4wqELLOmxLVI5WBFRBG
	raYHT0RU1aJAJDWk7KPGtVnPIi3u6UrShgHWh6WNLwa9w1k6d06tZ68YCXYjjktb4OHsvdrLPQRr8
	mCNQ0hpTJboC2/RVv73tNxu5bcWjwabZqqOqM6cx6SRkcy7ewyp/r+oX3Lcg/I48ltxqdrgYdFKyI
	Pl+E6D7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEEIb-009A83-4S; Wed, 20 Jul 2022 18:19:53 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEEIL-0099yf-Lg
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 18:19:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id n12so14429711wrc.8
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 11:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZaKDRIi1mwiob1WvFjjM3OHDQMYuXFWnH3kW9ZW5SAg=;
        b=PsYMIxchceuMbJ1CYX1Lrbh35TmnoRKSEf1vIjaTvY/UZvH3gBMGBuouo7S69kLVgm
         nSNPnSdFJWxJkJxc9dI9j4SMPOljPPgIyvOHlFHurFBpVhbP/jxmO58faQftUEr3lR4m
         LqkenqpuNZhMsXjBngfX4hGQN96QLqmCyufF4rN7VV8bn+98z49tnqB3Xd0dDMVvDNBz
         wf600N0N1bL/1Kq5XZeQ0nlnP6OEEb2BMg9uq3rJDKqqF+kDSWya2YpU+xvSvjrD7YV5
         WjwHWdE3T0pPMx+lfoosC2NrEAkSaAHhVhOrje7/m2eO9/AUEfQ78yACHHQyshF926tl
         QG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZaKDRIi1mwiob1WvFjjM3OHDQMYuXFWnH3kW9ZW5SAg=;
        b=Vk45pj+MiqR2KvDSPdgyyEH7piiEwplKypIX92gDHtT3P3K2a0DwNnPJgFrERiQ+AB
         Mnb/ApdiKzcLe24X7t0Qqqlz4TqAZlChAGNNyBg+WOFT1LniswQoTS2JJkx0nldmIWf/
         8bPgD9osPC8AxykWHl+Y2PfPzxcdWEmClHz9IOOvsy+KxY0Eg/uflZNtW/Q5wcLlv6QO
         OMQ1rcJ4C7U6l9eZH4fFiIrpNNDBcVEdymAf9dnldxtqQXQWif+KHYKANAFOIC3x/Ma1
         Nspx+ZlAjVVh97VF7X3W27VEXOU196dw9SY1uHhDxg87+ZK5spyxuEajaL7CIqARCe49
         dfYg==
X-Gm-Message-State: AJIora+RsVeHmG1svdBxNYZbFo4mDX+vPEss52DezGjAexipKeyuudR/
	VKlqzVhKEpMsgCExFD2uD9v9Eg==
X-Google-Smtp-Source: AGRyM1vjGU1aqaq3plo8ZMZ8Ne3fvGE9Cpnovf6zPJ/qO2LpFTeedX0ODd747EfnXKB+paAVbEXf8Q==
X-Received: by 2002:a5d:4b51:0:b0:21e:504a:b597 with SMTP id w17-20020a5d4b51000000b0021e504ab597mr1221393wrs.175.1658341175489;
        Wed, 20 Jul 2022 11:19:35 -0700 (PDT)
Received: from amjad-ThinkPad-T490.home (2a01cb040613180084408ac44a1fa242.ipv6.abo.wanadoo.fr. [2a01:cb04:613:1800:8440:8ac4:4a1f:a242])
        by smtp.googlemail.com with ESMTPSA id z17-20020a05600c0a1100b003a31d200a7dsm3400093wmp.9.2022.07.20.11.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 11:19:34 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: matthias.bgg@gmail.com
Cc: rafael@kernel.org,
	fparent@baylibre.com,
	amitk@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	robh+dt@kernel.org,
	rui.zhang@intel.com,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>
Subject: [PATCH v2 1/4] dt-bindings: thermal: mediatek: add binding documentation for MT8365 SoC
Date: Wed, 20 Jul 2022 20:18:51 +0200
Message-Id: <20220720181854.547881-2-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220720181854.547881-1-aouledameur@baylibre.com>
References: <20220720181854.547881-1-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_111937_932215_E35E9C61 
X-CRM114-Status: UNSURE (   8.63  )
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

From: Fabien Parent <fparent@baylibre.com>

Add the binding documentation for the thermal support on MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
index 5c7e7bdd029a..ba4ebffeade4 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
@@ -14,6 +14,7 @@ Required properties:
   - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
   - "mediatek,mt7622-thermal" : For MT7622 SoC
   - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
+  - "mediatek,mt8365-thermal" : For MT8365 family of SoCs
   - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For MT8516 family of SoCs
 - reg: Address range of the thermal controller
 - interrupts: IRQ for the thermal controller
-- 
2.37.1


