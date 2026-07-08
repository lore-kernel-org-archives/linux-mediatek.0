Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12329C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=; b=yNy/NAL9776v0qITKNS/5eYLbQ
	aMfyll8QIUFNelOwfjVOUOcdebaOEw0nTIGE3Y3NTtajaJV5gAqS7Q0Irpfka26aY6F8VLQdOR92j
	K8+pxHFtEP0wcd2E2qVy8jvAhSEi3VjXaGd7xNsuJt/cOGWjTM/IsgvtWO9w85m/mJxMYsngAoHFT
	FcfVWgCj+0M9n5FeKs5sF7ObGkJ1iXFs0yjqaOTqrKHPZ5lmAvan0hJ7/2wsTJbWhZ+VZbvS0In6t
	a8Ek83dUWLOSpjvDJhcKj11ociPaEgjlrByJ2z4W0+wBZg5turmpRVhQU1gKDCotYTuCpPSuf5mXZ
	G3qTYgeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8G-0000000HGq2-0rjw;
	Wed, 08 Jul 2026 14:20:12 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8C-0000000HGma-30xU
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:20:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ca70925c25so10397235ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520408; x=1784125208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=hvv8BH7RX09wp8EM9gAKFhiBWRah6GTPX/XMcrvspwcDptcXtMmY4AnBrizZDu7eXr
         EewpTFgTZP1IRUiVZYEgSEE+gPimQISR1yCiSr+oJSKCKbdqHwzwA7pEYjowSfgscPa/
         sCkZuB39QnF9vBdo6LLUUatNsbkzXVhJOy8gq+8PXep95T35kucqL7AUF20Q5RL33gS0
         66PbWGu5DZXFRf2tFu37ckYqPZj4kZZIyygdJKuh6xG30NIoQ5UmksPpvG3iEEQ9TD67
         VDFYL550braUp5UgIceYdmHMuBB0hB+8hSsjfd3S1/YBh3Ka8ovfPFUMmQ+JwZ440rMd
         LEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520408; x=1784125208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=hPvQV8IylEQDUqERu+b88mU/a0s0GF6PcyDaztL4AkNVXNoLHp/NV2TkcLNZPRPiei
         ck8D3Z5Fq3tokartiOwF7a9NlT01Af6hihrOkItWT3PAjprwuLbk7SOHdXgcxjUeHpr2
         b7lB/QhUI45P/nr4PZKuDS4ZveTQyQTEILoYR4sSUswvgdco7yslqTaHKkQsoxrCOyTd
         pmbZQH1NkczMXkIOMFRqBmUuYJU0bepm57oaVbUZvkBTM2kAk7KuDtHK9ZKJPTzZxSMK
         nQzbojnWpikiYLVhi2lnoNkrQqLu4gFy/Qvx53vwzUHCYy6Uaygs8KdqGPzOH60DTnBO
         GETQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6J9ObCC4120hc84CzUsiwiGLqVXHSF6fXv6w2BQ9t9NUc0bIcX8BDwKLrwbfRJlZI0zmTQeFo541A/fJrmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz5NzPXQGAeZIIHvPciP9J7Von2sF2i1gNz02jkmUdX5wggsN3
	W7+1+wjbHxI1iDyTb+SxYNzU8J+qh2XJ4HWk6MoXbGN9zOeXMva8eXmc
X-Gm-Gg: AfdE7clRGsV1jHQLrHnmK/vsRfdhDbqRJCUXkHBq+gMelLLFBvkEtPtLl9ptDVC/QZx
	j27hpKJTu+4gF61MrOSRoWc5N3CKG7xsJf6binjWDaxX4yM3yHTIepKmjJKrbI1F34QEoehyFZy
	pYry+AwzsBa0+YAqbQzLWzlDvk4yO0r795Ry153nodGwg8qllzFlr0Dy8La1+l7CF+5/BRIccDa
	9IKl8XFpwwuCd7V1Tge8lR7iErK6t9AYRNs/Onf2VKTPtEcCdjN+rwVrPtVx/TMlYCqTZXszaMp
	kc3s1rWNONf6HXyA0AB3/OMO76c/whgnX4kn2JEl4YYEPKJQhskgvKKjBHSmsdCnx8898yotrkm
	WJz/eMfgzSjRtt4BqGxVOtXCrs1NfIk1RvFcERKeJjG9yMqa2c8hJFn4OHMdwt2FfmuUiu06Tgk
	6nirZuQr+H7zosKzaRwQESpD1PoDVkA0YHqAC3LDCM+xNSc4CbZB/Fc/5pyA==
X-Received: by 2002:a17:902:ce82:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2ccea3a28e7mr30636245ad.43.1783520408022;
        Wed, 08 Jul 2026 07:20:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 08/27] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:15 +0700
Message-ID: <20260708141734.578926-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072008_920890_926A62B7 
X-CRM114-Status: GOOD (  12.20  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/hdmi-codec.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13ae9e83bc21..bc2c22436ba6 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Jyri Sarha <jsarha@ti.com>
  */
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <sound/core.h>
@@ -452,31 +453,30 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	if (!((has_playback && tx) || (has_capture && !tx)))
 		return 0;
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
-		mutex_unlock(&hcp->lock);
 		return -EINVAL;
 	}
 
 	if (hcp->hcd.ops->audio_startup) {
 		ret = hcp->hcd.ops->audio_startup(dai->dev->parent, hcp->hcd.data);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	if (tx && hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
 		if (ret)
-			goto err;
+			return ret;
 
 		snd_parse_eld(dai->dev, &hcp->eld_parsed,
 			      hcp->eld, sizeof(hcp->eld));
 
 		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
 		if (ret)
-			goto err;
+			return ret;
 
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
@@ -484,8 +484,6 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 	hcp->busy = true;
 
-err:
-	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -503,9 +501,8 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	hcp->busy = false;
-	mutex_unlock(&hcp->lock);
 }
 
 static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
-- 
2.43.0


