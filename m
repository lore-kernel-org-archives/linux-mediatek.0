Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D96CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 10:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwK8VBg5mhUKIoR2ZpQuKpCqhgCKrAbRlRpszsndm90=; b=C0gSFy6ja/bhAFdG1yTOaLsItj
	KmjaYujCLIYHriUALYLQc5M391F+ySJpKgGJtXDdF+su5Bc0e7cznvOYYDZJBpeOxlohLvZATmXu9
	RXuW6gsx+++MU0+zLbe+avdBH6ssiyMFTm+Yjh0Q5ebYkVyDAtVyDcLjOE50wVL5okBxhA70IqqJq
	pYfL4oN0H4n5JkwrbBts8LAp5T5ORI8kjwR3ugPwSfGpiX7OHOpe88errDPxJt4fYiNvSHVpn46tz
	VXNHB/UK2jw611L4+hJQJHWF+cYOtmAN0s+bVX+wGNHhPfvqg06pb5DszFUbFEVa/PYJGVce1ZrUw
	DGacex8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZneX-0000000H7Ep-2k6w;
	Wed, 17 Jun 2026 10:37:49 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZneU-0000000H7CT-21Yh
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 10:37:47 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-30b9e755555so4897744eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 03:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692666; x=1782297466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwK8VBg5mhUKIoR2ZpQuKpCqhgCKrAbRlRpszsndm90=;
        b=OrK8UVEa03w2zKxxWW/GLWCAG+HpAUGFUri+/TSbbmeJRd9bEHSp2vnDtCwBiYFbg9
         2F3oB3PQD9gLgME9MzPWUK4r+IBnhWf8TLkB8rz/OigoS0ZQG1oU2db4xYMvTjymZ0H5
         y2uzS6TGPkwUJ0I+vbcKaQzTRwqTlmlGz+Ee2J2T7xor6Cm8aPLaL60Y0K/viRcCAhdQ
         vDd82yu3+iNwWT890rL8bBayv8jVxWm7LTcDTuLNYAE0nHJmfrjfkcapLAGqnufgvqzL
         YC4gkVqrWf0cGZ7icPQXqg6bI69N0PuQnFI9wcVEBbBpsDxvZkK9h9qWhKuzY0Gv1n4z
         X8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692666; x=1782297466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qwK8VBg5mhUKIoR2ZpQuKpCqhgCKrAbRlRpszsndm90=;
        b=KoLvEPBlcav6T4R6TTCFzwkMGilQ+9fe4x1MTqAuq7txaHLvi25pzmipv2/hG2atNs
         0Yd79A/QhON+YaRAAYSoDmwdclwSvIM89dOhfpQuXrYZPscAnU7grDOsI8WsAZyEiQDb
         oiTPU2mXQN9x9373HK2IQdrP7ctuUdl3jXY8bKUzvLucVPUD2715MEWMKjUkwb7OJBC0
         8J4SMo+pVKTcgIid9yV3PWiewDrTklMlbXWTrDryaaqj4acweTUex2cDu1clHbi7YbBP
         p2HEcgM2LqJ5z5HqnFuNFy+lWtSud9vbUR08m0iRgaADE5Pe72oP/kwO7NvLJO+929Yv
         9P7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+7XqjNWsTgk0UDM3wn9+woHBbcXSY1Ktrbf6+Vgip8tLqDP+HO2FPef4gI7cMewjF2Lk5msmaHdrtBk1dnZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrxZlTEMp0T6My8JwucfV9J+hV7ajJi6/ILSJ9I26UMGLnLzlk
	+Nqtchxjoe4UZJFAYatAmqnvVPf89LC8ZaQ8s11+qIiob0NOqhfIlseR
