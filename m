Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED8CCE7B04
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 00:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gVnx1MmuYIlg0tiqUoYNZHesWSYWMmDezKgdxokwdPc=; b=1Ix0ZoSyLiO9lg
	Mt8yf6B0x6j0Ogjt/V3OMC54aFG3RsjapiXWXRx8+ZPnQ2cU6XtJp866T3NDPYAlpPGl8iRnLXQuy
	Nz49UJMCk7qPZ0CfEDUL32xT3Ryjx4Vnf1iljL6KuV4R5KaX0gRzZQwG91+mOoD1HXmeDVS3vI4jp
	Ip0AxkPj2qpZ1FmJWHx9SyJDLpzkYDtXit9KibfvC8YsYjQFe+cVe3xJUBvdo2CH1VpVztUt8JUCQ
	4w9X10FVUGjnHkB4UYHOBJpkRwVsK8yjNUnYY5pt6jPB0xBNCLOFu641f0kQ7HJQcVYvWJt0jwBv3
	A8qc7ADhrYVQFFlQiFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjkk-0000000DyXs-3CjE;
	Sat, 07 Sep 2024 00:56:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjjj-0000000DyFX-1l67;
	Sat, 07 Sep 2024 00:55:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E925AA43B3F;
	Sat,  7 Sep 2024 00:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DEBC4CEC4;
	Sat,  7 Sep 2024 00:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725670533;
	bh=wxD7YWuOg77zkgGePiidkzZ2id3XVXVfSV/B0CWo3fs=;
	h=From:Subject:Date:To:Cc:From;
	b=txbaz/S0DzOqrP7Srj0uHP5NwxJ61ZeyK08ZfBcewUFksEwOYFOUa0Foy7TOBnZvo
	 wPHq+o3OGG47gBV9QPJ7h4DoE5rjnrSVk/Qqwv8nWYyyIHOYO/oxkf5GU741tZgH6N
	 UDVV09gFMXI8gml+xjjoeTll5SK7jZ2nurK4MywL07sJIjMEpwCMzIb8hV5FxwPn0n
	 TDLFNCxFFkSTWbwANTqX1QZquIamCMZHMLAUvHwixZXrvAV9lE4V+knRFZJUgravGE
	 rgAEFJwiRki76V5OwHhOifDSlQdjAZqh0JAMW8BSisCP22F2GKn86uEJyFbJpcsLv9
	 kL/KiUW32FphQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/7] ASoC: mt8365: Fix -Werror builds
Date: Sat, 07 Sep 2024 01:53:25 +0100
Message-Id: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAak22YC/x2MWwqAIBAArxL73YKaPa8SfViutdALrQiiuyd9D
 szMA4E8U4AmecDTxYG3NYJMExgms46EbCODEkqLWhRowjag4xuXo8qKHPuTZ4t1qaUse6mcMBD
 b3VN0/m/bve8HFLDYaWcAAAA=
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wxD7YWuOg77zkgGePiidkzZ2id3XVXVfSV/B0CWo3fs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm26R8iUKAFPl5RrLULFN0jg3emwaq07m5JyXWp
 stS2I2P9gWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtukfAAKCRAk1otyXVSH
 0Hv2B/0SdQwOpPUm0EC+oUW/2mBA+W5rI22n4xAN2Vfq3mvmNfMYxZvvtj6ESUy7aLMufxHWqZP
 MXwu8DuzxgbtZPfXDU8Z0HM6esGQH78MOSlNLG+hosmwwo8Yv/98YCER0QTAiyZnEDhzregE2qm
 LyqdtQ87iWeDy2AfUfxP2nrPau3Qf4qcEqgpoggmi8cOt34Dfyw8Z41dVgbDFkjXXCEITLc+uJz
 pd3UFpDib5MbDflmwnc9+iIYwsNhm0Hf7JRE18vbLJLlzStQL7o8djFMJhfx7UOkv6UTdZ657Oz
 ccBGhg4nKajdTOnPlWveLoBNGkVZLXWOfKogXKKyUIwvoyVr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_175535_568685_8D0A4661 
X-CRM114-Status: UNSURE (   7.97  )
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

Nathan reported that the newly added mt8365 drivers were causing a
number of warnings which break -Werror builds, these were only visible
on arm64 since the drivers did not have COMPILE_TEST enabled.  Fix this
and some other minor stuff I noticed while doing so.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (7):
      ASoC: mt8365: Open code BIT() to avoid spurious warnings
      ASoC: mt8365: Remove spurious unsigned long casts
      ASoC: mt8365: Remove unused prototype for mt8365_afe_clk_group_48k()
      ASoC: mt8365: Make non-exported functions static
      ASoC: mt8365: Remove unused variables
      ASoC: mt8365: Remove unused DMIC IIR coefficient configuration
      ASoC: mt8365: Allow build coverage

 sound/soc/mediatek/Kconfig                    |   2 +-
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c    |   4 +-
 sound/soc/mediatek/mt8365/mt8365-afe-common.h |   1 -
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c    |  13 +-
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c   |  30 ----
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c    |   6 +-
 sound/soc/mediatek/mt8365/mt8365-mt6357.c     |   3 +-
 sound/soc/mediatek/mt8365/mt8365-reg.h        | 214 +++++++++++++-------------
 8 files changed, 120 insertions(+), 153 deletions(-)
---
base-commit: 813751eaec93bfeb6236aaed99607a44c01b3110
change-id: 20240906-asoc-fix-mt8365-build-974117b12f0a

Best regards,
-- 
Mark Brown <broonie@kernel.org>


