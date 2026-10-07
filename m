Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6EBCA5FFC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 11:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5tPW28u/y25LsoprSZgjrTYuNMeOHBtCHRS1PxOld3s=; b=xV0NqY0sHDJLxx6lBYvzRe4G5N
	821T3NlCPrdgGrjzE5XQY8cd56y17uouCNNwWIaZlTvxe+aiTpgPp1YYX0mcLWUxEGYQoab9PW8Yj
	vyHLL4rx1M90clAq8JkeuZ4UbMVwFB27AVq5bnMWf1ovkDyckLm6WX9U0XUFnhBwxeqZ1xXwHZIxJ
	SvYdpeUVY8wDEcYSUEEbOA6h0l75eHCdIESQawqDlQEi4dl8JWSNRK9ZxijGREj9xsTMzYRxVr9II
	emHoxRY5tX/ISJrtHkZAQZPGHCugdvAF/ZbvLyIn8IklIqAw+59dhIRl/85gnTsVSV2W+7C6c8/Uq
	jvBFT0+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPWi-00000002GqN-2QAk;
	Wed, 07 Oct 2026 11:09:36 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPWg-00000002GpN-0zqQ
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 11:09:35 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3a0a911e8d6so1994080a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 04:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371373; x=1791976173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5tPW28u/y25LsoprSZgjrTYuNMeOHBtCHRS1PxOld3s=;
        b=YIPqDshDp6P/yFXbAZ+pCrDNrLNJqUH140CTEHOK5h7pO2oMp2MxMnOH/wtqJoE+Gb
         ODn1qAfQEjryWDiyTYjMaANuhIH8ICb9YSqzscijEWWNk7urq4LElZu9nKRhXj1VZ4EU
         OGDcdFP4w083cmUzrXy+MEdTw7LR6ExDUFvU/KBNv8+utXZr+ZXvw5gMUzZRgCtsaDdt
         YsZBBymRtnYNgUdNFEdWgYxWiY+oPdSuUZSlM4zxhul32MW5kqYpBIAaO58txPgGEDOI
         mZXEuP/DFncVwzoAwfSI5nPP0CHECPDbeWN5bJdnmtgBg3895gjQTT7EsY/yh3tB70fN
         7Bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371373; x=1791976173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tPW28u/y25LsoprSZgjrTYuNMeOHBtCHRS1PxOld3s=;
        b=d7ZlQYYEghxWBVOhUQq0kaSw+sAjv9kYq7mRrQxCFD+LiHbeUSXPt8hLovqqT+CKVO
         yCulSsukv8hka0zCTkZNROHPvmhVMwYuprotEyl7EiGFgVfBvbDg1TBJ/p9v8cufYBEs
         sLX4jzHFock9aE2LfL9FUC5FBtLrqR3zhl3utfyyowN+UFN3hf6pszNix3uYX5BdpD7v
         F4ioKU/vcOmMVTziHUCzsEtoEIXUc+/JZC3rQm2uw27RJYZgSI58uW69gVLFaAFYBkIF
         mRKnILUa6ci26hXG584H/0hliyCv2WngRJRieTb6JbCc5DvS3jMN5jv93svv1nbK0J+M
         pBcA==
X-Forwarded-Encrypted: i=1; AKwUvByxE0xeMOnCIlerJ6bovpDafXRKac5KOr2ZvcmqtT3MKHQUm8DdDfIoVr3CtehQ8NvNV1TWCnhbxzcGuKlPJw==@lists.infradead.org
X-Gm-Message-State: AFq9FYK7ZRo7lN0SLz67XpepoJO6sdQ/Nf2BnF1R8LFi4qVMuwDcp4Vt
	nXe6TMv+ggklGQPeLVhhFiVfDtQHV2aeh9uolMzEKKwGfuDmtjRwQCkQ
X-Gm-Gg: AYBFou1uu9LvuJSVl3ABTi+z1wXTB1zcfouqUF7uNo+eTKzkvBP3aiwtu5+4M5RT675
	uTRkroEeuJ5efGnnXd6WTzjBvMtEpnWNBHuRZNCNYvYmC+QjaJkW412+cbQu6WT1WQTuFWuG0wD
	ilvJRzPQFAMsZdRJwziMeUCzX33MlLRzWqXsGereVskPzVQFGCO5KC+pfQaOyuctOkQJCXGFycS
	fgaLWpr0HTSzKFyI7b4O58AKKJYC4nNok14K4fyfdkJQwxoZowOEQxUmf4FigRiwQWuh8jJTbls
	Z4viFgTEL8ddZzoxpvQECSzGHb0QLKsSpuK/RjIkD7hTzVty3L2/mdnnKTrQmE6acWpseBx7tBW
	b9okccgaAKt9V8bSiOW8EULJlIfjbTt5DVWpDkqnVy4ZfCli7+15zPeRsPH9nJFho2NdiEJ53uW
	gCoA15id/lMVW5jrphYUxAFRPLzntwpld+4CIigeBe3QbNbHw45GGb3rP/VSiFmR06zJGBb+/lL
	527vSzjnxPzqY2l2NkgXkkigm6lZiwr6gWe/Pyun7IDzhPl1bB0E8hXOk4TKHyaZIdbE3evjbMW
	OMR0eZQSdCxiGA==
X-Received: by 2002:a17:90b:2246:b0:3a7:aeb4:e6eb with SMTP id 98e67ed59e1d1-3a8a1ceeb73mr1617868a91.67.1791371373155;
        Wed, 07 Oct 2026 04:09:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/4] ASoC: mediatek: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:54 +0700
Message-ID: <20261007110858.509341-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_040934_321861_92EE5779 
X-CRM114-Status: UNSURE (   9.12  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

Some FE startup callbacks may return a positive value from constraint 
helpers, but ASoC expects 0 on success. This can cause .shutdown() to be 
skipped during rollback.

Return 0 explicitly on success.

Compile-tested only.

Changes in v2:
 - Rename the patch subject.
 - Simplify the code change as suggested by Cezary. 

Best regards,
Phuc

bui duc phuc (4):
  ASoC: mediatek: common: Handle constraint return value in FE startup
  ASoC: mediatek: mt8188: Handle constraint return value in FE startup
  ASoC: mediatek: mt8189: Handle constraint return value in FE startup
  ASoC: mediatek: mt8365: Handle constraint return value in FE startup

 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 3 +++
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 4 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.43.0


