Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD59C79FBF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 16:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G/vbQHAhPT31Mmibdc9NJTWNHdvmxIIchs3BB/8irg8=; b=eMTHQT5l1l7zOPpn3I9ZVjUry6
	ewRbeekysofiRgFcMW2fy7nbXpWQhbjqFV3RTTgjrBQKL1GIZdBkjNNJvrQzCy6x/txUVyyRFo0tY
	BdrMszx1tEtmbvd79OhEYYfYHZe74qMcghkG1l65uIeRJAtknwIEDE7B+mRUULPfI2PXm9NMJ96fS
	xdqLe70LUXT1W7BSlGnitzlDNAYjBFAULYl8SO8P594msxyN6JZPTsuT3U9xmFEs+IXMG2oGhc7pS
	WRpdXFM5u0AuLxYLX335L8a9G/EG3nQAAvybghE2/5du6S/XLCaY6Qmc1J0hzHN49eTC/3EYk9DFJ
	rFLyNQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4i1T-0000000F0Cp-2hxZ;
	Thu, 10 Sep 2026 16:53:15 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4i1R-0000000F0C9-0Adn
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 16:53:14 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8534d507f59so7289884b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059192; x=1789663992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/vbQHAhPT31Mmibdc9NJTWNHdvmxIIchs3BB/8irg8=;
        b=Z6e202R0M1aktL4LpPSJT25aANyJrvRrS+fVmEgYvnX5ZXXwfaxhXan8gypeCbbBHo
         aVISD9iW44Eer6Dik1PCsJRcALbnADM4MRDP9cKQSZEarIr2LUDQIJPQav1DEs96QV/+
         csFMB4JaxYtBdFhgGajn0RJJ7Xctdz8MKlB7IxAb5ifO2vO4mOEtFOzxM7NMnynAtZ+3
         rvfEL7psDIZXGTesF7b3Ocqo7U73NyNOpo1b9ONYL+1TQlNahfWYb4BdVKMsDh3ZEHx5
         SGPfTJTHof0r6qy+zFuznhMAeqVYOxpfnkIaMcIJdl6xCaxV5IzNXOVTtsia0L7xusgw
         eQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059192; x=1789663992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/vbQHAhPT31Mmibdc9NJTWNHdvmxIIchs3BB/8irg8=;
        b=Il+yDfs0MRWTM+D0dHh/vbVRQblawqzCUAfETlX4x81hlcN1rXtmZkbZtTWXbBGoGf
         odBKcerMQqAamw1LMTVr0tcZ1/P2YDtp3i11x0PRSazDxdptFAqcQmsfleSmC2WHhXGX
         wKs7fdiDIgrYCSo1yvPaU23M2X9LMdALd8iGD0z8EegyF/Oi7TbSucfulfFOAm8wsIGR
         /pDxuO27+Woj/ky41uiMAAi27y3PI7e4cIXXTnm5AgNifbzn9F7wtiworptwYiK4yVUD
         f9d/JYy9raELoaC2v93x6XijV0YcGG5J6RrfKVeSJr5HsOI6nDjfxj4JUHh/vyAVOSI1
         eFsg==
X-Forwarded-Encrypted: i=1; AKwUvBzE/4VrImK6rtqxWun3fsJY0v9weFi33CkDPKVZ3cVQxoAi0F1SpAVE8JXPwwGy6G6gCfj2YD4Tcu2EkyhuLw==@lists.infradead.org
X-Gm-Message-State: AFuF++mxvzDSh7GswjKtzwwQJygFu05D9F7S4VwggJy7vEQaX++Ih0Tu
	TN36+iTyBLSyM9xpgJRxvCDbU2YjiCvAq72v6mFszrSLjiUubWgzcWDQkstIOQ==
X-Gm-Gg: AYBFou2dFWcSbuz7OnUTe7RkCAZuYRWGbnoW35SY7qXeSwxNiVM1A9S7rTCVPZA6Hew
	YhWGN6OX018Y+zALZvW76nEmW0VQg2YhVADoRfnifwR2PMqAlcbGCx/uCEuGqFqoCN0GbgwQNmh
	lXXN580zlZBx/h3Ynx/uQPrbHbEud7hAlIM6YNib3AkvfsQcI+2rluisnECq9PO6oYCaw35vEE3
	jwUnz9SNWDUJJtDo9hiiaF2f7T3VE1FIjmMVOXe9F2HLFGD6G5j2i2cXKDRTBLUaW9SbEPGRNzs
	bk4b2xPPiPtkOcfUZ7saO4JNZYtktDXzpe1UDeNtfT4FBX8SCv5SfTCYmBL0yuLroc7K//+WBXs
	C6loVKPaR99tVK3qOFk+NzWDrqDPFX74MntB0eGB8MVcc0EfoLGjEv9t0R2QFcFglDiNS1AIjkO
	blGnni3Vm6NCqzAlKKjXvogDRtBFzU3Mf85PxNINcWAMPeSTh7XCvEkEsL27pJ7AORWelP14m8y
	4yNLZLUSrYE8Bf6z86zo40nKp9P
X-Received: by 2002:a05:6a00:6d43:b0:869:201b:7386 with SMTP id d2e1a72fcca58-869201b7831mr9536931b3a.1.1789059191831;
        Thu, 10 Sep 2026 09:53:11 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153e3ac21sm8425743b3a.55.2026.09.10.09.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:53:11 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: james.lo@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 RESEND] soc: mediatek: pwrap: Remove obsolete NEED CONFIRM comments
Date: Fri, 11 Sep 2026 01:52:53 +0900
Message-ID: <20260910165253.378212-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_095313_077436_51802109 
X-CRM114-Status: GOOD (  11.05  )
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

Remove the obsolete "/* NEED CONFIRM */" comments from the MT8195
configuration. These values were previously confirmed during review,
but the placeholder comments were accidentally left behind.

Link: https://lore.kernel.org/all/2a117e5fe9fe0ece39e9165a463082ef42be973f.camel@mediatek.com/
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Link to
v1: https://lore.kernel.org/all/20260522134522.368073-1-akkun11.open@gmail.com/
v2: https://lore.kernel.org/all/20260525092437.29313-1-akkun11.open@gmail.com/
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd8582637550..87bcbfa2d5f122 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2396,8 +2396,8 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
 static const struct pmic_wrapper_type pwrap_mt8195 = {
 	.regs = mt8195_regs,
 	.type = PWRAP_MT8195,
-	.arb_en_all = 0x777f, /* NEED CONFIRM */
-	.int_en_all = 0x180000, /* NEED CONFIRM */
+	.arb_en_all = 0x777f,
+	.int_en_all = 0x180000,
 	.int1_en_all = 0,
 	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
 	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,

