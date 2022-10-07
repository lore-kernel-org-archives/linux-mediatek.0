Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DA4C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJLkzhckeFshQoIGVrBkoMvfKHebYXfQWu6zMogaTcc=; b=gExMlU0QvQTogbAo7qS8VSziTX
	YT5Fked99arVoz2RuFIBfGEekQ74OrG1xR7hwL7YiYY6ujq+ZzB7h7xYdHfuzW7XuTQoOrwftctmA
	K+I2W9xMF6B4PzlqpKyTKD5vkvvmWnI/lpqF2SS8pSvQywVRDuhRypUN0QDVHNpNnk1RxkqZmSkdq
	Ck1gMUclb4BcSUNX2AmbluLx9ofUIS/T0wAmIbekrfgTHbNcrlNy+G9bkrZeacTOs0S+uBrXukchl
	hys4dlE3nP+obi7/7T81J/sSZpmmTnZOF47hdp/J+0aGMZF6N9n3f6yi3bzmxIQvbIcZe5D0NbgOH
	yK7hnDEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmxc-0090Nx-3l; Fri, 07 Oct 2022 13:00:16 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmx4-00907e-K6; Fri, 07 Oct 2022 12:59:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id j16so7192724wrh.5;
        Fri, 07 Oct 2022 05:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJLkzhckeFshQoIGVrBkoMvfKHebYXfQWu6zMogaTcc=;
        b=MbC4F10bh/tlVCl4xj5R5MQ1vOtQYYCiiRNFuLXnd4i+cCBlKq/mprYpbArI82WKsM
         9S/0zLq4TCfkxlCa3fg5HVTRuQtIPlbIZVEYKAT+Kg03X8sMNe7iLGZuWnFtumxWgzvq
         fi5gzYjgIJOAWqkghM3txtIOzSNY3BCGzQuHzxNzoe3T6DhXkjOxijlKgLxoq4PE4rLs
         Medfdip2Tq1TvY7REoqhbDW7eGejcVvaFBDS559mX5xxu+i0/8zBLUUFHWFgpw5RXEBr
         I75gSoh4qfJm7DybeActXnnFtu0k3dWkXz5+x27QnUXXZn7AIoWYkfH67RIEHj/uEkP6
         /sHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJLkzhckeFshQoIGVrBkoMvfKHebYXfQWu6zMogaTcc=;
        b=2p9XPwBzhujuc+Tb68BxIoC12nzztm1eK4FTbMh682BhXPtLhIi336UNKhGjKOPWXb
         qlTR3M8Wf4apikK7zO/oSFHyLXAIzBl5D7EJkHlh0u4+PkbQ+1h4JIyj4tZb88EKPW1Z
         qUskP0H9qAUHU4p7sFzjoACAEVe1w0e2xvx2gMmdKRfItdG5LNq6/ucnFd/sX4khBtmf
         RDBu1zHu+nSj1eaqhQRyIMGn1B54gePgel8qo8gFHI8bWoPgwntwpf7x+S42ts/4eQIn
         E+65r5riW7wnZwORioqaSE5O/drTjrfHV/mWCN+edytZJIM6oER+wIQ8o9oo26YCinL+
         JBfA==
X-Gm-Message-State: ACrzQf0ZDzF/J4EIZ6PJ/D5j0VobwxctFWRBM1AilqfowrrQaun0TLYO
	mphWNcWm8t0F5r9QXVsOlOY=
X-Google-Smtp-Source: AMsMyM7ikBxF1zrx15wf2hOuBcYSBcCJ4aCMTyIZGiuKvrxstdB5PaJsAMBv1q/+NQL2LEiimRY3aA==
X-Received: by 2002:a05:6000:15ce:b0:226:f2ab:516d with SMTP id y14-20020a05600015ce00b00226f2ab516dmr3215174wry.264.1665147579829;
        Fri, 07 Oct 2022 05:59:39 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id i15-20020adffdcf000000b00223b8168b15sm2008243wrs.66.2022.10.07.05.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:59:39 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 03/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Make gpio-ranges optional
Date: Fri,  7 Oct 2022 15:58:57 +0300
Message-Id: <20221007125904.55371-4-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221007125904.55371-1-y.oudjana@protonmail.com>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_055942_698876_FFA01B50 
X-CRM114-Status: GOOD (  11.81  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

The pin controller can function without specifying gpio-ranges so remove
it from required properties. This is also done in preparation for adding
other pin controllers which currently don't have the gpio-ranges property
defined where they are used in DTS. This allows dtbs_check to pass on
those device trees.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index c6290bcdded6..d45f0e75a698 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -67,7 +67,6 @@ required:
   - reg-names
   - gpio-controller
   - "#gpio-cells"
-  - gpio-ranges
   - interrupt-controller
   - interrupts
   - "#interrupt-cells"
-- 
2.38.0


