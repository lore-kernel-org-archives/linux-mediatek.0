Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D5AC7EE2F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 09:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYOWcd2IcetwoVsS4nntw9yoShUHzHzbCdiQYPACYvQ=; b=DIx14Y9lqCHNJe4SG+TNGIliv5
	WwAMlxJEgRl+KIUf6dy9d6tQUwTUcINak2jsvzOLgZL39G1ooujgZTSm/T4kBEnkeHAcgTas75NMf
	lCj8r3z1N+d3nMgvgZJ5lXQWArIvIeHxOS054AtxGHMwqxXMCdC1uh69Bg7t7VyK6PZ65rONQYfbg
	uSglIHyptFmLtqnJ9s8S8yaz+Hs6c2nHUNPTYZqBIDZeTsskFnUeUXEGqfCm8PRR+RutseIkhYBk3
	YcnwCUPGdaEzujQcSDzKJnqWt1aXD6iaiS6cBQJy1PeCfrCn+7STYJz1fq1XaTe0T/CyLPUACesUm
	SiKeqFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q27NT-00G9fd-10;
	Thu, 25 May 2023 09:35:23 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q26Q2-00G0NW-1c
	for linux-mediatek@lists.infradead.org;
	Thu, 25 May 2023 08:33:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30a95ec7744so1767792f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 25 May 2023 01:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685003634; x=1687595634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYOWcd2IcetwoVsS4nntw9yoShUHzHzbCdiQYPACYvQ=;
        b=eftV4gtcSYARUqlFtsn4ljUnFYv3T8UTXV/aDdPvA+L6DwHFRZQyFfnlc/dFvSbYxF
         GhTSOTNvMoBUt3XvdUgEoJelWAdOix5O7ZAuExkMvhz7kFNi2J0+jd3XUkirrA0rxbf4
         UWDurJFyvmawdR/1DbvGG4qaq7/b678OkY2ixXfM5miqoDlQyo6HAHnXNV98CSHW/qUI
         6a3Jzm6Ok94YnbGiBkSbjUxHZx53sP1lwwxEfUVWUQjwYya+JaJY2ub0icSDyytjYNuD
         wVeZY7zLFJvtZHz5udGWyLb576QwY0ekOnIsxGwD4b0KU4NHCB3h92gLHE8stPEWFq+U
         0yXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003634; x=1687595634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYOWcd2IcetwoVsS4nntw9yoShUHzHzbCdiQYPACYvQ=;
        b=mD9Pdwueq4WMSp7NXBtng3fh/UMZx4RIyYEzaNz8PpH3d8Iybp3H/BkP9BZZoMZ4qz
         fosYBn2sIrqcZbhkOq6o2D/ChqhSu9nhKgt3OsSo8gonxVhZ9KijzCC+j9DGCdFJ8acA
         VarNjCp5pU/e+8h9/GCcEzXy+A6VGhk9JAiZgFN+8bZgFG8ef6ZYYYx/qMLBMAfnxseA
         SOcps9t20fAklJR9f7tS20N/hc1/ua/NDeSHf5FehM0oN4wtxOptCk202+xig09w4rFm
         p1QmizRLTMPNuQJ/uLO3RKt9jLdN28Slr8MZp6lSG/caE+QXpcUXFqDOIopQ5A8U15bz
         L5Zw==
X-Gm-Message-State: AC+VfDxEBy9cSQpGh7mF0mwrWCiYuNAvHlG9g6x2vyhyS1YkOQktcI6F
	V73ueief1tycXF8U+QvW98QL+w==
X-Google-Smtp-Source: ACHHUZ5bw3W4ft6+BDmBbOM2v/LDguqVSUO8lTNgiBRlWmWHzJKHOEUjQ921LscmcUFb0h3MjlNxmw==
X-Received: by 2002:a5d:6a90:0:b0:2f9:61b5:7796 with SMTP id s16-20020a5d6a90000000b002f961b57796mr1967724wru.29.1685003634518;
        Thu, 25 May 2023 01:33:54 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o3-20020a5d6843000000b003095a329e90sm945809wrw.97.2023.05.25.01.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:33:53 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 25 May 2023 10:33:10 +0200
Subject: [PATCH v8 01/10] arm64: defconfig: enable MT6357 regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v8-1-7019f3fd0adf@baylibre.com>
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=793; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=WTUqVHBR4HvQxOd4r/5AfIRd2ez+/KjC4aOa4tZxgIk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkbx1vfSiKtJv8aAT4IOZB7Xz43lWuQgoRCFuoC3/v
 0aNnrHmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZG8dbwAKCRArRkmdfjHURRAtEA
 C+Il5XUr1nBN5757SDW91yT55UdcKbq8nqrRwSxq7ytwJdRUxhm1slyroZBqq48WQQe4D3KIi6mA1p
 zNpyVVQLjZrZd4xQYncj5GgFQv4S6Tskc41gtVY354CqS5rqqqTYhvyuVeBKol3DFDYWvMPdH7LlLf
 lSbfVtLyqqwh9z8x48dXNtze3WOzDtgBuKwaICwEmTSIQe76pdU+ByiUJq3YgE04WOLBEQSnrdfUMH
 PtkE2ocy9gtv0FswLjQyjgWGgwXaC9ROdATOrpEkbnAhFAevGCQbiU30/jYN3N7gWOV7NBWel1xpHD
 XgOTBHbwYedJuCUxxPjEHNkupqWfbErhjDZzHbKub/pRW+v9+0TxXqbnI/kiuMK6OA3/NHag207Bpf
 ZWd6Egq0PqDrr2oRuHDv60AATm+t6iYKuUMb3NEXAkYGWMd5vOBTkOdAdZK5HnIMH4oCaNqSHST2q1
 cSBE7ZpyNDpvwcA4Qr4CdVgn4eiqbABOjyrVuB0bmqdhCL5AEmI84DeI/QJWMMZ5X1bKLKeEi+vFRa
 qhXMaDOJ+JhMb2LmOuZUvwf3585zfHNyyVvTrS5xLbIPalOMMqTIZPGHCDlI0frge3McO7DEf4IoaR
 3esu0i3iVMlAlNSJ8pv5r791MpK2I/3++4doJNxCsdcefHpy3/XZA9B4q88w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_013358_538064_6E49FA8E 
X-CRM114-Status: UNSURE (   9.40  )
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

Enable the power regulator support of MediaTek MT6357 PMIC. This driver
supports the control of different power rails of device through
regulator interface.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a24609e14d50..ed3fca298314 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -708,6 +708,7 @@ CONFIG_REGULATOR_MAX77620=y
 CONFIG_REGULATOR_MAX8973=y
 CONFIG_REGULATOR_MP8859=y
 CONFIG_REGULATOR_MT6315=m
+CONFIG_REGULATOR_MT6357=y
 CONFIG_REGULATOR_MT6358=y
 CONFIG_REGULATOR_MT6359=y
 CONFIG_REGULATOR_MT6360=y

-- 
2.25.1


