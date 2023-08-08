Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57BDC001DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 13:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d/kMxPLtuYtfsGSJG2tOdeZ1yEQcKsWU7BmPk/CzUa0=; b=TKmg1gjcQwmYdu
	6YCFIDpj82dab5saMg6oVehyloEi+7HmfK0IU9DK274e5jYTmsXcPKyRm0qP0aucUs8HkVFktGeQG
	VjqByf5Y5dzPb592nfswkiPBi/X4z/eslxyybHk9MDUh2MW0t06hRrw5afkXoVCe7tlPdsG7omIiB
	+P0YZKjpRAvTjP1RhDhbGo0GcqGebkK/w0ffruSAtTzX0cyTz6u1BP9yAJ0PqDtLZduS3B/xg6F0h
	sHiJ8A6vQF5GbatqIA9OM+ZhEkAPIXIGzTrtHFqmRYsprLFkWNmIr1sEncTtHiQP//3VKTQcOqOUM
	gRH+n/8TE7tkJ25DRVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2p-002gZT-1a;
	Tue, 08 Aug 2023 13:46:43 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN2l-002gYy-2U
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Aug 2023 13:46:41 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9cdba1228so92011671fa.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Aug 2023 06:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691502398; x=1692107198;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d/kMxPLtuYtfsGSJG2tOdeZ1yEQcKsWU7BmPk/CzUa0=;
        b=oynh7AOOD7lXjMd6H1pfMXhotfeIBpAp1NbpuZKdnZmqlKStU3JuccQUAmWZRcLco2
         sglgaOl8kD96k7ErIFv3DELhpA2c1JFEgSVj7SlFmz/j4jUe3nfTovz4biFM7AyBtAqu
         AYpPRaNndD/Mz2KzSWMa87TU2Gv6xWWXuJMXWoPMEYI89EqUyQySZ30uFsw9MYdgMyZb
         VSoAuy2rJla9E7krBKi9PTm14JiZMlWfOyLwYA+beU98tWKuVaL08oODpDqUrLQdI42h
         mxbO+QtbjCs1gv+x0z5SOTGOwB/fhEzf1knLYTr/We8GJTyLfBfhn1dZoq9QP9LyScg/
         baPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691502398; x=1692107198;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/kMxPLtuYtfsGSJG2tOdeZ1yEQcKsWU7BmPk/CzUa0=;
        b=JftrCuypX7q+q3ed/VZ+VMIdRY8bqKrWvcQwpWin/6umbyUtiF/R1Ee6qjPtH661Vy
         Ve95jWhv95rg0M2LaOSc/3Ri1W6vtpLkfMeZlvUAyOCTjyVChxpGIdGwFoPp4fka86ug
         t8BHF1nz9c23DPFkoDFhNl/DzGqdfYRPQ6VjVtnwkgZ717MfKMv31/QvF/yzOadw8Lz0
         9KijUTX7dzRZf/rBjXCbbd/MilMH1avWHfXlD3hCaMQQb6ftUB3/FjWmuVLbD9duenAp
         h2OL39S/oq9UF3e2eGjHITTuQEYloU89l/ElEWSEvIUG2Mm6SEWitZII5JYSnbE060pp
         Bdqg==
X-Gm-Message-State: AOJu0YxgBpAUCSxNQRwNYuqwbUhbCvVGALk4286iafEOzJnRtPxrM8sE
	y64fIYdUyzIpQJ8JY2Go/H0bfQ==
X-Google-Smtp-Source: AGHT+IHWCMZNWUenzR2ow6DEw9qzbs1hN0zvPorE5eMO9zjCNiMy4ZjezjEMoOdrW0oJwauJJK4sjw==
X-Received: by 2002:a2e:9e0c:0:b0:2b9:a6a1:f12 with SMTP id e12-20020a2e9e0c000000b002b9a6a10f12mr8506359ljk.43.1691502397847;
        Tue, 08 Aug 2023 06:46:37 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/11] Regulator legacy GPIO header removal
Date: Tue, 08 Aug 2023 15:46:27 +0200
Message-Id: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADNH0mQC/3WNQQqDMBBFryKzbkqMtUpX3qO4iGaiA2Jkpg0tk
 rs3Fbrsbt7n/zc7CDKhwK3YgTGSUFgzlKcCxtmuEypymcFoU+lWN8qhjEzbI7Aoxum52HyqCl1
 jL8Y73RjI243R0+vw3vvMM0muvY83sfymP2P7xxhLpZXxvq4GfbVDbbuFVsvhHHiCPqX0AYvhI
 ou7AAAA
To: Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_064639_864019_782166AA 
X-CRM114-Status: UNSURE (   6.61  )
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

This removes some low hanging dangling <linux/gpio.h>
includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (11):
      regulator: tps65910: Drop useless header
      regulator: s2mpa01: Drop useless header
      regulator: rpi-panel-attiny: Drop useless header
      regulator: rk808: Drop useless headers
      regulator: rc5t583: Drop useless header
      regulator: mt6311: Drop useless header
      regulator: mcp16502: Drop useless header
      regulator: max20086: Drop useless header
      regulator: lp8755: Drop useless header
      regulator: bd71828: Drop useless header
      regulator: bd71815: Drop useless header

 drivers/regulator/bd71815-regulator.c          | 1 -
 drivers/regulator/bd71828-regulator.c          | 1 -
 drivers/regulator/lp8755.c                     | 1 -
 drivers/regulator/max20086-regulator.c         | 1 -
 drivers/regulator/mcp16502.c                   | 1 -
 drivers/regulator/mt6311-regulator.c           | 1 -
 drivers/regulator/rc5t583-regulator.c          | 1 -
 drivers/regulator/rk808-regulator.c            | 2 --
 drivers/regulator/rpi-panel-attiny-regulator.c | 1 -
 drivers/regulator/s2mpa01.c                    | 1 -
 drivers/regulator/tps65910-regulator.c         | 1 -
 11 files changed, 12 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230807-descriptors-regulator-3ed7a42fd072

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


