Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570B3C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1EO681NLLyGQFHGfJf2gv1cVQUWKJ2bHIXepwv2glw=; b=wM3toL8HuFcmc+
	9sF4U2R+TKYxaOr+/cIjGqytmlt7+p0h4AXanh+u0qI0Pb7Cku5Hf4+wRj4D9Mi8OhAUYr1IdWtuO
	nMbTNEcvml3fabO+wAHYORgWlAL2u2qfvVNIc6q9EgKNEZGiKh5FoW2R4ULnLxtZqEjzoGzmYbmWX
	YaAYf3N/lusyKQwmnd9ZJXK64z6qycCMzxubEpPA9ylx+8DsXRaqhV7TOUt7K4KMXp7E59xULKp8I
	aVVLWmIgR2p1Qq1g1EcYtNPUD0DArPVur8MQZ9uPVUWcqFTOvzWylBmqgJPmNpdiQsbryeUvof7bo
	cfWbsyT/fVrFo8VL9J9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtOX-003tnH-03; Fri, 03 Mar 2023 00:35:33 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJZ-003qeP-78; Fri, 03 Mar 2023 00:30:26 +0000
Received: by mail-lj1-x229.google.com with SMTP id f16so735203ljq.10;
        Thu, 02 Mar 2023 16:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1EO681NLLyGQFHGfJf2gv1cVQUWKJ2bHIXepwv2glw=;
        b=jYpbKsl9Nsw4DwxLHHkbnq2jY3A1MpuQQF/XFdukoMRo6p6chJJVL8SU8X2Y+0V5qt
         xAREb7n1etY1CKu3qDWRsHgzAChFWmlCCVqcubbCXK9OkB6uHVrs8uNjCNVuzqUpdRhe
         6UlbLMVgR02S5+ZhRmiJpIOJHB8IQ8YFWr+5YkbMI4U0FAx1/RWZlD6cm16KQitcoXec
         CyrudItmTPT5jf3EZyDRTjpdr9m3Kh2GhEQyRUTcjKSZ2HaXYPXKHhYJ5j9Qn0Lx9wWW
         AgZbrouMa7lPv5PD1M7kU++hEYXctrIFnsBBcHijXOyi7ojRHf6wNJWrSQGa8wmAqaPc
         s1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1EO681NLLyGQFHGfJf2gv1cVQUWKJ2bHIXepwv2glw=;
        b=kJrJCFBO/yMTY2MSXdWHzr3sNoivXggR+Ym+U3C0yLTXeEJgVzTX2kn5UYyjHBwCOB
         S1MU2T6Fj9LhHlftny0LAqv1D+2v9y8BZFv2HrKXW8V0/kjU3opICTCGzc5ZhlpUxfrn
         /sKk/dJVhbwoZ0JHMd4ENqhSQz8SmlScxN6QqPePHXX+6PZr0blGvvIz0I8Zblxdnd3w
         lg7NR0OZNSj9kYe78cx6xzbTXPgAWjbt3V+9aTYO9H4LATBcYyC9EfP83zHE8kJDg9I/
         i4XrDW0LkdJIoiLz14xnMYWeQdiCKcAuCovomn7vn98GIBqzHKlLD++E7IR0Y85WS0Fq
         qcUg==
X-Gm-Message-State: AO0yUKWObezZXmRdAGgKmHKjs6bOEt2Mo/vm00HnZcGBIfOKvYQffFWo
	jyJylP1kqG9bHmDIWZ2w6Qw=
X-Google-Smtp-Source: AK7set8brLrLoVwNHcgj14Xjo3ys/agkh/5bIb+NCvbVQ35DVnkWmkqUzvAwOvYWewiYAbl2lg1wCA==
X-Received: by 2002:a2e:86d1:0:b0:295:a5e1:8347 with SMTP id n17-20020a2e86d1000000b00295a5e18347mr3395254ljj.28.1677803424712;
        Thu, 02 Mar 2023 16:30:24 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:30:24 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 13/20] dt-bindings: pinctrl: mediatek: mt8195: rename to mediatek,mt8195-pinctrl
Date: Fri,  3 Mar 2023 03:28:42 +0300
Message-Id: <20230303002850.51858-14-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163025_284493_38D4BC1B 
X-CRM114-Status: GOOD (  10.10  )
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

Rename pinctrl-mt8195.yaml to mediatek,mt8195-pinctrl.yaml to be on par
with the compatible string and other mediatek dt-binding schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../{pinctrl-mt8195.yaml => mediatek,mt8195-pinctrl.yaml}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/pinctrl/{pinctrl-mt8195.yaml => mediatek,mt8195-pinctrl.yaml} (99%)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
index 66fe17e9e4d3..7b3dfc14eedc 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8195.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8195-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek MT8195 Pin Controller
-- 
2.37.2


