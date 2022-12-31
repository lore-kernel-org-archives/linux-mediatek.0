Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7055CC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Dec 2022 20:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WN9zTYIRYdOMpYuWboYKtjNs/fAWvOvRi12vlwn095E=; b=ONuFRGwFI9GjXyNwixKGc7nCG0
	71yxsY8emspyjdSDMNvqnMvDFQKwlvBxwB5tPDzdWyMUix1WW+77rnT5LSItwv86UZALgoiXA6l8/
	hIadIyitcSPQMik6UrWOGgjU0YSigtuFAxheCUk8ePlmfRMpjaSTpa84FwFPP5xwT3QHxvAtQKSVl
	1yGHR/LnuW2Mt0Xyr0af0x82qJ1imJk6q5AX5MKdAMn/PryIWnw3abnEpWHKgCpOMvEWEi0YNqhr/
	ciK7Pzny16m50Z99RqFTz602OgXQF/lCuRnZ8sSKX3f6bQgCBEHolScZKrvqT3x7rEYBOjJaKLCaN
	GHCrWHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBi6Y-009h3w-NL; Sat, 31 Dec 2022 20:05:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBi6H-009gvF-TA; Sat, 31 Dec 2022 20:05:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 85C2B60C2B;
	Sat, 31 Dec 2022 20:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18FCC433F0;
	Sat, 31 Dec 2022 20:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672517094;
	bh=nbEQCC/a/+NsXj6d7pAHo1OtVx4lNUjq9z845PL8KLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kgn1awa6j4koxcAFSCZxbWYbksP1qEevFxgKHa5AFVc35JwP8So4ENt1mQdHUYlfa
	 sUn6Qz9chc3hFaOXRUtWkbZ6Vwnm0lFx87KfvROae8qmnGC+03b56qH5lv7CaWq7NO
	 Twh6jvjWXMojBPUkJTKrsWd17AaQOF9XkBQfjJ/pHmPuQ2puZ4+m4RnSG0aOflJs3j
	 3JUWef/odCCxrcYpfI6c8RBrePIAsT98llHeI9w9qvl3nWN4ePc2B39ePs/U7Ag77E
	 DJhCmA9Aq+8EecAywFEaMbC4GMgtbgYiDEjMULYut1kiKg3fJopnfJonn9438YnK8a
	 s1X77QfGSQzdA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: YC Hung <yc.hung@mediatek.com>,
	Curtis Malainey <cujomalainey@chromium.org>,
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
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 4/7] ASoC: SOF: mediatek: initialize panic_info to zero
Date: Sat, 31 Dec 2022 15:04:36 -0500
Message-Id: <20221231200439.1748686-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221231200439.1748686-1-sashal@kernel.org>
References: <20221231200439.1748686-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_120502_293263_11D9BD24 
X-CRM114-Status: GOOD (  11.13  )
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

From: YC Hung <yc.hung@mediatek.com>

[ Upstream commit 7bd220f2ba9014b78f0304178103393554b8c4fe ]

Coverity spotted that panic_info is not initialized to zero in
mtk_adsp_dump. Using uninitialized value panic_info.linenum when
calling snd_sof_get_status. Fix this coverity by initializing
panic_info struct as zero.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Link: https://lore.kernel.org/r/20221213115617.25086-1-yc.hung@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/mediatek/mtk-adsp-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mtk-adsp-common.c b/sound/soc/sof/mediatek/mtk-adsp-common.c
index 1e0769c668a7..de8dbe27cd0d 100644
--- a/sound/soc/sof/mediatek/mtk-adsp-common.c
+++ b/sound/soc/sof/mediatek/mtk-adsp-common.c
@@ -60,7 +60,7 @@ void mtk_adsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
 	char *level = (flags & SOF_DBG_DUMP_OPTIONAL) ? KERN_DEBUG : KERN_ERR;
 	struct sof_ipc_dsp_oops_xtensa xoops;
-	struct sof_ipc_panic_info panic_info;
+	struct sof_ipc_panic_info panic_info = {};
 	u32 stack[MTK_ADSP_STACK_DUMP_SIZE];
 	u32 status;
 
-- 
2.35.1


