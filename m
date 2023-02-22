Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C726EC636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeXXWoYtcN7Md4fHV+U+ymSCKklKj3szjzv05DFaWBc=; b=K3L7OPHC44kPS6
	nFfjbpNCmNW1iq59ZUCYdsjJspSMoBvPf+q3x4A/MofI8Ah27Iz5uDtwoRwpYuRpfCA6Ja8mR5YmH
	rEFyODiWq1fPu7e7JG6khQFuzpLaGTxp9peoyYgXsvZC6zVTpadhwjSQ5ASW/kc5KeQVS/pxze/Av
	Y3LD/riSBqUpmry8L07RyjbQNDRwGpW04BQc5vANb+xyLqolwi3GctLpfdMzEZn5k6WhYl4HfDd2p
	5kNpPpvW4xdcG9oKuiIdzBSHJSEaGamRK3jbivTXGLiFXDi2JoeYYy0ms5YmrT4gk2Hh1jS5D8mpn
	iEkvKGMwVlp5ntWZmIJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUuAf-00DYPt-D5; Wed, 22 Feb 2023 18:48:53 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu2h-00DTvd-5g; Wed, 22 Feb 2023 18:40:40 +0000
Received: by mail-wr1-x432.google.com with SMTP id v3so8678774wrp.2;
        Wed, 22 Feb 2023 10:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeXXWoYtcN7Md4fHV+U+ymSCKklKj3szjzv05DFaWBc=;
        b=CSWzu0RDifPIC5mVxgRnFfoFU8+34A0WTuQKE35mzW/6ggRyLHF3l6iM1+kgmTXwCu
         oCZS7EVL3DR/F5WVbsc5h/HkBDQ4ldhlfPPAq6fD45M6m5tbIGX4H0M3vtHvYoT/CSen
         sz4kd819EHvEaKI3aslUVvNWnqUDABjbGwIc0Hsge/5GBEmvdHvRAjJIhDHCb3JcqZnz
         E3t9NlAKw0VbYlt2CSdN0SCF5PvZ5MCDMn7q2slkvbNTQBExh/qsagyjOCYNzkBP8DbU
         nD1sWl3EL3jCc2o3CqrjKreER41SXYBR/X4ywF1wHtcfB4qb7TcoBLpgjqiz+CcAH7J8
         YICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeXXWoYtcN7Md4fHV+U+ymSCKklKj3szjzv05DFaWBc=;
        b=O/BsUJ/wPqyT56yoPC+dODyohXyJJMSIGBPEIhKJwMf3da9VeU/BPunuu1F4B3lONg
         sKtWsnXZmaCY+sB/HdXSPZMdShBa3xWDfDz3lZ6q6+IwCwZztHLJMoHTxCve9uFw5WC4
         1eArLLC5B8JxSTIJ4AmBRiuV9d+EaJczCplTvPYG4vg2dUthoCFRBgtZ/sVUz4SQ9JH2
         WKKqa9ULgM7QDFEQynsKZ6aHYGQioIhxE9Ifdqoe3nrCu/cvYaiMFx7/FgTk3tumwOhV
         lwpq5u5Vd1TUgbZ1/utr2fpiNNvgDZvgGd6qmffWSOMYo5GViSffTIbECt89M6G5RfMz
         0ajQ==
X-Gm-Message-State: AO0yUKWwL4+Hp/hv8pC0z46m4u9wscFFICwLhCmLv5UEaSk7ZJYgRZ3V
	UTpEpsrzb0BkENcTjE/n3cM=
X-Google-Smtp-Source: AK7set8Uz83OUsrFm9m3xtosfJbhI2niwL6prvque1JZYsakJ64OCWj+zmdlRdhG4BeR7sPUaUU1tg==
X-Received: by 2002:a5d:5486:0:b0:2c6:1482:33fa with SMTP id h6-20020a5d5486000000b002c6148233famr6770139wrv.59.1677091238565;
        Wed, 22 Feb 2023 10:40:38 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:40:38 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 15/16] dt-bindings: pinctrl: mediatek: mt8195: rename to mediatek,mt8195-pinctrl
Date: Wed, 22 Feb 2023 21:39:31 +0300
Message-Id: <20230222183932.33267-16-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104039_251664_9866A6E5 
X-CRM114-Status: GOOD (  10.45  )
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

Rename pinctrl-mt8195.yaml to mediatek,mt8195-pinctrl.yaml to be on par
with the compatible string and other mediatek dt-binding schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
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


