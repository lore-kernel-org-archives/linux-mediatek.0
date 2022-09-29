Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE37C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 20:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Myj5pwXBiOBl/Oheah/8nv6JWAVMZ8REC2QxU47plLY=; b=1iL2GmyIoqiesslVymAJUY/gLU
	RiM7lCZ0HKO+dV8WXJRvOPi0DNZ4mrrSgFiw4ncX5B9p186xIRnRNDAMNPgXI4CQMVAsMzQPCpaUO
	riarsmnISLqSBhYQF0OI3Klp4u4XI7iNn0thST4Zsb2unyX/MlcO6uYPJ6GLPzcBAIth+sfi9MERH
	UFG/x3C5PgB61mDxH/gvKFsa0GpuNrpfTJqe6+r7KZtyjXlHCrqI/+y4pEBehCorj8vnCrPTfKlU4
	qXJr21jLk1KEUSlEQZMZSzUinDBTaxf/k4f4VSefw7hlaY6MwDhPKKvj9+yi4Zfy9Do7+n0Q4ZQ03
	6umxKiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe0Yx-005SGj-DD; Thu, 29 Sep 2022 20:55:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe0Yl-005SD9-CY; Thu, 29 Sep 2022 20:55:09 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 022D566022C0;
	Thu, 29 Sep 2022 21:54:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664484899;
	bh=u8vd513Z6iUQllRWnPPQC4Zl83VQH1gtqG8/V8QUGJY=;
	h=From:To:Cc:Subject:Date:From;
	b=I/90rkr6oP3p4/r66yBm0/dLpFtqmvwZowTrJZa7HwvaxaDCOTd7hVQ6WN5moCpuG
	 kSnOh59WkOk3oAzHztGOC7GkcU0OTbhRcLlor3GABI+J7TpimDAtBr13pqXkDgE3xe
	 QRcnkGpWhOpbHYZjSPohsLAKI3I7VWkWYmpduoNX6z2FKlbYM8kLL/Ffr8jU39XnLl
	 uoVmuvbBDymYkNUgDLMfrm3AbgLbiFSWl46yCPajy7LDNRMMzC1MJRlIWCPX1z9KlI
	 A0DNr8d+0l9LIHQ2HDuJJlFvwh0oAmjdfeGqwSs3nZeH8BcemKMHQ5w6siipsFbF8R
	 fNXFXrYqZFYrg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
	Jaroslav Kysela <perex@perex.cz>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@google.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8192-mt6359: Set the driver name for the card
Date: Thu, 29 Sep 2022 16:54:53 -0400
Message-Id: <20220929205453.1144142-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_135507_680771_A0557BCD 
X-CRM114-Status: GOOD (  15.73  )
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

The ASoC core automatically populates the driver name field in the card
from the card name if left unset. However, since the driver name can be
at most 16 characters long, wrapping will happen if the card name is
longer, which is the case for the mt8192-mt6359 driver.

Explicitly set the driver name for the card in order to avoid said
wrapping and have a readable driver name exposed to userspace.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---
Issue noticed while upstreaming the UCM file for this driver [1].

[1] https://github.com/alsa-project/alsa-ucm-conf/pull/217

 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index ff40ccd36f7e..b93c3237ef2d 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -24,6 +24,8 @@
 #include "mt8192-afe-clk.h"
 #include "mt8192-afe-gpio.h"
 
+#define DRIVER_NAME "mt8192_mt6359"
+
 #define RT1015_CODEC_DAI	"rt1015-aif"
 #define RT1015_DEV0_NAME	"rt1015.1-0028"
 #define RT1015_DEV1_NAME	"rt1015.1-0029"
@@ -1070,6 +1072,7 @@ static struct snd_soc_codec_conf rt1015_amp_conf[] = {
 
 static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_card = {
 	.name = RT1015_RT5682_CARD_NAME,
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = mt8192_mt6359_dai_links,
 	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
@@ -1105,6 +1108,7 @@ static const struct snd_kcontrol_new mt8192_mt6359_rt1015p_rt5682x_controls[] =
 };
 
 static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682x_card = {
+	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = mt8192_mt6359_dai_links,
 	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
@@ -1266,7 +1270,7 @@ static const struct dev_pm_ops mt8192_mt6359_pm_ops = {
 
 static struct platform_driver mt8192_mt6359_driver = {
 	.driver = {
-		.name = "mt8192_mt6359",
+		.name = DRIVER_NAME,
 #ifdef CONFIG_OF
 		.of_match_table = mt8192_mt6359_dt_match,
 #endif
-- 
2.37.3


