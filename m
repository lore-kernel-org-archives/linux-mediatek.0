Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C70CD37AE
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 20:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iuH5M3OKaFqO/zUaKD6Zf33toTBRQm9seRXh8qC31JA=; b=e6Dm+O+AH1d8pgNa5YklwEuTQw
	Ye5+AeGdqDM36K4wxg6FYCGyb/1XZES6lE023h1l+zDBp0UXT2N2eXE0jVmnjqKFvGgm6gEF004Oi
	MZEgbikXT3n4WmAtVQBPrY8TonoPrBVL6avOyEex20UR76YyYjsvs9g48ZUemWOT6TfXTfh7LExa6
	1QmLQJMN0BY4p5G8UAGU+GyKLCUrmqGAWidr4F3g6mu2xVLH0NpJIU8Da7QoGjoejYoZ4TtDX8q8K
	eYVLrKbsRVfx708anaf2cMkfiFQYAHn0Y+xadPS5prCQ4IaSzVQx//4LQCTeh0cu68O6CkV6RVZEu
	j5oVCvEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slaMe-00000001ooM-3V4E;
	Tue, 03 Sep 2024 20:43:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slaLh-00000001obc-2dRn;
	Tue, 03 Sep 2024 20:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0DEA1A43EA9;
	Tue,  3 Sep 2024 20:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D50C4CEC4;
	Tue,  3 Sep 2024 20:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725396119;
	bh=fObWe6/9NPe8SUFuJMyrYDaUhNT1pDVv6rt+ZUMVZYc=;
	h=From:To:Cc:Subject:Date:From;
	b=MNl4JMZHjo05n3iUIdWYXSbsqozISkfNL9zTyfrWKZpoVnxB2ieqHj2jf0/HB9llN
	 K71aKkd5cgrCUQKB1RlzZHOpPT8xmMZrxdg+UoRiekwI3inc8wLI/KxA6+Kk0R9OJt
	 LqKt91yiVrmDiUo7q8ghx4rii+rT2HFiYC5PIvF/qXz1xj9qEkKdQ+flQbs78oS49n
	 wYQqY672G9JlD1qn++f/hl0dX1Yhxme6loLmDdoGT9rVXn+1bgN7dW0pD9Fe/mqN0v
	 JxrBrvuiKALCJDSug5DcVSf6v4wZsutqLJpGsPnYQ9uESvHfHtL9HLhI9XI8VYo9SH
	 lbHXfF+w5lQmA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Albert=20Jakie=C5=82a?= <jakiela@google.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pierre-louis.bossart@linux.intel.com,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	cujomalainey@chromium.org,
	krzk@kernel.org,
	christophe.jaillet@wanadoo.fr,
	u.kleine-koenig@pengutronix.de,
	trevor.wu@mediatek.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 01/22] ASoC: SOF: mediatek: Add missing board compatible
Date: Tue,  3 Sep 2024 15:21:48 -0400
Message-ID: <20240903192243.1107016-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.7
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_134201_756901_3A36EAB7 
X-CRM114-Status: UNSURE (   9.63  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Albert Jakieła <jakiela@google.com>

[ Upstream commit c0196faaa927321a63e680427e075734ee656e42 ]

Add Google Dojo compatible.

Signed-off-by: Albert Jakieła <jakiela@google.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Link: https://patch.msgid.link/20240809135627.544429-1-jakiela@google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 8d3fc167cd810..b9d4508bbb85d 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -574,6 +574,9 @@ static struct snd_sof_of_mach sof_mt8195_machs[] = {
 	{
 		.compatible = "google,tomato",
 		.sof_tplg_filename = "sof-mt8195-mt6359-rt1019-rt5682.tplg"
+	}, {
+		.compatible = "google,dojo",
+		.sof_tplg_filename = "sof-mt8195-mt6359-max98390-rt5682.tplg"
 	}, {
 		.compatible = "mediatek,mt8195",
 		.sof_tplg_filename = "sof-mt8195.tplg"
-- 
2.43.0


