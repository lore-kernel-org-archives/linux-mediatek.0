Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08786CD98C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 10:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IJUYz/VnH85xP5IAHA2EUA0hKYGmtjdBqL/tBoqQ/8M=; b=FLRsnA6h77BAFHuysQQSmwk1L5
	vYexv5pBIIlcyNUQVeiFRncYVho8Xg2vxAnhQQNGvI24ZWvnwiFicMkYda5IBqViUzmex8YHmaTmz
	DKQZAL6yHxtDQVOmiDboCowhKtW6xZaHye7dEXpZ4ZYk829xjrO7hezcMycm2+1Ma5y/MFYk1KlRU
	GqTrO/ameW0860VhPW+bYxPpy0mJMP9qqF508eQfY4JFomsYM0c+9iiSeR5qgLZtH++prDWYoVjzA
	4Qh9Jdp4Aiow0l4Zw2uikV9mO7G5FLepYf3G2Ss9cLmyMBSlwmMZdmDuHuWSO4Twh/NbiYvOmvqq+
	qNkerFxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG36-00000007Mka-3Z9F;
	Wed, 10 Jun 2026 10:20:40 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG33-00000007Mjd-0qS4
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 10:20:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2bf55c39e16so29525365ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086836; x=1781691636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IJUYz/VnH85xP5IAHA2EUA0hKYGmtjdBqL/tBoqQ/8M=;
        b=BmO/MbKtPdcb+eHkCHXJJEYObIPt6nfPQFfNmG8pmy6rSldybH5gPPKGqum5rsFCpZ
         FV5Q+CnHw4f9Q35qNTvbsiQ7QmMIdzoQr730MdZRoAfA+ZRcNdL8yrG0ipm72dUmvoYY
         kqG7LzDrjsqyoToZZfD1bjuT7Y19OY+7Xvv6HmpXiyYI168dIutxMotzKaAMsa3ltJm3
         Glk1zQpivd2Ip1Z/TB+N4GTD6Xk5dYXWIli48FQrmH8/OHv3O4jzYqlUsyTpuNM9KxhP
         8RdidPwsQw1KtYQ8ERbxzc1VgetJ9MRmAzGpkiKtvHR36X/RZjC489VIiNdcAuz+WD3b
         BzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086836; x=1781691636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJUYz/VnH85xP5IAHA2EUA0hKYGmtjdBqL/tBoqQ/8M=;
        b=LfVIVOKdeNKqXwYEzIdaFq9SlQOLPd93s511b3Uezj9LF7YT4KyTwEgNVyDHGaIagM
         /kA1arHcDq5vfzeMsoqNU6tAAewACCT1z0JRGk1UbmGgyJfYwYgrBenqX/Ua1+Lg8cvx
         4/C2wVcQYOYqS7oLm6BvV8rcvoEEImTAn8i6XFPkFSDFwVi6Ynmv2Ik6y/j+l/pbEQgL
         nILGE1RMWUA7sHeeTsb8OOyXLJMpLMufCLOnKPb4nIJ2LMsTgiRE7KKVALTC7UCjkloz
         OikUsDz3bTuB7XTZAxBdqHnOl5tfqwKlNwptqVMZIBUy26QeaPKmg2xg8+TJjNVEwDvY
         hS0w==
X-Forwarded-Encrypted: i=1; AFNElJ+pn0DPEKAGkvNLRX/i8ewwmSxHAubX49JjrFW/WY4u9mW7M7bJO1xNCnI+IVSK5rN9s3iUV8gBk9RZ8Iqdww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2Bu123OV/wOYJr1guODsuu6xHRfHU77ZV1ktGhEN14revs9Bx
	Sm+t9Pq95IwBMByx5UUgptHs5ZZQv9g3fw7jGKeJpB2BbTc25iwrublN
X-Gm-Gg: Acq92OGhimkwM+FSnRchZAiUY7boYkjVIjF7yHgOfndL9cjEO49siGQiwIDucSzsbJc
	Q8UlUETkWw7qxTrN3n0A7KWtHA9RAKUrLCKmTMTmuij4XsxE70Rj1N+/HVKMvQoEqk4TwJyKY7S
	ptYbskd0Qia+TQiHdMPlvEOpNXNCX0Iyh1BDBQwe0L6Xbl2gctndroz0KcKZ6LrroaWERwP0CMa
	PxGD0uSyIeqfVZ/+KbrTFg/UqVFYb5wkGAzQU40+S0qk9I0a/vj/xJO+nopWcjnNLnZHPWvAm37
	UCx8G1rNtrFVorU+BSnAs5/JFcwhpgczsimPUFxEC8wWqdV29j/FPxl68K2slvCRBiI04bGFJ+J
	CcR/yk0vWCsOdYAL/IrRNtOH4H0xyDqaQO7osT0siL9yMlVBo4VKXARNeKr1+pDd3+LJwxCfGBu
	25jtVi+Ftd9jc5eGEK71GDXZXTVxBdGbm5DKg83lkaCJdMvarcbYxgN1MGbMc4C4kt/Uq7
X-Received: by 2002:a17:902:e544:b0:2bf:2d0:8877 with SMTP id d9443c01a7336-2c1ec7fe13emr206516295ad.23.1781086835997;
        Wed, 10 Jun 2026 03:20:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:35 -0700 (PDT)
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
Subject: [PATCH 00/10] ASoC: mediatek: Use guard() for mutex & spin locks
Date: Wed, 10 Jun 2026 17:20:11 +0700
Message-ID: <20260610102021.83273-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032037_245562_7E608AA8 
X-CRM114-Status: UNSURE (   7.76  )
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

Hi all,

This series converts mutex and spinlock handling in Mediatek ASoC drivers
to use guard() helpers.

Most patches are straightforward conversions to guard() helpers with no
functional change intended.

One exception is mt8192-afe-gpio, where the mutex release point moves from
immediately before dev_warn() to scope exit. However, the affected path 
only emits a warning and immediately returns -EINVAL, without any further
processing.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (10):
  ASoC: mediatek: common: mtk-afe-fe-dai: Use guard() for mutex locks
  ASoC: mediatek: common: mtk-btcvsd: Use guard() for spin locks
  ASoC: mediatek: mt8186: mt8186-afe-gpio: Use guard() for mutex locks
  ASoC: mediatek: mt8188: mt8188-afe-clk: Use guard() for spin locks
  ASoC: mediatek: mt8192: mt8192-afe-gpio: Use guard() for mutex locks
  ASoC: mediatek: mt8195: mt8195-afe-clk: Use guard() for spin locks
  ASoC: mediatek: mt8195: mt8195-dai-etdm: Use guard() for spin locks
  ASoC: mediatek: mt8195: mt8365-afe-clk: Use guard() for mutex & spin
    locks
  ASoC: mediatek: mt8195: mt8365-dai-adda: Use guard() for spin locks
  ASoC: mediatek: mt8195: mt8365-dai-i2s: Use guard() for spin locks

 sound/soc/mediatek/common/mtk-afe-fe-dai.c  |  8 +-
 sound/soc/mediatek/common/mtk-btcvsd.c      | 81 +++++++++------------
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 13 +---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c  | 29 +++-----
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c |  4 +-
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  | 42 +++++------
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 16 ++--
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c  | 30 ++------
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c | 10 +--
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c  |  5 +-
 10 files changed, 87 insertions(+), 151 deletions(-)

-- 
2.43.0


