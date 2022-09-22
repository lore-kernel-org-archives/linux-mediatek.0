Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3292C6FA86
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OkD0not9nboYr7bezTMStyfqMn+HT7peWTk76cvy5Lw=; b=LafRb4fSK0/r6G3+cJ5NgNRVkX
	p8RIYWeBcLmN2qHwgi1Am6zcFsGXUPW4DrV1n5scWT0SYxuts6huUH4MRDleC/wsnwWWJ73cQFUKG
	j6jAk5zV3Lcl0yrrBBCQP1E9sdEjjG0GHD6u1VmQ3gSuMv/1GTPCAImTBhkWBgcL/VqppmE54UyYf
	tooVFK1B8OBZXOLqAUiX5iJ5J4dqgEomUSsd1UMRR/3qYZ2mvwQZYWgU7oqyZHu1spez983aNYN/c
	vdr3HueIJVhxAuKt5eyUJcg/5y1m30WkzBnQZ+5ZNR1EfrI1MSdCe8f6w5RWkf3lVJSo5cfnZLeL4
	PI762DNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJY8-00Ey5l-GO; Thu, 22 Sep 2022 10:35:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJXx-00Ey2A-Su; Thu, 22 Sep 2022 10:35:11 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 67BC9660205E;
	Thu, 22 Sep 2022 11:35:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663842908;
	bh=hzZs/1aO3k2jUVZmRGLQHJ4A3hmjRyWqEEyzQ3TI83U=;
	h=From:To:Cc:Subject:Date:From;
	b=em+faPkZ7TtqBZu1q7U/Y6wsY99Kxt1vP2PmaRUyKax9hdplgIpEq7HJF3MmnmHvf
	 p61YNHBnMc8tMvKcHsqcIGk9PjhQEVCzGXBUbQd5W6ZjywNpGFe6jSlVvIYc5YX993
	 GnrCGFjoSlPwBzoLRhInnohevwMN1v297YziY6wJbv46usLjXgL6W4VRxJUvv/nuci
	 FI0aisjls/vNE3Z8RIFnFLPbZCCbmnTglrseptlcFA+9pRytTAj4QM51H+8iiWKhoW
	 Ap0cII5uj7HzmrKKH9PTg+OqQT6d0dm9WXVuAIOkCzDjISeUt22W3f89cpeBM/4mOr
	 lwHZgqTqi3B5g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	trevor.wu@mediatek.com,
	tzungbi@google.com,
	angelogioacchino.delregno@collabora.com,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops instead of custom ops
Date: Thu, 22 Sep 2022 12:35:02 +0200
Message-Id: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_033510_082007_947341DF 
X-CRM114-Status: GOOD (  10.94  )
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

It is possible to use the standard snd_soc_pm_ops for this card:
remove the custom mt8195_mt6359_pm_ops.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 961e769602d6..23bdde6acd1c 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1532,16 +1532,11 @@ static const struct of_device_id mt8195_mt6359_dt_match[] = {
 	{},
 };
 
-static const struct dev_pm_ops mt8195_mt6359_pm_ops = {
-	.poweroff = snd_soc_poweroff,
-	.restore = snd_soc_resume,
-};
-
 static struct platform_driver mt8195_mt6359_driver = {
 	.driver = {
 		.name = "mt8195_mt6359",
 		.of_match_table = mt8195_mt6359_dt_match,
-		.pm = &mt8195_mt6359_pm_ops,
+		.pm = &snd_soc_pm_ops,
 	},
 	.probe = mt8195_mt6359_dev_probe,
 };
-- 
2.37.2


