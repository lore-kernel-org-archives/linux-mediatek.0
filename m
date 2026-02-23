Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9D6EC1112
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 17:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jf6/GdPMgEPudu5Ub5QM0YH/lbZT9UmvVkra65sIm8=; b=A3I9whuZSI9leklFjH4x+QFhlZ
	MP4/6S+ArLbH1qvLWsVZMhDQsu/tOj7RGX+RGcWoOn3oaKa9EB+xjf2nCStGwPLzQ6jiEHLgBz5Wm
	9ZOAjKuWZm4dVyUyQ19P9/FUgNJAYMwjK/p3JeAEyM6uAmmJHjdnJNwqMaVKL9ol26axjEi2JmYN1
	lqwpVchVHbrFoqw46bIABTKXQYkK1p9t61+Bq9zeCRrpyjuZ7P6R09J5/DUkxSw0r08hG2NnHlC6y
	Vbr+0xCRRzSPd0wKJZqmfvuCzDjZ8oJxAWiJ40MHSVeNwgyguNpJlr/lz0VDZ2sOVqd71Z7jnjHoU
	NGJCdB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZYh-00000000jmJ-2vL0;
	Mon, 23 Feb 2026 17:17:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZYf-00000000jkT-0rrs
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 17:17:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-437711e9195so3018440f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 09:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867039; x=1772471839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jf6/GdPMgEPudu5Ub5QM0YH/lbZT9UmvVkra65sIm8=;
        b=DCDvl6xJWzENyXL4NGL3sMP84wDnyqq4pXjlgJoUVlMfmPfgQTe9OUvIgtGR4Kxjo3
         X0X5f0snqJGs5FxCmy7EHN8xmVeUW4obYscoLG2mMfxbZvTRLSLXnypALXJJWghjaim+
         8XN2E1K/5cpnd5buw16wyZe+sttQFW9v2ZeMdWLQBqQv6zAm39O2blwTaHR8qEBVy3i9
         q+OruEmGxM+Y0hLjtqVtrlAfbhDDT2qVd4hAVvSTWnWWG6C9F9LnXfM81F5A8OwKatFD
         biPzwBoypwYtCFvXhsEjeHg1hHUnUG9Z1sdmDVJVswCSLFqSeCBBAdQz9QKnZbSv5tJu
         V6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867039; x=1772471839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+jf6/GdPMgEPudu5Ub5QM0YH/lbZT9UmvVkra65sIm8=;
        b=Qj4XYDB+Juso8D0ra3twQSG3ouSrHQGV0uHLnbTrDBgYNopccV7V8ZykgLC54AUcb3
         AX13VjUrUm6/w9BKKQh7rr7HKeNdQcSypb7lZkHp7L++gbLoyjikWc0OZj8JUBarxUbO
         Mn0xE/7EmqkGrDuAHYysFs1qkjDvfXQO1VAxD7IbgGJ6O8VDpiY/20GYjrUmg3dwMUuO
         /9BulHJgembMhrQaQaM1uvn/in/Ukgrh8JaSDb6SUasOKsy7108fPnqCrTPrdbUnWfrZ
         hW0MNqxQzPDxjFjjtGB0lo3IaTnLSFrsgkyCXosP/Ye/53d5jAJJL1guRGXUDMpK2sOr
         22Gw==
X-Gm-Message-State: AOJu0Yz0VUItIS9I4oHGD03vOwPbUL7hGPa2YAWxDaBI2KUX54PGyDlf
	VnKQdqDkTPP8Foh6YmqiSdCLoqD7RCotD2xDmY9yUVShGVm35GGvJADKqIAu2A==
X-Gm-Gg: ATEYQzyHVwSTLuogOldyKq2uV1bZKQCorADbJWUGDpOL6KBpmp1j0ludgqHL5ZE60Up
	5rk1d0IqvlnoLXD4o6DVhXBm5CesBGasjBrFTN+T5DS86lBWtJf1+E3eynjsUSmUMIyu52MVBQ/
	AfBZTVXiSkPdUlqbtz5QxF8ztlvdUQbonQbqByHF5G1GMy05MVNHiNFCOi9h3Ufv2MGiqCoy74S
	PF/r8CGDw8SCBZBsyUyEfKVlZKEUiuA1ZGgoZiMvk92Po4HUpuq6e/wPx0akohH9wTgwGdytWv3
	ZiysVfjSPtI2cYjdZrORupUHWKdY88fcoj/Qs47r2SHfp0FFzL1M1T3wg9/BGXxFC6wPO5zpcLW
	eH0Hp7MmtPQFsfKam5D09j0l8rN1mtgo7VIljE2u7rlFVYkahFyVlzpCB1tC2tqCAIvhAWPpSSn
	JUlR2K86w3rvFhpizroM5/D2USy18oqw==
X-Received: by 2002:a05:6000:604:b0:435:97f6:4f44 with SMTP id ffacd0b85a97d-4396f1a97fcmr18768298f8f.56.1771867038655;
        Mon, 23 Feb 2026 09:17:18 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:17:18 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 1/9] dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
Date: Mon, 23 Feb 2026 17:12:40 +0000
Message-ID: <c5ce038359583c5318c2d5ee341287c213aef880.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091721_255152_993B03FC 
X-CRM114-Status: UNSURE (   9.61  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the currently supported bindings for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 6a89b479d10f..5f422d311d4d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -67,6 +68,7 @@ properties:
               - mediatek,mt6323-rtc
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
+              - mediatek,mt6392-rtc
               - mediatek,mt6397-rtc
           - items:
               - enum:
-- 
2.43.0


