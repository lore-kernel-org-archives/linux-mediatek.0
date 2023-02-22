Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F3FC636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4GQZ8qAd7vUgU+4b+W6RunOVqNL3/02QMSg5OECyOek=; b=OxS9SjAXgZi3GB
	UDkx+4nUdkUij5ItowYMljz2AvMUPwJSNaEfbbv8eI3lgN7DY+CtL2fYEiTKrRNrzvIbXJBMchoi7
	KXzazUmXir8pe5wRJR7f/SjFuVGD3oit7ir6oe43AwEHJdi0hSlLjaQBH6iiD8LkLHjhFYouZXSmd
	C5H39l7OiWq7LfDwbl7B4VqEQ3phgLWWGkGYnKcB+4a7/nm1Zfde6vqXnuPKOpTT0SPOrN4vlO+e2
	8FauTy3YbbIppjZXfy4o/w5M6NpGIGO3nHK0H+BPvgVLXhdGbskzv5wkvXjcADS8xu8Sdkf6P3Ksc
	BrguTE8d83pKKDN2K8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu9k-00DXyJ-M4; Wed, 22 Feb 2023 18:47:56 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu2e-00DTk5-Pi; Wed, 22 Feb 2023 18:40:38 +0000
Received: by mail-wr1-x429.google.com with SMTP id l1so8477421wry.10;
        Wed, 22 Feb 2023 10:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GQZ8qAd7vUgU+4b+W6RunOVqNL3/02QMSg5OECyOek=;
        b=gF5UguTKx+5wO9R3iI8jUuMqngJiy/plOyL8nDKrrZLjiNoG8lU4qTQrFco4KH74/J
         rqDNvM4M88vtto8ZkGxGpwrmBw8v+y9fLTrunl+jXRH97Je6IHZc+HmwjGhjSAn3xI/M
         gvq5oZ8uj5Se7L1o7z3nvW4gV5kxpT2wuHgfFdyFXkW5BN53mcHMLLxa7T+/PC13dXVB
         QL1M/0bm/Xt+1B9c1K8RO2XD3otMxlyWSsPTTF2yHKVd/WksCfexnaVf+oxq4F27rk7S
         Fjr7yPS15/vu0h8cXZKokU12XFSJBfOYx6p0LnPyHFQSytV4A6zjt9qp4/jVmUGzDmu7
         R4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GQZ8qAd7vUgU+4b+W6RunOVqNL3/02QMSg5OECyOek=;
        b=mhS4RoNHQ6CN/vSWFD83ewX/cKBjskKc7xlGZV3K1HPK/0HtnH5SyleSoaR3tysZlS
         k+TEn/bkzoauwafE5Y9pgCzHj60XnPm5AyprJDftv0/UnNxM8kdu5OCsS/aPlthmZWWo
         gDazLVQUDYCLOKJ3v9LYXHRbbTN6syzhcprqdNUIkoGV+ha/QyiQhjIbs1uuFca4ZPpl
         +UUbRrkQ9EopBw7jhQqKLip3ferMv5KLF2t+mnfKdPoiQBCrCt9ePALjm7Yss82V+pam
         CrU4HgFv6SSP6sButwBnrVeA1Hf6xgjy0F6qtOoHXzP3s8qTMZo9se8G4fYbT5DMW5+l
         zoow==
X-Gm-Message-State: AO0yUKU2Lc9PSDw1SdAG6PdLDDGZoKqkrBxdwGVTc0erq5Uuck4kkTVP
	6AJUb/a3dtPCI2sjhJpsDIM=
X-Google-Smtp-Source: AK7set/fFzM3NYHNQny0U269a5WUM4hhg0gF5WL2JKE+SiZW5s9bqU947q6Qe/lLwGBgPYWyFND8sQ==
X-Received: by 2002:a05:6000:170a:b0:2c5:a38f:ca3a with SMTP id n10-20020a056000170a00b002c5a38fca3amr6617920wrc.10.1677091236355;
        Wed, 22 Feb 2023 10:40:36 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:40:36 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 14/16] dt-bindings: pinctrl: mediatek: mt8192: rename to mediatek,mt8192-pinctrl
Date: Wed, 22 Feb 2023 21:39:30 +0300
Message-Id: <20230222183932.33267-15-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104036_886927_D40B81C9 
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

Rename pinctrl-mt8192.yaml to mediatek,mt8192-pinctrl.yaml to be on par
with the compatible string and other mediatek dt-binding schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
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


