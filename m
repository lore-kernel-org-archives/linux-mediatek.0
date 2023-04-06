Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A67C76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2uCgX6sEmCBNBe9xi6iLO8ZFa4TFh6l4wvqAexbxFE=; b=1E4CRh1LQfPafVqfZfJUctca/3
	PsZRGkRILQcYwQzcCpVgmLtWfhUcsiUCNwfKtvsN9C5TCHsQ5XwtHd49pUn22mtuQpSn9Yj8i/qRc
	xRw2zDNMqRPRwKLxYqEfCTpQGfFY/IA0YZK1c42vjbD3j0bNnB/P+jgw8AwJHbmOF0vNykcORNTDh
	ssOy2z5UYKlkllZvg6+TZeQTS/GjEfCh54fmW77UxSVT5LZrW6j7tF5zacdSioBtHX1o3DoPgTAqx
	NWKJ2WU+r1jDAQwL6OnySlgygsVPnA9GJ4cLg1InUcDLy41NDbESmwuuioNuhSOCXyeCIf8+BCKkL
	BBfze1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPd6-007Ovd-2p;
	Thu, 06 Apr 2023 13:26:20 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPd3-007Ov9-2B;
	Thu, 06 Apr 2023 13:26:18 +0000
Received: by mail-ej1-x631.google.com with SMTP id 18so1379487ejo.13;
        Thu, 06 Apr 2023 06:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680787576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2uCgX6sEmCBNBe9xi6iLO8ZFa4TFh6l4wvqAexbxFE=;
        b=puXVNVU9EBdRRU51Tp3oaQEXxiY8mlkmJXepMcAeh/JUwxLDWNUB4XVSWBH4pcyQo0
         Kkr1n2cGfuFoWQn0z3QexCOAjuupo8Bo4UX1RNB28UzJhpND6D5BfiKg0kw2tA90Z0Rn
         MVrARvHfhExzCrcCSMmLuX/DjA7Nmx+4dC15pqGpLX50bYeORL52T2R3FEuwyQJSPR+6
         /O/Ki9h0tX4JsYxjcHB5CN8mzIfl8R1KcLq872ng+KG3A+sjP8wpuWD8e7Kqz8RUqVo2
         oeY5q5nyPxE/Vua8SnKydEMTQoxRJtKf0jV4h+OVAFeG75qWBuotR9+rCMvKaKmWUn6O
         wweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680787576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2uCgX6sEmCBNBe9xi6iLO8ZFa4TFh6l4wvqAexbxFE=;
        b=eFzFT5timdRdr84cQPq3ZnFbZ4svhi3k2kJhIz4On6FhvC7gzdOe4UBjeaMAOEGgOd
         aW5zWh6kY+lL3mlMABDPKwiQeEBvi+j00/4yw0JA+lVLX4ofRcthILe2+mW7wk+4SPnf
         nW8ZmXfPmHTXevtqW4LLMIjpdj4dgGtbMjtTYug2G3C0lzjF6S1TtB2m2gA94evLr7cN
         dL5yu9FgT1TKTaIXmzsGCSSk23WE+96dheieM9LUZmuH/k3QIJbYQAEZXM/XnaIT3e4r
         7zXzHrwS/0rg+BrUDzlrZoqiHKQFXyQKvPYPmvlXhXtD9MSqodY1DiqHgABhsU/0y0Dj
         Y/7A==
X-Gm-Message-State: AAQBX9c1PbEvC5dMFuqjdB/ebMu6rrBZ5bUYBIBEqi1lIgFAtlM+p/kL
	66VILojJoFbCdbZWfCeoNI8=
X-Google-Smtp-Source: AKy350aNioyvp7EHIOBjyxhYQsWZ0lS9rtfZyfNBOrNYZDg3XXXRkfQRb1puc/p3quUBiZA/VseVcQ==
X-Received: by 2002:a17:906:68c1:b0:947:fb7b:2fb5 with SMTP id y1-20020a17090668c100b00947fb7b2fb5mr6378488ejr.31.1680787575912;
        Thu, 06 Apr 2023 06:26:15 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kn3-20020a1709079b0300b008cecb8f374asm840524ejc.0.2023.04.06.06.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 06:26:15 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	linux-pwm@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND] dt-bindings: pwm: mediatek: add mediatek,mt7986 compatible
Date: Thu,  6 Apr 2023 15:26:14 +0200
Message-Id: <168078755179.1496271.10390223668553157368.b4-ty@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <Y+zfb2uQyKHng0kS@makrotopia.org>
References: <Y+zfb2uQyKHng0kS@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_062617_714252_339095D5 
X-CRM114-Status: UNSURE (   9.18  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 15 Feb 2023 13:34:39 +0000, Daniel Golle wrote:
> Since commit 241eab76657f ("pwm: mediatek: Add support for MT7986")
> support for the 2 PWM channels implemented in MediaTek MT7986 SoCs has
> been added. Also add the compatible string to dt-bindings now that
> they have been converted to YAML.
> 
> 

Applied, thanks!

[1/1] dt-bindings: pwm: mediatek: add mediatek,mt7986 compatible
      commit: 90cb764c3fafb80ac6b3efd99f8481226da40f60

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>

