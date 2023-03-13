Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA92C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8438bEydUlrPZrkVMSwHAqPRPD9BxspbjMsnayfq+s=; b=SPdkXUf1u80u9s
	oDvsPB+JFTkPtPtFM2xOyqIH8cdzkaXhRm38B+EtLhOxd+QiT77VEQnSAXRQxOUS9Ac8B+d9BRG0G
	QK3+ycZ7tIHMXbgJnBaFApnZe1xVT0hrLfByyOX9pXNy4QE3gcjbwnosUXsP1a0ctkNXTaxpeYsmu
	YR5bY8KfBWQuVXSkr6L5M3BmScPbf4TReiAOKdlzC2euhIYJtIaILw1xY2R5Eo7ikH8bnyTU8HYDh
	XOm5EFwmXtHGo4kGDlYGHJjm45TeIIjcCLzNrU7hgbOSb0qT5HT84dLGMl/Tve+JbTa6Tjx3dC1qT
	CUU8g7h0tVmBOCrod0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpKa-007mir-EE; Mon, 13 Mar 2023 21:03:44 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpHI-007kjr-1Y; Mon, 13 Mar 2023 21:00:22 +0000
Received: by mail-ed1-x535.google.com with SMTP id cn21so23866882edb.0;
        Mon, 13 Mar 2023 14:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678741219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8438bEydUlrPZrkVMSwHAqPRPD9BxspbjMsnayfq+s=;
        b=SDpynhQ/UCtA9/qj8iY/pJ+sVXXXZFzaUBTIcLYIMsShiMxY7aFSJ0w5L6ieuTwO5I
         Zu4GH8glMJhRm3g3J7mCh1iUIq0Ntp2JmLYnWjWRnjipLwP2CuBpbuMF7GFhcTIila5X
         1kvy5JQlRO/9Wa8p9wuaw+eaZTu6HrFu8vhdDMvCZf3yRx/ASzDHN9Vqa304tiMl35F0
         xwzSxInBvVRwYesYEimPNyxXOotdB/kooSUqZBtpUAPGWcFBpn1mdh6N4L6F6E09NY2U
         Dy6yqqb4DiDMaRfBn5iiBkAMN1/OvhXY32GLWZYFtMJiMfGLz/WscCT1cK/jj3Tuw6Jj
         6aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678741219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8438bEydUlrPZrkVMSwHAqPRPD9BxspbjMsnayfq+s=;
        b=FKQvDdFYCltJA5hh5zCDDQzWTE1yLVamn4+PyX9CPbwjZlvZuenusYAvR+yufr2Qw8
         5XCPGn/ccTrZugkq172qBnFK7O2CZ0gFx8Gcrh3LK1HJRyx56Ei7ke5IW+O9/3rjDaip
         xrF/mSVIH2al7/kKwIkgfJWzax9/OCPEUGoSmARwzADlGWy6jMiMlhks/9yIzGH1gK3F
         SZ63vijOsc/sPIg+R06sdcN4LsUasLshqfrwqtRYmdAxSw74kQtBdo55QUed18cC+gW5
         XdKYrwvNREKzO/2hQHzWW+tvb8bDpyw+tx3IgCHf0TTmh05gQ3fV50uAqvxr7CLiDRCO
         DF5A==
X-Gm-Message-State: AO0yUKV7/5nnUo+EQBEc4LyUCMP59xHwU+3FW6pZ7Lv8LZduMuC1btaQ
	a6HU0Blnuw2iZf7lRZASLPo=
X-Google-Smtp-Source: AK7set/hHrdJdiC0TWwhv5WD+UmIkyFQQvKuFVP4Bt/3CFM0wO22DTqWLgGgT9JNw024LMvYaWbYHg==
X-Received: by 2002:a05:6402:74e:b0:4fd:23c9:11ed with SMTP id p14-20020a056402074e00b004fd23c911edmr2163161edy.17.1678741219353;
        Mon, 13 Mar 2023 14:00:19 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j11-20020a170906830b00b008ee5356801dsm219853ejx.187.2023.03.13.14.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 14:00:19 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 11/21] dt-bindings: pinctrl: mediatek: mt8186: rename to mediatek,mt8186-pinctrl
Date: Mon, 13 Mar 2023 23:59:11 +0300
Message-Id: <20230313205921.35342-12-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230313205921.35342-1-arinc.unal@arinc9.com>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_140020_790834_8C3A8801 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
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


