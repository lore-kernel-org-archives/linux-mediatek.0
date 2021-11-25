Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14DEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 04:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q1YbxkGaSLoxPjF9PYuo/9f932oaPIXsL9bz7BaHUEM=; b=KZa6MUapO9HK5d
	u1bQtLp4uKci8QKJFiASCLnrtaHqsclmsllRg/D2PxAxeScBqD2R5QMdn0fm1uZqQHiWdQ0LDXgeR
	/a2cLj9t9Sghb66QUa4Fs0tXrknjMwe4yJwocIX6o+ZQksEEG9fTymHnD9MzBicAcy5jRtsxZ71+Z
	QPE/9m/grEn0tkE+DLbx1KbB4RHZc3Uj9JDSwI9q2uO4ofAA8AAiK812XgjjhWGDi/axfrVkH1d2C
	pbEUHuVxPpl6C6ZPrcFPpmfUtO3BLBLLpQ4WYvlpjY+O+TUS3q+9o3Wk04G0YqrkSANNCqQTCWvtQ
	0GXpyedgLr3oIE3tyXSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mq6JW-006M5e-0g; Thu, 25 Nov 2021 04:24:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mq6JG-006M58-Ox; Thu, 25 Nov 2021 04:24:37 +0000
X-UUID: d9c185c7e3604ea68a1f0a5d259dafab-20211124
X-UUID: d9c185c7e3604ea68a1f0a5d259dafab-20211124
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1893712864; Wed, 24 Nov 2021 21:24:30 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Nov 2021 20:24:28 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 25 Nov 2021 12:24:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 25 Nov 2021 12:24:26 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <tzungbi@google.com>,
 <garlic.tseng@mediatek.com>, <kaichieh.chuang@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <alsa-devel@alsa-project.org>, "Jiaxin
 Yu" <jiaxin.yu@mediatek.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: mediatek: remove unnecessary CONFIG_PM
Date: Thu, 25 Nov 2021 12:24:22 +0800
Message-ID: <20211125042422.2349-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_202434_844606_31E71746 
X-CRM114-Status: UNSURE (   9.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The unnecessary conditional inclusion caused the following warning.

Such as:
>> sound/soc/mediatek/mt8192/mt8192-afe-pcm.c:2368:32: warning: unused
>> variable 'mt8192_afe_pm_ops' [-Wunused-const-variable]
   static const struct dev_pm_ops mt8192_afe_pm_ops = {

Because runtime_pm already handles the case without CONFIG_PM, we
can remove CONFIG_PM condition.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c       | 2 --
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c       | 2 --
 sound/soc/mediatek/mt8173/mt8173-max98090.c      | 2 --
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c | 2 --
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c | 2 --
 sound/soc/mediatek/mt8173/mt8173-rt5650.c        | 2 --
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c       | 2 --
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c       | 2 --
 8 files changed, 16 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index bc3d0466472b..0f178de92a0f 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1474,9 +1474,7 @@ static struct platform_driver mt2701_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt2701-audio",
 		   .of_match_table = mt2701_afe_pcm_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &mt2701_afe_pm_ops,
-#endif
 	},
 	.probe = mt2701_afe_pcm_dev_probe,
 	.remove = mt2701_afe_pcm_dev_remove,
diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 3d68e4726ea2..fb4abec9aa5f 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -901,9 +901,7 @@ static struct platform_driver mt6797_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt6797-audio",
 		   .of_match_table = mt6797_afe_pcm_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &mt6797_afe_pm_ops,
-#endif
 	},
 	.probe = mt6797_afe_pcm_dev_probe,
 	.remove = mt6797_afe_pcm_dev_remove,
diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index fc94314bfc02..2408c9d3d9b3 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -193,9 +193,7 @@ static struct platform_driver mt8173_max98090_driver = {
 	.driver = {
 		   .name = "mt8173-max98090",
 		   .of_match_table = mt8173_max98090_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = mt8173_max98090_dev_probe,
 };
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index 0f28dc2217c0..e6e824f3d24a 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -231,9 +231,7 @@ static struct platform_driver mt8173_rt5650_rt5514_driver = {
 	.driver = {
 		   .name = "mtk-rt5650-rt5514",
 		   .of_match_table = mt8173_rt5650_rt5514_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = mt8173_rt5650_rt5514_dev_probe,
 };
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index 077c6ee06780..ba6fe3d90bfc 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -298,9 +298,7 @@ static struct platform_driver mt8173_rt5650_rt5676_driver = {
 	.driver = {
 		   .name = "mtk-rt5650-rt5676",
 		   .of_match_table = mt8173_rt5650_rt5676_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = mt8173_rt5650_rt5676_dev_probe,
 };
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 2cbf679f5c74..9b933cce0b20 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -336,9 +336,7 @@ static struct platform_driver mt8173_rt5650_driver = {
 	.driver = {
 		   .name = "mtk-rt5650",
 		   .of_match_table = mt8173_rt5650_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = mt8173_rt5650_dev_probe,
 };
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 14e77df06b01..86c8a523fe9e 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1279,9 +1279,7 @@ static struct platform_driver mt8183_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt8183-audio",
 		   .of_match_table = mt8183_afe_pcm_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &mt8183_afe_pm_ops,
-#endif
 	},
 	.probe = mt8183_afe_pcm_dev_probe,
 	.remove = mt8183_afe_pcm_dev_remove,
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 31c280339c50..e1e4ca931551 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2381,9 +2381,7 @@ static struct platform_driver mt8192_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt8192-audio",
 		   .of_match_table = mt8192_afe_pcm_dt_match,
-#ifdef CONFIG_PM
 		   .pm = &mt8192_afe_pm_ops,
-#endif
 	},
 	.probe = mt8192_afe_pcm_dev_probe,
 	.remove = mt8192_afe_pcm_dev_remove,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
