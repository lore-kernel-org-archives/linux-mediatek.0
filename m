Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D83BFF885A
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+mNgWlyrL8XJotrTax0tHAhgn97GtRZawZOuedgrq/s=; b=sRLc1EPeQKgcU8mz1gRIZC/cwb
	a+PuWqSSu8CUg31nHmZBJtp+6f7xxWVM/xWPOeGD+DW8XP0C9aNLeo+OiIGls1rpZ3EOTFFk5gV9E
	ul1TiVw8wdMOWDVh3Imwh7ekyDMmZqMZJWcd/GTfr9tHQ1MAAJbpwE9GU9lUAsfpscYSQ7i0L61mk
	eKFStSzICnNatirQk+Zz6riQV5kDHDl+7qfXyElAdYLr4+dKntr8YjA0XcTm5kJLC4qVKCOhaPvnO
	OGpWlKlpRtI5MQ+zlPGUZ+EL3rOy/BfWwqvw3fr3ZKUQ6pPPF3QIv+vcIH8oW8NXSKTaC8IsAArEe
	2dQd4BqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDD7-0000000FvAi-2FOb;
	Tue, 05 May 2026 10:41:05 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDD5-0000000Fv9f-00mt
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:41:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2b9705613ddso29763225ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777977662; x=1778582462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mNgWlyrL8XJotrTax0tHAhgn97GtRZawZOuedgrq/s=;
        b=U9M5I6UojN1Jhj+Nc8VW8wVUxW4DwHd5vugMdSJ6F/kS0PAUEc1xUZ78J/AfdUD2YA
         OG9POeFEVZVYe20jVd9ZaXDfgOI1oNt4x9BnE1KRDaY94EEyA+mMqVcUIR6jCvOCof66
         UnpGGz2Gh3upaR6DNC65zNaV/uQIhhcLbfJa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777977662; x=1778582462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mNgWlyrL8XJotrTax0tHAhgn97GtRZawZOuedgrq/s=;
        b=Xby0kQ+xYye5AUmfRA9jRpD98O3ZFOavv9TQGNnw5J6wiRWrJymue7hjNSE5WVRZ6q
         +1v5b3xoWMVMcKLzG7rQREyFBRbv243Y1f0Y/rcQvzpWWZU+LV7IxG2V1NAflFXs3Th6
         9yuYlGuD8nZKtoly4torVnoq2W3f45PhtOIB6qC6MieI6W0U2EactUBhP3WtMZ7biaZ3
         6fd4vwPd+nkteGkAm0d/GnDtVK0SxGBCYbm3TuWM03HjQBEEe+11NdMSr7C0pmKN8/Ob
         4hDgXsSFeUEghePO6OcQro/j/WYwxvIiNH6067a2aPROr36SrEu6uHarcpyn3c5Teksi
         G1vA==
X-Forwarded-Encrypted: i=1; AFNElJ9azEg0sGz+HtdIEzUGkWaLUUHsslvt+9+vz770uEhLbFHU6XJMQvm7oDZvkTlUj/TixUJdeb8Y4LeLWdHy1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzD2BfC35xFVyfBkk3RTYJ3mApnfAeO9FSghFjpHpPFrcjxndd3
	L2EpmqOXuZSuFiHen8FG6vYPnvMHvmlghbn4G/2IyNdwnwqcmv6dkVn+nMFw8R8PzgqpVwRAxDp
	CMpI=
