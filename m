Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A9BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 17:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwWBlptMdRe0vqbd/hYyqgTkT4dPNb5b6lRz0Kx4sNw=; b=hzM4r44SBOYFRv
	3vCw43lu/wdMbVyamMJvzRpmUbGTmGJY13GIrzN9HABIM1KTxGaiv1o8oTVfXg8YN5+5pGBl1Z1fk
	V0QnA5hQWU+aGvpSS8uJ8iohko3/0K+kofjWPYD5G/fVAGdbDxYlggKLgkkHN4QydXK1cYzCPDvyp
	bs37Rtso+ivbDuoQVP+9bsgwA7qDRGPP7DHa1z2qcGK/5qFEtNfFGuHainhwGWmcmXktOHL6Jng+1
	R6RvMTM320RYcy33h1BcFuxsMLJvO+7du4cIsWjinEmTbVbLbkzc97wXP8f20dt+RnEvdDvZo43NS
	2OzKWxyIKvT4o1SOUHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9VOW-00Fgsz-SU; Mon, 17 Jan 2022 17:02:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9VNM-00Fg3x-Tv; Mon, 17 Jan 2022 17:01:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 866F0B81131;
 Mon, 17 Jan 2022 17:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5994C36AE7;
 Mon, 17 Jan 2022 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438858;
 bh=05g762syOAZvMLDp/pEL5fFOuow6W/nYQmSGkutZrFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nAH4yGpczfb3BpzE/8awaInHD1KUeUOpNjWmSiovNEd7yGqrJaoi2uxC3S2dkEXSi
 RRINFNO/kedWerBmb6h4mSQEHTLUd3gBLA0giJ65XTudVQFqH/aHd9kd26BSERFgOa
 1mp7j5/rmLz1J3E31/zaWnhcffz3W8QY6wa1lXRR4VqADRqkuY4dKl9Nu2+bYMBw5C
 I68t6eFl2MMSizrOMzgkJmkRNYr40YHDcCHSH5J/zMjo+sjht4cVarkYgKcmtrZdmz
 6b5pqQxEDD5hUbwYzUZL7NVMsNHVj87x94BwtKYnvsgHf/j0PjrKhxUnhzzFkXdjWD
 Iv5B4XNiFResg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, matthias.bgg@gmail.com, jiaxin.yu@mediatek.com,
 angelogioacchino.delregno@collabora.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 45/52] ASoC: mediatek: mt8173: fix device_node
 leak
Date: Mon, 17 Jan 2022 11:58:46 -0500
Message-Id: <20220117165853.1470420-45-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117165853.1470420-1-sashal@kernel.org>
References: <20220117165853.1470420-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_090103_439225_493979D8 
X-CRM114-Status: GOOD (  10.98  )
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

From: Tzung-Bi Shih <tzungbi@google.com>

[ Upstream commit 493433785df0075afc0c106ab65f10a605d0b35d ]

Fixes the device_node leak.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20211224064719.2031210-2-tzungbi@google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8173/mt8173-max98090.c      | 3 +++
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c | 2 ++
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c | 2 ++
 sound/soc/mediatek/mt8173/mt8173-rt5650.c        | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index fc94314bfc02f..3bdd4931316cd 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -180,6 +180,9 @@ static int mt8173_max98090_dev_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+
+	of_node_put(codec_node);
+	of_node_put(platform_node);
 	return ret;
 }
 
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index 0f28dc2217c09..390da5bf727eb 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -218,6 +218,8 @@ static int mt8173_rt5650_rt5514_dev_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+
+	of_node_put(platform_node);
 	return ret;
 }
 
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index 077c6ee067806..c8e4e85e10575 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -285,6 +285,8 @@ static int mt8173_rt5650_rt5676_dev_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+
+	of_node_put(platform_node);
 	return ret;
 }
 
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 2cbf679f5c74b..d8cf0802813a0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -323,6 +323,8 @@ static int mt8173_rt5650_dev_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+
+	of_node_put(platform_node);
 	return ret;
 }
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
