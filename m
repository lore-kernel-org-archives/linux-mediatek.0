Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2A1D10F58
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tB73pe6/NtX8eM3PTQbggN9wppvlKOL9jZo7eXvreFA=; b=pmPCfdo3+M0rX4I5RYatAyUe4j
	+biXlH8m4iQx6HfQ0dDiUWCzmPMV2ebbW9ymkUN8JIB3W/C8FnoyETauVPAhOLvv2qgZtEVoIN+0c
	bDPTBhO0JHAqjTbd9AQjQcNQTuzuVbMrUSef8fZDHQUbtZxwEXX2W/AwQVoo2TvUSa2hgO+G77bi5
	a5TzBTY1gkt0Ncq4lTttqC+BkLFF0XFdw8mpBDwR9NqcjTOGpAMykpRIRiLsJj7pkXszufrvu5+zf
	n0ROAf80KYP/64/Lo6NWPgrxRLLpN3fQrk+1OA/RMgNFd+5OFsFLvpgXS7Xbfh8s8zlZh2V/IGCGI
	FlgI9TYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGsl-0000000F8Wa-32eM;
	Wed, 26 Nov 2025 14:52:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGsj-0000000F8VS-2tMp
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 14:52:34 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so72107685e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764168751; x=1764773551; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tB73pe6/NtX8eM3PTQbggN9wppvlKOL9jZo7eXvreFA=;
        b=fJn2fT0sCo4uSSlYF/5HhQ2q0geZc7kxcQDKwPD8OL9CqOHvMJ5mew3suUuyVWWNIS
         9pjMjl3+MmHzW1arMqyKnS5JQeQF4w/unPH73stsZ4FG8SztnODf7UDl1n36lWbkB7Vp
         z8YeJx3R93g5AtP4iSLhnGA9NfIV4330WSG0MSNJZZeyKeQ9zUG6Yqnv+EVIKeEjkKBW
         enMc5UuYsIIN/lcD8CaKF5AUpg/WQdDanbxOdsWYaymitO5BVYOBeFoBRj+/b8qwc7Zp
         VAOIGYouuO2DUTG+AHuma47O8t8ceHmGQT+XXt065w5cZxKEaoyTMICVIq8+MVFFdfF9
         b79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764168751; x=1764773551;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tB73pe6/NtX8eM3PTQbggN9wppvlKOL9jZo7eXvreFA=;
        b=OrszsWBO9lOjT43FVQ7m67XxxqvcYD6BcZph7rU4Mty+l5UmhzWS8dyvDKQO2evcTm
         YgVxTth3K4AURsK5o6ljqro9tLFIALgj3djgUBdOD4WAnJ2UYZ/ZukdmtgR8YkjKiW9T
         LZo8l/Z7HL5n+jcM9HUOCPf0E++LN4++tXZ032AHOimg90Mo0YrfHZ46F61mYTk9MIRB
         4BYVbPYXbTsQwg3xo1x6Mi1UYw+EscgpgA8NAkDqgir4l7UZlTYblFysXFBqOXP1g8Dg
         XKjo9jqarLLJ+AjAw/11FBnH2zkcPQAFGeF9O+3r8Dw6Rx9S8WVGztuFEJDBZ9a5UOOl
         g4Sw==
X-Forwarded-Encrypted: i=1; AJvYcCX88fJ2sm3MYrSAMMa0cCCO+sEIvrPC7eZeJINCCdgIL6qZJTMdIcCIkqsJOGxpKpJgREovmJNShDgHF5SgFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjWIjSIUWcsDWq0HRlesTqrIDvoS3UVDh31kTsAY1qiUAqdZKc
	EZSYtEYdTb1A3P0xYazhCKFAVdw5bgQkknPsEBd3IYGWVgX4g7fhjz9uctncPPNKFtk=
X-Gm-Gg: ASbGnctoY+8gELv2QvPMSnTAl3riKUSnK0YMaGwtsCBnKXT0dQtKffxkhivo1S4Io+t
	3c1eJUIsn4zH4d9WIj6ghO+RnbfJNqwMH0rdZxeB8MwHhhztEnjpOdqrhWaP5jrqSOzsmHDoxLz
	sH2JpKqG/IBh7xxWuHjDPP7Ua6rYf0H734IbxHli3RO/Zf3koexC3Msv1lh+qCRu4WKgRbHyVi8
	uorGGRbAup2yMWrebMC/B90bsKD7MlmKxsIKgHgbI/L5TSz1gmIc2zuFZfSAmhxA6kEJA+bhu1v
	GEyKoMgqBrSqPxIMIAvOBJTk1QFo3e2zvKsjzT801oiqHmcOmxH/ivFh1sDn9NDw/yhGSIxffwp
	BTl8fEj9AWuWjfQhx7kcApgECMhxP0D9/8Po95O8sqx6QnL27jOILkqnG0GczN5TaqPGeyXx3sK
	Vw9VAiQKMoiSaT87E=
X-Google-Smtp-Source: AGHT+IGCLmd8tRJyaKxnoPAOY3teB1a8/mQwQE4e51HEL7L4ZyHqrgXF4lwoEPkRwuQbHk3YrwrBYw==
X-Received: by 2002:a05:600c:8b37:b0:477:9cc3:7971 with SMTP id 5b1f17b1804b1-47904b1ac02mr55156645e9.20.1764168751196;
        Wed, 26 Nov 2025 06:52:31 -0800 (PST)
Received: from localhost ([41.210.159.101])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7f2e454sm40974088f8f.2.2025.11.26.06.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:52:30 -0800 (PST)
Date: Wed, 26 Nov 2025 17:52:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cyril Chao <Cyril.Chao@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8189: remove unnecessary NULL check
Message-ID: <aScUKqCEhSIZoOmg@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_065233_748004_170CA3D4 
X-CRM114-Status: GOOD (  11.93  )
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

Smatch complains that the call to snd_soc_component_get_drvdata(component)
will dereference "component" so this NULL check is too late.  The probe()
function will never be called with a NULL component pointer so just
delete the check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index dcee8e11eca8..166ece74270e 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2352,12 +2352,10 @@ static int mt8189_afe_component_probe(struct snd_soc_component *component)
 {
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
-	if (component) {
-		/* enable clock for regcache get default value from hw */
-		pm_runtime_get_sync(afe->dev);
-		mtk_afe_add_sub_dai_control(component);
-		pm_runtime_put_sync(afe->dev);
-	}
+	/* enable clock for regcache get default value from hw */
+	pm_runtime_get_sync(afe->dev);
+	mtk_afe_add_sub_dai_control(component);
+	pm_runtime_put_sync(afe->dev);
 
 	return 0;
 }
-- 
2.51.0