X-Gm-Gg: AeBDiesJqcPB5L1RtScH/A3hUmDRP57UT+Qd2QTwA/nAefuk8F028nW2CEfoeFFQBUY
	NmFhQ7LHQo5VZeQBJK6tP6bNy1Q/Gja8K/XCXYLvRA1MPbtFOOJUng9OMKcdQ7tWyJ9LFRKPKvI
	gCKVMl2Sm3oDovSBcyezQ+2L52+9aKU2/aMOVNRmdBZTIuxYFKl3+pJ80w9iLGXZ45kEzKhWtNM
	bPBc3vsj8pu3+ivNdV4S5/T3xWneEwWlsbjDGKPTgGaqIsy7BCeZhUgWanNiMyTI6APNyCOngYV
	nyUWE77JeuvQSwZ9ahdL4UZ9j5tSR4GN1slaYUC6uSagUEGSVfcAdjjRQ1GbZM0UqTQiudiFE6m
	1MIQ3TSgpgg7eBTKc703iGiTSMJlwH5vKPOMfAZYfDlVeHwOjbVIrPFt1jCpQXfXwEPx0zeDNlb
	HCe6g/2LSvbT+y4v/ENoPndqIGvoLf2Ff44w5Hh77Ny5OUswh2jHz6EjJWn31q6aR7ug64Wl61T
	M9R4Se3HQ0dP6eUmD4=
X-Received: by 2002:a17:903:3c66:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2b9f260d87bmr130052675ad.20.1777977662215;
        Tue, 05 May 2026 03:41:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae3b8e6sm126670035ad.65.2026.05.05.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:41:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: mediatek: common-v1: bypass pinctrl GPIO layer in set GPIO direction
Date: Tue,  5 May 2026 18:40:55 +0800
Message-ID: <20260505104056.1812343-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_034103_042136_933A2408 
X-CRM114-Status: GOOD (  16.07  )
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

pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
the pinctrl mutex. This causes a gpiochip operations to need to sleep.
Worse yet, the .can_sleep field in the gpiochip is not set. This causes
the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
whether it can use a spinlock or needs a mutex. In this case, it ends
up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
takes a mutex. This causes a huge warning.

Since the Mediatek hardware has separate clear/set registers, there is
no risk of clobbering other bits like with a read-modify-write pattern.
Also, once the GPIO function is selected / muxed in, further GPIO
operations do not involve pinctrl operations or state. The GPIO direction
and level values do not require toggling the pinmux or any other pin config
options.

Switch to directly calling mtk_pmx_gpio_set_direction() in the GPIO set
direction callbacks to avoid taking the pinctrl mutex. Drop the
.gpio_set_direction field in mtk_pmx_ops to signal we are no longer using
the pinctrl GPIO layer for setting the direction.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Only compile tested. Accidentally fixed the wrong file when my target
actually used pinctrl-paris.c

This was

    pinctrl: mediatek: common-v1: Directly modify registers to set GPIO direction

Changes since v1:
- Dropped .gpio_set_direction field in mtk_pmx_ops
- Fixed direction in mtk_gpio_direction_output()
- Updated commit subject and message
- Link to v1:
  https://lore.kernel.org/all/20260427061720.2393355-1-wenst@chromium.org/
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 3f518dce6d23..dd2c8aa03938 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -802,20 +802,27 @@ static const struct pinmux_ops mtk_pmx_ops = {
 	.get_function_name	= mtk_pmx_get_func_name,
 	.get_function_groups	= mtk_pmx_get_func_groups,
 	.set_mux		= mtk_pmx_set_mux,
-	.gpio_set_direction	= mtk_pmx_gpio_set_direction,
 	.gpio_request_enable	= mtk_pmx_gpio_request_enable,
 };
 
+static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+{
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
+
+	return mtk_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, true);
+}
+
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
+	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
 	int ret;
 
 	ret = mtk_gpio_set(chip, offset, value);
 	if (ret)
 		return ret;
 
-	return pinctrl_gpio_direction_output(chip, offset);
+	return mtk_pmx_gpio_set_direction(pctl->pctl_dev, NULL, offset, false);
 }
 
 static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
@@ -895,7 +902,7 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get_direction		= mtk_gpio_get_direction,
-	.direction_input	= pinctrl_gpio_direction_input,
+	.direction_input	= mtk_gpio_direction_input,
 	.direction_output	= mtk_gpio_direction_output,
 	.get			= mtk_gpio_get,
 	.set			= mtk_gpio_set,
-- 
2.54.0.545.g6539524ca2-goog


