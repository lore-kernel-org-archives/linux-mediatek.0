Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA283C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBoLaLgAfnzJMOco92w0PZhMXyCzsUA5lEBWwlGN0ao=; b=36CGBG1wlRqwtp
	GlM181zROd9ODPnVsKs2Iig5Ox+8oy+I32bro5qsPfHl8En5A3RtaoDgOmBNdEJb1Aj2e8Nc8MiM9
	6AU0o7ye+bqoMbjXD96x+EQeqsfDHg/QKEUYbfpZShl/EgWmpH7MrVB/uOj06LrUcKiNnTr0/fuyg
	wy1PGniHHY/liTrN92JdgF9LTh5HJPb1tyBm+dqyGF7dnahlCm9XRBThgGjHya/fQQsElbanB+UXc
	h9QYud9vCSVRUFjESvkUnPoXnJYKuWWwOkXAjdRRdpq3p0mmmc05XqDizd+ohtVZAslYjrR0d92Dl
	yrKg4/RR1nWhQhY/CyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtNq-003tSa-0J; Fri, 03 Mar 2023 00:34:50 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJW-003qoG-FD; Fri, 03 Mar 2023 00:30:23 +0000
Received: by mail-lj1-x233.google.com with SMTP id h3so725046lja.12;
        Thu, 02 Mar 2023 16:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBoLaLgAfnzJMOco92w0PZhMXyCzsUA5lEBWwlGN0ao=;
        b=EMMa4ni9zrDRspPU5ftf0JQipoI2u0POA5nbF+kc3oe/G6/TubCteI6IDoea0/5U22
         rn4SzkTNg6n9q/RXrtVKqGuLp0oOZrS/RpNUwn/oFvoJayTzhtzITB59+y7iTBlfhUEg
         cVxoVeII2eLERdm1jq+apPU7OMj7/EHk+rFWbG5lQ/aGJxhj/hBshvJXZPDLRjNMnz3u
         Cs8u/+ynlARvsccuFBSqmSyB2oH/mKdfY695iisL5D/YDPo1vxmvVk/DOeAw01Gpyj0S
         wj1KmpaJFE/VF2OLqXmiYGdId2+dkEZUdkb09ahg3SOk8GKk5v9TuOKaby8O6qIzxeaZ
         p8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBoLaLgAfnzJMOco92w0PZhMXyCzsUA5lEBWwlGN0ao=;
        b=aqCFeYQ+YyDOiuKcODLhqw8OIAMDZ6DrbjnEvgp0MgmZ6lMNhQERBnVVgdpt1vfdrm
         /cxpMTVD24ulBqp9hEz0+eHfiF9DQmNCVVkyQctgzCKI9g7DmzMZe7/i09ht8FZyOezM
         HwrYApytIIwMHqjZ/CfwDAr6ingWijXdtMDUWXUdKJetBkLwEOKoxiYvzS6Azuh6cQPv
         85BjPIbdO4DYXtgGRaIN7sf24tP3kSPOiBSJpXGPqmD0NFRxR2XtXseYjl6jQ6pgiRJ1
         opmf+uaVM7aOG56iXtRmpvVrj+5OuuzuQt5AdY60ubiCcnsedsaFnds9nL5xhRghh1EI
         Q1dQ==
X-Gm-Message-State: AO0yUKVlbVPzRvO/c8FgIYJFpK+iRfXu1PPKwfFbflCkeWEcebbTfu02
	OLjoTulGbgA5K1/O5p/OcAo=
X-Google-Smtp-Source: AK7set8rNy4xiBupjJ/nm4xKxLpUCbesFNEMDh48vzYZKeWx12ce9ZufLJQp9c42xDcig2JNeIlaWw==
X-Received: by 2002:a2e:9255:0:b0:293:5f51:3d41 with SMTP id v21-20020a2e9255000000b002935f513d41mr918759ljg.11.1677803421888;
        Thu, 02 Mar 2023 16:30:21 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:30:21 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 12/20] dt-bindings: pinctrl: mediatek: mt8192: rename to mediatek,mt8192-pinctrl
Date: Fri,  3 Mar 2023 03:28:41 +0300
Message-Id: <20230303002850.51858-13-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163022_554365_74B4701B 
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

Rename pinctrl-mt8192.yaml to mediatek,mt8192-pinctrl.yaml to be on par
with the compatible string and other mediatek dt-binding schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../{pinctrl-mt8192.yaml => mediatek,mt8192-pinctrl.yaml}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/pinctrl/{pinctrl-mt8192.yaml => mediatek,mt8192-pinctrl.yaml} (98%)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
index e0e943e5b874..e764cb0f8c1a 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8192-pinctrl.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8192.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8192-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek MT8192 Pin Controller
-- 
2.37.2


