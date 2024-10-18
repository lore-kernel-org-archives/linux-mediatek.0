Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE76D2F7E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 08:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZjjRK96GfuXcw6nB88pboztj/XL99IucjnOaEslf5E=; b=ihjDVJlOd6Vk7bujZhlbCPKFS9
	0HG1XhJXxONWAY9Mp3XFE0CpPrc/eSTwhzDs5YKNf4eCTBK3KmNt5dU8/T352eemjW19TsHARy3u3
	fT/+xhIGcU2SufU3wXNsFYb9x61lkLsNuWedIknm8YJ23xaJwJh4rreYblKVSIAk1g37/h/Rmc1Rg
	RDZPmQ65WfLgHvL559AMkkGXiw7c6+3ygnGQ8cw1BVCgVKcFogI5vwpoyoAMMpgUp+vqzf2C25NQd
	A4W2ih6qCdDqwyg1QW+A6w8dJKWKva7zfUDAoS5HS0N2QUa+dyhw3hbnnNHeE8Oj1GK2BcBpLgW4B
	j2/O7Rug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1iJX-0000000HWfN-0uel;
	Fri, 18 Oct 2024 08:26:27 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1i5b-0000000HSX7-28pn;
	Fri, 18 Oct 2024 08:12:04 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539f58c68c5so2972144e87.3;
        Fri, 18 Oct 2024 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729239121; x=1729843921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZjjRK96GfuXcw6nB88pboztj/XL99IucjnOaEslf5E=;
        b=CErpwI1A+cS98eJHyHZ8yoOM4Q/QUZtIZ+IrOrxDxDTCfsB92NYkoApWSThprNXy09
         egk0S6lEPNwyrap5STDbp6jScRGmT3Gq1mgAGT2WiBtRnQr4eIOxc8OPQMYmgvg4Uy9d
         rgHxe7cwEzETTBFsPxTLQ8XNuIC2e7wOCvvT7EER6MKvvccXGQo9ND5FPXoLxNR46HXv
         qr0/fn9VHpojHyK6p6VT4KVf/B+5/lLYuE0RR2eOeeDU9MuqaCm720wV3EzQYUyuGhwH
         2ZraDJ8sIrZrgCQHDXbv7QM80xanewT9Vv9HBVzjJk2JKzek6bYTlgH/84WL+eg8TKZl
         tYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729239121; x=1729843921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZjjRK96GfuXcw6nB88pboztj/XL99IucjnOaEslf5E=;
        b=Ke6hoXh1SAj3zRW0oYdZGk1Accc2jeVCVY8jxQORrdL8JxBbfotreRTHhcY7usoTuM
         V6cQLXcMgUMrwK4Ewvo3u2dlla4ZptU+h/onz5IikSr+YLyDZ3QWDNqIT8hJaXtIED7p
         vdKvDpNrb64sapZfVMWVPgJAJdELtaug7RBc3PJ3WLD3GuDFtkaH8l6qcfIpyOcAR34w
         uIacJMd1GMKOr7Jusvbs3YZSUPn8XN92mL++75h79t2g2oOK9z7ubvLza0fr1QmLtwOg
         bgFC+CBjfYT4nf6uFHG20TZG5oQ2D59Rtf87Ma3MQyErueyTqbDvEnhhRPREt1H8WfNo
         7d8w==
X-Forwarded-Encrypted: i=1; AJvYcCVuyynw0YLHx6bhpwBvE044cBzpL3QciNkOX+RGxJzb21GHFvRWvi7PvSuZR23VrepuSW+wuKz7gJ72djqAhzg=@lists.infradead.org, AJvYcCXW6esg7dqIIPoINiY3ynf+icawNTSfvRIDwTC4ftwUr/VqSvgvGZh1F4+z+HVwGUDhikjuPkgSGHr3QFAJldO9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/bx9yN6GGPkzzwWqM9bS3EyIIrnoFpJw+vw8RLuqKo4lN8vwN
	OcGkYWEAwXlzPQMpcI44Xx/pYepaKXXa4TjppPmwA8ESPM9W0xFA
X-Google-Smtp-Source: AGHT+IHOZo2zIv5xORZ3TfFiF94d8rr6g6N8wyJA6Yi6pZbzCQ0+fj68XKKyXsG1c3g2+PrJqW4LIw==
X-Received: by 2002:a05:6512:39cb:b0:538:9e36:7b6a with SMTP id 2adb3069b0e04-53a15494e4emr1432817e87.32.1729239121034;
        Fri, 18 Oct 2024 01:12:01 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68a8e734sm61129666b.24.2024.10.18.01.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:12:00 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 6/6] Input: mtk-pmic-keys - Add support for MT6328
Date: Fri, 18 Oct 2024 11:10:48 +0300
Message-ID: <20241018081050.23592-7-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018081050.23592-1-y.oudjana@protonmail.com>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_011203_583777_EF073BC2 
X-CRM114-Status: GOOD (  12.15  )
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

Add a compatible string and related data for the PMIC keys on the
MT6328 PMIC.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 4364c3401ff1c..df1e4147e3365 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
+#include <linux/mfd/mt6328/registers.h>
 #include <linux/mfd/mt6331/registers.h>
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
@@ -78,6 +79,17 @@ static const struct mtk_pmic_regs mt6323_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6328_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6328_TOPSTATUS,
+		0x2, MT6328_INT_MISC_CON, 0x4, MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6328_TOPSTATUS,
+		0x4, MT6328_INT_MISC_CON, 0x2, MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6328_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6331_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6331_TOPSTATUS, 0x2,
@@ -287,6 +299,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
+	}, {
+		.compatible = "mediatek,mt6328-keys",
+		.data = &mt6328_regs,
 	}, {
 		.compatible = "mediatek,mt6331-keys",
 		.data = &mt6331_regs,
-- 
2.47.0


