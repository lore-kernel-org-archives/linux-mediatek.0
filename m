Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369F0CD37B1
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 20:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=maXpUH+/F8w+OCe1DdjD/RDf5XcGtfvlQ4Wfn1ildU8=; b=bhI4wi4udctnWOiO+Pu7luWAdN
	/Nm8MMFd2TnMAwoNDjvCjlAOCAY7ICaJvxbYfo2l2qvrKjQjS7S1m3nMYQrcQzwn8JJB8zd+n/M/1
	rEDkhm+UHl+iXBTsu3p0csyn7qXBKutEmFWfzRCGRW3b7Xulg0BjCIw30BaWapkxXT5rKWrFA8GEw
	HP3PH2/2oH3AbB3LsYf63KgXNbkIJliOSM0bGrV07F4iR0AeIuicgwiEkH7POBUKPWo8W7yaZudlV
	gODTkrd5II4Fc7NUYQNeIMiqg7ZoTX7C/NOGh3QyXCulvC64hOm8yqIarY9tnqoZnKQEr6i+vgf/c
	/DoDRKCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slaSM-00000001qp9-2o5q;
	Tue, 03 Sep 2024 20:48:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slaOs-00000001pfe-0Nzh;
	Tue, 03 Sep 2024 20:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EDDF75C4B35;
	Tue,  3 Sep 2024 20:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C4BC4CEC4;
	Tue,  3 Sep 2024 20:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725396317;
	bh=ZN3aHPQfFSmVtl+HuC3jUfcxPgpdLvgJItoky229XU0=;
	h=From:To:Cc:Subject:Date:From;
	b=Junl84VhaoF1CmOGzsuGmdkbNHrrjZDdttT9rk99W/PLqoh285hua+AnlY+cYpGwp
	 /1tcVZMhU2YDmVITSpV2lpPeMtBmwjL5Vazl8o9cUHifCbld50/I4RmKFYIOBWWgj8
	 IFiLUHNS7padTNwGwwdazhjbiOEt7pT29HgBq4/4AMOTzqS97o2NpmgTc6DQ3+xNZF
	 7BsyQdPX+1sizQNOLXwd6BgO9IfUmPTmkVTN5sFnNWyVbg/0iLHGDvJm4bjCm0pKji
	 +eelscbudlFwldF2hbudHgUrTxEZileYvjjo2VFwzZ5cf7G1j16HwBwUHAA91/8kvO
	 bfX/mB0vyk1VA==
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
	kuninori.morimoto.gx@renesas.com,
	trevor.wu@mediatek.com,
	christophe.jaillet@wanadoo.fr,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 01/17] ASoC: SOF: mediatek: Add missing board compatible
Date: Tue,  3 Sep 2024 15:25:15 -0400
Message-ID: <20240903192600.1108046-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.107
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_134518_214452_2F763B40 
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
index 53cadbe8a05cc..ac96ea07e591b 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -663,6 +663,9 @@ static struct snd_sof_of_mach sof_mt8195_machs[] = {
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


