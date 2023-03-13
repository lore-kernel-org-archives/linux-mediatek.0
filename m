Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59CCC7618B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gB9wsR/QejWKnTpjqpalvhn0ClVxLzlxnCNLg5LJDYI=; b=AVVO2ws4z9yHfk
	xC7D0/8L5V5mZtSTZ3mn3zLnt5xLBh5yxSm2b5uIQRfjOHcruOy6TfnQh5zn/J88R9REhRDOzLD5c
	kbX4hIKRefed8tVzXlFfJ6lSErMMBkfL8YKrTEOo4QIcaqqoNzhMZFnE38hW3m9WhXl7ohkBAvdSu
	X3PAbP5HTQkX9gyRexgjFh1zkDahW80zqPblvaQogTEkGRacYJpTuCxOIDEWw6XtKSRkh/17EcV7f
	3FfwdNbWQqBQfAwFbfBbFiPCstoa6jsSPjsQeWFUmqwhoT/HMFCPnSMTWBkYCR6jBPd1jV/LQS8UW
	02MkWBJF0QpSj/XYWgIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpI9-007lLi-9w; Mon, 13 Mar 2023 21:01:13 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpH4-007kkz-VG; Mon, 13 Mar 2023 21:00:08 +0000
Received: by mail-ed1-x52d.google.com with SMTP id h8so10264466ede.8;
        Mon, 13 Mar 2023 14:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB9wsR/QejWKnTpjqpalvhn0ClVxLzlxnCNLg5LJDYI=;
        b=afd4A4/xe/WkNG2sFgtHs1wJZxZIKKLvr1jIY8nlKLuaVg7jtyTD9svMdZf4XKMmVN
         /3V6+meDqA9/F2/mL+tJlrveUtlRyo+cTl3n7mgRj98vdXpoitOeOhnoc68UT9cg5UME
         Qx8NNtLMDUqwZPVmyKd+m/S3Gi5CcW5gci+sIXgTS4Ys0ijPVxFKwWL+5N2iJP52P9X/
         xiuNRPWe+M1Nu3oFR5KE939BJ0zJxixpNPPdeu11ErOB/FOPOh+0pqucvIf95zOVnJO2
         iNDTy3suVlVE/+noa5e7u0NPc4odnrxXgbAwWbKl95WQyzMQd6s+1z+OOXNbwhnVmy9Q
         xtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gB9wsR/QejWKnTpjqpalvhn0ClVxLzlxnCNLg5LJDYI=;
        b=z1eRC3pDw4uSlGbFUjy16kSC/8bu/NO4752n/jaAPGyvLL9Zx4K45YDiYrXlfR/QRK
         /ovAxKIxs4yHb47SKo2BVZrVLmtc31kPEZ4KJOT1ukOHSRvwnJGrhO3yukf4doLA/b7h
         M64/zEddtG6SEroO9d84l5MZ4/Z5buj7UkV/kdupH8i2rA47My+JusYGbndo771q1Stu
         CsUUuNkWfWhA+tDJghMJ+b0XNxNel4N6q/6w5pTKRADuiHMwDYRYxKtMBZO55O+2zbTb
         DZzFTjgAdQhmU0xIF7J2iehHbYp3QV9CaedmIfw1feeQ8eDLSp1hlJyJ3IDEHJLlzwlE
         d83g==
X-Gm-Message-State: AO0yUKXdfgXFn/w+E5YhN41fYxCcLwgNMmdcWoGG/XEu4LMAFYwbbGXO
	9WmMZ6EDWkrFg/AABfrsErM=
X-Google-Smtp-Source: AK7set9YtEmB8iR180enMLgbiiGYN9pPMD6nTSjLxbpr8YHc+lGhtd1Zp7BuvrnYuwG7OxudpCqSKQ==
X-Received: by 2002:a17:906:3197:b0:8b1:3293:ead2 with SMTP id 23-20020a170906319700b008b13293ead2mr39965925ejy.25.1678741204635;
        Mon, 13 Mar 2023 14:00:04 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.14.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:00:04 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 05/21] pinctrl: mediatek: remove OF_GPIO as reverse dependency
Date: Mon, 13 Mar 2023 23:59:05 +0300
Message-Id: <20230313205921.35342-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_140007_036196_99EF109E 
X-CRM114-Status: UNSURE (   9.91  )
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


