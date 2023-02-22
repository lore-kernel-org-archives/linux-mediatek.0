Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B07DC636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcArEGHX/fk4tdd7xlvhQYvzSJ8gqoZ4AEIyQIgQrNU=; b=RMefSXvFi+flDy
	Mb20/vXMRo8rdZeuQ563lMfpWCC/jKdBDL+4oq7dyq/a7j4DqffJNYyzlFSHohGMqqARPTPl8/cEC
	YaLAVKqPP3DSDh/Dgi9vuvvL0AvFqVK/r74lzhNghh2Qbpq3aqCrsk533JlSeyrH6UnJWsQpDuPVB
	Db4hFrEzZ4C6T6vXOY1UvkiI71KgPvo4StDW0lWV9vCRN7hOP6UrKPc8nMBbUbRZoI+7ssuIxreXX
	UnTLPNSvn759XvY3SUteYI7mGIVLDh0lVdNJZ0ym1ypzXAEPxZFthIjp8Pull/LeukY+kXa8hXOBA
	lOcw1RMdie4i6Imbet9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu8F-00DXDC-CQ; Wed, 22 Feb 2023 18:46:23 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu2c-00DTel-MH; Wed, 22 Feb 2023 18:40:36 +0000
Received: by mail-wr1-x432.google.com with SMTP id bt28so2090402wrb.8;
        Wed, 22 Feb 2023 10:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcArEGHX/fk4tdd7xlvhQYvzSJ8gqoZ4AEIyQIgQrNU=;
        b=AR3MjkftLOM10sT3eRRIRv3jttbYHUx5N7LjAquL7S+7THBL4C7hugZCKNdCHq/wZ2
         fMkseRfTBsJTi/fV5prmF8t2TNDDRjJRtSK6FUZ/zo7FRf8ywkXtipOg3uBR9Y/Y47JR
         3FNNzx+se451S5z4q9o28Hay2RgOaeXLWNO2WcU7KamknJkox2nIXg2AiB+DNOcCnVtm
         rTa7QuelafRefkSveHJ9LnD2M9GaKvwWoKTxfvaz+4Epkc0Scm6Y/WzAS5I3NE7ZKfBG
         VFmVo4TtB1rzZEySAoSCYvrUJlef+G+AAA5h/fyKvLEoqA9/r3rMnnEmwLbtHncv9yq9
         isIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcArEGHX/fk4tdd7xlvhQYvzSJ8gqoZ4AEIyQIgQrNU=;
        b=LASD3+82Xn9xfjlf+OrYuozw0e5JaxC2F1CxV16EK+W9zD1Z7kkreg71TvLe0ZTFx1
         ztbD9YSQ+x04rGZCthz9Wx7BfGwgpCBL+SNHFaWQJlAR6hvIxHzFmuM/tcE85zM6Ulpq
         P7w1VnFrR1gmECULRajvhBZi0gRNX6LeHX4QfZ1gpwpwmAT34SYUOFLImNhbdr/D48ze
         QJ5eIgRmHcmFdqWR267g8k9sSgQIFDseSTvohdlaGSGGRQ3Uc7qZozrAhhdPGEbvMpfl
         MZgUO6zqyUIEU3h2+bnzFZWa8wAW99h7zHLLUbyAMA5Jhhsg822R5VV0ZOygSmhG+hE8
         c5Ug==
X-Gm-Message-State: AO0yUKVW9FgqdqjrAPphxgU70YkPfPkgHjFUUMnrMVZoiGx4omB50gov
	3bfhRDSx28t33dA0ee7lF9k=
X-Google-Smtp-Source: AK7set/PI5j55Nw4TKwVmwP/MNB3vBBcm1slvLkmfdv12lERhBSSRt/I8s1yrUOc05aaohWWABC82Q==
X-Received: by 2002:a5d:4d4b:0:b0:2c5:5d15:4e25 with SMTP id a11-20020a5d4d4b000000b002c55d154e25mr8455403wru.16.1677091234179;
        Wed, 22 Feb 2023 10:40:34 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:40:33 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 13/16] dt-bindings: pinctrl: mediatek: mt8186: rename to mediatek,mt8186-pinctrl
Date: Wed, 22 Feb 2023 21:39:29 +0300
Message-Id: <20230222183932.33267-14-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104034_791857_DB4CB579 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Rename pinctrl-mt8186.yaml to mediatek,mt8186-pinctrl.yaml to be on par
with the compatible string and other mediatek dt-binding schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
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


