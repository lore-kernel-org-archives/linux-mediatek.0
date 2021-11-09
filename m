Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF9DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 22:21:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13AA261A8B
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 22:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13AA261A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jvhnXaBriWCfcS3Nb13o408ktamQXvcKY50uJzeUXw=; b=SECtRito5uP98r
	4IevUCNlLqY4oCV22eDsdat2xSZaO1FOUNePcd6UTuEKfeTsgII6NHt2aulXVO4PGlg0yoBhtGnFU
	jRKGNRCZooCLVyxASsxXFbubzn/FMoNzArMr1y6579DX89NraNsGmSfumvXrKYYezPuPZoghWCsSI
	blA+gYvyd7g2FRaQhze6815zV70HZMblXgQKBGqI4R3fIisLjVpZQg3m7HjO6U1iyTnxG6yuzvw4H
	nt9HSDfYK9oM02OUGAeGrkg9BfQvYVyKEak+3/0tr00QLuRyxrku/XmocHM0YYWNNbIYEG/mmTqZc
	HzUEO5VgGEK0OcIlXLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkZUo-003Nwl-H6; Tue, 09 Nov 2021 22:21:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkZQa-003LLy-DS; Tue, 09 Nov 2021 22:17:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E58DF61350;
 Tue,  9 Nov 2021 22:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496236;
 bh=pVycJHCOHhJHYDGpvWVmOqvqDvlFgZCXvpf4/RBRYyI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jgiM7TRw0zhuOW4ermPjO1H7C0n/oYZwkSb+hJgEq+GbBKliiFaJ453PyE9YJKPs2
 Tzr3t6q/bhLxmOLEHhzsIIMlmHOSRsvTRE594PE1UbZ/lzkB1ZIwF971F+X1TfjHOM
 ucLUrpAAMyYbeoF+5hoUb5HzhCc8rXDQJvJBIfjmXNElPcFfqb6CnEpqzlCaGjCe1i
 HOkRmPnyBJnKiBwvFMQbWIVUkXnj3xAyAEwYuork1YjMU5I57wbH+S6q4QLXzA7Tpo
 5TDTQI3PF6wBhukRtuernNxOmTQkc1Qoh0oFLZIkwvbckxwIyFo2w+z186R94dAE7W
 AxfOdSwMpms2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bixuan Cui <cuibixuan@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 14/82] ASoC: mediatek: mt8195: Add missing
 of_node_put()
Date: Tue,  9 Nov 2021 17:15:32 -0500
Message-Id: <20211109221641.1233217-14-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109221641.1233217-1-sashal@kernel.org>
References: <20211109221641.1233217-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_141716_495908_D948D419 
X-CRM114-Status: GOOD (  10.32  )
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

From: Bixuan Cui <cuibixuan@huawei.com>

[ Upstream commit b2fc2c92d2fd34d93268f677e514936f50dd6b5c ]

The platform_node is returned by of_parse_phandle() should have
of_node_put() before return.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
Link: https://lore.kernel.org/r/20210911081246.33867-1-cuibixuan@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index de09f67c04502..a3fa8efc8f81c 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -1040,8 +1040,10 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
+	if (!priv) {
+		of_node_put(platform_node);
 		return -ENOMEM;
+	}
 
 	snd_soc_card_set_drvdata(card, priv);
 
@@ -1049,6 +1051,8 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+
+	of_node_put(platform_node);
 	return ret;
 }
 
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
