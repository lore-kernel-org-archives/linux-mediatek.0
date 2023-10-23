Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47027C25B41
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jAyRkZU+G6EHBgXjNlQRdapo8Bo6bVrz7BpJ95EsKKo=; b=v3XyqA4bUJZzeEFF02eRclyD1u
	TivfGzv1HTizhgVk5hPBbShCJpiK0PtoFOYZMZzeY2nBtiZkenN0VAJ8z+N6AROxl9IUJpxFI6a6U
	dgTAAs8Xa8dzlYNlPjrrkfK6HHNdhsOQ6HWyCXLyadzf+mmTSbhFrnIMKHww76Svo36S6if0Jb/nX
	UdPuyojcL+6peehinsE8p9EcFBAeSexE47qLiQrk7lS70StTZiW9FjiVkwGz1tUnS6ys+9Sotdr39
	kh2caP18Ql4V5UJT1SIU5/w3ah26bs+d4h6XE3p+y0UzGN3dc+J/C8WujBcEkvQeDr/zVaw9ImWtn
	9OTixceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quwg5-007fXj-0S;
	Mon, 23 Oct 2023 15:17:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quwg1-007fWW-1o;
	Mon, 23 Oct 2023 15:17:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4084095722aso27986805e9.1;
        Mon, 23 Oct 2023 08:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698074226; x=1698679026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jAyRkZU+G6EHBgXjNlQRdapo8Bo6bVrz7BpJ95EsKKo=;
        b=LM/6g+C0W3qxMQbBItwW+yz6BimLvOvTmpwDLbi4briDSDbCzBMAHKM8MZjJYweXkI
         95ZVpDjHRNC6YIx+mg8x4patZRPoygrTuTkRAb2DYzyZ0dhacAxyHMzlmDpGcO42fmkP
         jkF1NMVATkRH7YS06vLWdefqNG4g4b9siGSoO24VnCbmTn1VqGS6eq9lzmW+kNQkDmsr
         XA7/D3wVzlrFaw49MkRQzhT/yySkIvc8k8QqA3fstl3MmnxP+nCbgTMwwXCEucJ3cC70
         8ALTbVMbaa/CIOzoBFD7alSdmCSgY/+n16naCKH+pCnR4yHb2yFc1qrx1eNgeOkAsa2R
         1YlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698074226; x=1698679026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAyRkZU+G6EHBgXjNlQRdapo8Bo6bVrz7BpJ95EsKKo=;
        b=sV6FobJPW28siDCvLCQ2aUDrhK0VeHNsGz+Fh5NIjJ4fJJCtsXOn6zzIh+wGyewWQv
         5sifE/cuAkmqzTB5EptevaTlfyEJKu7zYCTkqrstfyHxur1hjLaIcePl3VKIVBlzsNgA
         /QIHqdnscBfGoHOKHYdHP/Yg+klyRfUs/s2JQQ6F378F/4zGQA1QivZAgnmV1LJRZ8dH
         gFT+nautzB+NlWoya4EypwFT+xvBZBSUPM5mfL73uCKY0FsZKGtV75wRx9L7d/V/nuDx
         qjdDF8YVtFUhX4pyDw3EFSOQfSc9TbfypRPEKKAbPoqDGMFHsT0DgkWQZrKOtjdobuVc
         E5lg==
X-Gm-Message-State: AOJu0YwfrZvatZyADmmzhgR3CLryiCQnlKrEdMMUNbRH87k9uCcr4pK5
	zfqeKEOIuATfDJGg+9gnm1w=
X-Google-Smtp-Source: AGHT+IG/PhtGCsg7wXm8Rc5Irl5IiMZvAOjGLp6Od9Km/HS5gzwHrgf4OZgoP6sqwU+2RfvtoTXxsQ==
X-Received: by 2002:adf:9dcb:0:b0:32d:a29a:b6ef with SMTP id q11-20020adf9dcb000000b0032da29ab6efmr6726291wre.23.1698074225584;
        Mon, 23 Oct 2023 08:17:05 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d5510000000b0032d2489a399sm7913701wrv.49.2023.10.23.08.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 08:17:05 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: mediatek: mt8186: remove redundant assignments to variable tdm_con
Date: Mon, 23 Oct 2023 16:17:04 +0100
Message-Id: <20231023151704.670240-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_081709_601212_D6318CCB 
X-CRM114-Status: GOOD (  10.65  )
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

There are two occurrences where variable tdm_con is being initialized
to zero and the next statement re-assigns tdm_con to a new value. The
initializations are redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
index 4148dceb3a4c..ef2801f84d27 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
@@ -416,12 +416,10 @@ static int mtk_dai_tdm_hw_params(struct snd_pcm_substream *substream,
 	regmap_update_bits(afe->regmap, ETDM_IN1_CON1, ETDM_IN_CON1_CTRL_MASK, tdm_con);
 
 	/* ETDM_IN1_CON3 */
-	tdm_con = 0;
 	tdm_con = ETDM_IN_CON3_FS(tran_rate);
 	regmap_update_bits(afe->regmap, ETDM_IN1_CON3, ETDM_IN_CON3_CTRL_MASK, tdm_con);
 
 	/* ETDM_IN1_CON4 */
-	tdm_con = 0;
 	tdm_con = ETDM_IN_CON4_FS(tran_relatch_rate);
 	if (slave_mode) {
 		if (lrck_inv)
-- 
2.39.2


