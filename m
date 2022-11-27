Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768F7C4321E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 20:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+PQ8C4HY8GI4Ih4606HRpgDC5j1lzCXOLCR0j10k4og=; b=lo4eA1fLuvKxYJFtTZW+cdIn0i
	13BP/GXqgVqhyuTarsxPGstllWtGbZYpK+JatOYKSGclZ+qCAIVC8t76FHuBc510Tx9PymSoYtSHc
	02CVaJ3vwIK1JiX9lz0mO97N/3DHrtXWdxp3WzOrS6sy7uznXUC8dznmt+BMSSQ5ubS9dpfsNWr6x
	b7BfckVU3y4wNNNliTc5tWOoD976OZ2lybwns89VbkCS46aIb4Kkv2CpU5CLetO28NbzjaRTYsaxi
	agYmSQpWfbHCgXkhuYgbSA7UOtmomScLvkXoSu2uCCoc3oCh1d9jiITlVrQyr51ftL7Oty8U6lIQg
	IW9lgCzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozNtT-00DQMJ-9U; Sun, 27 Nov 2022 20:04:51 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozNtQ-00DQKr-Ep
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 20:04:49 +0000
Received: by mail-ej1-x62e.google.com with SMTP id ho10so21302332ejc.1
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Nov 2022 12:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+PQ8C4HY8GI4Ih4606HRpgDC5j1lzCXOLCR0j10k4og=;
        b=U7ppHaFyl2uoDpwagB2uxHAl3qXc867gSP+EYCeh+Ekig4WP0Bj22uBXpJjS8d8vEE
         LfkOFhLIy9pJy18/nyFhYljoO5jFByJETKBHVuWQFPnFRy774YGv7VpFp+RRKYcrp1if
         819lzsJqo5p6Lm3XpekIHPbmMZ0zCSiwwxfNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PQ8C4HY8GI4Ih4606HRpgDC5j1lzCXOLCR0j10k4og=;
        b=KC7anX6ZvKXqLjy8kN56sJJZAz49tfMK85eKb0Lu2J+Yvb6sOW5Ir0QKVt1w9dGW5V
         mMn8ltCZ4Si+lQmZsFNDn77k9tmFf6rl71zWlq6dXaX+NvDGuMoS/nYZdRSEFDPj73Cw
         5IbzLE9ynhwcjR0pDfWhqZtoomJ5n13rBE7ScWlbIuHiPXm7tGDNN2GcmIbXglMN9AVk
         FJT5GV3JKJ1mqQ0vkLRGgHcVl+29I3mXG1NjUQFj2b5WgciN1KQS41n5IIoW82ZKQzbH
         AqNqul4AWxE9VFb7Ir57Q0kauLMVqWeSnqoBDs2ZAFgoR+w0wGm8m+9WZ5I1YGeEeRwE
         dogw==
X-Gm-Message-State: ANoB5pkW6x+2Ww9Mm1EqrJFpC4lA8yywYXKIgHFFYjDwO8i3YYjMkdHh
	LSOE9kBBXQUjGIoKGS54lgMniQ==
X-Google-Smtp-Source: AA0mqf42mS5Gm+YoLaWqTwXnCwIMBQWeQRJjTw5H5MATSu9YOsyjAoJB9z+d52K7UVjI1cU0rqhGNg==
X-Received: by 2002:a17:907:2c45:b0:7b8:bbbe:5ca with SMTP id hf5-20020a1709072c4500b007b8bbbe05camr23250340ejc.544.1669579483314;
        Sun, 27 Nov 2022 12:04:43 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id y5-20020aa7ccc5000000b0045b3853c4b7sm4365211edt.51.2022.11.27.12.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 12:04:42 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 27 Nov 2022 21:04:15 +0100
Subject: [PATCH] ASoC: SOF: mediatek: add shutdown callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-mtk-snd-v1-0-b7886faa612b@chromium.org>
To: Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>, alsa-devel@alsa-project.org
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2277; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=s1hlyXlFMcsbbpy4qR3m3W7fS0UNSJO46JANbYHIp7k=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjg8LGMFtVpE68zXEwJMlnmGcwIe5eTlR8bzX79ra4
 AxIafBCJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4PCxgAKCRDRN9E+zzrEiFtXEA
 Cf5Sg6YXeWg5yplb+YZwdBmNJiO11ksXUZ3IaGKVDn17qaPvhSLMD/2JjzzMLAh20rsOEke/qO/fjK
 341aMOWWArQ0zVwVdBdnDuC6xqfzdUJbH3DxKiElpYI9Zi6R2v6T8U+CRLhVLl6pWc917giiYK1AUI
 cuxoIhteEClZYg+9lIehzMJszaHDDPY6upPC1Dc2sOmHh1zfjqHB1vZAqMc0qXW8rsRUQMmkhvShs/
 kV+AtdLGWzdvE0jx8KN0XtUWIcwQg5O2EdN0xYbE4AkKaXCskBhKanLbblN6ajBDnh/qKb+6vwsWiB
 UBT2+KVYWh22KI3ry5+hx4O7KNixHflRtNZ8+67TmFEizc9EC+m5TGT98ek84Gr99KZo9YSXAom571
 QuAJ7RMaEcFmUJWo5lwZM0rRnAxaLp4UmA8QgpR0CqPDsA3VDMWmRVoYb0hNFBRPXAgPPju9S4wnWJ
 ma9Eug+OfJBSaJrVzFX7QUJC3h2XL2AeddGWR8ztI3d2gK/PNHMzbR35taHoM+E1nHOz3SnsWzB/N3
 eTYnx1sAnYNbNHqko7qj3c4CF2yp6J2emRGKTw9XnsAfrqXtNMJd8+eqBsV1pCMM6n9vP2X0Y0LAnV
 ooib9iObWJi/rL13BKkBNmNtEWN0VmDYGopctoP8eP79KJxn6iNehmddVjrw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_120448_553749_400F6842 
X-CRM114-Status: GOOD (  11.96  )
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

If we do not shutdown the peripheral properly at shutdown, the whole system
crashes after kexec() on the first io access.

Let's implement the appropriate callback.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: sound-open-firmware@alsa-project.org
Cc: alsa-devel@alsa-project.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 181189e00e02..79da25725987 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -430,6 +430,11 @@ static int mt8186_dsp_remove(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static int mt8186_dsp_shutdown(struct snd_sof_dev *sdev)
+{
+	return snd_sof_suspend(sdev->dev);
+}
+
 static int mt8186_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 {
 	mt8186_sof_hifixdsp_shutdown(sdev);
@@ -538,6 +543,7 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	/* probe and remove */
 	.probe		= mt8186_dsp_probe,
 	.remove		= mt8186_dsp_remove,
+	.shutdown	= mt8186_dsp_shutdown,
 
 	/* DSP core boot */
 	.run		= mt8186_run,
@@ -629,6 +635,7 @@ MODULE_DEVICE_TABLE(of, sof_of_mt8186_ids);
 static struct platform_driver snd_sof_of_mt8186_driver = {
 	.probe = sof_of_probe,
 	.remove = sof_of_remove,
+	.shutdown = sof_of_shutdown,
 	.driver = {
 	.name = "sof-audio-of-mt8186",
 		.pm = &sof_of_pm,

---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221127-mtk-snd-e0abf36be4c0

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

