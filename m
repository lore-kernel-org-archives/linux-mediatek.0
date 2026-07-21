Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DD1C44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxGvcZ0w0B0OvE6uvIZ2A3qQKrxY4MT5FL8LI9fV4I0=; b=4DsrTEbmirISNBMbh9tLHh5m6B
	ZROjB3A8O1aKcevNnvoSAiauSlevbW38ZfnYf2a50H6VwFDCBSvjH2g1cHjp2o+8aC/l6Vts2TZK+
	uB9ftitgLUcbYvMWBEJvL+JhoKQ07PqFkVAXYbMWWirpN8Ecle2EhT5l4/18N96QgzaOa7+jXR/0q
	vxA6abnTsLMkE04VTtE1u94XJp/R+OTrvnsWv/yzNmhrwn1koX3lKVOvtQCHb7x4IYJp8Y3gjFPzm
	/AQiR350ypEYRapsPFJyqrdNa4xO8UuDHP9uZun4sx66YHAo78d/Tz4OLIUl9oQobR7SLbwcws3Be
	W4h01L2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7h5-000000098V4-20W0;
	Tue, 21 Jul 2026 10:27:23 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7gz-000000098R3-0SWn
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:27:19 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ced3386430so74004115ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629636; x=1785234436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxGvcZ0w0B0OvE6uvIZ2A3qQKrxY4MT5FL8LI9fV4I0=;
        b=CVYh21wsq84ZrMw/IK6LMtpZDEfO2/JtLqYDfaJAHmYvqY1boRhc6PMFUonkLn1nte
         DAgoE+U3icSID/oUlW5xVIPLRK0ADnPl2s5y4BYwvLDnwwFvBkzD/LH2AYC8z7ocXRL8
         9B7BNFWinvQxp/cVHECHLjEhfNRjFdQY5x8usBVkbxWHfSaIE5uXeqRocclVAPU4qq6M
         35vBdPQhzLaQ3v2SnwKEVFDcJMwc9uQcUlAd3bOMwxuMmVpg2anG4wsq0nWPC2QVUC2E
         XFbUu+T3vH0flDe8AYweMvowOuhEw2c0BdgYb+Z7yNq8+Wc1jwEqVJURMR+V54fhRCoT
         xtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629636; x=1785234436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FxGvcZ0w0B0OvE6uvIZ2A3qQKrxY4MT5FL8LI9fV4I0=;
        b=qV3FUsJPYr8LU4CFY1HkwKIveDKCyRMGtglLSHgFcQ66ycBckc+jbuXU1g1666bunQ
         uqI6kAIY3PVMHc7K5dLUK23uRL4D3cg/JLqNq2ksvWCOxrE5JJRpeo9OVf93q2oHocXV
         dlxJihJyhoyNpl8Vu0rZep+OkXzMFcjDnM7eGE6Sc4N53VomWYn9UT7OXFnIFjnb+W9g
         DizUJreVhgZB2AJ32LOXD54flVemySn4VHr8GiyMS0/V7Tz/9Q7nTW8gnvwugzvfNQXb
         QMMBSurKwchuJvDXgCE3uOlPeICUvIAgOzF/THtgNEYQnBDUTVcLIHUyvp/yAA5KyyZJ
         2PdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQmPZgwRe0gP/Zghg5hAPKM1sjtP0Gmsx/RGpQg0yzrqa/vkyPKS3BknnCJOW3nYGKXBNUbg6aV2UFl9MxHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Us/6C/X63XVLZ8q3C8NNFiZQjW+p90wStrKk/wZMKgbQuXvv
	IQ5/DXZjZPHGAlsQkLVTiiJwGvB23A93d/gGV7cK37SVt3x0QZOaa2/C
X-Gm-Gg: AR+sD11NwKbKxhX/TnSXxcriSfmXYggD1U6Brt/t2P/oAOde9WtpGtJsi8pWeLyDrwu
	TTTdZv4tZG6mkA9DwfTOkDX/Sz8iEYtw5VX6WMRH+H7eJoh86OFtNiG8n+wuZuZYdH1DfAe1yYY
	Fbim/9Usi0K9kbcxW2Tbv1etuN0IKqv71BSv0BwMRW/Cy/ef86cV8WB1IcotMHhYhwStzf13IbP
	Ybiihca0ZBg5jtUqH66uRRMXtjvsqrwdMCRBlqhWnKxx00p0AcipVACqFQIYGpH5/u4Me69lOQA
	KdNoPwWJN33TBlqBVflzmbc4ekkWnCGP8+vtGTwRBMvdTKzmK/ugE7/uWFfIyg7rzPwkD/wHPuS
	PspLwcSwxjjVYmicIqNtJDzMlEDKJKhNamYae67ZayMe55EDeuShoAxY3TI7sGTIAQnedqwL+RH
	97LiBzLperRH+G/unEaj+b3/pG1ZPqOcfGRFQfj8foCgNFJKY=
