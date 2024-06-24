Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07885C2BD05
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 06:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4N2wMnACbjcCz14LY0USvKoVXrjwARwQKVYyLGYLpXg=; b=d9z+/LN+3g1coJDgJBSArF3Tpu
	rOKAR+kLA1Z/2Z4/fkb0tNP4t5pqH42rXsKM45Q9oEfDiRwXzQYJLT+iYon1DM4gTbRCsOfop/IoV
	Rq7DkFQbtl/Q0CGahi7SGX2LqUv+8pTcfwERvFnfIH9tSiQDkrZr0NRmnR4E7jtSd83LPQ2tkz52H
	LI5FmovzOxjSFCl6mtknYB6FoGRVkooGpBqmO23UndOD2p4TAw6VlJgnTMjy0OolAXeNJ9buDGieJ
	SIrAu237QetQQWke9vboCQHfoSW+DxPC7fTFuAbd37oliburwWhdFgVXRxaQGPrX8s9fIEe/kqnQU
	jtx5sOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLcws-0000000Fh8d-2LIx;
	Mon, 24 Jun 2024 06:13:06 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLcwp-0000000Fh84-1gnM
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jun 2024 06:13:04 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7067108f2cdso939018b3a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Jun 2024 23:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719209582; x=1719814382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4N2wMnACbjcCz14LY0USvKoVXrjwARwQKVYyLGYLpXg=;
        b=cvel5lyE8vGipLdaGto9jlokeWIV/0BjTLAxo/R21X+DIz9zXP3aUKAY5nABrmWmFq
         DqZm7jhEKbVhpwyOs2hBdOKxUiCwrNZ+H2PJOBZdPHcCbjSL67bn7+zVmI9I358KocjH
         FM1lTGxb1ZqddczfsksrFZNwEunFP3oK+tImU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719209582; x=1719814382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4N2wMnACbjcCz14LY0USvKoVXrjwARwQKVYyLGYLpXg=;
        b=n9Q83TSQr5QbivisJDs2POb86LVVHFwAYOkuXd7+377+bZ+TM6QJtt0ETod6qfYGDE
         bQiW5qjN94wZcgUY26YOQNY+VM+T1JiqdYXWmuM0yASpANx+ZwCPGcrfRJVVPWCO+9Rl
         N76kQB6Z2hNjkJ1nvF9qOsk6kYEK32n2ZdNqmrcu1dGBWuuhsnc9CYak99ONMbejsfEP
         D4JwsnjeFL/uaZFBZ/GINY/iQ0cB2dVT+UAu6522TE1xymlFfh+KUJZ3I+rJOYeBdmHT
         cPQU1nV+3JPtPqHcVtMk083Vpohi34m4ptP/CyHvUxDTeBCQdtXSzT0ykz9qGQu/g8/0
         6XOw==
X-Forwarded-Encrypted: i=1; AJvYcCWkkMSXHFyxFsz6h4Ek/1MDybWFqYPuEBvwtXd7fanGRgj6cyT/G2TJ4gc4KoFJkMRee7R6E8X+iCH//ICvl4HPv2LouuQyRXKbtkNdN6nRH+cI
X-Gm-Message-State: AOJu0Yx/nyT7e41QB702vdEGUsnyjcljF3ylq5rntDvnisn4Aj2xK+NX
	XCDivvrxYcxhjODzrR5OhG3Xl1ObQZln68I0bcgxUeoG0nx8hjCq/MlE73YA4g==
X-Google-Smtp-Source: AGHT+IH+UlRR3GoF9E4C1DBHIOVlzoOCBHgWIsZ6epuQKT65Zpk0Nz9eUaoHFwng5u7QIXrd2vEFwg==
X-Received: by 2002:a05:6a20:c120:b0:1b6:cd8e:4a5 with SMTP id adf61e73a8af0-1bcf4479e51mr4136921637.19.1719209581937;
        Sun, 23 Jun 2024 23:13:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:62a6:1858:61eb:37a2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb5e5629sm54687965ad.220.2024.06.23.23.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 23:13:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] ASoC: mediatek: mt8195: Add platform entry for ETDM1_OUT_BE dai link
Date: Mon, 24 Jun 2024 14:12:56 +0800
Message-ID: <20240624061257.3115467-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_231303_628471_C6507962 
X-CRM114-Status: GOOD (  10.31  )
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

Commit e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component
and rework codec link") removed the codec entry for the ETDM1_OUT_BE
dai link entirely instead of replacing it with COMP_EMPTY(). This worked
by accident as the remaining COMP_EMPTY() platform entry became the codec
entry, and the platform entry became completely empty, effectively the
same as COMP_DUMMY() since snd_soc_fill_dummy_dai() doesn't do anything
for platform entries.

This causes a KASAN out-of-bounds warning in mtk_soundcard_common_probe()
in sound/soc/mediatek/common/mtk-soundcard-driver.c:

	for_each_card_prelinks(card, i, dai_link) {
		if (adsp_node && !strncmp(dai_link->name, "AFE_SOF", strlen("AFE_SOF")))
			dai_link->platforms->of_node = adsp_node;
		else if (!dai_link->platforms->name && !dai_link->platforms->of_node)
			dai_link->platforms->of_node = platform_node;
	}

where the code expects the platforms array to have space for at least one entry.

Add an COMP_EMPTY() entry so that dai_link->platforms has space.

Fixes: e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component and rework codec link")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v1:
- Reword commit message with more details on how the original commit
  got things wrong, and what this commit adds and fixes
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index ca8751190520..2832ef78eaed 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -827,6 +827,7 @@ SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
 
 SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
-- 
2.45.2.741.gdbec12cfda-goog


