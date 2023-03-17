Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5B1C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 21:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gB9wsR/QejWKnTpjqpalvhn0ClVxLzlxnCNLg5LJDYI=; b=O76Deq5s+uLeX3
	Xpjwot2XlgU0TjHhyyh/g0zVtkmoRPElA+tkNLb2TwLLiFwzZhjtNwXMj/+4S8B2YjqRTzlE622H1
	nih0mgrUZrDM4jfLSYXsHV/XAGCyX8TiUwaWB2U25h7h0KjYPq9j2rJPxHcBidsKmBN/CIGQ9J8bc
	zbyCdXu3uXIaFR0DCthI2yY7SEFHZc28PjM9YVUp6snrx5B+CWAmarvRy0DT6Ng+MjE/aJ0jFjiWZ
	IXZ2wEcoe75WNCV0w8d6Ar9D6K3H/ykkKmzBLqQsvN0ogPrpl1dwQIeTeTsalBkLRRXMWks+WhgGq
	FN2CJoBkPJu2dGOW133Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHew-003S9A-2K;
	Fri, 17 Mar 2023 21:30:46 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHej-003Ryq-0f;
	Fri, 17 Mar 2023 21:30:34 +0000
Received: by mail-ed1-x532.google.com with SMTP id fd5so25398656edb.7;
        Fri, 17 Mar 2023 14:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB9wsR/QejWKnTpjqpalvhn0ClVxLzlxnCNLg5LJDYI=;
        b=DeEVrrd12HU2BAG6cPFbACSL4/hWSMKzky1XNI+Efkafor07HEaRDFq/E128YGgf2C
         zNjp4F2Ls3MSXdI4ClYk2mXmcL04SPTUNpQH/xFA3c4RM8Yt2LdS0/zLfv4c2HMBUkXD
         z5ha+4wbHknDdoU69qzbdpMwQIoQrKIHUR4yWFaSv+sgQWSjkEJWk03aj/CfkF6Rpniw
         wOm90IAoZ2aD7TVsfb1dAfmL5R67VyTgKfIYUnnAQZzkyLHZDcGc/oLpUj4b2X+xQNdd
         ecuMxnMIBf2zX+HNIU4LTCTg7VbtZ0ABEoOWWhVtyZ3zRiAU5LbxfmgpK+BfBVwAuzLy
         ftjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gB9wsR/QejWKnTpjqpalvhn0ClVxLzlxnCNLg5LJDYI=;
        b=17CWvOOTbUC8uU5jAxQO2pErFg+bQugRlsKw9uwO/dGBYN+QNwZ5mg/SDj7+DLmV0b
         OZY9sniNb28n3VNI5oX31htkshcFbelLwhAxTQHmOgWRuvlroMz78GGzjR5ElhVTh8RY
         Y+L/WmbEKt8DZ6meGXumm8NjYU8VdJYFWIN90UiGVqARb0UtlMUnQpTo0hG+3qvKe7EL
         Lb2pCmW0oPxJkuBtVv3VZd1bVCjDp/iYNNhmp4ctCIZoPS8erDFSqON62kRSIVqW1KDT
         7qwa560gr4NytKeWeT4sd2UxUsCFOFhkVEgasv5UC+HE59c+zmm4s9WbvFy+10J6QaAm
         WxIw==
X-Gm-Message-State: AO0yUKWCPAYlSfVKnnVVcdeTNCGTqmX3FFrGXnA8h0TKPSJdlv6cWR4P
	fOSVTBUQ9ml2wYdY3ZfsPX0=
X-Google-Smtp-Source: AK7set9ZDd1hJkSDFx7yupS27zfy8fGrjwhkV7qA9C6gFSRh6OVgFYg7DSrCVPDblSg/8gD6iJ6iFw==
X-Received: by 2002:a17:907:31cd:b0:8e1:12b6:a8fc with SMTP id xf13-20020a17090731cd00b008e112b6a8fcmr954836ejb.4.1679088629209;
        Fri, 17 Mar 2023 14:30:29 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:30:28 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 05/21] pinctrl: mediatek: remove OF_GPIO as reverse dependency
Date: Sat, 18 Mar 2023 00:29:55 +0300
Message-Id: <20230317213011.13656-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_143033_253886_7C9AE7BB 
X-CRM114-Status: UNSURE (   9.95  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The OF_GPIO option is enabled by default when GPIOLIB is enabled, and
cannot be disabled. Remove it as a reverse dependency where GPIOLIB is also
set as a reverse dependency.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/pinctrl/mediatek/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index ba21a599953c..ee04b1af36dd 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -17,7 +17,6 @@ config PINCTRL_MTK
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select EINT_MTK
-	select OF_GPIO
 
 config PINCTRL_MTK_V2
 	tristate
@@ -35,7 +34,6 @@ config PINCTRL_MTK_MOORE
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GPIOLIB
-	select OF_GPIO
 	select EINT_MTK
 	select PINCTRL_MTK_V2
 
@@ -46,7 +44,6 @@ config PINCTRL_MTK_PARIS
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select EINT_MTK
-	select OF_GPIO
 	select PINCTRL_MTK_V2
 
 # For MIPS SoCs
-- 
2.37.2


