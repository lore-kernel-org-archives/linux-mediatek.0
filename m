Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBBBE9410C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 06:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgbiI2XInQRR+Vqs16mnpbyaWQyjL6O2oXRYN+hsObo=; b=IDe+FeeRlazzenx2e7rSeWw8xj
	P882xn7aCQU7+92Hpaqq63vwG2mb1mSckF2R6CvjqZhsOxIwxnjcZ20sPuQ8XHiL38V+pSAgUfdxp
	4thIlgP+X33z7qiDY6U1UScPs9tUF9xKQPhrggW+d6m1SBU+uOVr7QRSc7+yZ2xUkcFHu1UxkF1Cg
	/DzkRwC3Qg1xqyXwiNpv7JvQTKpuHt+BRiM3tlPLlAmk5ieQhHeJcfDmn0zwaUKarf+C0asSj8TK/
	VXX4KN5VRRM0zMpSWGKL+nEQpwQ3dhJd49l3TiLZD31e1sQgTn5zYD/X0IEyp6WpXdAyKc/Evu+kj
	qJiuS39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7q-00000006dxj-1qW4;
	Thu, 01 Jan 2026 06:25:34 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7m-00000006duD-1uP1
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 06:25:32 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-34cf1e31f85so9200279a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 22:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767248729; x=1767853529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgbiI2XInQRR+Vqs16mnpbyaWQyjL6O2oXRYN+hsObo=;
        b=JwZ4+7I9TicrvkvMJeOPSAwnFV3sEPan+dnSlv5wnXBaWhBfS8mkOsRFNbWBPEKOQs
         bsx1PYgZRLDTb7rVv79IKSN7W8WqxExZ8fH2rwzNOmRjPYPoaCeDzknKEkuvBdR4uTn0
         wQGvw5V15LAmUdcWNZhPgmswnGIi+ZPd3MNetIbzugqpxJxXvO93pMoCVdF8wnn/vugJ
         LgWYoanxuPWChe8jzeKFNZs/JB7kRjS0UYiID2uNC2hwzfeDlhxbjuET/R42aRFVObaS
         si+Q1YBc9EmHux/oyfw6s762GLJbUdIe96cb/950yVcCnTH41olyOr14idOp083aNCuU
         D84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767248729; x=1767853529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgbiI2XInQRR+Vqs16mnpbyaWQyjL6O2oXRYN+hsObo=;
        b=m0M7fUBB6TX37RF7nwZFe8Ofd9VkRWQtlXq9zw+v5uMu5m5qYGUyXS0ofx7hwaZgST
         Wg4mqO/n8ELh0fXzhkGQkVne4C892kxEPi7b/+NYDBHy7vD1eWzAGLv1fgXtWANoVSKN
         0BEPqCFavB1oeWwr9c/KQNBVjuEYfG/mn9PZF40IZCrIUKBBZzr85plUi5NerZ+PG5LU
         nM2Cz/vEPZ0wsUv51o2OEv9vmiGeAeP2f/w+HcbK0kgKYbqE5qZ0pBO9CidAbjz8h07e
         kL/U9iskok4qM8jBEmBnNT/C9AlVoB1YCJPMKCcC3dfZrfnWdwoU5sBigzlzD+62c3eg
         TKRg==
X-Gm-Message-State: AOJu0YxJ7rqR877byV34WGIyHVX9GTWSzFZQEPqIT/F2HPl5NaXeD2Va
	SeT0Y8z5l6aVR7gBmXEDvAJT6R/ucf1M+gS/dWf8ApBbAtHYy8ba4AT0
X-Gm-Gg: AY/fxX7vilPDedat2tOqIeC+dP9eeFAR9K+5ofYHXV/KYmSao9KGT4eVdVcUzqMBK/4
	BW5wx+kaC+SFdARHLHoTy1R+srXZkFxZtWCVgFOoTr0vCqM2qegubTHhl3L370YM9UT/YnTrsPx
	uy4HAvnqwIdMDAwN4mWhJvjLUUPtM6Y71yJYCLWORkLZ9e0+A2vg764X5FUTyOPUfSv7sdDAEAF
	UTKCdIpkQP1be9/TlRdUSQid+tNEdO1F312FaHVGh0bDEUWr+K2z1Ga6P3vcnZm54AoPnNgg+0M
	cIw8G8D/kix766/Qh68Z5MpY9G0mYSO5SQihTCHauaami1MTMRIGGIqfKdkp3rKb0Rz7fnx0+Z6
	OzcaCGMKrimhUQ6upg6twYDjZRyLNumGp3SOk1O6S843sarKnJX5hARRY6w6Qe388Li5epRXbMr
	f03FmV6fVA5TDu82L0b0W4Jo9KQOJnySKQF6LFtzjaGn6nRgFq0krFy+vKJ3THXvcKvZ5ApJAz
X-Google-Smtp-Source: AGHT+IF0EsKgw/v3geh0bknpZ5PAnHW8mZQz21B6hYvNqEgoKWU6U4GCafgpBsInjUAAOIATUbBYTA==
X-Received: by 2002:a05:7022:2214:b0:11a:23fb:16e2 with SMTP id a92af1059eb24-121721aab8fmr37787196c88.9.1767248729358;
        Wed, 31 Dec 2025 22:25:29 -0800 (PST)
Received: from zubuntu.home.zacbowling.com ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm144361662c88.4.2025.12.31.22.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 22:25:28 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvalo@kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	ryder.lee@mediatek.com
Subject: [PATCH] wifi: mt76: mt7925: add error handling for BSS info in key setup
Date: Wed, 31 Dec 2025 22:25:25 -0800
Message-ID: <20260101062525.186192-3-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260101062525.186192-1-zbowling@gmail.com>
References: <CAOFcj8Sad3pLohFfRdj5jzK3Zs3FAjFVBuzH=80i_m1YqSbpfA@mail.gmail.com>
 <20260101062525.186192-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_222530_507853_FF22A62C 
X-CRM114-Status: GOOD (  11.32  )
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

From: Zac Bowling <zac@zacbowling.com>

Check return value of mt7925_mcu_add_bss_info() in mt7925_set_key_link()
when setting up cipher for the first time and propagate errors.

The BSS info update with cipher information must succeed before key
programming can proceed. If this MCU command fails, continuing with
key setup would program keys into the firmware for a BSS that doesn't
have the correct cipher configuration.

Reported-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a7e1e673c4bc..058394b2e067 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -637,8 +637,10 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
 		mconf->mt76.cipher = mt7925_mcu_get_cipher(key->cipher);
-		mt7925_mcu_add_bss_info(phy, mconf->mt76.ctx, link_conf,
-					link_sta, true);
+		err = mt7925_mcu_add_bss_info(phy, mconf->mt76.ctx, link_conf,
+					      link_sta, true);
+		if (err)
+			goto out;
 	}
 
 	if (cmd == SET_KEY)
-- 
2.51.0


