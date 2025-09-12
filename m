Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644B4CA101F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 07:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5K1W1vf8Z5GhVp1uTmKWJ/JLDCzOhXuDobj39bYgkVc=; b=d0HmIaw4OVv25t0VxdnsmlmPeH
	8AtrqSeXrxDuj1aYYZE0tooTfbF+OYxm5vSdHoJWHCKmAj2Ajct98q6kcykqbvWlQdv1TwE8T+7SC
	EI0/mHFHjw5S+tAm5WM2RrEjlVV0qW5T2d+iOCc8Oq6ZI1fmcm6ZWYBtV+vMlN0P0R/pCmpP7KBet
	oRYB7vbKIA93BNDLw5TpSKVdcjblSCujR8biZdtRd9N7QfCqtvTfVAVCiHtyZrE5BidlSK3B7/LzI
	VIxbjqRJh4lrf2GFpbdQVq5ZgSlB3rm5oYXa35YqmDZ2G2/pRmfkhiV/Si8eOihA8Y0Dfx1sD5oBO
	cKC8J/Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyBc-00000007dzq-0Rsi;
	Fri, 12 Sep 2025 07:27:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyBW-00000007duY-2ECv
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 07:27:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45dde353b47so9509575e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 00:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757662025; x=1758266825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5K1W1vf8Z5GhVp1uTmKWJ/JLDCzOhXuDobj39bYgkVc=;
        b=TfkQsQ13zwnDoYxLuRubLxhStXjc622WLveKeRs8/F8khRlXlWp1HKfHD8e3FrFUU9
         5hriAf5yDIaQkXsAJev0/oo0+2Z4KwsSVYbbOLws+tGXQMzmVUM+he9/Yu8nmZGGr4VA
         aTiI6IGVYZekN9QBZRDqVhATLVcg2kRNZ8Rf/T9kDphIgMQCoHjc+0MGvKoe4wBJGAwk
         9bmcugCSsgfMRrbxiEA+faYF1tXEDQYst3PawqaK1Zf81LJdMdOZcZVAlFy+EbHHsW79
         xvsQUm/y+iObIPxeId+bCZ4KHJMdL0I118n0S80YmimjcQts+08Q5cw0mMZ1XKfJdYha
         bT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662025; x=1758266825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5K1W1vf8Z5GhVp1uTmKWJ/JLDCzOhXuDobj39bYgkVc=;
        b=gRg6CfER7e5KkxM9qVx8hNULHOr4hDr1LFK1dLHBP4Ssxgy3NQW9A220FoWeCfQBKo
         sPLl4tF8naLdDF/ZDc82T2UWHXZXsvgMvvIQUmOHXV2WQBNvpYsQDTnyY7t2t40WG9JO
         2x5YM7qqM6PmJX4Xn4eAAQ9mxUZHPyHkM7hc3zePBxYm1C2s/t/EBH2Xsx2gjB8NkaqU
         m1g67vNXpKUL8n7aeSkiN46J93SYu2CFFuGJUfBE0z4ssensLNtLSiuLAafyq3zv5i0B
         MRl+iOWQvxg9HIf8tnwxtltLnwEnsLgviWLunJ98KC4HItxsuxBh4PKAaceubDPxL8j2
         TMSA==
X-Forwarded-Encrypted: i=1; AJvYcCVqgz8+Ur3IsuARpseOB/sSivabZlqlFcNGQZOpU/pUgSksO46JMfNjtUSFerXy+DxKOW3IhlKbHRkrVx5YTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkjC+W2Q46BT65rLabP+at+s5qXjv6+c8LgUy5tGdagELuZ9ws
	z3yT5Y70rbaTmP3xpEQEVUVqF9WYS90yG9j8Erw3zJt3KborBDO2yAntBvXrWKk+d4A=
