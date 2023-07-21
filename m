Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1591C04A94
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ys0r8p0mIPfGi9bl8X8cEqDLnuWcCtUcJ0oWQjuIrRg=; b=42wftgFf7c2yD8OpXxkqYn/kZu
	wTsdGMx9/8adBm0A/x3IzZKN2EIh5i0RxOzNHFZOQsNlLH5uRSdwJ8r1oIqnOz0EuDPLcf2LUs+eX
	CS5C8QzJWSHpdiOIAwlAOlgtPkRBBsi3vNZLRLWN+ta0cbKPKv+9Vy7gKOJUg0K2r7p8F1peUHjhZ
	X9dGLMp6AYr6JCejSniXSVpRIYJ7L/BaN4TFT7Qobph8gAf0v0FVoqEHi5ddlQB4PeQTWe/pM0kCY
	HL5dc+tzlKNzebXfqH3CPR0CeO+Y+B7KgGwx8R1I9Uzi5ssIjBWe5GIY3Fnb6md+R0ZO2R7rAFPcF
	qXKGdXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlWB-00DNRB-2k;
	Fri, 21 Jul 2023 08:29:43 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlW6-00DNMd-3D
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 08:29:40 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-565f8e359b8so1064408eaf.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 01:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689928177; x=1690532977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ys0r8p0mIPfGi9bl8X8cEqDLnuWcCtUcJ0oWQjuIrRg=;
        b=R2Pp3kKpVj6sAFx6xXNWhKBZBscxIoXFlJ5qMG80IECImLIMRw9ruyOpTIBfij0pIj
         A+9HdOXQ7cRKOYB4Tjm7VwuwaHWInEF/kOpXY7aykZVnykUO3zfKpqwYREzwP9WuJxxJ
         MEldT5QFe8N5vSwJbNaMRywFbmFxvHhfDLVr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689928177; x=1690532977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ys0r8p0mIPfGi9bl8X8cEqDLnuWcCtUcJ0oWQjuIrRg=;
        b=eQnl3Pg1Dy3TIoun6PaTsKW8Hj0GbmVz+OMk+vuCpU37FdPMF7N7La1E5GlRRtJM27
         nvXZEWUI3MofrpY4Xb6Lzk74KjMu9eyc0SpuVtT3I8by0nDeBuCLgdkV7treWYZTt9xo
         8zNLqcBpU07sqcQe/sm6Jew5BZh+726tIWZCPW0M2TWRTR55rmtIiWPhvBV7qvC8ivca
         MDRLQ+xIJ9spz+ZUy3GaLB342d7h2HkxGKsgQFhlvt7SqxlLjhlYj2kyx+6jMfGLzsyW
         hgA4nDA8S6LFZ7Wvj58C2Vjk6cxsmQBcwIvweTiIlgdfKZhYT8EvErXa5/kz6mfNCn3v
         5o0w==
X-Gm-Message-State: ABy/qLZls89eblPRciptdzrmZVrgMjPk3dZAYmCg/yByTYdYdMc887tu
	cwky/Lx7C21MpCDVLYmzNpTCTg==
X-Google-Smtp-Source: APBJJlH4zr16V8/zoAw9LSHLzoGP6ZJ04FLTsy+Rw6XaPcaQHV7bk9/6klOg9xRA3fzhtSjy6Vugzw==
X-Received: by 2002:a05:6358:27a8:b0:135:6d9:2399 with SMTP id l40-20020a05635827a800b0013506d92399mr1442813rwb.30.1689928177700;
        Fri, 21 Jul 2023 01:29:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6d86:d21:714:abab])
        by smtp.gmail.com with ESMTPSA id d26-20020a63991a000000b0055fe64fd3f4sm2594382pge.9.2023.07.21.01.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:29:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 4/7] regulator: mt6358: Fail probe on unknown chip ID
Date: Fri, 21 Jul 2023 16:28:56 +0800
Message-ID: <20230721082903.2038975-5-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230721082903.2038975-1-wenst@chromium.org>
References: <20230721082903.2038975-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_012939_035507_C8D75713 
X-CRM114-Status: GOOD (  17.50  )
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

The MT6358 and MT6366 PMICs, and likely many others from MediaTek, have
a chip ID register, making the chip semi-discoverable.

The driver currently supports two PMICs and expects to be probed on one
or the other. It does not account for incorrect mfd driver entries or
device trees. While these should not happen, if they do, it could be
catastrophic for the device. The driver should be sure the hardware is
what it expects.

Make the driver fail to probe if the chip ID presented is not a known
one.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: f0e3c6261af1 ("regulator: mt6366: Add support for MT6366 regulator")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6358-regulator.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index b9cda2210c33..a1eae45f5fee 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -676,12 +676,18 @@ static int mt6358_regulator_probe(struct platform_device *pdev)
 	const struct mt6358_regulator_info *mt6358_info;
 	int i, max_regulator, ret;
 
-	if (mt6397->chip_id == MT6366_CHIP_ID) {
-		max_regulator = MT6366_MAX_REGULATOR;
-		mt6358_info = mt6366_regulators;
-	} else {
+	switch (mt6397->chip_id) {
+	case MT6358_CHIP_ID:
 		max_regulator = MT6358_MAX_REGULATOR;
 		mt6358_info = mt6358_regulators;
+		break;
+	case MT6366_CHIP_ID:
+		max_regulator = MT6366_MAX_REGULATOR;
+		mt6358_info = mt6366_regulators;
+		break;
+	default:
+		dev_err(&pdev->dev, "unsupported chip ID: %d\n", mt6397->chip_id);
+		return -EINVAL;
 	}
 
 	ret = mt6358_sync_vcn33_setting(&pdev->dev);
-- 
2.41.0.487.g6d72f3e995-goog


