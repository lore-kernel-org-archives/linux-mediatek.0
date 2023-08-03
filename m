Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890B5C00528
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 08:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Lx1zRkSdUANyaQ1Gnq02c/pWcPt7HlFaVxx5Opdo2g=; b=frpSr3BK9FBxKTDTx5jKwZzn9y
	g9OuQmUDTlNA0wgKyFTthPv1WX7qVAk7uY2ESI3ikRrZ2KoSXhPiMvdsY2o5Fzsd8gY60k8co9Z1v
	hALFSWRzjO4RHgqjdSGj/kWnaWxMLnrwcEDmBq23zVtwCvmnyl33b5rM1fN3TSPonhzZx8urxRXgt
	LO9OfX4qGBDHmc3s1NhfL6+hKBCKTZszoPnY9BdFtfBkPaYStzS4GM3FBuBpYayB59sKGc3I2aa9b
	/V5Q7EhgnyY/Aq+3Ye6qlcGIEW5qIRtBK1bHzGAc4eAG0uho/4vBJTkemU2JqFbLGLX/TCBfSRMcc
	7nhhsJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTre-0073Se-1B;
	Thu, 03 Aug 2023 08:39:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTrZ-0073RK-1n;
	Thu, 03 Aug 2023 08:39:18 +0000
Date: Thu, 3 Aug 2023 10:39:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1691051951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=8Lx1zRkSdUANyaQ1Gnq02c/pWcPt7HlFaVxx5Opdo2g=;
	b=CPQx6POElCLI25HF25EWtOndSW+HbPBlw+XjgcofIO7Qa/rD5ISAfXDRNhgENP+5k5n8ng
	4v8/nFN+adBmm5e9xTCKkMpcdALJZOdU2GIJ3qZxJk93AKjfG31WpR1j3B0V1AkYYfSKle
	lJO6GzwyoOnXRhbEM4bA/RluEQlJWaQZjNDjBfQdZWFy2mf4dyLPHMFckXA9zmx3cKreUu
	mctMsMEKFm+IZ5uKVX+Y+VOLA+Fjk5XllqV/MYbyTRPi2A3BXaTjengqZjT64zUnxVRmfg
	bjOEovuOnqVApTBzP8rARUWNtA6XqB7KxYxIOQ1kgsOcVn9ea+PkRRm65JaW4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1691051951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=8Lx1zRkSdUANyaQ1Gnq02c/pWcPt7HlFaVxx5Opdo2g=;
	b=JQNECTpCykh1SaYk8dxFPh2yoJ2XOfEVbF2oKss4URiMxPsZDnwgJHCDHiAEXMp6w4PWfn
	IGkC8z2x12mXUoBw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] ASoC: mediatek: mt8186: Remove unused mutex.
Message-ID: <20230803083908.9DxbPvOK@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_013917_749289_B6C8B34D 
X-CRM114-Status: UNSURE (   7.33  )
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

The mutex mutex_request_dram has no user.

Remove mutex_request_dram.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 539e3a023bc4e..70ec101890d36 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -13,8 +13,6 @@
 #include "mt8186-afe-clk.h"
 #include "mt8186-audsys-clk.h"
 
-static DEFINE_MUTEX(mutex_request_dram);
-
 static const char *aud_clks[CLK_NUM] = {
 	[CLK_AFE] = "aud_afe_clk",
 	[CLK_DAC] = "aud_dac_clk",
-- 
2.40.1


