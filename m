Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1A2C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 17:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6lGsEL+KekNJQt5jm0uaCYNEreqthjJyO/Nt5C4itk=; b=Ss+IEFL6NpkQPN2NwwDrF9h6WS
	Slea0GAAYhlP4I4WtUAQpOE2zy3bmxXOAGHkOqHLdcQaWhbBooCl73I7N21TlE0P7NlI4Msr+1MU9
	FZvoJj65FrYWClAaO4mBnBLR3eMzTZJg7xgxRks+CoEu8gZYscypEs7J/RsCnI55Rbzk3cmAPjayV
	28IT93g5cE33iqxv1RWB+pEvAlEcySATwA922z+JrOXAY2iYJ8IQrec5ZUFCiz7tBjWkueBgpcI3q
	8zMPBxsaYzlsEzM1S32f4oo1pdHtfX3lHEfoJn0HvF7Q0z4tsMyZIYcUE1JUehYMoQ+vayAG775Qf
	wHdoZxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orj5R-008weZ-5N; Sun, 06 Nov 2022 17:05:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orj5F-008wa7-PY; Sun, 06 Nov 2022 17:05:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6479D60C3F;
	Sun,  6 Nov 2022 17:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CF1C433D6;
	Sun,  6 Nov 2022 17:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667754321;
	bh=gsVXRYCR9lVIvBRGS7VnApwkMRqk9CPCHhrgfVyh1XM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=muxwarglnq6BbU8YxZ2kHEXJtdvx9SyGPoD0vAztG1ZSMYTohz39I4BE+PWrbZWdd
	 ICnCQhD0PfHlodPrBssbbD9Aqfpq+QzjZT27TdHHjRq3YkLnRBlFfJhhdX4cb4mt5m
	 fBHDRQAMQqrdoBg/3x1u8TolD4KJ+YdPfx666MlwEGUG0K6xMfd+3EAcb9XncgfvUu
	 4+0Za5IDGwJYqSqj3P99DoUjMjZGdmKshp4LswKZZgf5lF40Vqdzpt0pQrVP9O6RpM
	 6e8QQEolNE/yIMGUFZgFXE9ERij4LwuD0s/TgV0sg8m08xAneMK+59Ml2DenFiGhiU
	 cxQ7tayl41low==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhang Qilong <zhangqilong3@huawei.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	steve@sk2.org,
	chi.minghao@zte.com.cn,
	ckeepax@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 04/18] ASoC: mt6660: Keep the pm_runtime enables before component stuff in mt6660_i2c_probe
Date: Sun,  6 Nov 2022 12:04:53 -0500
Message-Id: <20221106170509.1580304-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170509.1580304-1-sashal@kernel.org>
References: <20221106170509.1580304-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_090521_887901_2ACE9005 
X-CRM114-Status: GOOD (  11.30  )
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

From: Zhang Qilong <zhangqilong3@huawei.com>

[ Upstream commit c4ab29b0f3a6f1e167c5a627f7cd036c1d2b7d65 ]

It would be better to keep the pm_runtime enables before the
IRQ and component stuff. Both of those could start triggering
PM runtime events.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20221008140522.134912-1-zhangqilong3@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/mt6660.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index a0a3fd60e93a..7d7f97b8c7c4 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -504,14 +504,14 @@ static int mt6660_i2c_probe(struct i2c_client *client,
 		dev_err(chip->dev, "read chip revision fail\n");
 		goto probe_fail;
 	}
+	pm_runtime_set_active(chip->dev);
+	pm_runtime_enable(chip->dev);
 
 	ret = devm_snd_soc_register_component(chip->dev,
 					       &mt6660_component_driver,
 					       &mt6660_codec_dai, 1);
-	if (!ret) {
-		pm_runtime_set_active(chip->dev);
-		pm_runtime_enable(chip->dev);
-	}
+	if (ret)
+		pm_runtime_disable(chip->dev);
 
 	return ret;
 
-- 
2.35.1


