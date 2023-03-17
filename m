Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877B1C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 21:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3sp6QmVh7Rvu6BYvs/4TvtXukT0lH08BB5qr/XfDtE=; b=I1NxXGhNLMy2tN
	MfVa7mU/bmoHp0hOYhggCUqspgQbybNPnIFNZ8NvxtbRvZKb60WHQUNec2mh96WSL3EVIHjFRuSit
	iShFEPj/YcKcNNZysQMZd/Z4PyajTrmd0xnwmv8UCsNZ7PAxZhPMqhEstJUSWVwC7B2BGy+JXRNER
	fbcI/K7a+RV2FIs/ZBuF+ZfMIf7wR7KTd8QxdUohFGzLGFpEIyjq66CIifEB/vfuQTAOSlxm227Rw
	hEvWYZwDh2+DFAgaztYhaThTXVVlImSzhpyptnmDHlzvyXy1ZHJCTWkWRQxq6UCuFaHkDgP18B5iA
	3NdOfDd2ru9D+U784kBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHfX-003SUY-1h;
	Fri, 17 Mar 2023 21:31:23 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHep-003Ry2-2W;
	Fri, 17 Mar 2023 21:30:41 +0000
Received: by mail-ed1-x52f.google.com with SMTP id x3so25366264edb.10;
        Fri, 17 Mar 2023 14:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3sp6QmVh7Rvu6BYvs/4TvtXukT0lH08BB5qr/XfDtE=;
        b=GdqMRlbbMdqy6mBryn6qXANvu20qLcsphW6f1CwS2ByufSCoUvCno/NyxPCmjwTkvl
         H1TqqmMvztp/DMucW1PN7pMx9B2Ufue7tAApNNk8OzbjkwUc9sizLC29NBeXchmO5R8z
         T8A/ouG2DUMLdZw13luqQ9wv2z5xKY+xJN0dXpvOEjmv4uSW1dRVaWkcYfR7IkoShKJm
         lcT/MZAVPZr0XcFp3tTJZZSDa6i6M/nQSsqWVOqQcqe/YeaqalcfBw8ZuKkCVd/0RKjN
         wTtbAB8n+DZIJe3G/Shq0GdMO4ymTpRPYgkkm9/jLHJ8ZzZhamNfQBhV/JJf4SklK1zu
         x/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3sp6QmVh7Rvu6BYvs/4TvtXukT0lH08BB5qr/XfDtE=;
        b=ttk1nAdQU57twkO79WYl5bM1aWh/GtHV9AIuXWhdRxyx3P2URn0dVXgANRiD8Qo0YK
         bzNBzIRKoHYkhD10rWGG9eltM2HH8uOhbnY4Sqzfn6HXRMPgqZWOyoChOVEF0mt+syuY
         /hqdcDKg4C948ctfuPb5xKvt3ydHHY+oSWSPperbXP7JQ0Ia5Yw/VirYUqqoQ3G+2g1B
         TXjkp6R53Ibtuo3mRag0+q9RA2oG4YVUsad2q07F1k8HG7lWNo1IEsoPvJMbXcM0UxYR
         aIM8GanPI9r6llyWy9w4sZSTBBo3vA7+9wDXZ2UWkFFOyJYgAVWaLv/ulnR3MV/IxQKk
         4/8g==
X-Gm-Message-State: AO0yUKXtCNnJWgt5RhkkVV96GKW2ko/3carMeAoiVlMgxx65X+nfSNI3
	2AOs0+LX50lQvYehNewY7wI=
X-Google-Smtp-Source: AK7set/9K2BNiDB/LyvS/AlwDYgBXQTTnanfENeD02BnpjOWxSsJ3zmb4GYZB96xyu/KaC775A3WmQ==
X-Received: by 2002:a17:906:2a51:b0:87f:5d0a:c610 with SMTP id k17-20020a1709062a5100b0087f5d0ac610mr774374eje.32.1679088639122;
        Fri, 17 Mar 2023 14:30:39 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:30:38 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 09/21] dt-bindings: pinctrl: ralink: {mt7620,mt7621}: rename to mediatek
Date: Sat, 18 Mar 2023 00:29:59 +0300
Message-Id: <20230317213011.13656-10-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_143039_835649_EF79F6BA 
X-CRM114-Status: UNSURE (   9.66  )
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

Rename schemas of pin controllers for MediaTek MT7620 and MT7621 SoCs to be
on par with other pin controllers for MediaTek SoCs.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 ...ink,mt7620-pinctrl.yaml => mediatek,mt7620-pinctrl.yaml} | 6 +++---
 ...ink,mt7621-pinctrl.yaml => mediatek,mt7621-pinctrl.yaml} | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{ralink,mt7620-pinctrl.yaml => mediatek,mt7620-pinctrl.yaml} (98%)
 rename Documentation/devicetree/bindings/pinctrl/{ralink,mt7621-pinctrl.yaml => mediatek,mt7621-pinctrl.yaml} (97%)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
index 09ebb8ac22ac..0dcdc3788e66 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/ralink,mt7620-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7620-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ralink MT7620 Pin Controller
+title: MediaTek MT7620 Pin Controller
 
 maintainers:
   - Arınç ÜNAL <arinc.unal@arinc9.com>
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description:
-  Ralink MT7620 pin controller for MT7620, MT7628 and MT7688 SoCs.
+  MediaTek MT7620 pin controller for MT7620, MT7628 and MT7688 SoCs.
   The pin controller can only set the muxing of pin groups. Muxing individual
   pins is not supported. There is no pinconf support.
 
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml
index fb8c5459ea93..32506c538459 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/ralink,mt7621-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7621-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ralink MT7621 Pin Controller
+title: MediaTek MT7621 Pin Controller
 
 maintainers:
   - Arınç ÜNAL <arinc.unal@arinc9.com>
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description:
-  Ralink MT7621 pin controller for MT7621 SoC.
+  MediaTek MT7621 pin controller for MT7621 SoC.
   The pin controller can only set the muxing of pin groups. Muxing individual
   pins is not supported. There is no pinconf support.
 
-- 
2.37.2


