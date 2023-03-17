Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA68C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 21:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBoLaLgAfnzJMOco92w0PZhMXyCzsUA5lEBWwlGN0ao=; b=JqeKv28E9Lxrdi
	7o1atw63LoR2ggnbBXbtUMNeDowZ8i+lrrNFEiZZpp/D/xBNiDpL5SCHwC4ltUc/u2Q37IvVXGujM
	/qM6L/9MAGBIBONyjFFMK4y07gMs6Zk11p9/thNLEFp4eHCtL7iaj0v9co1OKUuW0QFouxJNRT+42
	LUd1XCwVsyMkCqaouFh8CnqCgmSdziR91ODXXJXrOm8pNOyhxlp7i/Pbu1XjkwwHHT6mZLLTp/BIe
	rdpNDozswm+n30UgWMxM9dE94lz/4tXa2N074tSIBq36SHdJXdIRIRsLu98YwqymMMsyvEmL8DcBU
	+uPcBckTcrfTyQtsmYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHfn-003Sf8-2g;
	Fri, 17 Mar 2023 21:31:39 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHex-003Rv7-0b;
	Fri, 17 Mar 2023 21:30:48 +0000
Received: by mail-ed1-x534.google.com with SMTP id x13so25487599edd.1;
        Fri, 17 Mar 2023 14:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBoLaLgAfnzJMOco92w0PZhMXyCzsUA5lEBWwlGN0ao=;
        b=c/rn5V3gsaXFcP0ZsLg66GCLxi7bukAkbNoDtS44ArFLEtbqAIKSL4OEf2Do8hQ7Qg
         s/spPfzoPZrR9GXdgQEJ1/GI+PVdnshVibG40gVzbL5vxFsz/KuJoJjzQ9KZeHfoHKnw
         uJy5qoB0B35k0ndW2nJAVy/iijmT9wQePF4leu2DibuCqRtOA5d2KlTUa6cDxLqtxkVL
         kxJXJxZ+yAsMsmF2WR2Y/FLrmcc6tvZAN0c/wafC7ynTEvGmUBxO8jn1lRLmnLKo/MDV
         Quq2vUREm7PYDhXDFJNzqDzUqVAeSeMnArc1iM3ofkzZITEJtfyTcRxsIGyBua8qldID
         7S1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBoLaLgAfnzJMOco92w0PZhMXyCzsUA5lEBWwlGN0ao=;
        b=X7Gidw7aRLHKb2+joBbqO55vvvKVoypBivhYnZ4B4jF/kFIxgxRWHzh8RXq2ISUdpZ
         l/nZzliXM2rUh/aYMlLCEfyljAQ5DsvK0eE/X1AgYH3mABwZt79uDXFdJQ2M3XOALxC5
         j2eCfQUqNbFJ1L3z5FocpRWkQ1y3Z6QA0/ccFEMA5xnRRcBrDGKJgxB2GvvYLNZSq9ka
         9GUchs/vU/hHJKnaX4putqels33LycELlomidb9I0fy9hmOqgTpT0OYNNgHZQQAXewu2
         CRt9ivOg90qN80HPHd/+WZvCTAcV5z7C9IVUaxQfn30poTYTaI580oaFJ1eInOub9p0o
         VHgw==
X-Gm-Message-State: AO0yUKWUTaK8fbPBkZmuVBoJTygK2D5cbBnvgX5PigbuLbaCSoavL79N
	HyTNvFQw2f85+pA875y+YUQ=
X-Google-Smtp-Source: AK7set+OQPuC4DWsozzV9ZDx0KyTGxxvuHxSGkd8klGTQvLrDpud4gQhsGXkpPv+kraHJ7a+HxgL1g==
X-Received: by 2002:a17:906:c183:b0:92f:17d:4438 with SMTP id g3-20020a170906c18300b0092f017d4438mr969149ejz.47.1679088646676;
        Fri, 17 Mar 2023 14:30:46 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:30:46 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 12/21] dt-bindings: pinctrl: mediatek: mt8192: rename to mediatek,mt8192-pinctrl
Date: Sat, 18 Mar 2023 00:30:02 +0300
Message-Id: <20230317213011.13656-13-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_143047_258666_E3601453 
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


