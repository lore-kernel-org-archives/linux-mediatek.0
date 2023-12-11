Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5D6C10DC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 13:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0wlTcCEJMlvsh4aukW3oCT8yp77e/pYvHoaxlV+oo4=; b=2+oBe/mc7gPJMwOHZL+QxDh/De
	ALCzbc+F5+hiGxkGdfSlRa/VuCnG9wTL4xgD+Ss+qA2dIlXjPzb2fW4GNsgSpm9kNMlCVnpwMLaB1
	TpCXPrdpeCNMoCNtxBMM6Cih7z5nyZQjXQHkgmhYtFV09Z3GeszCtP9QhUBuzhAOI7qenchwqezX3
	vnW/WRvnagYzy+MZPoSQnhFZ1KdSLUUOnKikYtbHPuBHrORFVRwviMJsiyyYYmmFQ6wav32lGd/7H
	0A42+1disMTiNkXfn4HbQb61p8DWpn/SKcQYbnEJCd6Hr6VWKJeYcd/oMBsbSsfveMVVeXjH2X9bU
	GVsqGD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCglT-0052Yb-09;
	Mon, 11 Dec 2023 13:56:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgku-0052N4-2Z;
	Mon, 11 Dec 2023 13:56:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21187612AF;
	Mon, 11 Dec 2023 13:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E087AC433CB;
	Mon, 11 Dec 2023 13:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702302931;
	bh=uDlu4Y967RJ4SxiO9YzlT7AG+ZRio0a6mNsr/SQmFbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qZL4nbKUVzWns2EId+asMBx/XS+gzzr+KhBunQNhTHc4/c8R2eeoMrAFUgVfBK5EW
	 Q5t0uAoAVykJtlwB85OZYnzrp4542yzpCOkLsZmOEAcnlAxgoQnUxU9z0r9Ic1c4Ht
	 FsVrGRaHcl9pcUC1uYPuA2ZpbpQ570EdBgSQixgBbEs8rbEMHqoKKrAyWBtQznYcJ5
	 XgII0ZHT3i2nAkP3ZPGJaQoqz8RdwulgtqICfrFCcq3hvslYFZGIFvmGL/Hx2XEr5m
	 nPTK0mMPvWAGdYWp49RHLAan2+4tDyj/gwaZJTi6jRYGHCiJiupBZ87OsXfnEe6BHJ
	 SlmN0Za17OY/w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
	trevor.wu@mediatek.com,
	tinghan.shen@mediatek.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 11/29] ASoC: SOF: mediatek: mt8186: Add Google Steelix topology compatible
Date: Mon, 11 Dec 2023 08:53:55 -0500
Message-ID: <20231211135457.381397-11-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135457.381397-1-sashal@kernel.org>
References: <20231211135457.381397-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.66
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_055555_787649_5FD6EEF7 
X-CRM114-Status: UNSURE (   9.51  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[ Upstream commit 505c83212da5bfca95109421b8f5d9f8c6cdfef2 ]

Add the machine compatible and topology filename for the Google Steelix
MT8186 Chromebook to load the correct SOF topology file.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20231123084454.20471-1-angelogioacchino.delregno@collabora.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 181189e00e020..76ce90e1f1030 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -596,6 +596,9 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 
 static struct snd_sof_of_mach sof_mt8186_machs[] = {
 	{
+		.compatible = "google,steelix",
+		.sof_tplg_filename = "sof-mt8186-google-steelix.tplg"
+	}, {
 		.compatible = "mediatek,mt8186",
 		.sof_tplg_filename = "sof-mt8186.tplg",
 	},
-- 
2.42.0


