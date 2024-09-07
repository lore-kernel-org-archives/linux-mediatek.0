Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9E5E6FE49
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 01:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+G41Hom1ZnE+Cu8G4r9ppPTQdFLzvEFHAGH7QPZKiU=; b=ePFh5SG4Ha4PuGZNMgGEjzcRP3
	4dhi84bZYm2zeBeucZp5/IlK+XHOl9ZBbU3Fuz22jjaeWKutne7YF/igGpW/kTNSmEdz2Vm7KPlNp
	spgW2FfBKJP8GFhrgHoPT2+ps5CXlfMydMfEAy8/W9agV1DAYnQ4tkiOu44FP3IDmAbCjotkcSULm
	Ko6uKc3+SvUaTRJ08jpLlwbCDIlzFljSBnxG8kvWWn/O1cqfuTE21uaZonSq7cx/k+Y0i4u14H5Wj
	EyJavrIBxCghhvmShE7KM5E67i75QF+0KPTo8npnANoFJJXCAB5VR0t6TtYKFObYAhobsvjRKX4WZ
	2+Xm0peQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjra-0000000Dzaj-16Ur;
	Sat, 07 Sep 2024 01:03:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjk4-0000000DyMl-0XQR;
	Sat, 07 Sep 2024 00:55:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0ACE15C5AD7;
	Sat,  7 Sep 2024 00:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B490DC4CEC8;
	Sat,  7 Sep 2024 00:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725670555;
	bh=nA9ahGD8KCtvlvbDt4nJtzFF7vCKqQHJVd+rW53TmJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ayJETFy3oR0dj/YVoAdbPdMdTaPXt6OFwEabnelgP6jdlmYvD+r+YwAYAdwA3hSZt
	 /MpGtMM01zhUI+Gj3+EzGiK9jY7sn8ZkYoLak0Ulbg/sGIwpOu2fMMNYU6A+3lnDFl
	 nkUOiLty2yVVtpzuPzMsghsZ2qv0na0DXO4lPxk8+dEriNjEifPuY2NMkbAEBlpg3W
	 0bZWK0CsUAVlb9ONCFoU/AaKQhGL1jmXaKkFnzu3dnazKI0tBJy3ouW7idfxi0BKtm
	 APvXwXL9TJ+jS/2uhjEIIt5d/MGowtuGlzfK1LDP6xSuPOrn4CF2tRHFBuQKI9KqFe
	 IpHPqjOje0hHA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 07 Sep 2024 01:53:32 +0100
Subject: [PATCH 7/7] ASoC: mt8365: Allow build coverage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-asoc-fix-mt8365-build-v1-7-7ad0bac20161@kernel.org>
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=745; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nA9ahGD8KCtvlvbDt4nJtzFF7vCKqQHJVd+rW53TmJw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm26SBashc9R8SRaPNLmRiHb9uf0L6Kfilp2Crr
 xwJesp/DgKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtukgQAKCRAk1otyXVSH
 0HNBCACC6/FARXYPWFGoDdvKChOmPaXipGUS4ZUgMv2zgpiLMUk3Rmjoh92TZAho+u88uJQZU0l
 DdMQMkr7n/GhGSDZ8nvNOsXOe6HJgCXIUrYg289RDlfTTDCd01DIjX6L8gmvQ/apVEBsYWwlSRW
 VXLE0ROKZgbFD+IdJL29AI5vcrDum/WYhG9AopQI2H0aIF0+t26jgOB90mm0qbpKOC2ioWRtbeT
 WDK8Ew8uTY1qF5AVL6HuVt7HgYEQOUzRu9w0yr/O/HA8u9tiGbxRz7UR2y7VRXDp+sskceBZctV
 Rm0Y0JFiCbcO4Qf8vsW6q1xRG5dEGu01CjVUPZb8nLBFTKJT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_175556_250062_A523395A 
X-CRM114-Status: GOOD (  10.70  )
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

There is no build time dependency on anything specific to ARCH_MEDIATEK so
enable COMPILE_TEST builds.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index e6f7a5a49794..3033e2d3fe16 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -301,7 +301,7 @@ config SND_SOC_MT8195_MT6359
 
 config SND_SOC_MT8365
 	tristate "ASoC support for MediaTek MT8365 chip"
-	depends on ARCH_MEDIATEK
+	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select SND_SOC_MEDIATEK
 	help
 	  This adds ASoC platform driver support for MediaTek MT8365 chip

-- 
2.39.2