X-Gm-Gg: AfdE7cnln8+9WrDvO3owPaTK7txkqIsucCNoGT0M5/9NGkJpKSzQk3oYXbrb/S/hZLN
	tFkM3ySyuUZhDxhegIK4zcmqQ3aGnc/gqDby42VGnAvjhfDo37/JPn17xQxhTeSkMCIXMcFXqtd
	ImCh6BuZyOe5MgRLl/di8r8GbXZYeFdDVPIeSRoSopH5tl9AUnRCXjOTw7gfOXusrDx+io45/kN
	iRlvuOuzSO3DbK78J2ADch0U7jy0BSPVQN2OB2vew2G+7ZtjkVgEQZdzhRiDyrZmiDGzGR/vEvt
	N2vXZJUoUcxguo31SNYMkGFlRBEQ87gG0VZOHvKGWPIKXispxH/U4wW/mCmGm9vJNzHNsaMfU1o
	DoMujwvSSlXyQSKSLkyMqvlUu7JaRJwHEa3gy8/G0q8YAOa5JmwNNEW7DHtIMIz/KqHitt3v3kP
	AN3L4gjJRqWJ4bCOFtQlDlOzPrL5WvoEh0PCb0vGtALKiBF4I=
X-Received: by 2002:a05:7300:a945:b0:307:91f9:c1c1 with SMTP id 5a478bee46e88-30bca08cc96mr1666554eec.25.1781692665702;
        Wed, 17 Jun 2026 03:37:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 31/78] ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:48 +0700
