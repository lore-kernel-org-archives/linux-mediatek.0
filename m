Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B53C388F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 03:53:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB682207BC
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 03:53:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SZvzSrhR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNVLxxvO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB682207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L0qWgBZVrT2/cM3P/EohEe2zwfNEjkUz+52XNXF6yQ4=; b=SZvzSrhRRdfLc8ki3u46O9kRzY
	JSBxJA5z/zy4R1pVkVjsTUTBsQ4BjiCBFCN3UbTo9Pr8eYmIxGtBP/tI1TA/PyuVeekAQfNynDurT
	Ps4jK48JxTC1IBw0Z0IiHgqVgetlz+HlseZkplPZb448Vcmjc52DjAJKt2EGWEm6oWZTr33w9em0V
	Z0Kr8GBMiWTQaPyr1zQzqhYednCmIM0SDOFDf0CSnT4f/gtEX1ZtUvK6zlV3IcPMUzdYs7bKkUNGI
	lK+aHiMC4iy+0BQvJ7wclCvrAIiXTNadYYzszAwIv70YEdNv9MO8rermkLTbd434NBAaH7iOpfpaH
	68q68hXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcKil-0001Sc-Ev; Tue, 10 Nov 2020 03:53:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcKig-0001RS-St; Tue, 10 Nov 2020 03:53:23 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C930820721;
 Tue, 10 Nov 2020 03:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604980400;
 bh=l2Jw2CD3tgByn9HdhbfrTBIjqlt2hug4S+cpuWnQWY4=;
 h=From:To:Cc:Subject:Date:From;
 b=oNVLxxvOLFF15IPriSG19FFGsvMsX/1R5oD4xRTQ/Lj+uicQP5xDr/O96YsSZwc0f
 AzbQfxOxoqdlv/F0ZWHALiESbwxFLqoPevskplkhR8KzB9VMxVgqLD9l4IHfWjIrAB
 WfZG0icvRSXIPFmNanS+ImsUIYnfw6Xwd7/8Vepk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 01/55] ASoC: mediatek: mt8183-da7219: fix DAPM
 paths for rt1015
Date: Mon,  9 Nov 2020 22:52:24 -0500
Message-Id: <20201110035318.423757-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_225323_025316_56D39E43 
X-CRM114-Status: GOOD (  13.25  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Tzung-Bi Shih <tzungbi@google.com>

[ Upstream commit eb5a558705c7f63d06b4ddd072898b1ca894e053 ]

RT1015's output widget name is "SPO" instead of "Speaker".  Fixes it to
use the correct names.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20201019044724.1601476-1-tzungbi@google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 31 +++++++++++++++----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index a6c690c5308d3..58b76e985f7f3 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -624,15 +624,34 @@ static struct snd_soc_codec_conf mt8183_da7219_rt1015_codec_conf[] = {
 	},
 };
 
+static const struct snd_kcontrol_new mt8183_da7219_rt1015_snd_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+};
+
+static const
+struct snd_soc_dapm_widget mt8183_da7219_rt1015_dapm_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+	SND_SOC_DAPM_PINCTRL("TDM_OUT_PINCTRL",
+			     "aud_tdm_out_on", "aud_tdm_out_off"),
+};
+
+static const struct snd_soc_dapm_route mt8183_da7219_rt1015_dapm_routes[] = {
+	{"Left Spk", NULL, "Left SPO"},
+	{"Right Spk", NULL, "Right SPO"},
+	{"I2S Playback", NULL, "TDM_OUT_PINCTRL"},
+};
+
 static struct snd_soc_card mt8183_da7219_rt1015_card = {
 	.name = "mt8183_da7219_rt1015",
 	.owner = THIS_MODULE,
-	.controls = mt8183_da7219_max98357_snd_controls,
-	.num_controls = ARRAY_SIZE(mt8183_da7219_max98357_snd_controls),
-	.dapm_widgets = mt8183_da7219_max98357_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(mt8183_da7219_max98357_dapm_widgets),
-	.dapm_routes = mt8183_da7219_max98357_dapm_routes,
-	.num_dapm_routes = ARRAY_SIZE(mt8183_da7219_max98357_dapm_routes),
+	.controls = mt8183_da7219_rt1015_snd_controls,
+	.num_controls = ARRAY_SIZE(mt8183_da7219_rt1015_snd_controls),
+	.dapm_widgets = mt8183_da7219_rt1015_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8183_da7219_rt1015_dapm_widgets),
+	.dapm_routes = mt8183_da7219_rt1015_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8183_da7219_rt1015_dapm_routes),
 	.dai_link = mt8183_da7219_dai_links,
 	.num_links = ARRAY_SIZE(mt8183_da7219_dai_links),
 	.aux_dev = &mt8183_da7219_max98357_headset_dev,
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
