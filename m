Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C89C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8438bEydUlrPZrkVMSwHAqPRPD9BxspbjMsnayfq+s=; b=kGcL/npyxaEeyy
	wU6fUesQVy2f/3591qBN49ZN/vfiOWWsHHh/z/OE86P4Se4tApeOwjZhtSfO3QxZPEZy80Fw9AWMR
	xgwgKtuHf1LZwkIJW1m0wyVRZ4tndHfjqKDQ3QM1lUC0s7ZMEwda8LFrimRfoQXtjhoJwIYzcE2UB
	QbnfyxLDkKwQylHcrnVhBMA3BcKwdyeRX+epxSqauj/bRlcALD7M+Z3SaeD383d2BvGVWA+beEOFO
	N2M37s9XCToh0lN4BcuyDyOOEcWCkq6LDNDvCE4m0TCPxIkK7Zuf5LTYXWoAkbQvmCfhOXMLqXSNo
	JK76lVIkVHlG6e2I+I2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtND-003t6M-Dt; Fri, 03 Mar 2023 00:34:11 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJU-003qrE-MT; Fri, 03 Mar 2023 00:30:22 +0000
Received: by mail-lj1-x22e.google.com with SMTP id h9so777093ljq.2;
        Thu, 02 Mar 2023 16:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8438bEydUlrPZrkVMSwHAqPRPD9BxspbjMsnayfq+s=;
        b=NvVrQZmOZM3L5aKsXkdrOIz4Ks1ElIhzsdKG0l9z8OGbfolNiSH93uEQ1SxBctBbjH
         4fj1R/mUMdy8JOZ7Vn2Gfu7nE+bHyBHZL5okEkvEB2l51CDXqzale4Ix0KQgsfLcsoxk
         CDHZI8Y9uAkTwM6v9BZuGqezR7rbSev4D+hfXx08O4jFWd+O6IOaiMmmhJET5MTUUQjK
         +Z22zHtIbOUVNRRhRaEJkhFAZxE/UMasEJ9uTC+in9Po8pfiOE9pc1skvevioaUUaIni
         WJK78mFXYFIYFisjTvFURD0RyAo4MObb81DgYIfrRlMGhqY1F5hMFaXm4eyEfQiRd2cI
         G8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8438bEydUlrPZrkVMSwHAqPRPD9BxspbjMsnayfq+s=;
        b=FadKDqWlyjkKNPIcmitsHunYt9ekcv2VgUFMxfvtnPJLYirE9ghBszMXDhQqAcAVcB
         0Uqxd2yhTk39saHTTk/LWQY91NSaozYXsr+7mtQjkz/eSoEuBuxj2vQezLpAIGYtUzhX
         Yl4TJVf4KjtMaCtoOxsVlhBMW1ssSH76r94MQhQZRPzhtZ3nhqun0MksZJh092Xq8PRS
         hE5LgIYBsP8PFB2tASs17eRtM4Sz6Ku4pq8IU0ZQ8YcC5Mm4qmR0ScM1Rdhog6jOh2xK
         920AeUBZlGuyY87IryFS9f1yi48dhxfQpipgCJfU9nst9lfGcmKsOVJLMeR58M62bwJ5
         /f5A==
X-Gm-Message-State: AO0yUKX7LJZK7kmXDMBhwHyn6b4Lo+m9/ZD6r85wGVFMmgdP2iX5fh1d
	zj+WRT1ux+TXI/C767G2q64=
X-Google-Smtp-Source: AK7set/XYEYh2rpl8Hj6S3msHXK+AjMZIY2lTd8Jv31ZzTy8V28zpD3KyVf0hWldflgc2tujmptGww==
X-Received: by 2002:a2e:3101:0:b0:295:941c:7b2 with SMTP id x1-20020a2e3101000000b00295941c07b2mr3730218ljx.12.1677803419304;
        Thu, 02 Mar 2023 16:30:19 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:30:18 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 11/20] dt-bindings: pinctrl: mediatek: mt8186: rename to mediatek,mt8186-pinctrl
Date: Fri,  3 Mar 2023 03:28:40 +0300
Message-Id: <20230303002850.51858-12-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163020_797384_7406E1EA 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: Rob Herring <robh@kernel.org>, Sean Wang <sean.wang@kernel.org>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, devicetree@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Rename pinctrl-mt8186.yaml to mediatek,mt8186-pinctrl.yaml to be on par
with the compatible string and other mediatek dt-binding schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../{pinctrl-mt8186.yaml => mediatek,mt8186-pinctrl.yaml}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/pinctrl/{pinctrl-mt8186.yaml => mediatek,mt8186-pinctrl.yaml} (99%)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.yaml
index 26573a793b57..32d64416eb16 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8186.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8186-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek MT8186 Pin Controller
-- 
2.37.2


