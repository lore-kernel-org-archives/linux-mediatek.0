Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9539EC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 14:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0VYglMQNZRhRnrkHmi8JSdfUYM/b7cYcu1bSKgVeFQ=; b=0C9XyviXhkSvs2Vn1UCUxccbim
	dsSJGvMT/pzADuZBQmvqjKW3inqIe/IMGcRwwditl2YXWLmlPU165L4xazbLhCKk5dvqcBsY0L+VU
	WNiJ6X8q3uwMdMizoJ/Qlw/p4+vM4Ox0xO1JQ5kXPaUjSWs5mY85WOSk/dpjO7jyp5uXZ73/B5Zg3
	cy3SmndHlLjroDkPtgSrKf2JcRlHf1hrKr06e1nXSA4jQz7UKRjTTz1gdc4lhWGPuysUEQQsWlF28
	F0d8Oknfe5SWqxXBF8yfVHHfpZIIS33GhHPVjd1oE2lESJQk7XJ5aypZwulYPvxIGrbX0f5xWvRvY
	ydzMYWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQBP-00Akuh-HF; Mon, 16 Jan 2023 14:09:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQ4K-00Agdk-8B; Mon, 16 Jan 2023 14:02:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6F3D1B80F88;
	Mon, 16 Jan 2023 14:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6576BC433EF;
	Mon, 16 Jan 2023 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673877750;
	bh=QPhRtNuE6JxeurA1PW69fSuF/HqnQ/1AJqwFGLiIYdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BMHhJlt2HmB01gVPRkqfxfzcrTc9o1KHtzzhQjV0m2nmocLQEuWwUl9tTewyQaaaG
	 1Dzq6ICPOIOiyfZmQMKTTc62PVsFmhh6BRze73KzP2dXDp//6Tjdhk0++iLhmoZlvJ
	 icccd/j3t6EPwcyyXLKe5cpaueX36UJySaU6Q7i51dtqsW0ucrnFKAmtIx/96Tb+Ss
	 Ntgz8VGvgmBdFHtShr0+8cUZ5jbBKXfdmWa2Tt9+2+aSAGZ9Nsqk7GbcS0Icm7JTNL
	 hC7mVyGtl2JXLiLhEe+H/vEw9tYG8tywT3/7gOEalyOp+D3/c+uhBcOQytVD64fBAc
	 Rbn9crVCbGvDA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	tzungbi@kernel.org,
	jiaxin.yu@mediatek.com,
	trevor.wu@mediatek.com,
	chenxiangrui@huaqin.corp-partner.google.com,
	renzhijie2@huawei.com,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 10/53] ASoC: mediatek: mt8186: Add machine support for max98357a
Date: Mon, 16 Jan 2023 09:01:10 -0500
Message-Id: <20230116140154.114951-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140154.114951-1-sashal@kernel.org>
References: <20230116140154.114951-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_060236_511151_796C662C 
X-CRM114-Status: GOOD (  11.35  )
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

From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

[ Upstream commit 8a54f666db581bbf07494cca44a0124acbced581 ]

Add support for mt8186 with mt6366 and max98357a.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Link: https://lore.kernel.org/r/20221228115756.28014-1-allen-kh.cheng@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 363fa4d47680..7bdb0ded831c 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -182,9 +182,10 @@ config SND_SOC_MT8186_MT6366_DA7219_MAX98357
 	  If unsure select "N".
 
 config SND_SOC_MT8186_MT6366_RT1019_RT5682S
-	tristate "ASoC Audio driver for MT8186 with RT1019 RT5682S codec"
+	tristate "ASoC Audio driver for MT8186 with RT1019 RT5682S MAX98357A/MAX98360 codec"
 	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8186 && MTK_PMIC_WRAP
+	select SND_SOC_MAX98357A
 	select SND_SOC_MT6358
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682S
-- 
2.35.1


