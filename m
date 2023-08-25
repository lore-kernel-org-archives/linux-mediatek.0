Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A98C3DA66
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QKuYBGqDNfevPgqLQGe1abZBRXyM1hFJQmY/97Hh66A=; b=ChhcKguBzPVpAE3JX3T1owZiof
	KHIjGb/02H1V/5eh+LEu0+p+TeugmmodIlM1kb+REP9Jb59eMDP4CvhwnVpVVG/7qmOxDH3TIGMue
	dyqgIX+sV0n1HmixbDou0MhKwslKv1UA4ECXC4T/5akHZCsZPdMRea02Y/Dhw3nrX9rz7zydtJdXy
	zQfRVlRTC3DCxD+UrC8eLnHQl5SqmwagsKdHaJMM8h091ATKjEUFNtoGUij/Ejx/YPmYsA1Rrlo/G
	F0heEnCtIEn9zPq1g5ygYftdQAZL40px5R0U8Un3J1Fs7YomS6+szMRO3lmvOkULm0t0+NXgez9K/
	k//JP3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZYsK-005h9G-1c;
	Fri, 25 Aug 2023 15:37:28 +0000
Received: from mail.astralinux.ru ([217.74.38.119])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZYsF-005h7C-1Q;
	Fri, 25 Aug 2023 15:37:25 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 202671868942;
	Fri, 25 Aug 2023 18:37:07 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id v73nNLLpUn7Y; Fri, 25 Aug 2023 18:37:06 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 87BBD1867579;
	Fri, 25 Aug 2023 18:37:06 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id I_6nBa4-AHub; Fri, 25 Aug 2023 18:37:06 +0300 (MSK)
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.233.189])
	by mail.astralinux.ru (Postfix) with ESMTPSA id 72BA51868950;
	Fri, 25 Aug 2023 18:37:04 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Eason Yen <eason.yen@mediatek.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] asoc: mediatek: common: Remove check of return value of mtk_memif_set_addr() and mtk_memif_set_format()
Date: Fri, 25 Aug 2023 18:36:50 +0300
Message-Id: <20230825153650.20923-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_083723_676848_4D7A16EC 
X-CRM114-Status: UNSURE (   7.38  )
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

The mtk_memif_set_addr() and mtk_memif_set_format() functions always retu=
rns 0, so it is
necessary to remove the check of its return value (which was
probably specified by analogy with the check of return values
for other functions) to make the code more readable

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: df799b9502ed ("ASoC: mediatek: common: refine hw_params and hw_pre=
pare")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/media=
tek/common/mtk-afe-fe-dai.c
index 882cdf86c8bf..3c8a11c5958d 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -143,15 +143,10 @@ int mtk_afe_fe_hw_params(struct snd_pcm_substream *=
substream,
 		  substream->runtime->dma_bytes);
=20
 	/* set addr */
-	ret =3D mtk_memif_set_addr(afe, id,
+	mtk_memif_set_addr(afe, id,
 				 substream->runtime->dma_area,
 				 substream->runtime->dma_addr,
 				 substream->runtime->dma_bytes);
-	if (ret) {
-		dev_err(afe->dev, "%s(), error, id %d, set addr, ret %d\n",
-			__func__, id, ret);
-		return ret;
-	}
=20
 	/* set channel */
 	ret =3D mtk_memif_set_channel(afe, id, channels);
@@ -170,12 +165,7 @@ int mtk_afe_fe_hw_params(struct snd_pcm_substream *s=
ubstream,
 	}
=20
 	/* set format */
-	ret =3D mtk_memif_set_format(afe, id, format);
-	if (ret) {
-		dev_err(afe->dev, "%s(), error, id %d, set format %d, ret %d\n",
-			__func__, id, format, ret);
-		return ret;
-	}
+	mtk_memif_set_format(afe, id, format);
=20
 	return 0;
 }
--=20
2.30.2


