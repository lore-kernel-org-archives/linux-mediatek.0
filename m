Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6E4C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 20:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vkHkCaWtDIfpH8ijSazjk6Jfhs+hqJsnwjns3+SaeCg=; b=vlQPg3qhh+iss2/XaMZk76kzXB
	8OmD8ttWgP9MsymQGbYIC2t+aw+Vv4ZO5ejlEw2dhQPNAMIqUqymWsCpM1WHSQdu4w85ns3psgwBD
	Re5x2uqJRIdDYcYqjOivA3biji5wDO3EfbIhtKjlahRRvBcUIkPrZErV8yGvk/3isWX4B7KQFQigF
	sZUJ2HVz355qPThkOpUB2gBQxnI4yCwJQaxTh3SXJx2mhggzSZmBDWc6A5k4vXTvFQybw16iB+6ML
	N4yO6nG2LPUW6jDVbW7Tv3kY+QMGVGI0heve1uzIoRGOQrYYGrLXYu2H95+4wMcAJwO7n6vg/tgf+
	FmlnZJ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHrXg-00000000Tdg-339G;
	Thu, 13 Jun 2024 20:59:32 +0000
Received: from smtp-67.smtpout.orange.fr ([80.12.242.67] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHrXd-00000000TcN-2wtY;
	Thu, 13 Jun 2024 20:59:31 +0000
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id HrXUsAUflNbytHrXUsgDhP; Thu, 13 Jun 2024 22:59:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718312364;
	bh=vkHkCaWtDIfpH8ijSazjk6Jfhs+hqJsnwjns3+SaeCg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=g/xzsFh2MkamRdsQKDv53s+bAw6tPvjMHfmSFNRtrNOApkoOHKjv8Wc8/TdKeyfHC
	 ipqv5H/DVpYWUGNABFHxxry+9ml49vL45+z9DUtryf5awGJe4IKtn91XOCKo/UcemF
	 LWS2tvL39XMnecXlmQK76b+veHt/RUwr0gTF5p+XivJpqZkj0eHJgUnQ/9fSDXHckf
	 uThafhO/uCu9jHd4W8CVwelQm+aXU/6hIARUdCqqg7nfteQd2ljfqKlUEW0D1JELkH
	 X9SbpLIpyg4rCTrU/jJSvugjpRUz1PYc7WmD47W0TZjy0vTSrA+Bk0IZ7D6tVYxwxl
	 kzn6hRUxIzbzg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 13 Jun 2024 22:59:24 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: SOF: mediatek: Constify struct mtk_adsp_ipc_ops
Date: Thu, 13 Jun 2024 22:59:09 +0200
Message-ID: <a45d6b2b5ec040ea0fc78fca662c2dca3f13a49f.1718312321.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_135929_906625_E5AA675B 
X-CRM114-Status: GOOD (  11.98  )
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

'struct mtk_adsp_ipc_ops' is not modified in these drivers.

Constifying this structure moves some data to a read-only section, so
increase overall security.

In order to do it, "struct mtk_adsp_ipc" also needs to be adjusted to this
new const qualifier.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  15533	   2383	      0	  17916	   45fc	sound/soc/sof/mediatek/mt8195/mt8195.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  15557	   2367	      0	  17924	   4604	sound/soc/sof/mediatek/mt8195/mt8195.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/linux/firmware/mediatek/mtk-adsp-ipc.h | 2 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c         | 2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/firmware/mediatek/mtk-adsp-ipc.h b/include/linux/firmware/mediatek/mtk-adsp-ipc.h
index 5b1d16fa3f56..6e86799a7dc4 100644
--- a/include/linux/firmware/mediatek/mtk-adsp-ipc.h
+++ b/include/linux/firmware/mediatek/mtk-adsp-ipc.h
@@ -40,7 +40,7 @@ struct mtk_adsp_chan {
 struct mtk_adsp_ipc {
 	struct mtk_adsp_chan chans[MTK_ADSP_MBOX_NUM];
 	struct device *dev;
-	struct mtk_adsp_ipc_ops *ops;
+	const struct mtk_adsp_ipc_ops *ops;
 	void *private_data;
 };
 
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index bea1b9d9ca28..74522400207e 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -82,7 +82,7 @@ static void mt8186_dsp_handle_request(struct mtk_adsp_ipc *ipc)
 	}
 }
 
-static struct mtk_adsp_ipc_ops dsp_ops = {
+static const struct mtk_adsp_ipc_ops dsp_ops = {
 	.handle_reply		= mt8186_dsp_handle_reply,
 	.handle_request		= mt8186_dsp_handle_request,
 };
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 31dc98d1b1d8..24ae1d4959be 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -82,7 +82,7 @@ static void mt8195_dsp_handle_request(struct mtk_adsp_ipc *ipc)
 	}
 }
 
-static struct mtk_adsp_ipc_ops dsp_ops = {
+static const struct mtk_adsp_ipc_ops dsp_ops = {
 	.handle_reply		= mt8195_dsp_handle_reply,
 	.handle_request		= mt8195_dsp_handle_request,
 };
-- 
2.45.2