Message-ID: <20260617103235.449609-32-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033746_538630_CE5FC119 
X-CRM114-Status: GOOD (  15.17  )
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
 sound/soc/codecs/hdac_hdmi.c | 116 +++++++++++++++++------------------
 1 file changed, 56 insertions(+), 60 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 3220f9226e0b..eeca901aea74 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -537,10 +537,10 @@ static struct hdac_hdmi_port *hdac_hdmi_get_port_from_cvt(
 				continue;
 
 			list_for_each_entry(port, &pcm->port_list, head) {
-				mutex_lock(&pcm->lock);
-				ret = hdac_hdmi_query_port_connlist(hdev,
-							port->pin, port);
-				mutex_unlock(&pcm->lock);
+				scoped_guard(mutex, &pcm->lock) {
+					ret = hdac_hdmi_query_port_connlist(hdev,
+								port->pin, port);
+				}
 				if (ret < 0)
 					continue;
 
@@ -640,11 +640,11 @@ static void hdac_hdmi_pcm_close(struct snd_pcm_substream *substream,
 	pcm = hdac_hdmi_get_pcm_from_cvt(hdmi, dai_map->cvt);
 
 	if (pcm) {
-		mutex_lock(&pcm->lock);
-		pcm->chmap_set = false;
-		memset(pcm->chmap, 0, sizeof(pcm->chmap));
-		pcm->channels = 0;
-		mutex_unlock(&pcm->lock);
+		scoped_guard(mutex, &pcm->lock) {
+			pcm->chmap_set = false;
+			memset(pcm->chmap, 0, sizeof(pcm->chmap));
+			pcm->channels = 0;
+		}
 	}
 
 	if (dai_map->port)
@@ -922,7 +922,7 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 	if (port == NULL)
 		return -EINVAL;
 
-	mutex_lock(&hdmi->pin_mutex);
+	guard(mutex)(&hdmi->pin_mutex);
 	list_for_each_entry(pcm, &hdmi->pcm_list, head) {
 		if (list_empty(&pcm->port_list))
 			continue;
@@ -945,12 +945,10 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 			list_add_tail(&port->head, &pcm->port_list);
 			if (port->eld.monitor_present && port->eld.eld_valid) {
 				hdac_hdmi_jack_report_sync(pcm, port, true);
-				mutex_unlock(&hdmi->pin_mutex);
 				return ret;
 			}
 		}
 	}
-	mutex_unlock(&hdmi->pin_mutex);
 
 	return ret;
 }
@@ -1274,67 +1272,66 @@ static void hdac_hdmi_present_sense(struct hdac_hdmi_pin *pin,
 	 * In case of non MST pin, get_eld info API expectes port
 	 * to be -1.
 	 */
-	mutex_lock(&hdmi->pin_mutex);
-	port->eld.monitor_present = false;
+	scoped_guard(mutex, &hdmi->pin_mutex) {
+		port->eld.monitor_present = false;
 
-	if (pin->mst_capable)
-		port_id = port->id;
+		if (pin->mst_capable)
+			port_id = port->id;
 
-	size = snd_hdac_acomp_get_eld(hdev, pin->nid, port_id,
-				&port->eld.monitor_present,
-				port->eld.eld_buffer,
-				ELD_MAX_SIZE);
+		size = snd_hdac_acomp_get_eld(hdev, pin->nid, port_id,
+					&port->eld.monitor_present,
+					port->eld.eld_buffer,
+					ELD_MAX_SIZE);
 
-	if (size > 0) {
-		size = min(size, ELD_MAX_SIZE);
-		if (hdac_hdmi_parse_eld(hdev, port) < 0)
-			size = -EINVAL;
-	}
+		if (size > 0) {
+			size = min(size, ELD_MAX_SIZE);
+			if (hdac_hdmi_parse_eld(hdev, port) < 0)
+				size = -EINVAL;
+		}
 
-	eld_valid = port->eld.eld_valid;
+		eld_valid = port->eld.eld_valid;
 
-	if (size > 0) {
-		port->eld.eld_valid = true;
-		port->eld.eld_size = size;
-	} else {
-		port->eld.eld_valid = false;
-		port->eld.eld_size = 0;
-	}
+		if (size > 0) {
+			port->eld.eld_valid = true;
+			port->eld.eld_size = size;
+		} else {
+			port->eld.eld_valid = false;
+			port->eld.eld_size = 0;
+		}
 
-	eld_changed = (eld_valid != port->eld.eld_valid);
+		eld_changed = (eld_valid != port->eld.eld_valid);
 
-	pcm = hdac_hdmi_get_pcm(hdev, port);
+		pcm = hdac_hdmi_get_pcm(hdev, port);
 
-	if (!port->eld.monitor_present || !port->eld.eld_valid) {
+		if (!port->eld.monitor_present || !port->eld.eld_valid) {
 
-		dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
-			__func__, pin->nid, port->id);
+			dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
+				__func__, pin->nid, port->id);
 
-		/*
-		 * PCMs are not registered during device probe, so don't
-		 * report jack here. It will be done in usermode mux
-		 * control select.
-		 */
-		if (pcm) {
-			hdac_hdmi_jack_report(pcm, port, false);
-			schedule_work(&port->dapm_work);
-		}
-
-		mutex_unlock(&hdmi->pin_mutex);
-		return;
-	}
+			/*
+			 * PCMs are not registered during device probe, so don't
+			 * report jack here. It will be done in usermode mux
+			 * control select.
+			 */
+			if (pcm) {
+				hdac_hdmi_jack_report(pcm, port, false);
+				schedule_work(&port->dapm_work);
+			}
 
-	if (port->eld.monitor_present && port->eld.eld_valid) {
-		if (pcm) {
-			hdac_hdmi_jack_report(pcm, port, true);
-			schedule_work(&port->dapm_work);
+			return;
 		}
 
-		print_hex_dump_debug("ELD: ", DUMP_PREFIX_OFFSET, 16, 1,
-			  port->eld.eld_buffer, port->eld.eld_size, false);
+		if (port->eld.monitor_present && port->eld.eld_valid) {
+			if (pcm) {
+				hdac_hdmi_jack_report(pcm, port, true);
+				schedule_work(&port->dapm_work);
+			}
 
+			print_hex_dump_debug("ELD: ", DUMP_PREFIX_OFFSET, 16, 1,
+				  port->eld.eld_buffer, port->eld.eld_size, false);
+
+		}
 	}
-	mutex_unlock(&hdmi->pin_mutex);
 
 	if (eld_changed && pcm)
 		snd_ctl_notify(hdmi->card,
@@ -1795,13 +1792,12 @@ static void hdac_hdmi_set_chmap(struct hdac_device *hdev, int pcm_idx,
 	if (list_empty(&pcm->port_list))
 		return;
 
-	mutex_lock(&pcm->lock);
+	guard(mutex)(&pcm->lock);
 	pcm->chmap_set = true;
 	memcpy(pcm->chmap, chmap, ARRAY_SIZE(pcm->chmap));
 	list_for_each_entry(port, &pcm->port_list, head)
 		if (prepared)
 			hdac_hdmi_setup_audio_infoframe(hdev, pcm, port);
-	mutex_unlock(&pcm->lock);
 }
 
 static bool is_hdac_hdmi_pcm_attached(struct hdac_device *hdev, int pcm_idx)
-- 
2.43.0


