Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96714C04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 22:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2wqVo0aD55CNjK+hEjl9Jhtj7J/Tr6/AA4pMGSEV/1g=; b=Y014mOvWqjx4R9+IPTzuY9GoqX
	0atO/XFLgT64cb3jeLkjVlgMtmGUem0Z7pZQzAcGpo174JjknscrpCLR39P7SGWRSWIGvBPyFksIU
	dMI0QnGFT0yePKk9hFVziz+va4j1yAvMGJExjJ1NIeP4IHKNWVvi2NHYncvzwiZaGzPyYfGiRi20t
	FOpUg24Ipu0Pmg0OFBNIkUsazPlEyXJ5temXchm8xfSGoJPVAEh1uB2Lph5a0CO956zNLs5dvzGMf
	zYtkaDJDvJzeUSs4Neds9MV/68ZkQVBe/LeG9QlQh9uEAP/87sZtsGtQdP7kIxw45O7++kIL/0GLR
	LxDW0ryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odfAP-000Vww-83; Wed, 28 Sep 2022 22:04:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odfAE-000VvI-CD; Wed, 28 Sep 2022 22:04:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so1727456wmq.1;
        Wed, 28 Sep 2022 15:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=2wqVo0aD55CNjK+hEjl9Jhtj7J/Tr6/AA4pMGSEV/1g=;
        b=KU1oYI3X0FsdCE4047IjtG+VQWOsp23dQ1ziNPvW9YTUtXJgabEeqWTqAfXnORtk7Q
         EgXtEwk7lbwjqPFgg+cMC4IgeJbda9fq7SzSgYlCFtfPJMX7NuKM+LFQ+pTHNQ3MeFK9
         jgS88jZoYJlre/fYBan0YOURD6Scp5FEFXjLTzFVPlQhmsyEJYk0Tff9Bsut8aew+9hx
         L5WKAeV7f/VMlkXKEVA1qoXAx7ml8wcjhgpA+5bZrRzw2vf2ETSiFReCmZWh1M3Cirtq
         Gff1LMaLcri9HXdR38v1ZbHtBO0e61ybtU4mAW21b1ayAXZsjKUmnJ2k3Nl0iX/fbqxt
         uPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=2wqVo0aD55CNjK+hEjl9Jhtj7J/Tr6/AA4pMGSEV/1g=;
        b=wrWwoCuKLSSd4XaZYZfgNWjLMSTmzBdPdPapSzqGvDPV3eSfASFqSE7UFHvUBMW+kD
         wcZhl8TXzkPJjwESXqhncLD2urbGy5AXdcH9M69ESOEDEb3lLvuIaNak/nXmFLPnvA9k
         8h6iQ5cbVWeItqqOw6tRS6bHfVZx0rRbqmPT3DcHd7hhLqiywDKxYMpaHgH7RyemWp/F
         X3YiB0dZqcypJ00KYVvWNDUD94EGShVT2o0ED9Bqku5cLyNfKRYRISoBMAJxYfYWnKtT
         JiiPij1P5oHy5kh9X8RS+bdXfmHqwDLVtjIo/i36phOH2tNfn73iNzc5Ie+Xn5BrxF3s
         B+rw==
X-Gm-Message-State: ACrzQf3ctHWGjYQH5otGGygzsIIG4ALlh7HAayjHhacQoxHs8LS2UQIK
	4e7/Czw323A/xrSeuTyRj6SHeHaT2EZ3ZA==
X-Google-Smtp-Source: AMsMyM5C5bvoufyf0RMPrn0G1wm8CeA8ImmPUYZ3eH2K2m1PZUZoa1b7sFlsXXS6Dva1sReyJbuqKQ==
X-Received: by 2002:a05:600c:310b:b0:3b4:c618:180d with SMTP id g11-20020a05600c310b00b003b4c618180dmr76898wmo.25.1664402658808;
        Wed, 28 Sep 2022 15:04:18 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id n3-20020a5d4203000000b0022acb7195aesm5121019wrq.33.2022.09.28.15.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 15:04:18 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8186: Fix spelling mistake "slect" -> "select"
Date: Wed, 28 Sep 2022 23:04:17 +0100
Message-Id: <20220928220417.66799-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_150422_455355_5BB9FD8C 
X-CRM114-Status: GOOD (  11.25  )
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

There are some spelling mistakes in dev_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index 274c0c8ec2f2..eda913fa147a 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -170,25 +170,25 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 	if (enable) {
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_ON);
 		if (ret) {
-			dev_err(dev, "%s(), MISO CLK ON slect fail!\n", __func__);
+			dev_err(dev, "%s(), MISO CLK ON select fail!\n", __func__);
 			return ret;
 		}
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 		if (ret) {
-			dev_err(dev, "%s(), MISO DAT ON slect fail!\n", __func__);
+			dev_err(dev, "%s(), MISO DAT ON select fail!\n", __func__);
 			return ret;
 		}
 	} else {
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_OFF);
 		if (ret) {
-			dev_err(dev, "%s(), MISO DAT OFF slect fail!\n", __func__);
+			dev_err(dev, "%s(), MISO DAT OFF select fail!\n", __func__);
 			return ret;
 		}
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 		if (ret) {
-			dev_err(dev, "%s(), MISO CLK OFF slect fail!\n", __func__);
+			dev_err(dev, "%s(), MISO CLK OFF select fail!\n", __func__);
 			return ret;
 		}
 	}
-- 
2.37.1


