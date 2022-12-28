Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFFCC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 12:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9X91Fnadk2T2IXBmaaCHcqGD55dHXQIcw8hnKRyjWdc=; b=yAWP1dJvxxqbm+FGTeH0KQmOhX
	qo3GGMa/0YP5jlrrzsQCgcWHOnvAChy6Soa2p/4XlSbiv1MSA9nhd4xq8eDUmtNAM/FJQzb7r1SN9
	3xx0HqPD6DCcLThdgGOMp4LZYVk+jngEujmPojx+0s9KLP0T6fvCiyfmpaooSGP0m4cLJUgxDmyNO
	ehysHDY3QFTFtWkE4OBYdtiwrfC5GGfcKuBl9nUrBkY6qcwQ8oKf25e9UVdHF3ThIxVqj6MkcJX0u
	Lb1+mXZ0lJCdEbqSKNXfsTdiEuo1cGnVd//p233VveP4K5AtYuGJeTLg+9bp7vR6GfUcsgsvY0uKM
	MOQh8uMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVSW-004lWD-7D; Wed, 28 Dec 2022 12:23:00 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVSS-004lRw-9l
	for linux-mediatek@lists.infradead.org; Wed, 28 Dec 2022 12:22:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d7so15901524pll.9
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Dec 2022 04:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9X91Fnadk2T2IXBmaaCHcqGD55dHXQIcw8hnKRyjWdc=;
        b=8ATAjlMSvH64+WHo5TfeKLy/9iwXrYE8/B0YTdIfYIbO5BQINeQDS9114Ih2LQcH4a
         oXtlbx2wf+omFT99UgiMZHnatKZ4sQfsMymZ+OVOz3wATCMcKeaLSaHFtraywPp7zjNA
         vqiKIK67C9KVKhqT5L2FmmjPnNeH7jaJJfOozT6FOAHxNSRYSYMTasIieCUx+gJQymeF
         GamizVymKLPex/aowlguGu4BSxVkhe75Hrh01m0AAGOVQDplWliLtNdkdzazWdF+xuHA
         bXiAI06dLc+TL1zkSHjg/PT3eipglJY2ffb9YeGdzHK1o0H+GvTYkbQaKJUHgeqneBWH
         PZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9X91Fnadk2T2IXBmaaCHcqGD55dHXQIcw8hnKRyjWdc=;
        b=w86OZqXT67ilrmILuu9f/ixxITp8uOlD5zDLwYXfzIkJyvV7WW4NeR1oOYYHKrSsva
         mkeJPg5qQaSYi7+ok5QQIM1XK4zkZsT5CIu1e/Cxusw7YCHYaYcAN1ZNuWCC0PAJRQ48
         U8tOcSWvPftKClQBi33BMxpilScJ7ivWSI8PsROlTISSigG186XugQpBPgQ9jRZFRxYK
         IZCDcj0fvPY1P6Y2r8hzxNXReOpJpl3yPBY/tSRZMFoirG39USY6iES+OsVR7Ikv/scK
         k5Sb8in9O6SwdoZ3k0XMJbnpzEMOefLZae+1KZZzYDGFUSPPSMgrctuBc5VHLrBNDy7D
         Grkg==
X-Gm-Message-State: AFqh2koom1xibqtklhVTeRdjTd3GJa7gMuXamcoTh5sw3exUpUPxU/DP
	NzfgqHa57HBCCGjofhzOEuMcjA==
X-Google-Smtp-Source: AMrXdXt0gVyGT9VaSwJVm9bxkdZzyN9aQyXLpHP3077wingZFW4PqgWXO63Kj2x5OqBxtEC9qIw/cQ==
X-Received: by 2002:a05:6a21:3949:b0:a7:9022:5d5e with SMTP id ac9-20020a056a21394900b000a790225d5emr31532687pzc.2.1672230173418;
        Wed, 28 Dec 2022 04:22:53 -0800 (PST)
Received: from localhost.localdomain (202.60.225.077.static.cyberec.com. [202.60.225.77])
        by smtp.gmail.com with ESMTPSA id h1-20020a056a00000100b0058124f92399sm5236074pfk.219.2022.12.28.04.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 04:22:53 -0800 (PST)
From: tongjian <tongjian@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	jiaxin.yu@mediatek.com,
	chunxu.li@mediatek.com,
	ajye_huang@compal.corp-partner.google.com,
	tongjian@huaqin.corp-partner.google.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: mediatek: mt8186: support rt5682s_max98360
Date: Wed, 28 Dec 2022 20:22:29 +0800
Message-Id: <20221228122230.3818533-2-tongjian@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
References: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_042256_451724_744DF87A 
X-CRM114-Status: GOOD (  11.67  )
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

Add support for using the rt5682s codec together with max98360a on
MT8186-MT6366-RT1019-RT5682S machines.

Signed-off-by: tongjian <tongjian@huaqin.corp-partner.google.com>
---
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 8f77a0bc1dc8..af44e331dae8 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -1083,6 +1083,21 @@ static struct snd_soc_card mt8186_mt6366_rt1019_rt5682s_soc_card = {
 	.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
 };
 
+static struct snd_soc_card mt8186_mt6366_rt5682s_max98360_soc_card = {
+	.name = "mt8186_rt5682s_max98360",
+	.owner = THIS_MODULE,
+	.dai_link = mt8186_mt6366_rt1019_rt5682s_dai_links,
+	.num_links = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_dai_links),
+	.controls = mt8186_mt6366_rt1019_rt5682s_controls,
+	.num_controls = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_controls),
+	.dapm_widgets = mt8186_mt6366_rt1019_rt5682s_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_widgets),
+	.dapm_routes = mt8186_mt6366_rt1019_rt5682s_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_routes),
+	.codec_conf = mt8186_mt6366_rt1019_rt5682s_codec_conf,
+	.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
+};
+
 static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
@@ -1232,9 +1247,14 @@ static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 
 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id mt8186_mt6366_rt1019_rt5682s_dt_match[] = {
-	{	.compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound",
+	{
+		.compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound",
 		.data = &mt8186_mt6366_rt1019_rt5682s_soc_card,
 	},
+	{
+		.compatible = "mediatek,mt8186-mt6366-rt5682s-max98360-sound",
+		.data = &mt8186_mt6366_rt5682s_max98360_soc_card,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mt8186_mt6366_rt1019_rt5682s_dt_match);
-- 
2.25.1


