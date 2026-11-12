Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403C5606A337
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 06:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=npTOHjSU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1jAQzFC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hdMQOaidcysmkd0hNo7kkHB1KCKjR78WhA/YmNa8gos=; b=npTOHjSUBJW9UXdtaYuPLwEsUh
	/i1yf4PddSRJisBlKOdEN0J7wNxcdoGShfbyKpdq2oXRbNA5WjiPznWtlSnI2T0GxRGU3ipZ4xYwi
	Tsi3ISXL+FA/Ji99t3XDkeZfXFxzcIsOkoeCnQa2+ieZdsKYWenRLQLTKZ7kGl4nFyNrfqfuAbwxr
	XN5UcmgPyBMEpGP7+QS9jgxBP4coXyqR8TOQY9YYuc95uvsr640Kb7tKO90yijjB4Y/fkAd7asIeU
	qjtk5SqGvpLrlFH8/EVSpIla9gWspE9zFwwPXgn5oxFlvfjRqGfch3HlguvdCG+GBn8hA2yKYouR8
	8OW8SZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO8H-00000008nOZ-3ZuO;
	Thu, 12 Nov 2026 06:18:01 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO8A-00000008nKA-3pLh
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 06:17:59 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-91f0272ce61so16567116d6.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2026 22:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464273; x=1795069073; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdMQOaidcysmkd0hNo7kkHB1KCKjR78WhA/YmNa8gos=;
        b=i1jAQzFCt79ZvspP4y7Gt4WbL54QoTxKVw9CRe1UhOBHT1vsrUgrz42c+RniPvXbZ0
         GO6cWrxIViSSblfCvuhZxd5mYpyiTz+xSkbDQ+Qbf/VWGws3VKMfdKnm+7WgU0CIp4xJ
         0UNBn5qJd6Uu1+6sOLTvrp0CNNbpQuNicvhwlbomn3rGVlXyIDRj1LN1vcbBbA9bdJ+n
         /xIgBnD7Vxp+7IHm7OGdBepOa/kkzUNJyPN+ZZOaetZMFyJHzGocQlRlJygZVwMi1en8
         AJn32Eeg8lWOl5OOHUnAR6WOK4pxHxqYO2qXKZD8fwb3xTCqLVeEQSj3Ot8flEtMhpiZ
         6Ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464273; x=1795069073;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdMQOaidcysmkd0hNo7kkHB1KCKjR78WhA/YmNa8gos=;
        b=BelDBkw1mMfUa8Xq4eONT2MtuYV07AFxCZ1oKXg1v0QPJ92A61k9a9+0VFlJGFNo70
         PA1zYA26BFejfUEJ8WzjqJ1MDMNKn/134t5E8015g8nJOXFZM1ucR7UdE5o+tLuLJ7pT
         uzV1iYYFH1iS+v2Xtkdydr5wZ5QsuhmtVBkDm1iywCKENzodvqnjC46/HbSSsXGcFmHo
         7829WqRp1S/JN33SdAuT5Ejcw2cbftt027/7yxnCbbZKg18K24aIf17MACfQyUj2HfeS
         ibrLThkDxHpzZlskTkqDFUl0CznRZZyGvygyGWZJdgV+PPhSiX4dXFewoUObh+6M9MvJ
         iVpQ==
X-Forwarded-Encrypted: i=1; AL+hErFhUFcZd6gQ+PBKyrFEXGcEpwwh4nbeuM2VWrMoV5FlvkKR+DxpVXo1hCq9epux9sk1BzYFEEqGkYFUI/+s5g==@lists.infradead.org
X-Gm-Message-State: APuU4Z+1Zy1gHLlbgJlxep1Hm65DaQb75DZa4uCQOdcvWnuW03bgda8v
	BCErj19ONMLb0Qr9G4HiSn9emurMWT2HsVyBgbHw6gcXfaIm8GeUkiw=