X-Received: by 2002:a17:903:181:b0:2c9:97a9:2098 with SMTP id d9443c01a7336-2cf349fa514mr192693585ad.44.1784629636326;
        Tue, 21 Jul 2026 03:27:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:16 -0700 (PDT)
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
Subject: [PATCH v4 07/29] ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:38 +0700
Message-ID: <20260721102600.523199-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032717_173616_BF1B77DD 
X-CRM114-Status: GOOD (  17.04  )
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
 sound/soc/codecs/hdac_hdmi.c | 117 +++++++++++++++++------------------
 1 file changed, 57 insertions(+), 60 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 38073a70fa61..d9e6fa6d3e99 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -10,6 +10,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -537,10 +538,11 @@ static struct hdac_hdmi_port *hdac_hdmi_get_port_from_cvt(
 				continue;
 
 			list_for_each_entry(port, &pcm->port_list, head) {
-				mutex_lock(&pcm->lock);
-				ret = hdac_hdmi_query_port_connlist(hdev,
-							port->pin, port);
-				mutex_unlock(&pcm->lock);
+				scoped_guard(mutex, &pcm->lock) {
+					ret = hdac_hdmi_query_port_connlist(hdev,
+									    port->pin,
+									    port);
+				}
 				if (ret < 0)
 					continue;
 
@@ -640,11 +642,11 @@ static void hdac_hdmi_pcm_close(struct snd_pcm_substream *substream,
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
@@ -922,7 +924,7 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 	if (port == NULL)
 		return -EINVAL;
 
-	mutex_lock(&hdmi->pin_mutex);
+	guard(mutex)(&hdmi->pin_mutex);
 	list_for_each_entry(pcm, &hdmi->pcm_list, head) {
 		if (list_empty(&pcm->port_list))
 			continue;
@@ -945,12 +947,10 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
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
@@ -1274,67 +1274,65 @@ static void hdac_hdmi_present_sense(struct hdac_hdmi_pin *pin,
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
+					      &port->eld.monitor_present,
+					      port->eld.eld_buffer,
+					      ELD_MAX_SIZE);
 
-	if (size > 0) {
-		size = min(size, ELD_MAX_SIZE);
-		if (hdac_hdmi_parse_eld(hdev, port) < 0)
-			size = -EINVAL;
-	}
-
-	eld_valid = port->eld.eld_valid;
+		if (size > 0) {
+			size = min(size, ELD_MAX_SIZE);
+			if (hdac_hdmi_parse_eld(hdev, port) < 0)
+				size = -EINVAL;
+		}
 
-	if (size > 0) {
-		port->eld.eld_valid = true;
-		port->eld.eld_size = size;
-	} else {
-		port->eld.eld_valid = false;
-		port->eld.eld_size = 0;
-	}
+		eld_valid = port->eld.eld_valid;
 
-	eld_changed = (eld_valid != port->eld.eld_valid);
+		if (size > 0) {
+			port->eld.eld_valid = true;
+			port->eld.eld_size = size;
+		} else {
+			port->eld.eld_valid = false;
+			port->eld.eld_size = 0;
+		}
 
-	pcm = hdac_hdmi_get_pcm(hdev, port);
+		eld_changed = (eld_valid != port->eld.eld_valid);
 
-	if (!port->eld.monitor_present || !port->eld.eld_valid) {
+		pcm = hdac_hdmi_get_pcm(hdev, port);
 
-		dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
-			__func__, pin->nid, port->id);
+		if (!port->eld.monitor_present || !port->eld.eld_valid) {
 
-		/*
-		 * PCMs are not registered during device probe, so don't
-		 * report jack here. It will be done in usermode mux
-		 * control select.
-		 */
-		if (pcm) {
-			hdac_hdmi_jack_report(pcm, port, false);
-			schedule_work(&port->dapm_work);
-		}
+			dev_dbg(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
+				__func__, pin->nid, port->id);
 
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
+					     port->eld.eld_buffer, port->eld.eld_size, false);
+		}
 	}
-	mutex_unlock(&hdmi->pin_mutex);
 
 	if (eld_changed && pcm)
 		snd_ctl_notify(hdmi->card,
@@ -1795,13 +1793,12 @@ static void hdac_hdmi_set_chmap(struct hdac_device *hdev, int pcm_idx,
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


