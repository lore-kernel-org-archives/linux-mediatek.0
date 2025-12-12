Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24F4D4336B
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Dec 2025 04:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QW5cVIdovQWDv+bqBSbnBeQJjt2jpyUHW2uxiLg7ptY=; b=OvwUtuIA5SDvc6fpkr9mAzTJmP
	UNuitt76pnYbZn9dvyI16KmbbvfPdu1bLq194nqyzw/tfUTpscp+icZuEx6zlLzfn0Ik4EWPcRyhf
	rjdJ0L2Qxq7WKUI147UwwvrV88aNFhbjreM5qxCj9Nr6dRVoJD0jkdPdMoLDVy8SF1HMarb94lB4Y
	R4IRoV2vRYjc463b/pMG3Q8himSHp6cSYEkRB5vobG18qLlOpGLXc0fFKG52HbUdL0sNV2vKeTgbS
	1wFJo8trqLgpXzFpkUvu9raPlUUjbNZfh0mkfmDubosWRu/yWT8lf84JmQTZ3V4kjDrHQLU6yvxLh
	59ryiuuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTv2G-000000005DK-3wBH;
	Fri, 12 Dec 2025 04:45:44 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTv2D-000000005CA-3esY
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Dec 2025 04:45:43 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so504458f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 20:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765514739; x=1766119539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QW5cVIdovQWDv+bqBSbnBeQJjt2jpyUHW2uxiLg7ptY=;
        b=PtpYkIH1lq13YMSKzXLDi2a9pwzFqjTmHLBE4gboqC/nzBAkVTQDIWcd9R7menyR2w
         2nk4rsL8PJJ0uqJTb8rMA4Bqw5ZgZgWWocnWqssz1UjEkN0ZC7XtNKUuOyEGCgLcCOif
         OTc0E0XF7gVyHsdwlLdmGGLEeUd+zn2Ei6z4x42JgYHh+Bwl8Q9Hftp8CDel3bHwDrzZ
         5mNRLV+4d2iaciRkU6azubyWXzlTpuzIL9UOOa59RI3F6fakxnq89tc4AbvkuQq3Duq4
         sGtCwFIf0mCoVbzXd4eizfYWgP6zez6PJx8O1b5SuMICDhoFR2AzPUAhB0t5PXyC96nF
         caBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765514739; x=1766119539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QW5cVIdovQWDv+bqBSbnBeQJjt2jpyUHW2uxiLg7ptY=;
        b=au1xDwORkuh06c07wEfeXIt34NDU4J6jdg6jeYc1vZ+Zxvn2Z3aO4XE7Di12VsLjBh
         oqD8E8tUbISgbtWlY5ct+BKfHcV6SWuMXV7YMZO5BQkMFbSC2uUc3NhF5uIWA5DHZdnf
         nEPqfzfh0RJTPVdyoECZBMHNZ4LviN6MJLZgFpxcX9QKCgyr39jgUAadEwcNSSKyZndv
         XYZn6+UtIO/HHuNVBsR5jKTOSqF8mljv97xrATWrJlMyX1JQMBAAuj6Mdg1ZrENqQcJZ
         5LAse2an/2Ya88VmYnCAQBSzCf166ek0NYD6HEHZLQLiSogaN6OOOEPPgk2omZ7vFKzp
         Bsxg==
X-Forwarded-Encrypted: i=1; AJvYcCVtFb19aoTsZiLAemEOkFnPLQ+WmZwSbQA4SOt3QJgPvepRcRxlsaUB5bielMVX6dZu5lwucCgTaDoGKLvi3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXPFbbxQVYqxJtN2n4/9akipgCX4XK5YbgX8BdI63vA25v7Kmc
	njdGDINmN4UmLe6AgSb10WUbVCvyvq7l9R51MbkFHytP3WHBwtoVOmRl
