Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEB9CD8CB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g48rDzZBVCGDCg/97G6a3N/2kOm+y9KrRj3TLV6zvrU=; b=4DZPXo3F9739zC+4ityZNQX9jg
	m9sikCdX1XE0EzvmcmxmZDyeTR4CNMO2MTGeiaVrzGQs4DKrDpXihHEsmJB+IgjiuIaprKMXNBmYI
	ayOsWZy9/ZTg0AJUE52wCRYp3nmJcOopfGXlecfcHvU//PISUc86qOcQJ0vTQDJtm3iOc0gcurhba
	N4kg4cfS7vELZSEXihZ5/AQSvOKs2/+J6il41rFgcWfdW/VcBmvhwLbmHeXFYOQJTThvhVDPNL6iQ
	CX+J+xDT0LTxf8eGfIHD3TLFlneCMnTOn/T7RTPgZXW09X6HmTC9CoUqaDYw8oR2dPC0+iSGjUfoE
	DpVwTzyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3V-00000007N5e-0bvo;
	Wed, 10 Jun 2026 10:21:05 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3S-00000007N1v-19pN
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 10:21:03 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso63498825ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 03:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086861; x=1781691661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g48rDzZBVCGDCg/97G6a3N/2kOm+y9KrRj3TLV6zvrU=;
        b=CwpjbXsW2dcI74+KTHElnzcIq9zeReJSiq36jTLdhNtIb2NBUgktGpY+R3/Zm3UqkH
         RtRqQvRmPKO06A+7QX/BfKOI4mJRCeFU9ys+jcIBAANENtAWoaiGw6rDR9d+CvZXVIdY
         dQg1i3sWykdiTZsiNL0SQE2CbTKCx0GQIUQyoAgvoiktAz4AkpgLLiGaDgYMm5dtVu1L
         fXX5hZRT/8HJfOHNFYldAo2KeJJc5sFXI+zFhKLIP4eu0NebsgE50YI3vSMiX3Ibi7Rb
         qy/Ua33Jq25a843YueL3BJxhg/Pf+oeB20megzQsngdLOEYdWGjTl1GyOC50FBIG9+GI
         pv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086861; x=1781691661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g48rDzZBVCGDCg/97G6a3N/2kOm+y9KrRj3TLV6zvrU=;
        b=ncdJpDQiiZHn7V0vcysKe9JSDM/yrTHVGmsNPx8SP9HQCmVpBteXbwb8tiXl4ItLrI
         G/vuauzSf6DOwoTK+XBHT8v8nZctp0ufvyliszzH/RFaLF+bBvdXFiHoCHOW1xbyIJMo
         3VZuHgeiT0toHxlyh3QwrSv/3YovTvscB58NW1aJ7UfGI+3D7spLx/T4CqCbDvdHL58L
         0/1G0+2Up8wVXvrLlNqLD0XpriEiyXwWIQHxvqrYjQY/wbjdsUaWvlGkJVWx16/fmNAV
         RUN4LpkG811MAHEzbhwesRWBlr3cAFu/bQ2GJ2Or4xIsYFqDc3EygPPThUg0uWHWB/bC
         I4Nw==
X-Forwarded-Encrypted: i=1; AFNElJ9zy/++bH5n9VY8f4UjaEiIW7nLS/6MOO6hMjvtbEK8BUZrheQtDi1kj0OEtLpQwWRmN23Npj/gJtvYE7Svvg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz58FI6BIrP4uWQSsEt4IlJ2r4ixPo/gxHWbSvvVre8sewDDYZr
	ccjXrPmVdWY1StiOa0zcCU18B1bdkLCKrAZEeznM+ax+91kNK5P2o59N
X-Gm-Gg: Acq92OF2Ntknfhn/3Mlaq3zFzak01K6PiBCe3eRlbw1xMyxzAVpv+j/yMYsCg63ZFor
	fyWY0vixAbZgaFN+tKTlbh6miHIz9Yc4A2EQimrVV8oQhWutjgYzRGC7L22/N7L1bmSHnns5KgQ
	yGxDut58MpXWRjwvryqw/lRCUTgEbnA7zDzy7X+dPm6PQl2cNYLl2qjivSzw+fksUtGQ85p+ge1
	W7hRxv8cq6TpWN5ww1vmaV3KsWm3nAOpiWKgKcT2r+p2+EPZBtPFV8mGz+qiIlcF9Bey9I9w909
	NBMCmSdFpy60CR6Tc7YvQfvS4MnKWzq0P1YqPL7hHcGLUV97+LDqfpzU8grEV2f7vTLf461o3w6
	KMkimMOHYdrMCXOTN0tYeKtiaM4kWC/G+QL7lOT9OXRBgiXkptSszLIh9Qw5wM7rE9ckAuVQnOW
	AGW61j3OdJc4Fk2LgNKah4K/9OErGfZo4Eix0EwxEZEn30RpWYQxCwvN2/eImJcNTy7cyQDNYs7
	AzLiqI=
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr310019635ad.1.1781086861478;
        Wed, 10 Jun 2026 03:21:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/10] ASoC: mediatek: mt8192: mt8192-afe-gpio: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:20:16 +0700
Message-ID: <20260610102021.83273-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032102_320793_163B42C1 
X-CRM114-Status: GOOD (  10.41  )
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

Convert the explicit mutex_lock()/mutex_unlock() pair to guard(mutex)
to simplify the locking logic and automatically release the mutex on
all exit paths.

This changes the mutex release point from immediately before dev_warn()
to automatic cleanup at scope exit. However, the affected path only emits
a warning and immediately returns -EINVAL, without any further processing.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index de5e1deaa167..b993ca2dbd7c 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -208,7 +208,7 @@ static int mt8192_afe_gpio_adda_ch34_ul(struct device *dev, bool enable)
 int mt8192_afe_gpio_request(struct device *dev, bool enable,
 			    int dai, int uplink)
 {
-	mutex_lock(&gpio_request_mutex);
+	guard(mutex)(&gpio_request_mutex);
 	switch (dai) {
 	case MT8192_DAI_ADDA:
 		if (uplink)
@@ -296,11 +296,9 @@ int mt8192_afe_gpio_request(struct device *dev, bool enable,
 		}
 		break;
 	default:
-		mutex_unlock(&gpio_request_mutex);
 		dev_warn(dev, "%s(), invalid dai %d\n", __func__, dai);
 		return -EINVAL;
 	}
-	mutex_unlock(&gpio_request_mutex);
 
 	return 0;
 }
-- 
2.43.0


