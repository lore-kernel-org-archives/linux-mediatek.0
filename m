Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4788C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 17:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sHjOf83warWP0QPXDn9mSDNJ2v6sfbfBrZgQPpz4/s=; b=K25ISM9crJefIz
	j+xrUob1PlUrE4OQWycrXyupkaHXLUaNvRMtRp0irnC3pg7OBeD847+vRv6qtN1NgjFgSj6L97jNR
	hABbBIyvDKi2j7WaRh4V1u/NjA9zlfsY5waSkPt6GiazGgSpXORine0EzBdDHHR0cIQFQkYThhoW/
	/a0YUepiS5NzTrIwJ3xbIkm3SDNCyEN1a4gbGyxHAhVQabMR2dnrg4Ppkqp2Z4fEFu0/+r2wHK5H7
	t6MVvWuQTonQvpXOCmJqCgvvBrIKXerMkiFDXuSKtufNBfc/P4EIeXeV2gAh4FiqUEL1IQu8dgBvb
	TNhjkteQ4COn5+/fVGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9ViY-00FruZ-NA; Mon, 17 Jan 2022 17:22:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9VSr-00FjZ7-03; Mon, 17 Jan 2022 17:06:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9216DB81164;
 Mon, 17 Jan 2022 17:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86BDC36AE3;
 Mon, 17 Jan 2022 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642439197;
 bh=FpjEEp5qZAA2Ti4wiR35cwToImkcThW+7KWjliH3LY0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=txD10DxzgdUPqNXi9s1+/BZxeSOY5mn19OcCyCQ+eQhA1FGsbAkXHFDs3InWxQeqN
 smxl5x0vNAHtbQIVOITL9E9zeUB7xZam/nQe+d9fQJGND3uOejdAkFv8JenFFk2VS8
 dsq5kR20I2aYpUP/lueWRLFFHbzXgh++hbmGm1DTrehF8MibpK83bhhAeEhQhPCBod
 L2qB660Tp/z+fPQ/L9ErKRPw3pwQl02ei29gJGzZCQeVF/qexu6qYNR11ovdVUjTFE
 l+Qarpf+DLo174EZx9nik6Ku+QtN3pwDqN4Me2dgBZav9jhPF3AdFlICx8q2sWUMpc
 jtAwqx46YZ5PQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, matthias.bgg@gmail.com, jiaxin.yu@mediatek.com,
 angelogioacchino.delregno@collabora.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 17/17] ASoC: mediatek: mt8173: fix device_node
 leak
Date: Mon, 17 Jan 2022 12:05:51 -0500
Message-Id: <20220117170551.1472640-17-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170551.1472640-1-sashal@kernel.org>
References: <20220117170551.1472640-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_090641_365393_AB066E38 
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
index 902d111016d6f..431ba3db17594 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -169,6 +169,9 @@ static int mt8173_max98090_dev_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+
+	of_node_put(codec_node);
+	of_node_put(platform_node);
 	return ret;
 }
 
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index 582174d98c6c9..cdb3940710379 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -217,6 +217,8 @@ static int mt8173_rt5650_rt5514_dev_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+
+	of_node_put(platform_node);
 	return ret;
 }
 
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index b3670c8a5b8de..242f99716c619 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -274,6 +274,8 @@ static int mt8173_rt5650_rt5676_dev_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+
+	of_node_put(platform_node);
 	return ret;
 }
 
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 7a89b4aad182f..14011a70bcc41 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -301,6 +301,8 @@ static int mt8173_rt5650_dev_probe(struct platform_device *pdev)
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
