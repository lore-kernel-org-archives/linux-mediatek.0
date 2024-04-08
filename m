Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5F0C67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 10:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BgMBOXWSUTk2V625cFtn0BP+aJZnfiCckssn4N/MuIc=; b=Mmous88c7iXNeitcIWWDDzLBrw
	xAaqWV3Uu5BeYUgI6mjEKwtTAFcSKKTubGm/VJgjSD7IOYDsYxW0zOfJesPC9vBaA3UhRZ9WGPsT3
	xkp5xPisKN695IuVieRBHETaHsRt9ssfkVlv4WFa0iJ/rFctE9WoBcQSaIkeANm3Tlh8g5jPQFdHI
	tDk+yHsf5p7Tkc9VI5/u4IoprXMcAf7qYJj7WTG00j2AioXghwTvT/dVqesIRco8+Kj6K7A6ZXCWr
	j+bR1Z6o+WdkERUvyAj63cKuSQFqE8lLfOVCpfJtsfL63JP7/s4fPpm5VVNOxgkgyk1FhGUxl9+y9
	A80O1lMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtmbQ-0000000FJDc-2zpz;
	Mon, 08 Apr 2024 10:51:52 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtmbN-0000000FJD7-2bl5;
	Mon, 08 Apr 2024 10:51:51 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-56e6282dd72so784077a12.3;
        Mon, 08 Apr 2024 03:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712573507; x=1713178307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BgMBOXWSUTk2V625cFtn0BP+aJZnfiCckssn4N/MuIc=;
        b=gM0IofIcEV702ZfyaAHvweNSme5et06xqAsBek116uyBUXDG1NzQeyNnuXW2YeHmL4
         AuNwcKaDoMt7aJ8d59JBQTshIv9BWZT5CNmt6OXStPtpfozFxAdxxrSNtNGM0JIKCWZ7
         UTsrvFYC8u0ylNYo6fmkrJ4QnF0HjC/SE2wszIXayVrWkgcTJrI5nLqtBkczpx5+3wcq
         E8igmXzwb24dVwrV5UV/evjV93MyOjNyPynBisVQ6UWRXjzF7QZcRTnXuWeGnxnzcw6V
         3Bn7wHL9b9CSeVeo0BB2q1gbs627etx1DaUrhCbOVx2dV1RZb1Emva8cXEql2qTy6Rg9
         52VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712573507; x=1713178307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BgMBOXWSUTk2V625cFtn0BP+aJZnfiCckssn4N/MuIc=;
        b=gstBEY+hLmBvVSPLWKCh4y4D1LeAlFxnM1s4w4XRdeEuh8Kj8OrFISdTbinusrXzOK
         p7501ZYd/TcwDbUdL2WqHJS86gx5razfrxurw6fD0UzGb2ymKc6/G3Pw9EtP8KBZ17NR
         XospwmZx4CO/wDRQobqu9VcMzC/8Fy1Qu0gywmRiVEibg1QZU8GPavAMC/yy8rSDBDIs
         k+7kKGr1jeV9VV3i1rsLkSEgE2h2l7pKBojEnlk/XEOT7LTF/H8O2cz4E1ELPfVnvutd
         M2aPg88TAY7VgHzSJh6P9MiAkpvLDPKUIqc9PttFC4gzkEA8oP3HCkNuOWXiD4Ev328A
         BQLg==
X-Forwarded-Encrypted: i=1; AJvYcCUMRyIis4GCGdVcMjd7AuVPdWbwan4ZYz69GDeqFE7jQkA8s01yDoxKd6EY71aW1OkT1waVu6mP0bj8+vRZgtliWPjq2Cw9XRaKvxEGkLqXjKSqyvj7ak327xgAomJCmQcpqCMuukFL9i9qZQBi59qrtubP9WtdGLY=
X-Gm-Message-State: AOJu0Ywwc+ljAthlFgTUHht6EDRPyqJCQHzsqvmLSJO1Xb+S5auP6Twj
	WnSZqmfETiHwrdBc67YGIys9qR4PE5AJ4lb5wQaGqUzUR+tR6yRh
X-Google-Smtp-Source: AGHT+IF1/ugf/K7uAP7APr+QbAPjgDSfGk4792+1LeuVHIJk9kuAxqHXAOJRMldWYia02ufJj3Ks0w==
X-Received: by 2002:a50:c003:0:b0:566:fbf5:a279 with SMTP id r3-20020a50c003000000b00566fbf5a279mr5312382edb.20.1712573506521;
        Mon, 08 Apr 2024 03:51:46 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id c9-20020a0564021f8900b00568c613570dsm3983900edc.79.2024.04.08.03.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 03:51:46 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: pinctrl: mediatek: mt7622: add "gpio-ranges" property
Date: Mon,  8 Apr 2024 12:51:28 +0200
Message-Id: <20240408105128.30586-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_035149_687620_6C872259 
X-CRM114-Status: GOOD (  10.39  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

Allow specifying pin to GPIO mapping. It can be find in in-Linux DTS
file for MT7622.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index eaa65512161a..d211f2e403f2 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -36,6 +36,9 @@ properties:
       the amount of cells must be specified as 2. See the below mentioned gpio
       binding representation for description of particular cells.
 
+  gpio-ranges:
+    maxItems: 1
+
   interrupt-controller: true
 
   interrupts:
-- 
2.35.3