X-Gm-Gg: AYBFou2XBe8mXVZ87JP6Uao0lIJXLREbsejFwz61+7pt6fpXRA+qJui0rPuYEDEYpxY
	AlwZahrh16IyhRDQCC768Dr1owb6tqHTy+euJlmmLNGTASX7PQ0+FpDIrRn2NiTjdnSXGimbzVU
	dkr8OdeC9QEQSm+18Kkyos/foYuwn/diWPAK9bhQjbQHeu95jWEnQ2NNpmCzN4qwX82B8LqLOS/
	ZfXwhhglQiM2vPZtlb6OATD5GEIc6K62U1FSkyD0hzoJ2UuJP2n+LVWWEcpt0fWI5u/Qe+sur7b
	us4xyiqkMWvSNCCzGAncZDpKm/UoHSd6npZqNRGfB4FPMM+bz7U101SWn5Bggm0fyqtnv9E3GNh
	8UctTEI4mZU84ZVX00ba3j3Jg2hWoyPi5g5DMLtzZLc6HLinrq8/R8Kmhhh+plxGzO7C2JtL5ct
	CV6luIvKL9KuyrORMADIWW3aFNL7h+U7Zg7UMgTsrARAWBNL3K8AAhLdNTrk5mnoaza8IUNh8VP
	MsOGiJxSJ5Hdr4pYfHbBt0KWxRYrzlA2lVQRkI75tQqBRBtk4Au/l2ZNPTuRP5yYseq2UFSBg4p
	wrNsiTKrPQUY/7oTCihbxBv3VffFRUyLDGbGoHpwCx9kuqLXMAqCSmSGTNeTitjHuDl2CmubzsF
	xW4EUPhrwgKHJvkuJNCf7hB+sbJT+x5s8GaZrBu5J7hU8fT+Ct3w98M3fv7gOfBP1gDnEeoMqil
	cV50XqkHly34NvVpzWZcYBkFW3c7Pdbpq7
X-Received: by 2002:a05:620a:688b:b0:947:a247:6afb with SMTP id af79cd13be357-947afd68101mr819573185a.13.1794464273217;
        Wed, 11 Nov 2026 22:17:53 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.17.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:17:52 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Subject: [PATCH v2 0/5] ASoC: mediatek: fix AFE IRQ registration and removal ordering
Date: Thu, 12 Nov 2026 01:17:44 -0500
Message-ID: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_221757_885667_67CD9F8F 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes IRQ lifetime ordering in the MT8186, MT8188, MT8189,
MT8195 and MT8196 AFE drivers.

Request each IRQ after regmap initialization so it is freed before
the regmap. Where remove() shuts down the AFE, free the IRQ first.
Also balance MT8186's IRQ wake setting.

Found by a static analysis tool under development.
Not tested on hardware.

Changes in v2:
- Rebased onto broonie/sound for-next (cde5523c75f1).
- 1-3: removed redundant IRQ request error logs and clarified changelogs.
- 4-5: added MT8195 and MT8188.

Link to v1: https://lore.kernel.org/r/20261011222234.2098904-1-mhun512@gmail.com

Myeonghun Pak (5):
  ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
  ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
  ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime
  ASoC: mediatek: mt8195: Keep the AFE IRQ within its resource lifetime
  ASoC: mediatek: mt8188: Keep the AFE IRQ within its resource lifetime

 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  1 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 42 +++++++++++++------
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    | 10 ++---
 sound/soc/mediatek/mt8189/mt8189-afe-common.h |  1 +
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    | 16 ++++---
 sound/soc/mediatek/mt8195/mt8195-afe-common.h |  1 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 16 ++++---
 sound/soc/mediatek/mt8196/mt8196-afe-common.h |  1 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    | 16 ++++---
 9 files changed, 70 insertions(+), 34 deletions(-)


base-commit: cde5523c75f1320a55ac1d55a717ccbb566557f0
-- 
2.43.0


