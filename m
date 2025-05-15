Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB1DC54754
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 07:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UTuhmwgeL8CMgAtrwpyLwhvwNVYclkrjjEa64TIcJ/A=; b=Ejyn7iu8C7S3KeyOyWNeRnMb78
	FPjKufRKoSIXYIjtieXuoe4FB2TCujReOs6QYHHIK8lb6E31R3ZQ1sfZiSYn8F/gITLS1ei4fWrET
	XVOIRxiEcOvZDPTcXmH8ULGQTjNCrrBSMet4Ce4sWYcsXKLDFJ7nYaXOPoMn73algz42CkZgxClNM
	+CRiKs5TjVZKNnPVCOCze3hSGErGpMWF2BqylUV7K0q9DyI6L2KuH4u1TUfeEXya0225MbWVdZJNt
	SJ7tiITmd8tDvXLYQ+sE8n5IWekmq5Yv+1z/GM+ISHvK+dxd1pdh86FnGrAlcGUqhbySp1hVfmbU+
	wfNYvCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTAq-0000000HNUW-1J3N;
	Thu, 15 May 2025 07:38:36 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTAn-0000000HNTl-1w0X
	for linux-mediatek@lists.infradead.org;
	Thu, 15 May 2025 07:38:34 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22e8461d872so5032435ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 15 May 2025 00:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747294712; x=1747899512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UTuhmwgeL8CMgAtrwpyLwhvwNVYclkrjjEa64TIcJ/A=;
        b=EUHaq6OukvDs3Z4NqBdf912nKlpAJYrjClciSSixf9xquq5il1iSnIw9DDQ0F96rsu
         CMbJfcTTggHHPZQ6eEOxGXthtzXcRBCbwyQ6UZ0yJHVzQmXEPe/RQ1VA9oeEr0gA53oo
         toQkQFtNGkYOB8I7dprKQRTr2jLGlsv67Ro/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747294712; x=1747899512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTuhmwgeL8CMgAtrwpyLwhvwNVYclkrjjEa64TIcJ/A=;
        b=CyYAjdbAzq8CTOkFV53aoBCHzYELlCoNSTP9EPcRh1hhgqs9LEgMsI3KrUFF217l2c
         4GTSBdcP3GpJ9DORDwp+meVSF90WIXdoxuhxnkS08LXqXCPFw9vUJNJZvSz1v7aXE1A0
         GszA3XkR29Zywy1k5hOVwXF7TIjW+KCFkXpd6GM6debUjGEP/yzYjteTmjDe21bU5Gua
         MnsuxL6qVcXI7+IDxXgu5vFmk5zc2Se+ohsk2qwf0eurogEhP6gFcHfXcxNfx9NxNy+4
         xod3viAKVje2MlgP/aOKutNOS+PLlpWGVf3i3tA1I6AIa54ulvshKJxGEm7wxgOhUVhx
         ztuw==
X-Forwarded-Encrypted: i=1; AJvYcCXaDkthMFdfv1wJ2yOU/C17sGmYXgjguF6PfyIbIrMrSABRzYmBImdBenqmu0/MHU1vODghAIzw5rUL0In6YA==@lists.infradead.org
X-Gm-Message-State: AOJu0YycMR0AOxNh+xeLLx+vHsq5aOPZTamesTVJqCt9q8DkLlInwbV5
	pmyPUfvkCPkVZ3Y6QTUN2k4B4JY5mGiHopLJES2RMHF3YKdEiVBYzk346qWa4Q==
X-Gm-Gg: ASbGnctIm+ewk4oToBFzC/j5l11ZfNMlKxdmyfprlR5/s0cHcQT4UuzQnIU/DD8zqq6
	Ke2nG191hpmXkCOLIYK3AfJsdnvSl/XaO1us/wbV0j3noOoTzCFvMlWX79gWI4u7m9/yo7zmnm2
	lGVWc7a5bNrelETmgc7OHbN+xKsHD3UYd5OtnjvDeo4g64zS+xYOdGNyRv+xzyZtFhlX429ex+d
	f07AMfm3EF7x2oRrZ1tuU3tQqnQtgJaLlJojNdgtL7bZ2vgxflcY080W6bE+KbMDAdEzhMi90S/
	qZ0zGUF/qbEZWpPZtsQ5F4tXYKUIZLYbQuuuPtm6sR7aqMeTJsjyHvmlBGkpWenaiYX1lt6C+jD
	TbP/l
X-Google-Smtp-Source: AGHT+IHd+tTQ1WkK+zV3TpgzWBvKz1U7eVTGR5TBqP6q/kPdJhkugAruaqhe6ky7C8X/88yU/ln4KA==
X-Received: by 2002:a17:903:11c9:b0:223:3b76:4e22 with SMTP id d9443c01a7336-2319810ffa6mr73889445ad.6.1747294712457;
        Thu, 15 May 2025 00:38:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c43a:aaea:5f52:5763])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271f61sm109750825ad.142.2025.05.15.00.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 00:38:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: [PATCH v2 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
Date: Thu, 15 May 2025 15:38:20 +0800
Message-ID: <20250515073825.4155297-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_003833_523715_CCF92F5B 
X-CRM114-Status: GOOD (  11.74  )
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

Hi folks,

Changes since v1:
- Rebased on top of -next, dropping changes that cover the DMA address
  MSB registers

This series is meant as an example on how to use macros and range cases
to shorten the MediaTek audio frontend drivers. The drivers have large
tables describing the registers and register fields for every supported
audio DMA interface. (Some are actually skipped!) There's a lot of
duplication which can be eliminated using macros. This should serve as
a reference for the MT8196 AFE driver that I had commented on.

The three patches tackle separate tables in the driver. The remaining
one that could be tackled is the list of DAIs; but that one has more
differences between each entry, so I haven't done it yet.

Please take a look.


Thanks
ChenYu


Chen-Yu Tsai (3):
  ASoC: mediatek: mt8183-afe-pcm: Shorten memif_data table using macros
  ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
  ASoC: mediatek: mt8183-afe-pcm: shorten mt8183_is_volatile_reg()

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 571 +++++----------------
 1 file changed, 127 insertions(+), 444 deletions(-)

-- 
2.49.0.1045.g170613ef41-goog