X-Gm-Gg: ASbGnctHvzhWX+63sHhzC5PdlrKzLSNE6xZGBFOLAxlbxiAE0HT7sLjLG5l+zixYnOK
	q0LVQYoYbNM7EOwR96U3Q3eGgwSiIpV7ZenMn00d+EY+fvC1e3Xd+QeyHRr44LOM1C0H/jjkNDP
	UeiJpZkNMqvvgGU5cNnH3aiI9Uk/5hgt3H7Ho0HbPg3rbJWEXxIhqqymqnsuPbKh9AhAu+Zx7RB
	hSxfgWmug8T2ME5QNcX1f/IESklt9bN+u3/JhJjFGKdvtzt8diL75Si0Mm3qkpK4O3yB1n6Z56D
	3YInev6Jrf1T/8qX0TD+cebR/rPCrt+zQSTxsZyvplBy/yaiE3kmX60mX+7LJvSTuceO5gStvD7
	SUzQDXrCGVcg4JGv2axv0atM=
X-Google-Smtp-Source: AGHT+IHnJFZvdCCeCxhMw56xuAjolN8GpBM01BpNCjssGvJ1wLlPBDHBDYHA0TwsVBlYSdL7Ex3cDw==
X-Received: by 2002:a05:600c:8486:b0:456:18cf:66b5 with SMTP id 5b1f17b1804b1-45f211f7aaamr15546025e9.22.1757662024343;
        Fri, 12 Sep 2025 00:27:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b6ab:4211:ebab:762])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e774a3fb5bsm730202f8f.58.2025.09.12.00.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:27:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its modernized alternative - part 4
Date: Fri, 12 Sep 2025 09:26:56 +0200
Message-ID: <175766186360.9646.5204996164911945151.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_002706_609770_D63F7F49 
X-CRM114-Status: GOOD (  14.36  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 10 Sep 2025 09:12:36 +0200, Bartosz Golaszewski wrote:
> Here's the final part of the generic GPIO chip conversions. Once all the
> existing users are switched to the new API, the final patch in the
> series removes bgpio_init(), moves the gpio-mmio fields out of struct
> gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
> the new situation.
> 
> Down the line we could probably improve gpio-mmio.c by using lock guards
> and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" or
> something similar but this series is already big as is so I'm leaving
> that for the future.
> 
> [...]

Let's allow it to cook in next for some time.

[01/15] gpio: loongson1: allow building the module with COMPILE_TEST enabled
        https://git.kernel.org/brgl/linux/c/80d7319c7a2a9865dc730422ec7227bfcc92e6bb
[02/15] gpio: loongson1: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/116eadc92b4c47277d660271eac1efd4afd33121
[03/15] gpio: hlwd: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/43dffacf6be98fb31aa7790d693adc29276461f0
[04/15] gpio: ath79: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/551a097118391018ddc4079cbcec6fe4e7d64bc5
[05/15] gpio: ath79: use the generic GPIO chip lock for IRQ handling
        https://git.kernel.org/brgl/linux/c/e7a3a1be11d7e786924ed7af3b3411def2e46f21
[06/15] gpio: xgene-sb: use generic GPIO chip register read and write APIs
        https://git.kernel.org/brgl/linux/c/36f30f7ffc4b98dbd49deec8599cf810e7006cdf
[07/15] gpio: brcmstb: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/e8bd2a6a5059043a9f13a0723acd48c1291a55ff
[08/15] gpio: mt7621: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/80fd7e96d669d729d9e01bfa3e2b60ea6b500e20
[09/15] gpio: mt7621: use the generic GPIO chip lock for IRQ handling
        https://git.kernel.org/brgl/linux/c/2c1f22fa54fcbf8fbd9c03f5d341c73ef36c6d27
[10/15] gpio: menz127: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/b24489af4500720d8ad57c55111d90e762133c50
[11/15] gpio: sifive: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/8e1c8ccc1df8b802a7a1b4beadbd8b87fff1c3b3
[12/15] gpio: spacemit-k1: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/063411108de622a26b36487a711903443b0e864b
[13/15] gpio: sodaville: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/ae9a52990b2cd62e0555adad92d8fe9e431d1bac
[14/15] gpio: mmio: use new generic GPIO chip API
        https://git.kernel.org/brgl/linux/c/e43e94fa19cf058c4e465fcdbc2f521123058ea6
[15/15] gpio: move gpio-mmio-specific fields out of struct gpio_chip
        https://git.kernel.org/brgl/linux/c/9b90afa6d613b66ec4e74ae75f9bfa5baf386ecd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

