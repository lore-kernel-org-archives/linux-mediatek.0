Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2028AC3ABD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 05:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FZYfWobUsai4Anc24HWgooUiX7BPMHJRwh278DHkFhg=; b=EbaXy/DKlOZo/oDBxr9gXt2yJk
	oNPP6m32bExqK7p1KvyxNxb/UgcCPou56wGXdCCZKpIUfbWRpMAT9Qvm0MZ5cAenbBcZMFBs2myW/
	fuKMIlABu49Vd3mxzchNjF0ON3DlknnwzLAWxUECXBonjzI1e7BrtL4hxXjeW9EmAk+w09pBjvoTH
	GQ83Y5XQhn1aVtRqdE5ZyTTGHsXTSTbx+eqQRRVfAyGChQCHZ5g98c9d5nYjbFq/NqDgf2n15FTSW
	Bci6H/N0TcstlzZAb5aE7/1w4X9eSzTdLN0Mci9B50jrESBSH8u0B65SLSIlSmJDyY1I5FFgpQY5H
	9AQA7uig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFnGg-00000002UYT-1jFu;
	Fri, 16 May 2025 05:05:58 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFnGe-00000002UY8-0lWS
	for linux-mediatek@lists.infradead.org;
	Fri, 16 May 2025 05:05:57 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b170c99aa49so1101325a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 May 2025 22:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747371955; x=1747976755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FZYfWobUsai4Anc24HWgooUiX7BPMHJRwh278DHkFhg=;
        b=kYpvNDvvedsonvz2e/wAPPWKhWb9i66hQDvQLxhV9x+n+vYN5l9Zl4BZCItHBcyp5Y
         BMhZKHCHcvfI9ivuhoe+Py1spBwNO01CYdF6/uQnWaey0qG11SKJU9fmuYGcDtiZtAo4
         BsvITaTStf9NOukBsztRxP1OaePv8GZRBR2ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747371955; x=1747976755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZYfWobUsai4Anc24HWgooUiX7BPMHJRwh278DHkFhg=;
        b=slZjK0hUwUKgsJXdq9ZY356drbFPJ5u3EwkYC0iuvDJ007beoNog/ETXl0xCIxqnnj
         Sl5a3OPaVWuKPhk6J3evYCaBaR7YhyKCckFjFKS3G59iQ1dNNwDof+5wP8zb2wkfEa/A
         eLx2NSAJjbWE2Hni1sqChILu1PmFXXuYORDYh4NhlxuxTcUyLsTaqVBwG3MpVbyajSkd
         31qkyGNflPBJXpO5SyJbfTci0/zcNMb9gWK8kf9OBrW3+TEdCzNu64FD4h2FppF2L2CW
         KSreh13PIeG9HZZiOyaKZBtPyOcxpJQ1iOkIwFM/NY5pfZQO9/0pODwX/Pvxkk5imNy4
         I0dg==
X-Forwarded-Encrypted: i=1; AJvYcCXToiNfVVyntYa3FSVAd46RZE8Y5PQ4FtXShe8zO1/lIX8U0lAj1Ka/ig8jzoZqhGpAUnER50Y7TBHwiiyQ5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPd1M2XbE/QCxNGmZOueMyHNR6mrZy4BEzXUyWPlFEaLWT+S1x
	F8Qx7yJCnGOd9Pnp4w79WqxkdSS4zZ9hYxmPp50coQFfa+4FvvUhw1XE3EuurDjDTGSneuO5NqP
	mfDc=
X-Gm-Gg: ASbGnctqNXIPKaLeXIVusHUDJscRiCNgOGl6TkKUfkHUaDmdkO8MLt3bPacQ5QmZXO1
	C1mC5WQQncYVmS+d/PEB0QMY0lm9RfjQyESPM2Xz6u426fodlURYr1u7iIKPRugWM/dIks7Udkw
	3MEIvSU39s3e0tk8oxFtMwaJxWRcFh1nIlp1cw8U+3jPl2xUFAVtq7UEtvUYUTa3zMwsKpiyPPg
	lxUyzo5imAajHZhEprib5jBf0RZCRz62QOAys7JTpg470h9e+kWAzHgw9/V85QFToH1bUuHAL/u
	Iie0oSyrI90D5aGAPkQRHLvH+cA2sIQt6Ny/LBbqB5sEYQ5zV1Xa7VoBp4wbdlAnruwLGw==
X-Google-Smtp-Source: AGHT+IH0/GDb4r+wiufJP7iwzsEy+MWQRcekYSbQLeI/kLmTr/rbqnbWo/loA5DWMHtf5lSSzKhPKA==
X-Received: by 2002:a17:903:22ce:b0:231:b456:b97 with SMTP id d9443c01a7336-231d459a539mr26785735ad.36.1747371955405;
        Thu, 15 May 2025 22:05:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c43a:aaea:5f52:5763])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97de4sm6312355ad.144.2025.05.15.22.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 22:05:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-utils: Check string pointer validity in snd_soc_dlc_is_dummy()
Date: Fri, 16 May 2025 13:05:48 +0800
Message-ID: <20250516050549.407133-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_220556_250118_0C9AFB1E 
X-CRM114-Status: GOOD (  13.91  )
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

In the recently added snd_soc_dlc_is_dummy(), the helper uses the .name
and .dai_name fields without checking their validity.

For .name, this field is NULL if the component is matched by .of_node
instead. In fact, only one of these fields may be set. This caused a
NULL pointer dereference on MediaTek MT8195 and MT8188 platforms with
the subsequent conversion to snd_soc_dlc_is_dummy() in their machine
drivers. The codecs are all matches through the device tree, so their
.name fields are empty.

For .dai_name, there are cases where this field is empty, such as for
the following component definitions:

	#define COMP_EMPTY()                    { }
	#define COMP_PLATFORM(_name)            { .name = _name }
	#define COMP_AUX(_name)                 { .name = _name }
	#define COMP_CODEC_CONF(_name)          { .name = _name }

Or the single link CPU DAI case in the simple audio card family, as
covered by simple_util_canonicalize_cpu(), in which the .dai_name
field is explicitly cleared.

To fix this, check the validity of the fields before using them in
string comparison.

Fixes: 3e021f3b8115 ("ASoC: soc-utils: add snd_soc_dlc_is_dummy()")
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/soc-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index a1bcc852a6de..c8adfff826bd 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -267,8 +267,8 @@ int snd_soc_dlc_is_dummy(struct snd_soc_dai_link_component *dlc)
 	if (dlc == &snd_soc_dummy_dlc)
 		return true;
 
-	if (strcmp(dlc->name,	  snd_soc_dummy_dlc.name)	== 0 ||
-	    strcmp(dlc->dai_name, snd_soc_dummy_dlc.dai_name)	== 0)
+	if ((dlc->name     && strcmp(dlc->name,     snd_soc_dummy_dlc.name)     == 0) ||
+	    (dlc->dai_name && strcmp(dlc->dai_name, snd_soc_dummy_dlc.dai_name) == 0))
 		return true;
 
 	return false;
-- 
2.49.0.1101.gccaa498523-goog


