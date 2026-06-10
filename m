Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7759CD98C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXVJClFlTnZc58L4TC2N3jn2K6slmmQnCORLu4klL7Y=; b=ae3ba3frWEcvASeIvFWmgD1521
	XaEZoTil7J4UUs+0iQDHCMeHSdwWLZtvV8CJQcSv30a8nBgt6tDVgCmwzvCvn/7GrAFBrJVzuaXRT
	U57DQQsde1I4ZAxLKKwETm6zS0XUDny+NtMChbv7pFf05cRVFH1BMWEZxU4S7Pm7ooUnn9hrp6k8D
	4cLDYORGxsJ0OJxsVNsxUg82h93MVVt2BpP0FNQ/c1ZCBlBZ3CcastL8R7mWC/TxgbRA/FNGJMF6/
	K8bA4OL6U0An0+aLSwPiKjgZO+hQk1fYL5Yntm/sPLZkp3K8piD/yht8wNK7+BaDi6J/eGJpCT+bN
	SeGpPGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3c-00000007NEY-3Rqw;
	Wed, 10 Jun 2026 10:21:12 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG3b-00000007NBs-0FWW
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 10:21:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c0bd02d97eso73391005ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 03:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086870; x=1781691670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXVJClFlTnZc58L4TC2N3jn2K6slmmQnCORLu4klL7Y=;
        b=jcHBgBgVH5qvoJHZ+q9MxgoUNsupkyaDRz5euwCeakpC8hpusrGQfXbx3cAnLylOb0
         qjlgMJA3GQssZr/8zf8mtpqG/XyFbig9pQWXxAb4/282D7cRBoS0ZS3k1sKfBD4GvAtJ
         zTB2RrqvTXQacckyuvyWpWqkaZEc2036ndommRArtPq5TqUVDmz0+Ywjn27tAxdAAc+j
         WFToBOmhFLU08Rnu0fRVgrxVOt5DqzTBqgJSzSItgv3pd8c4lkLQCWJ3FOqcScXTjArH
         a8+cbs7dBjcZOgPdTwvPHjKpTJ8Jdv2z3lQLWC8k4B+T8XQGoZ9nHAg4WVOyaidtaw8l
         0okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086870; x=1781691670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXVJClFlTnZc58L4TC2N3jn2K6slmmQnCORLu4klL7Y=;
        b=K6DCJGasy3FxGrntB7z3leJ4T9fdH9x2mkFXz2hCHw6mP09oeCVVssNXnBykOYWHIv
         0EhMSPO6hrW4oyzoNiujhGxQGMaT0iegIHiGafIiBwgc61UP985YQQN4JEeOoYpmDCIH
         kYs9HbzC7YY/U8FUB4EgXw0A/3rh/dJ/7ofRxJpGfI1Jom+sCriue3+VgFWG/1B8qjcu
         b8ATMaA4MQ1J6JHwyRTTLO31zIU0qkdeXEZ5S2lKs83UVKknuZy16hwn6LjVH1uqBU2P
         ewH15FkUghQEwLv+gF5i0drRwgjPXmdEADNLn0IcEI1PvWPtZDDa3swNaOd37br7HCtF
         bzIA==
X-Forwarded-Encrypted: i=1; AFNElJ+RKUjuXFGaiHHNyr6n1Gw6E54aOsqUCicA7p7pKQiN9OCDIvWEyyu1M7gbv85Cckns0YkbTPMMnbHnvrWugA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwA0xszEgXc1vV27coqr3oLQzEHHkNHPZRDJzbU4sSIOHPBY7Wq
	fDfR0cSOMhK/mYX+7glPVwubEs3OD2814h8gVMAuG1C8rmBRMOxX13//
X-Gm-Gg: Acq92OF44znnn3iLxnaMUWrGp28WFQq43slSoLuFUPgww7uKvN/ZtzrUdbOisXOHfV1
	JNlMRhkEVaYL+URrpImSs//NPHBnb/fyVMqJ2rsuhH1qPKFPnaDvqkOLelJzZ4LsGdlW09lzOXd
	qnPmptUqf+KwJiG2RQAHKbiVXlXioPqaThmDKXBJNJB1u5p/qOfeoEn9NwUERjsj4ukN/qRuRAl
	c+X4QrOHXu1c4DCCZ6lQPRH7vdlJpRyrBjss0X7sZbFJrCd69rF4XEqD/IkZ5vwwxmztNUF+gMv
	Wt9O+tZlMErh+ocLTgFCActwn/8hD2xaieUMXsx2n6V/TVSw9Fs51zPJbZ/gGM5sGBnEBIZ6njD
	5nz17ROKjHy4SHN3CwHl7QL4IharvkT3C5PF+4oDE15r74dF/1eL7u0PKcVK6k3b/jJD0VvM2XS
	SzwFnCsm9SIZ/TcX6X4nMSjCf7e66leu+NDFXMpkpYIYKSSGIoSaFZcYe0dhQX1R67xj3e
X-Received: by 2002:a17:903:b0b:b0:2c2:1e6c:450f with SMTP id d9443c01a7336-2c21e6c46c8mr212600175ad.10.1781086870419;
        Wed, 10 Jun 2026 03:21:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:10 -0700 (PDT)
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
Subject: [PATCH 07/10] ASoC: mediatek: mt8195: mt8195-dai-etdm: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:18 +0700
Message-ID: <20260610102021.83273-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032111_118177_CD6AC348 
X-CRM114-Status: GOOD (  11.52  )
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 5dcc8ed26e00..1a20adb2cbf5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1318,24 +1318,22 @@ static int mt8195_afe_enable_etdm(struct mtk_base_afe *afe, int dai_id)
 	struct etdm_con_reg etdm_reg;
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
-	unsigned long flags;
 
 	if (!mt8195_afe_etdm_is_valid(dai_id))
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai_id];
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 	etdm_data->en_ref_cnt++;
 	if (etdm_data->en_ref_cnt == 1) {
 		ret = get_etdm_reg(dai_id, &etdm_reg);
 		if (ret < 0)
-			goto out;
+			return ret;
 
 		regmap_update_bits(afe->regmap, etdm_reg.con0,
 				   ETDM_CON0_EN, ETDM_CON0_EN);
 	}
-out:
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
 	return ret;
 }
 
@@ -1345,26 +1343,24 @@ static int mt8195_afe_disable_etdm(struct mtk_base_afe *afe, int dai_id)
 	struct etdm_con_reg etdm_reg;
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
-	unsigned long flags;
 
 	if (!mt8195_afe_etdm_is_valid(dai_id))
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai_id];
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 	if (etdm_data->en_ref_cnt > 0) {
 		etdm_data->en_ref_cnt--;
 		if (etdm_data->en_ref_cnt == 0) {
 			ret = get_etdm_reg(dai_id, &etdm_reg);
 			if (ret < 0)
-				goto out;
+				return ret;
 
 			regmap_update_bits(afe->regmap, etdm_reg.con0,
 					   ETDM_CON0_EN, 0);
 		}
 	}
-out:
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
 	return ret;
 }
 
-- 
2.43.0


