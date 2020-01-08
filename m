Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FBAC282DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 15:58:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C32E2077B
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 15:58:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KTM7F/G0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C32E2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=+SDXChUYLsZehv2wqLJ67vQ7OMLPJ/x5zah/vAjvBDg=; b=KTM
	7F/G0QDhNkaNqhHnN0YN14Wd6Ou6KLsji8Ft/eTMHwK0FLff6MVWJj81MCefkoEElfD7mV04fzMo7
	rGOktOmykB16nm/lwBr1Io0oyVI5JhSIfI2qrR8L3loQZ4xrAWQ6uDrybEqhtg9hEDar8rv7XNgqo
	2CczdFMzzt2cWcu2EoQ/6DtyFiqq+OmZfjSaZ15G4SPx4wiU/0MOEXokH3uVigMZzXW3NFUr5ymNy
	UcZBWfPPcl8lOt96gxibMulcqdjgRLsA3K6PMSjSumok+eDPMv3lvELauDStl9K7ZkOiLXuijpF9I
	Ihls6vXhwb9RK0lPMNb9WE80rJbiDew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipDjN-0005fV-Dz; Wed, 08 Jan 2020 15:58:49 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipDjK-0005fA-2G
 for linux-mediatek@lists.infradead.org; Wed, 08 Jan 2020 15:58:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00FFD328;
 Wed,  8 Jan 2020 07:58:45 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80E213F534;
 Wed,  8 Jan 2020 07:58:44 -0800 (PST)
Date: Wed, 08 Jan 2020 15:58:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Applied "ASoC: Fix NULL dereference at freeing" to the asoc tree
In-Reply-To: <20200107070956.15807-1-tiwai@suse.de>
Message-Id: <applied-20200107070956.15807-1-tiwai@suse.de>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_075846_153321_54645BF8 
X-CRM114-Status: GOOD (  12.38  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ben Ho <Ben.Ho@mediatek.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: Fix NULL dereference at freeing

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 8e3366cad2bfe4e669bfd3758110be90b1dc75aa Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 7 Jan 2020 08:09:56 +0100
Subject: [PATCH] ASoC: Fix NULL dereference at freeing

When an ASoC driver with pcm_destruct component ops is freed before
the PCM object instantiation (e.g. deferring the probe), it hits an
Oops at snd_soc_pcm_component_free() that calls the pcm_destruct ops
unconditionally.

Fix it by adding a NULL-check of rtd->pcm before calling callbacks.

Fixes: c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcm_destruct")
Reported-by: Matthias Brugger <matthias.bgg@gmail.com>
Tested-by: Ben Ho <ben.ho@mediatek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200107070956.15807-1-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-component.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 1590e805d016..6a8f26bf09ba 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -520,6 +520,9 @@ void snd_soc_pcm_component_free(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_component *component;
 
+	if (!rtd->pcm)
+		return;
+
 	for_each_rtd_components(rtd, rtdcom, component)
 		if (component->driver->pcm_destruct)
 			component->driver->pcm_destruct(component, rtd->pcm);
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
