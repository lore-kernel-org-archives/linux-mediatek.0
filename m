Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584AAC61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=; b=z8MSx1etuuei2qukw58sc8PpZg
	qYMCJAaEFEx8AVLBa+xOCGUqI+IIvUzlhvRVxy2LnTR/XqfT0KCY6xD35YZNQU27+gPx3J3AqBMRX
	ehLSLf2j3o6tTbDrAgkaO1YuWVwBmeLLw8F6I+mQbFq7TpQAL1Za3tOrP2WmSdXW9H0sHdS+vRX3q
	bFIZfiR8PENDo0h9uLuJfQry3jup7p4zz9gLZ3AVW41dyy4+2GxXjr7+jvd/AloaBnuFzd/AqaE/Q
	kV84CwhTCPM20EOcZrx6ZpsRA3K5k2WTGL+4oDcduGRk3g1pOIIPkYk55b1LVC8AW9JP1EjtZv3gp
	QWovuxlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkc-0000000GN99-0inE;
	Thu, 03 Sep 2026 05:12:38 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkZ-0000000GN5R-3NRv
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:37 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso1530176a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 22:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412355; x=1789017155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=D9PdX+ECuxvOaJ5tK0BWQ3u9j+B951txc2iGJT7lEhDlJ2VstdZnwvlkH6XqtXiLO8
         /YMhYoj8lFz+3Q6WR+wO0/fUqxt1D6Qoa7EBevvcQw2w2JmcjxeXNY3TDK07apVc8x1c
         sVjvR6iinq/3U5Fc2mYPatPqMRSvp0ztoDnXtRZyKTFn5vDbr73MUId9T/nWkCDUwGXD
         yEJS9BwAqBMkQX1BlgZGsgHrw8cGcOX1UU/K8KP1fCPt/QcjlTmOGdjZ8cApAe2ffqHM
         LS/z7Ujzy7YbSuxImMKMmDhu5KPVNSGSl1QasY0SWw0jCEp1A3EfdHeyJGjYkcl+kr3H
         cv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412355; x=1789017155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=VAe+A3h/kcCAzKG1yOxCxrfNgbDQuCRYzd+ALbZmlB0OV6LUkfuznaYRvqA2d26hWQ
         PN2sQLePiWwUFIfZq4R+45kiK+8KI3JGjNa2b39X9i41FBPttt3Q+VLPiWbJXl+3Qxr9
         92lyVVkHG9F8SsgMgPHtA0WQmFYmaWCePda8CieWuxsjcD8+zBwQsEbRB2yAIs16f52k
         IDZc9NilXOIMwN11YuMb2G9XF2KaZ+/6G7FcOCE0qj87VfZUWmIDrJOZ29hAxAjE4a0C
         S+pmcf+ZwvQAI2y1U4JtXqTpZG129LSs7nn1OSrtw/UQZjnZqvAcRGgy4d2SF3ehtuyR
         cfWg==
X-Forwarded-Encrypted: i=1; AKwUvBws+txEoImIJtOlBN1UQnRITtFfZNTny7lBHStF60YgFTOtE2GuCSmHV0JbMMtNhsOIjy8YRZ/VlMAMlFwc3w==@lists.infradead.org
X-Gm-Message-State: AFuF++mayAlzoTyemi2l9yZcQoSOhffAWObBnLRnyACktaNvTgw4Cdq2
	LTAEVO9uoykO97RYCdduqaJOOVxlWvuFwsrWw6ILFeLoi9xmRuyd4Fej
X-Gm-Gg: AYBFou0Ca56hJ54cQf8imEPLrBou2uKPF5CVTpkRaRSagR4/8sqR/mkxNusX9Xth2st
	jSdyrTd+WDF9ykJ3f+AcdHbYRg95tLBHbT7Rb8JqmJPzB69tDz7qNZRS335STfC3u6PdMhj6ulu
	ahB7F7xT6wtq7lee82TIVP9Uv9TQ5Lzt4nlnsfI7pNnLw4EcIIM8RwKUqJpHh3GH6dfOqcKXST0
	F6fiLVFit0YT6h3/NGu7zGlo/ye9yWEanoydhYcVWQiFolwcJEvji/dFtuFM/oQOGHdAYr12dKC
	2I44CSNFD8AfPc3deCQagi+9IluDEYJM6A3A/sNC6CueQ9dhftsayIuZ6xBZw/uKDwTT2zaRDKC
	adbmHcpU0uVjL7+nLKDfzKx0nGasvXln6L+njeIP/xZB6OB/NMleh7cZVwBfy91V9nAQz2j3bT/
	ZCbASPP1pGCkjyfh93Op69WK8VyQfG2HNz0IbrRy5cvOBRZGeFYqLQ2kK7YyO1fGy1PR2b8Gity
	Xp9nq+Apz1m6K/ZiAMrAB8eJXN4wi5bnt3gyolkLkt+LhiNjLmHlgIQ+OOhig54r/ZgV0nUe72B
	OfN6
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr14551384a91.3.1788412355201;
        Wed, 02 Sep 2026 22:12:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 6/8] ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial failure
Date: Thu,  3 Sep 2026 12:11:48 +0700
Message-ID: <20260903051150.178057-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221236_206772_A2DEC4EF 
X-CRM114-Status: UNSURE (   9.84  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

If the second mt8186_afe_gpio_select() call in adda_dl()/adda_ul() fails,
the first one's state is left applied, leaving CLK/DAT in an inconsistent
state. Roll back the first select on failure.

Also fix a copy-pasted "CLK ON" debug message that should say "CLK OFF"
in the _dl disable path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index aced8e7e920c..1cff2a63ef37 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -143,6 +143,7 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 		if (ret) {
 			dev_dbg(dev, "%s(), MOSI DAT ON select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 			return ret;
 		}
 	} else {
@@ -154,7 +155,8 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 		if (ret) {
-			dev_dbg(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MOSI CLK OFF select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 			return ret;
 		}
 	}
@@ -176,6 +178,7 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 		if (ret) {
 			dev_dbg(dev, "%s(), MISO DAT ON select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 			return ret;
 		}
 	} else {
@@ -188,6 +191,7 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 		if (ret) {
 			dev_dbg(dev, "%s(), MISO CLK OFF select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 			return ret;
 		}
 	}
-- 
2.43.0


