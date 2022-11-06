Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1514C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 17:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LS+5/p2b3L4g2WKjAoho8ZTLTiVUtpArRA4JmXpUKk=; b=2N06tWVKsSh79XwLL4lOyp647f
	jYKhCiHEvWMINAcKbd/TddYxkqdEsiTBTyCPecHcBlE7Q5WxM5H66vC2numm0BRyghQGKIZNZPXgY
	6ipDPOEccgrWMoIxV1PV8kZoTGPdvpQhC9ddK3wnDDeUBPp2lUN3/Rid5w6NszbQs4qqlEKwIOA+7
	y4zB25x445kAmFqjqHfGBmMF5Nvppa0MfqngrveRuthHqFQpeiNXpnYjULFxjN1GTjahDhi1rroSO
	VNbiLAG0pn6CzcxxXvAcMVFbxtEmYRC+n/MRgA26sjqgD7D4cXUO9CAFV2ZrqB/3/Bvs1/YGjlmnp
	h8FL2hGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orj4B-008wCn-O2; Sun, 06 Nov 2022 17:04:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orj41-008w9U-JU; Sun, 06 Nov 2022 17:04:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 864A260CF8;
	Sun,  6 Nov 2022 17:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31E0C433D6;
	Sun,  6 Nov 2022 17:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667754242;
	bh=o2+ts7+oQiXTOP7MINi299O0Ta42vbh8+bm3bKn2TRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NiprFO/H8NWZrZc4a0SjzKk+C+XUKeTsVUnlMbQj8W7Zw4bMcmqM8GuotcYs0T15n
	 TwbGioGn50rdyPQP2TqTj01LTC7E29w4uI9ZMnCj/q8fUNu28o6t6C7DgXztGROUx0
	 8qkyHJgvm3ei7bWOs4zdJMZNaCXoxHa9/jG1kW6DWFOTDbWxQY5uAdREgKVvVmlJYX
	 srNb/wLFUBxzvIJT/dtjLX5z0CqTW+ck1+4f2sTAQaERbXnOdZwn+zUzSPPPjtHypa
	 fMRvh9EfQYeZZl4aGG3cesnDygcf7XJa2F/58DaKFgpQ8KCK09Z/xVm9FlS/eUEVQt
	 0GrBDjgYS7CTQ==
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
Subject: [PATCH AUTOSEL 6.0 06/30] ASoC: mt6660: Keep the pm_runtime enables before component stuff in mt6660_i2c_probe
Date: Sun,  6 Nov 2022 12:03:18 -0500
Message-Id: <20221106170345.1579893-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170345.1579893-1-sashal@kernel.org>
References: <20221106170345.1579893-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_090405_725626_070FE23D 
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
index 45e0df13afb9..b8369eeccc30 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -503,14 +503,14 @@ static int mt6660_i2c_probe(struct i2c_client *client)
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


