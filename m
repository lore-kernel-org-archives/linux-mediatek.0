Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB37EDE998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=As6Mh+lzj3Gz1WRcYQZrDI90Xpd0PmMaVKgj6FhuHj4=; b=30kz+NTwhhDxFzgq2wo3MWhb+Y
	v0rI4prCSnrbqllloQlQQwz9+ADku7UpKWsgILeadU12G+pHBxVbN2EHloslgfUBauUh5wg/5fmwa
	PVpWlLk2ZMql8RVufYNzTjx3nXDvkWw5PsM7oKbovw6XlxyUgmMhyevw2+knY3GX5ccw7QxADiI4K
	SnXQ859gwpETbkEWfVqMaCI+8J+J3mjxY0Hk7BNv+IxaBm6qLi26DQwq28Cre61d32mMYbUF6y1bs
	oRWFAIJYDWGqiIVlFSJeuqv5ylpOZ5it48nIm1J4P/Am3VVxFyRnDqoiGBeWAGxJ3F1sGUJtAqfv7
	fY4saoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soI3u-00000008VYo-42gi;
	Wed, 11 Sep 2024 07:46:50 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soI0K-00000008UqE-3a3S
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 07:43:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso20565545e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726040587; x=1726645387; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=As6Mh+lzj3Gz1WRcYQZrDI90Xpd0PmMaVKgj6FhuHj4=;
        b=xY/TZAZbQbUlGGUEMPvPVo/BMkatTnzdTFyHfECJspEDrJv8bCfhKsj01KjVToDptl
         uOi8jB8m0d1xPcNXUUZ+8wKpPrTDDwm724I3FCpKndRRxQSJgxvBCLCh67dylxBoZv7w
         /3iC7xacGYWkSTZszyleniCUiTkaVvMJDwU20R/RPH+QuTc1xXEM0TWaZkynCm1S29JC
         behzV8B52UM68TJhmkzXUNGlPMqKVguOw/e7cOrjSZM7VXlLTHtAHFpHTFCh8Rr1ilfa
         uMjQ49o/0snSumw17R3gPKwQps1eJUgkbPPYW8XqxSjKkyIKmxdICpMbWBFYDQBhRTpK
         XGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726040587; x=1726645387;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=As6Mh+lzj3Gz1WRcYQZrDI90Xpd0PmMaVKgj6FhuHj4=;
        b=MEj5INPbkzROsUTG8vsmLzS/0IHUOpBR33UE1kK3OgGyiTd2Cyv9SEWH0caWzvQBOt
         kHJsbuA3pJ7nZX99op7RyApl+3a8+MNbogRJHEh2zUEeUJqEB1Mj71KhiSWqRqqOlF3X
         LoSlAoJKqxuc+xx+FyGgm+lzHs6Rsvdpg8lLM/Hi+774nz4i1qP3r9vpTOWKoMXWDa1l
         wW91NGIOGhVuJN3FeezYEw/pQy6GNP5xK3DkvXb1dFlCeKxEdYtmJvXioyhN1YA1hwWl
         +KP6ByzW8oxqGg/czJf2SwVQ/ftt8pkjTAaRMn1pMYmSOh3a2haba70jDQCfumokIniI
         QiGg==
X-Forwarded-Encrypted: i=1; AJvYcCUTsH2rZurp0Ff2NBTSmlLff/EyxVU0zWfv+puqAGsDxVkAcRT22zJt77zrMXiwwxMw4PDgmSNc2Mv5Qy8maA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFwAcMUStDO4u8UYcv8STdVIJ5YkmKaKcM21WDBfx7A+F5KFUA
	du2zreZGthfq8g2wm33URMrp+Kohj5AQHU9EF3+xMlUL92BJc2ia6rB/cBl6CVs=
X-Google-Smtp-Source: AGHT+IHOJBC9xWxtEz333I412PsRAnwCCXfRzkH+Q812eYtVEcfH3PlSFuvh4othUga0PEr6w0xhXg==
X-Received: by 2002:adf:f4cc:0:b0:371:86bc:6c05 with SMTP id ffacd0b85a97d-378895c31ddmr9796759f8f.10.1726040586743;
        Wed, 11 Sep 2024 00:43:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956e8a98sm10786306f8f.117.2024.09.11.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:43:06 -0700 (PDT)
Date: Wed, 11 Sep 2024 10:43:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: mt76: mt7925: fix off by one in mt7925_load_clc()
Message-ID: <84bf5dd2-2fe3-4410-a7af-ae841e41082a@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_004308_956515_B46B64C0 
X-CRM114-Status: GOOD (  12.63  )
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

This comparison should be >= instead of > to prevent an out of bounds
read and write.

Fixes: 9679ca7326e5 ("wifi: mt76: mt7925: fix a potential array-index-out-of-bounds issue for clc")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 748ea6adbc6b..0c2a2337c313 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -638,7 +638,7 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	for (offset = 0; offset < len; offset += le32_to_cpu(clc->len)) {
 		clc = (const struct mt7925_clc *)(clc_base + offset);
 
-		if (clc->idx > ARRAY_SIZE(phy->clc))
+		if (clc->idx >= ARRAY_SIZE(phy->clc))
 			break;
 
 		/* do not init buf again if chip reset triggered */
-- 
2.45.2


