Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0BBEB64DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjm1htpsgUdaRZcHsGo757GH1rkymaOgiUPQg9DWT7s=; b=DEN0oVtqsX6ZzE
	a696R/Kz5LH4kBnFZmS8aEbz6lNk4Otaa7URT1eqPeGRg1OrWrDynbFaPMLX9HDvxMj6uEh6nqZhD
	sITZO5oL/r3FBZngSXigmdiWLkg6CGvLqWsuXEcDpqs/uGKaH/u9c0RVqaxzb7GmN/Hp0Ee9Shyw3
	3KFQQ23eQu9A5dyFUyXl+nkRrab5/TNboyoXKLC1rRBiGEwAKcgBN+r9uvnB/HgigwO6aCPE/4gRT
	0Tc8tAE4IoSbg5cmF41WvAsPojCJ8/rGod6v2IFnbyIWXyXBkBVWfEhuXvDfv82+2LWzbybcDwRZ3
	FfF2KbDSPRX+JBQ9Gdmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlBa-00DJLQ-23;
	Fri, 21 Jul 2023 08:08:26 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlBR-00DJFG-28
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 08:08:20 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5440e98616cso1953945a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 01:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689926892; x=1690531692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjm1htpsgUdaRZcHsGo757GH1rkymaOgiUPQg9DWT7s=;
        b=apTJsacQxezIERIOQSQqwO451/lek2u8gXH7fZL0cfCdEDjzED1YDa2Baxbhk9Skr8
         08FwwyQ/l7u4oL/MEXt8tamuL+5yYji/Mqu99B67oXI7wh9ZmE0PRft4CzhT55XJMN3A
         dwc5kMyE67C+0BtJfA5fjkXw4DR3dkg7NWXhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689926892; x=1690531692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjm1htpsgUdaRZcHsGo757GH1rkymaOgiUPQg9DWT7s=;
        b=lBQGv4jLkaFEEQ7p/V8FoJ5aQsg6lKqhcJATQhV0PUkNg/eZCjqH+GMjfhxNucpvPb
         bOJSmpyoLzw6vQw2sT0NhCu8IAi6INeRkGsr0tludyd8LGTdfWGrDFBF1k3aDCMgL8cY
         xoY5o50BSs0XAwOgoMrWN/T7N3BKIHi2VaR9P7pWVkIzqqBnMkq/mO7uHIxPcmSpkxjf
         E0kMtDc0jW4jGrQHoYDNVazhVZ1FKZ86YmI5Wzh0X0okq2PLUK29eIKfk6hCvEYX+4SX
         kKRYUGPScDkn1iEfu7QyCYP1t5tDyKvlb/IGKGNL9RuSD2zGFO2sLCeEwuK3iBBqx17W
         wyng==
X-Gm-Message-State: ABy/qLbwQNzfq0r6w16aLJPk/AGzScVMacR1ml2KTRzolrRWWa4fGMPw
	nAGYCT/EOw16sdx1zV46wb8TOw==
X-Google-Smtp-Source: APBJJlGIS3+ANIVcIUnnknjeeQ8DSn4sVGCY4o1XMTR9Em25tsTHbHUsOx8EeBzPhWHUVPQUYP5HqA==
X-Received: by 2002:a17:90a:64c2:b0:25e:f696:1cf8 with SMTP id i2-20020a17090a64c200b0025ef6961cf8mr1951333pjm.14.1689926892623;
        Fri, 21 Jul 2023 01:08:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6d86:d21:714:abab])
        by smtp.gmail.com with ESMTPSA id o10-20020a170902bcca00b001b850c9af71sm2740294pls.285.2023.07.21.01.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:08:12 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 3/7] regulator: mt6358: Fix incorrect VCN33 sync error message
Date: Fri, 21 Jul 2023 16:07:44 +0800
Message-ID: <20230721080751.2012318-4-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230721080751.2012318-1-wenst@chromium.org>
References: <20230721080751.2012318-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_010817_694419_20ED64C0 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

After syncing the enable status of VCN33_WIFI to VCN33_BT, the driver
will disable VCN33_WIFI. If it fails it will error out with a message.
However the error message incorrectly refers to VCN33_BT.

Fix the error message so that it correctly refers to VCN33_WIFI.

Suggested-by: Fei Shao <fshao@chromium.org>
Fixes: 65bae54e08c1 ("regulator: mt6358: Merge VCN33_* regulators")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6358-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index da6b40f947c4..b9cda2210c33 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -661,7 +661,7 @@ static int mt6358_sync_vcn33_setting(struct device *dev)
 	/* Disable VCN33_WIFI */
 	ret = regmap_update_bits(mt6397->regmap, MT6358_LDO_VCN33_CON0_1, BIT(0), 0);
 	if (ret) {
-		dev_err(dev, "Failed to disable VCN33_BT\n");
+		dev_err(dev, "Failed to disable VCN33_WIFI\n");
 		return ret;
 	}
 
-- 
2.41.0.487.g6d72f3e995-goog


