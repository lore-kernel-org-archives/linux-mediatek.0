Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F19CD37AC
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 20:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5IRjTwOUM9BiRCgpLpcxkE+qwIJKpL5quHm1GBOz0kU=; b=DPoBu7GqBH0joWIOfRiHNqB5rY
	nDLzPKxe6rZhSv3cbkPuvrn68AkdO5HIAmpeskNoY1O9VXsm1AHoh/B+8mRUXIRYDOFKvqyYhRIKl
	05cKzzSMjIvLx+iGvzBzpbX6G79uY7HyCzvxi8l8opn/Rb9eLlVsqwyWL5neb1T7fdVTjIVYpTTpf
	lwMcIVPWoTRl3vnB3X/r3OFctiO4VvYg56vhGyOf1iHVgDlyX/2Mkoa9+8asStaSB7aglbg9Gr1qg
	trVF2u3wSKMKGGB0O1jBPxW6BzWJF4LR1GXETLo2GOo7tVKFj5IMz3T2tdKxuVmAjR6Kyv9RtpAXu
	2OxuG+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slaPc-00000001q1B-0jkL;
	Tue, 03 Sep 2024 20:46:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slaNL-00000001p2b-1RNI;
	Tue, 03 Sep 2024 20:43:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F57EA43E83;
	Tue,  3 Sep 2024 20:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C53C4CEC4;
	Tue,  3 Sep 2024 20:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725396222;
	bh=w6xmb8ZJDVceRYIFTagavHFeNZRazE64x1rzW/Yj8ZU=;
	h=From:To:Cc:Subject:Date:From;
	b=LMcxCfHzxzeeluwzl2z6hgk+b/om2tAw7BPsseBLiDbZUnkx9hZrY6aPGccm8MjHH
	 aZ/n2ANHl93r51DdegRLPGH30LkOouKmVjRnmxszIXyrl3qs9llqeiorXPGMyrobG2
	 Ac7US+DUZXNyfMOWQxl0PMcXtDLQjhzk/wxCG9h5x1Nol67vy9+itFcU72A77MnzJj
	 S4jPK1GWZasa5/gx3DkkFGsNFioxvi2Z3RoReCP5xTrnbYnW8PIo6HbYjwQghSU8YB
	 zhoq0MYbnHf15FRqxS7MX69kHzYZdsbDKtief2z2hsZJ4m7KTcEb1S7mu4Ti8UPfAU
	 XCHLUp/5JyECg==
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
	christophe.jaillet@wanadoo.fr,
	kuninori.morimoto.gx@renesas.com,
	u.kleine-koenig@pengutronix.de,
	cujomalainey@chromium.org,
	krzk@kernel.org,
	trevor.wu@mediatek.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 01/20] ASoC: SOF: mediatek: Add missing board compatible
Date: Tue,  3 Sep 2024 15:23:33 -0400
Message-ID: <20240903192425.1107562-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.48
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_134343_468701_F2E1D736 
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
index b5b4ea854da4b..94db51d88dda0 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -625,6 +625,9 @@ static struct snd_sof_of_mach sof_mt8195_machs[] = {
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