X-Gm-Gg: AY/fxX6Uko6hFP02Lm7lJqzWCrYS+m+z4+d8SSo3XHN0jEoR1omRSYWRdf6S3ovZZ/f
	9srCsGWRtfVqj+2x+EU1zPtv6zJ71CjfaJRVcge9nC/7tNbhm4M3IU1xI4DecGuA9jTzWUFzCv8
	t7omKdt0EvMXTDokQ+agstn4x1V/5nMcxXYHm88oTSJ5wNmd2RNNhsEhRdGq9jCO10gmAVtsEhT
	up8a1ZwoNPbQiuDnq5KdFJt++Wj3aIeoHPckISKerSJWg3WtBYO8bEiJLxNW2OWqgN0HU1eT85G
	dRBqgGOTF/W3+hRjOuXnIiEoCDDK4RQ7bRwEoo0a4bLvWzE9L55mog4VDouNbEdmXd5wPxZ1So7
	qYIvjc55TSmsZNZuDv8vRtj0afMWrJT40gEYNcSRQYlbbL16VRCRwUhgOdWVMmsWInqEh/p1o0m
	igHTHGzVH+YdloyQ==
X-Google-Smtp-Source: AGHT+IHxEK1dPtN1EkZbAF0nXgZC4Mys7ot/TMtb/qd/CFD63zDMK/TbKWYGp7RBSHzfv3pozTJ40w==
X-Received: by 2002:a05:6000:24c5:b0:429:8daa:c6b4 with SMTP id ffacd0b85a97d-42fb44d402amr567209f8f.21.1765514739163;
        Thu, 11 Dec 2025 20:45:39 -0800 (PST)
Received: from gmail.com ([147.161.143.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a665e3sm9861822f8f.6.2025.12.11.20.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 20:45:38 -0800 (PST)
From: hariconscious@gmail.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH RESEND] ASoC: mediatek: mt8195: optimize property formatting error handling by using scnprintf()
Date: Fri, 12 Dec 2025 10:14:09 +0530
Message-ID: <20251212044408.1286-2-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_204541_933898_D3590F03 
X-CRM114-Status: UNSURE (   9.19  )
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

From: HariKrishna Sagala <hariconscious@gmail.com>

Replace snprintf() with scnprintf() when constructing the property
and remove negative return error handling as scnprintf() returns the
actual number of bytes written to buffer.

snprintf() as defined by the C99 standard,returns the number of 
characters that *would have been* written if enough space were 
available.Use scnprintf() that returns the actual number of 
characters written.

Link: https://github.com/KSPP/linux/issues/105
Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
This patch optimizes the error handling part of property formatting
using the scnrpintf().
Removed the error check ret < 0 as scnprintf() doesn't return the
negative value as per contract.
https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.scnprintf

Thank you.

 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 44 ++++++---------------
 1 file changed, 12 insertions(+), 32 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fd4f9f8f032d..77c58c9ec3e2 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2652,14 +2652,9 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 
 		etdm_data = afe_priv->dai_priv[dai_id];
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-mclk-always-on-rate",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-mclk-always-on-rate",
+			    of_afe_etdms[i].name);
 		ret = of_property_read_u32(of_node, prop, &sel);
 		if (ret == 0) {
 			etdm_data->mclk_dir = SND_SOC_CLOCK_OUT;
@@ -2668,24 +2663,14 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 					 __func__, sel);
 		}
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-multi-pin-mode",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-multi-pin-mode",
+			    of_afe_etdms[i].name);
 		etdm_data->data_mode = of_property_read_bool(of_node, prop);
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-cowork-source",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-cowork-source",
+			    of_afe_etdms[i].name);
 		ret = of_property_read_u32(of_node, prop, &sel);
 		if (ret == 0) {
 			if (sel >= MT8195_AFE_IO_ETDM_NUM) {
@@ -2707,14 +2692,9 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 		dai_id = ETDM_TO_DAI_ID(i);
 		etdm_data = afe_priv->dai_priv[dai_id];
 
-		ret = snprintf(prop, sizeof(prop),
-			       "mediatek,%s-chn-disabled",
-			       of_afe_etdms[i].name);
-		if (ret < 0) {
-			dev_info(afe->dev, "%s snprintf err=%d\n",
-				 __func__, ret);
-			return;
-		}
+		scnprintf(prop, sizeof(prop),
+			    "mediatek,%s-chn-disabled",
+			    of_afe_etdms[i].name);
 		ret = of_property_read_variable_u8_array(of_node, prop,
 							 disable_chn,
 							 1, max_chn);

base-commit: 30f09200cc4aefbd8385b01e41bde2e4565a6f0e
-- 
2.43.0


