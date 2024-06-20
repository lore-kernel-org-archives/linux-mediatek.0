Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A41C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rDZlI2yZ4wi+UH3k0wT+hmOJJKg/VzbaB//Srify4c8=; b=T4BnOS0cL97K1U5SEijvbBcwRU
	G2gc4UERVqXn/X0JCbYrPPSAb+5Uf+T1IsDndFzI+Ye2gnEyIuD+Y062k14dj0Mo5Xh1z6Cic7VzK
	XpyHxi3ntIjKwUfh7/APE8POUpXmK3lug77tPYLuhjM0jHgViIPGANtdxt+X0iPkturOr6/u26laz
	bTLsCUlDibzOGN6ojEFAumCGHg/6nQ8P7J5vzdkAU1dUDlYgXn4y9D+cRyjR+qIpvBnxCDuEWT2OU
	YR8EmB2JcplUpReUWWmbtVT/GmQ/9xdXCy774SEw9bb/Nb7qO7Wgxshrw7mD/4F1rMxLZs/F7zGxK
	NePTMydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKE2w-00000004MsX-2fC5;
	Thu, 20 Jun 2024 09:25:34 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKE2u-00000004MsB-2Ndv
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 09:25:34 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-70435f4c330so645288b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 02:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718875531; x=1719480331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rDZlI2yZ4wi+UH3k0wT+hmOJJKg/VzbaB//Srify4c8=;
        b=BiiCUTDozsB2I0WSOYwInIukKovufC1DdhF2NCPQCUjh9nKf5aBrR6o8yuilxe+VmR
         UekYgob7vMMp6X6t5yULa/pNVAq2UZbe5KbSoeGx9PeEiQLh29Y+rsQ4ed8028+v7/EL
         qAGVqM3gJoBM8MbQ+x75rPdCoce6M5QI/nmEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718875531; x=1719480331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDZlI2yZ4wi+UH3k0wT+hmOJJKg/VzbaB//Srify4c8=;
        b=LTXJmMvkhpqn5ySeoFycVrlWWRKSTyd2Cv6ON5NU0cOy54ul17kPgKD0vgxVKhrZVa
         32wUdXzczN7jpdXBJyHvjoWpYPkO7mwxio4lrTf0KWQaCyme6Pgvm1K5QgohlFFfzKv/
         LpnIcjh7Rls1ucNcMp6Cl7rmnyoVZ6dNMFy9+ivBQ7l6DSQ3A091nj0Vs4L+/hHNiM0O
         o/gCx/bGZHVoZZVw5uPLXhQgtyE7FVcDflP5/cyE3DFcGsoVDVnFJLr/cT2ec5wQq3/Y
         lulKA0sLM69jDMSueabvXu6YZqYW3eyCxygtFoFW2kTl3nPXWv62XUFveOPx/UGEDr6B
         sU4g==
X-Forwarded-Encrypted: i=1; AJvYcCUOlOt/g+eQCQmJIGQ5BO99la81D+x5PRrvKjfsvFHB694MhkE8zSkuMirAQUVS2XjmB2DL9jF0RKyScEgRi7iD+qvKQ3XSu4AEQzu+dYabZe+1
X-Gm-Message-State: AOJu0YygRXwh1B73e7Chvlafi2mW3JHdNJXlAuiqoiY9K/+BpM4DKud1
	VwlWmz/Ch/f//7VoamDHGxjcC/QzArqtNR2a2kYCt78WZujnc8M9IIVntf8nAg==
X-Google-Smtp-Source: AGHT+IFjLrlNvst0OTexBZLhq72UApS8umR+VI7cUlAbt/0YeIqLW8EGKxs24IIss6Yf64ZG7G1XCw==
X-Received: by 2002:a62:f90e:0:b0:705:964e:d9f3 with SMTP id d2e1a72fcca58-70629c34f80mr4334277b3a.11.1718875530972;
        Thu, 20 Jun 2024 02:25:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c53a:5326:7f72:759f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ce168be0sm11866412b3a.28.2024.06.20.02.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:25:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8195: Re-add codec entry for ETDM1_OUT_BE dai link
Date: Thu, 20 Jun 2024 17:25:24 +0800
Message-ID: <20240620092526.2353537-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_022532_631675_B52338B6 
X-CRM114-Status: UNSURE (   9.33  )
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

This partially reverts commit e70b8dd26711704b1ff1f1b4eb3d048ba69e29da.

Said commit removes the codec entry for the ETDM1_OUT_BE dai link for
some reason. This does not have the intended effect, as the remaining
DAILINK_COMP_ARRAY(COMP_EMPTY()) platform entry becomes the codec
entry, and the platform entry is completely gone.

This causes in a KASAN out-of-bounds warning in mtk_soundcard_common_probe()
in sound/soc/mediatek/common/mtk-soundcard-driver.c:

	for_each_card_prelinks(card, i, dai_link) {
		if (adsp_node && !strncmp(dai_link->name, "AFE_SOF", strlen("AFE_SOF")))
			dai_link->platforms->of_node = adsp_node;
		else if (!dai_link->platforms->name && !dai_link->platforms->of_node)
			dai_link->platforms->of_node = platform_node;
	}

where the code expects the platforms array to have space for at least one entry.

Re-add the entry so that dai_link->platforms has space.

Fixes: e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component and rework codec link")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index ca8751190520..2832ef78eaed 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -827,6 +827,7 @@ SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
 
 SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
-- 
2.45.2.741.gdbec12cfda-goog


