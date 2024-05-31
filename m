Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5411DC25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 08:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BMwLestZgmk4mqZillFQkfuSiKmx8+iHR4IW4Az53nU=; b=Z/BWASHePFoW5a/bwhWhW8S4yM
	HZjN53NnoSE8Yz/3e1jDkp2TBWxsjsddhs5mol8I2/gyEqlbA2CLOkRhcws0dEEpUj4HiXuK5uget
	n+5E3fKZEaqWyh5O6jW0QCTePk9EZ/aXYkFAfn+xbOitAicnXx8Ir0Via4DIcEepPMP7SfnHfawcV
	3xy8sJwt7xG+XLXBaNxNjMK1QTC5lu5y8gfXU1IjmfSUSZKKh8EuN8VWrSJJQNvAs2c/Lkt8GDQN0
	yKzgd5SE2x2ebgU7d7ZnHnJ4lMDh4hN3Wp/fjfBpQKEQgm/swjv82oAIHIROMk/KMmQHG5uYLzGA2
	K27Gg7gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCxm2-00000009e0H-29Vj;
	Fri, 31 May 2024 08:38:06 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCxlx-00000009dxa-40rt
	for linux-mediatek@lists.infradead.org;
	Fri, 31 May 2024 08:38:04 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f32a3b9491so13261945ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 31 May 2024 01:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717144679; x=1717749479; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BMwLestZgmk4mqZillFQkfuSiKmx8+iHR4IW4Az53nU=;
        b=FhbFB/3VHOXwDW9R+ruYHZkOIfUFNXgsQM2nCjhs0gS8lzWyqPlhYNiqD3X1kMB807
         yok5wH8WBkPlFpH5jr5dOWITc01HoghZSM6CKrUKxdiCfBbH2W8NGiNBs7MEGgO6YyHh
         mGymVc8vod3zft9p1wqMCP1h59STkbodMDpdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717144679; x=1717749479;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMwLestZgmk4mqZillFQkfuSiKmx8+iHR4IW4Az53nU=;
        b=e2MsJOWnjC2OTlhzuUwZCUZtTfYfAMi/reDKxtKCqYwhEPPbEN9i4CHEL8WAGdPRDV
         1KxkcZwj232YI/2oFdC8WVCAV8IfeMvWo1+H6GAnm4PU4hQHJD2fYKGPSFUayNKJPH/W
         hzMg2K60ZrfQqiDW78M7PWvWLP25SX/66Ex/HRR16eX0IxS2AUCZtxuiWADyG3/3e+/+
         zxLRMySDE5hP7+QzH9K5qbYxxtHBJCLtqZcd09KHoSGZhDam0+eIZlWaQWEqDBrZ5Ws1
         t+tV7PeFkqLKVLakvc23fr00nfxGotlVGCDyfa6yJJF1V5ngHNCA6HFez1rrF/5qR7VW
         5KSg==
X-Forwarded-Encrypted: i=1; AJvYcCX2f3jRBBZgK6Lvrb0i/8t+okuwRyJ1VJuooF8bUg946DhmJ/TF83u81G4n/lLLQ5fUN+VVVKyQDMhxJnPIAQdmN5WxqwZ4L4tSyYdsdIUywQz+
X-Gm-Message-State: AOJu0YzfmOYtvju1nCiP2xzb+4cqwkSD8RXQQIJc4gec5czbJxR4KsBA
	BO7bCKQ2ycL6TNteKS0Uts105BBgj2BRT+ClW5YXcf22xSyslghc93s2kbIYFw==
X-Google-Smtp-Source: AGHT+IHVF/CjYv1gYu9lVMBUNy41C2j/6h4MXrfx+yak3WHwDeUdVuFOe+Oz/lM84SJ3D8ebAql2BQ==
X-Received: by 2002:a17:902:c403:b0:1f4:ac56:3d15 with SMTP id d9443c01a7336-1f636fedfbcmr13329195ad.15.1717144679140;
        Fri, 31 May 2024 01:37:59 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (198.180.199.104.bc.googleusercontent.com. [104.199.180.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240379fsm11057545ad.252.2024.05.31.01.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 01:37:58 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 31 May 2024 08:37:54 +0000
Subject: [PATCH RFT] ASoC: mediatek: mt8183-da7219-max98357: Fix kcontrol
 name collision
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-da7219-v1-1-ac3343f3ae6a@chromium.org>
X-B4-Tracking: v=1; b=H4sIAGGMWWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDU2ND3ZREcyNDS10jIwtDAwtTC2OLRFMloOKCotS0zAqwQdFKQW4hSrG
 1tQABn+CFXQAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_013802_021550_B748A762 
X-CRM114-Status: GOOD (  15.60  )
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

Since "Headphone Switch" kcontrol name has already been used by da7219,
rename the control name from "Headphone" to "Headphones" to prevent the
colision. Also, this change makes kcontrol name align with the one in
mt8186-mt6366-da7219-max98357.c.

Fixes: 9c7388baa2053 ("ASoC: mediatek: mt8183-da7219-max98357: Map missing jack kcontrols")
Change-Id: I9ae69a4673cd04786b247cc514fdd20f878ef009
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
This patch fix the kcontrol name collision in mt8183-da7219-max98357.c.
Originally, the "Headphone" kcontrol is added to meet PulseAudio's and
PipeWire's needs, but that patch was untested. Since I don't have
either setup, I wonder if someone can test this patch.
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index acaf81fd6c9b..f848e14b091a 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -31,7 +31,7 @@ struct mt8183_da7219_max98357_priv {
 
 static struct snd_soc_jack_pin mt8183_da7219_max98357_jack_pins[] = {
 	{
-		.pin	= "Headphone",
+		.pin	= "Headphones",
 		.mask	= SND_JACK_HEADPHONE,
 	},
 	{
@@ -626,7 +626,7 @@ static struct snd_soc_codec_conf mt6358_codec_conf[] = {
 };
 
 static const struct snd_kcontrol_new mt8183_da7219_max98357_snd_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headphones"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Speakers"),
 	SOC_DAPM_PIN_SWITCH("Line Out"),
@@ -634,7 +634,7 @@ static const struct snd_kcontrol_new mt8183_da7219_max98357_snd_controls[] = {
 
 static const
 struct snd_soc_dapm_widget mt8183_da7219_max98357_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_SPK("Line Out", NULL),
@@ -680,7 +680,7 @@ static struct snd_soc_codec_conf mt8183_da7219_rt1015_codec_conf[] = {
 };
 
 static const struct snd_kcontrol_new mt8183_da7219_rt1015_snd_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headphones"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Left Spk"),
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
@@ -689,7 +689,7 @@ static const struct snd_kcontrol_new mt8183_da7219_rt1015_snd_controls[] = {
 
 static const
 struct snd_soc_dapm_widget mt8183_da7219_rt1015_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_SPK("Left Spk", NULL),
 	SND_SOC_DAPM_SPK("Right Spk", NULL),

---
base-commit: 4a4be1ad3a6efea16c56615f31117590fd881358
change-id: 20240531-da7219-2281085838a5

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


