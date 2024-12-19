Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1778CE7718B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2024 10:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h9EH0VzNdlwEE7HT+ejlIQXInr2HWzq5t9FyUGd1FM0=; b=xNg5wdxnMnWN1qxGmxK8PUb9C0
	QktkFEbNG9oUexcyCFSBGli1krWq9SeBHwNXKeo4pJOb7e6XB57QWvVuXLsvdvp8vfhPS4lVoI7+5
	3go+WTyJc4JMItmLNzhRT95zx9fT2inf6nTcl1lV2QLs0T0yBWNFhSgskaV0AJkIyuQCX1Ww8U83U
	u2139pjSagZSS61xwPFwb4EVX/DVAPEKksOAWHPufUQhznQSxuypY0KJXWcO2xvagi999jkcmqXs+
	8CugYJFiE78tL9mXtl/9lbLpfP2mey3QnsrSDMkmrvYLHQWw1nNJlPPfONtyqt4ewRaCZX6zO0bFh
	iZRDm1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEAb-00000001aTc-0AuX;
	Thu, 19 Dec 2024 10:54:17 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOE9V-00000001aGl-2COa
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Dec 2024 10:53:10 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so515594a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Dec 2024 02:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734605588; x=1735210388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9EH0VzNdlwEE7HT+ejlIQXInr2HWzq5t9FyUGd1FM0=;
        b=E2lpV3hTyXR3Sxrj1rdtfITan4iCzRv94qcvwIOcR1PBgaLGi2Q6h251tqBqYI5/U6
         SMopSXtOvv/I5f4j6fQ/+AtaIdgdVexxc4JIRp3X0J/iIZ3JyqbJjengGUIzvVdP+uoT
         qO1FtwmNWSeI2OirFH19hGEC3zzszI7cu7yPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734605588; x=1735210388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9EH0VzNdlwEE7HT+ejlIQXInr2HWzq5t9FyUGd1FM0=;
        b=tqm6St5ga+29Nhtv5YMlZWOlrmtsJJW1bKLzWLVlxl5WR69UotOyXaA57o95pxTSmU
         al8vSmHvbDfeE5V94IsQ01z9XOuKi89oyyT4Wh+23ORXIj87AUgjdDYp/UxO9o8jqBAj
         llL5TDMMC28At+VDwKv/Sydh8hriJfKi+vYJC2Ex1AjKWMFC7xq1ytMen58/zp+jTp3r
         xD4fSiaK5zrcs6z29/HrrIl4gwtVN6WxEFwJUp7NN66ca66EZBHdltiuPDonAJWmslls
         BGqo+qSjqn9xEoTmp0KRM/w1TMIIHayktsTyZAEk8oE6DyvUy+aNv+Uc7paSBl4Iu7w1
         M2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVIZS7GxqZcWEIJ6D9h3Yy+PalZ++pLDblJgbbEt9T+wI2dqib6FsRxDAWtX1gwYZ6dpaLudMyMsz8JyIPSgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUATTCqNylLFfoRd4Rs7PJ3VfdMmTO8s814HoH9KSpHWVjbm2M
	eYqRsvIlQ+Lg++VTwnNcs1N3i+s1eghhmcSSX6KvOAPaxWnbJTv5zsgihSlEgA==
X-Gm-Gg: ASbGncuLfosIo1Q2mx8Dxghztwcv8DAmd6mWRG22L8uMeQ6wcEpX/AMffrZOKJur11s
	RoBunGYryOPbMp5mSSB40/LJjN+BwL8KJ412Djb12z6TJua3NrD3Qdm+w5uJC/bpVQnJ2qycoTm
	Re1g7GJD3NypaA8vG/Rp8HALFIgbyp4BgbYoVJZtcskrmqzKN60vF3rBbtt8LRn3mlPkvkWbeIJ
	hBuRPTMiFZ/bUBXed8T8SXjnYoF+3W8NuuJnphubG3btfbkStrFwQymSBHEvgChLRUaW8IovQ==
X-Google-Smtp-Source: AGHT+IENxlsOZm9def6oti4V70uj/jGgxMRZENhVtBejHswBs3FlI1YExvOn9EK0Mjoqmtw4PCN2Zg==
X-Received: by 2002:a17:90a:c105:b0:2ee:f80c:6892 with SMTP id 98e67ed59e1d1-2f2e91a4d5emr9173937a91.3.1734605588162;
        Thu, 19 Dec 2024 02:53:08 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6603:6add:77e:d71c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee06dd61sm2975014a91.42.2024.12.19.02.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 02:53:07 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	treapking@chromium.org,
	yuanhsinte@chromium.org
Subject: [PATCH] ASoC: mediatek: disable buffer pre-allocation
Date: Thu, 19 Dec 2024 18:53:02 +0800
Message-ID: <20241219105303.548437-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_025309_579564_C7805D90 
X-CRM114-Status: GOOD (  16.68  )
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

On Chromebooks based on Mediatek MT8195 or MT8188, the audio frontend
(AFE) is limited to accessing a very small window (1 MiB) of memory,
which is described as a reserved memory region in the device tree.

On these two platforms, the maximum buffer size is given as 512 KiB.
The MediaTek common code uses the same value for preallocations. This
means that only the first two PCM substreams get preallocations, and
then the whole space is exhausted, barring any other substreams from
working. Since the substreams used are not always the first two, this
means audio won't work correctly.

This is observed on the MT8188 Geralt Chromebooks, on which the
"mediatek,dai-link" property was dropped when it was upstreamed. That
property causes the driver to only register the PCM substreams listed
in the property, and in the order given.

Instead of trying to compute an optimal value and figuring out which
streams are used, simply disable preallocation. The PCM buffers are
managed by the core and are allocated and released on the fly. There
should be no impact to any of the other MediaTek platforms.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 9b72b2a7ae91..6b6330583941 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -120,8 +120,8 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
-	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
-				       afe->dev, size, size);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev, 0, size);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);
-- 
2.47.1.613.gc27f4b7a9f-goog


