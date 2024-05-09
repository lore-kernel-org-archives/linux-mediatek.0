Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D978C10F1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 07:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yFIJqrgUYRufZO44ifi0BeHH43Pj5mRVkX8VaE4POmU=; b=uqoUOF/un+Gvu+w9E4PyXwENNJ
	2N9cPuDdrYVuvcQsrLt+eOaryJWk85LaiEfgAG5Fz8hItz/41fcu0F13oZ52QRFqassPL5Dhs7go5
	2FsE/vlGvMAbvhSRP4MJijlpFt2GbBK+40iCsDOD831SOB6ZsVtc8xxIgqnG/XQzC3e69z85xt+RD
	wSiwK6uTpi53eas+468fYxJMzAa+/rPwPVmxwQXa7PU9xQ1w2YszUj2Fekk6zF/a39cKuBqHFJuYS
	yj3ITuZEIKrP4YAL8jwt1/bM843r53bF8vuKbPmXwp2/vFzDPJhWGUvJXcrVlZbXWzLIG/xThj7Sa
	xT4Wcylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yFj-00000000hFF-06OX;
	Thu, 09 May 2024 07:31:43 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yFg-00000000hE8-03y4
	for linux-mediatek@lists.infradead.org;
	Thu, 09 May 2024 07:31:41 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5b2761611e8so87389eaf.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 May 2024 00:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715239895; x=1715844695; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yFIJqrgUYRufZO44ifi0BeHH43Pj5mRVkX8VaE4POmU=;
        b=R4ktheX6kJw8y4n+Nj1fH6uOa9iYMac/kiKDOe+iuH9dNYmd84BOuwHZnk5cRk2kcm
         ukkL2IBaPO9/+KPg7hShzBIezx3uiB5EhHyZAJbgTi9ez4/dV4NIN2BvmnkcQM8zPYss
         0mUhqFLTw+SNO/NifFLejAjjvTvdDFqM7NIP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715239895; x=1715844695;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFIJqrgUYRufZO44ifi0BeHH43Pj5mRVkX8VaE4POmU=;
        b=oDg/HY5bghnmOq4qoUzzOtQATYQUFWNrLL63JALGqH0iBVDSnwXB4FXuP1VapYhN3o
         RW+zWNxB//5FjpwFiMbdoVsf3WdQQ+tX5I9uZuzhJ5fIfg/NwKcRkt9AcBr5DLn81+fP
         RstJweE0hTlXZ9AmC9eLLhLBD1N+0qw33vtjhrOX1pJmpyYWf4qXwvQ00OzjEATuxuaA
         dXh8QRgVksjh1AUUQhGH8IP+qcBz+iVfBlljDtowxtCR+npBNeDtDzBAWx/pQsaj6dkx
         L16Adkx5Wc47vLtrxQT/ofcjifqFgInxHwYUa7pAmiQxc9SlGPSvuFI5loAlzdfbe9w/
         8a5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFYAz+jDcYT9FFJ5a15fP5GneAbnvx72zcL9gliK5JmCtHyEANaE2zdr1BZSurb2dbJvVYEQpvYlwxU0zZYDEaRKzfy6M14xEgRoWV5udT+Aw+
X-Gm-Message-State: AOJu0Yw0cdpOCmiBW9fM74tlTrFsL45WmScLwbI541NA5kvXKdx9/Zx6
	eqHh+vImTapII4OgSrIrROsYVf5JB/Pxjrk0EL1L0mQUeFgBDzHK1E6PyJoDmg==
X-Google-Smtp-Source: AGHT+IFxCbiVVPSFIyPcWAzqs1t5rme6BYl/0xBEXZ775m3VFUNpwbdtD+YpUNB1N0N06kSsvGevfg==
X-Received: by 2002:a05:6358:54a2:b0:18e:a0ce:a35c with SMTP id e5c5f4694b2df-192d2c2b383mr578760355d.14.1715239895370;
        Thu, 09 May 2024 00:31:35 -0700 (PDT)
Received: from yuanhsinte1.c.googlers.com (150.221.124.34.bc.googleusercontent.com. [34.124.221.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-63411346d46sm586459a12.79.2024.05.09.00.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 00:31:34 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Thu, 09 May 2024 07:31:29 +0000
Subject: [PATCH] ASoC: mediatek: mt8192: fix register configuration for tdm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-8192-tdm-v1-1-530b54645763@chromium.org>
X-B4-Tracking: v=1; b=H4sIANB7PGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwNLXQtDSyPdkpRc3eSkNKNEc+Nky5QUYyWg8oKi1LTMCrBR0bG1tQD
 PHd/7WgAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_003140_112326_82C741A1 
X-CRM114-Status: GOOD (  12.37  )
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

For DSP_A, data is a BCK cycle behind LRCK trigger edge. For DSP_B, this
delay doesn't exist. Fix the delay configuration to match the standard.

Fixes: 52fcd65414abfc ("ASoC: mediatek: mt8192: support tdm in platform driver")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index 9ce06821c7d0f..49440db370af0 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -566,10 +566,10 @@ static int mtk_dai_tdm_hw_params(struct snd_pcm_substream *substream,
 		tdm_con |= 1 << DELAY_DATA_SFT;
 		tdm_con |= get_tdm_lrck_width(format) << LRCK_TDM_WIDTH_SFT;
 	} else if (tdm_priv->tdm_out_mode == TDM_OUT_DSP_A) {
-		tdm_con |= 0 << DELAY_DATA_SFT;
+		tdm_con |= 1 << DELAY_DATA_SFT;
 		tdm_con |= 0 << LRCK_TDM_WIDTH_SFT;
 	} else if (tdm_priv->tdm_out_mode == TDM_OUT_DSP_B) {
-		tdm_con |= 1 << DELAY_DATA_SFT;
+		tdm_con |= 0 << DELAY_DATA_SFT;
 		tdm_con |= 0 << LRCK_TDM_WIDTH_SFT;
 	}
 

---
base-commit: 45db3ab70092637967967bfd8e6144017638563c
change-id: 20240509-8192-tdm-cbf2a73c9dd3

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


