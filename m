Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59194C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 21:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8438bEydUlrPZrkVMSwHAqPRPD9BxspbjMsnayfq+s=; b=DIfMmqZwXkK1rD
	RVSDcK3WZX1TSSqVkW08JYsla8Ztf9MqDlt6hHXY7Txb1MN0XXV2gvMogGJ35ddUE0gZkNyZ3z0mo
	+9JTCQZidEjk2LDr/RE27+z1FcuuQPf0GuEFR6VjFaX8cni7MOYVoGCnX9mxTGQAwOPiXSTO04A0K
	zJZAQ61gh+VPITlJv0Yuwdh7wtyVMjKWYnLMiHhLC0tmD0M7joskkNyfMYwLy7FstSrAEchVH5EJb
	htM1QCoYFWu3Ijn0LTqp+Ye8GT+7V2T24CLLu1i5JY4u5yA0KA2ATKMdhtK6dEa7sM+/lX4jrkfyj
	WkDqZaleW228/qQaLCXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHft-003SjQ-1R;
	Fri, 17 Mar 2023 21:31:45 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHey-003S7g-0H;
	Fri, 17 Mar 2023 21:30:49 +0000
Received: by mail-ed1-x536.google.com with SMTP id ek18so25430948edb.6;
        Fri, 17 Mar 2023 14:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8438bEydUlrPZrkVMSwHAqPRPD9BxspbjMsnayfq+s=;
        b=BKQ1OiJAvSoi6GkGS20VepyAZM2aTwKrXTe4Ydz1TSkodfhZrKh8lT9EDNJDHEjOmU
         UWH8sM+IvQ5tGgoLfe8AcROvIYDEi/blCyXacpL+2Y2fry6S19VwnxFlmGn7c9tfE0LU
         VRQwJLXqxH2xf2VXLFnngDReFs0Gi3upAk3JGMDOBIw4x6BXA8Nv3W48+gR3vX7y1a88
         W65qEaKoMl0650ce4rzfomFy7ZhPkSOKRNwj1sspUl9SeG1SDGBhqfDVsL14WcCfYKrp
         2mWAyyLceE4zFuozksoNNhqpeQw/GsHLliaIuvyqNXfeMd0Nv85/JQoQAZp0fBoe8ldJ
         1emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8438bEydUlrPZrkVMSwHAqPRPD9BxspbjMsnayfq+s=;
        b=yK1B8caqqxY96SKFKg9nwc4eMwY2n3lLVdZ5nbExFx1yIGegnbVxH7PcGtoyRsbmeI
         Ha0ixfmizM1IqaJUPCOAvpJf1SMesA/K+Ldvhp0a4AToL6q/CwMIsbh3DY0gmS/D0228
         yjXTWmxsoLCmw2hvlP2ic0Ckam1Lq1787oSLjU/gvk5BDjT9HLWGodJS4K9XtrKcdEja
         qViEtglKMshHlO1/ijBgn40GjqMzNs+d1q182c8SSz6d9bHvd3TCUUmyZuZc+XDhcvFo
         iyfRdl6MkYH8Kcg3mIgIC8BZ9hURxnsgloub4M+Z0gXHOIUGT9Jk6qp44bp+Yw6H0fY1
         hb3g==
X-Gm-Message-State: AO0yUKXYnBP23+7eL7tkHiCPsMEF/mYGzWXKT9/RlwEWN1/XCicx/rlx
	mj9+DYUiEDQ5bVnB98KfYBh17wrZHR07Clq3
X-Google-Smtp-Source: AK7set9WdDW37amJ7JOELl+SoaTQ+kMULS23MCFyTGLUsyOVdgPMIEeQ75qrnhAz2a9GQMdJyXcBVA==
X-Received: by 2002:a17:907:a04f:b0:931:51c0:7300 with SMTP id gz15-20020a170907a04f00b0093151c07300mr665581ejc.77.1679088644180;
        Fri, 17 Mar 2023 14:30:44 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:30:43 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 11/21] dt-bindings: pinctrl: mediatek: mt8186: rename to mediatek,mt8186-pinctrl
Date: Sat, 18 Mar 2023 00:30:01 +0300
Message-Id: <20230317213011.13656-12-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_143048_124960_118974AD 
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


