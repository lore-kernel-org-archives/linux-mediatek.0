Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E85AC88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=; b=NuLvBCqvH4x1MGy4LsWD/7Q6j+
	AqDDfOzfcc3XsUUrIH8KjOLKkM11+4uEnt3Iq4y2t0jRhlTBmLWR2plbfsc0ZEXhZT5Xqqord3ZcG
	yhxirhNLyw+C2X+1OF49MYa8Jc8hSHpiKrlf+zR2qVjwM90Sw5mMHC5zrFtjYjP7hGcGgJu0I0oqJ
	gu0nXNzVo0QAzsh4hO7YTjFyrB9pVRgYMhMR0bUvvaPy2RsIJktCa43/pK6i6Wf1H9t9P4wbjW4VQ
	nmyXKTeoau/AxzJjEMc6K7hmBhUdl3EjFv8P6Tvzt9ltAQv0pguF31TJFC4QeiYTMaXzjrqf79dwp
	xg4T0xag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hm4-00000008LgC-3aJh;
	Wed, 16 Sep 2026 05:01:39 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlp-00000008LSH-3dM6
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:25 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2375688a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534881; x=1790139681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=TT/lMMvlAkoZvplYKGeptWvRXw1QjX7tDRI9cd1Ks6KWSSJGlDsfnaiJbozPGjOK5s
         Dd1CqsD8mhtoeD78C43Nws4i4hkCE5AHKcgTSHhLI0kfh8r7DP3TI76X0L0z3JC4F/kV
         iYbQ0g1aKyJzTzmO8nGYbbRFyMRh2yMdL8bjhwCVFFf8tnS3CVcZ6eFjBg6Ii8sKUvgI
         xa5jIO5cXGCh+NuVx/y4pGdIQvYL21kdKAdGuV6JPT0h9rL0oIsXLoVu+oorW0Di6Ow1
         sK5n6HJa090oV1yr5G0fbqte6JXbqDmHR+JI+hZreULpQEy2qbGxCmce0DRC8bC0Q24e
         zbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534881; x=1790139681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=JrikjOzpGLI2TmHKvqr4M9ShxaVymOrl9LXLvd/HImky9bIH+Hj2mfDQqsSRzeFbYu
         B/epMTyuOpncBuQOARJXrCTWuyxBmZvSnvPRaM0DuDKTuaqlFX9B8Ig+C8AWtb0n1wwA
         /cHhO+kheLaOoMuN18mkG0GV71JyKzKArrcPts4FEdK6Kh962q5FTP/EUZ1M6vexbCCH
         MIF7Jo7+8AE8C0ujAChaYbwE5HnMmzcGqOcO3fGnqipyY/01MgE/cKs9nShGktqNG/0u
         6jhJs8oGb2Czu75LXt61WzOE07kU/x6tONl690QwCf++M7ouFFathJz5TThlg9KlUHts
         Dgmw==
X-Forwarded-Encrypted: i=1; AKwUvBzPh80UBWn4Gkfwsvmysom6EB/w9kjNhW+MHc+spMv8vPTCtZ0orcTlhF98pVAwS1L5UVn4vpuyhp8wh2YRcQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kNnkpJdBcGHiej6qQPoQ9b4LdT2MlqO+dmcrFKHtcmZVuin/O8
	aKRagO+FhEhCsAfU4LrSuXloW4xw36P5a5w5M/sxgOH0PkfMWC3u4Oab
X-Gm-Gg: AYBFou1Jc1pdaxQbZlLjm7EwP/J4oeYngZg0QcrpHFORsrPgGbKQd8FXt7tpbQ/yis3
	TwGckv1lZKWZT4ELZm2y1F6s04hNQF5hsdrO1sLRFaIMJjMenJmjUtQcg+zIJcf6uHvNP7eVhF3
	+Hdx3k+wOfsPwM7dNrP/z7U034F/KxyZ1i0Pf3NbjlTJnuY3+Nc4zKFFhrF1nAIKczPUnQoCMnY
	31hkuD9qH3w7+AbeE/iZHTZzrVLpFBSDUzOCKB5WtBuDxb8R77j19E0IkrIrNWZmB/+yjPtifm3
	ruXJANP9DlWUIgyVS+KEPMyNbF/xi9gLYAgc5qnMrWq5Tbs1pF/qxmR6hc4XJ8lRGp+VPWShU8A
	cjHIm9eDQjl7spAfGhE5Rzx6K/wJMbAL+R2GQHJ0iOU5GFjg5prUhJmnFpTo7vevYcWn00PQ/GK
	NAWoIHWIhBHhMZ7OP7rzuyWpE1Oz4QsNBL0vT5MIRH9PEudx57hqIJArIiBqucz4GdLKbfQb916
	I+ChwEVpSDBYpPUjgeEPSh2TX6E18lBLRPg7x7zuxJ0tbXBn15RtQDinw9Z+Pod+r2RVNVaFb8T
	TSLvSwKk6c0xG+c=
X-Received: by 2002:a05:6a20:e615:b0:3da:f1b3:50fa with SMTP id adf61e73a8af0-3db4fb852a7mr9838208637.8.1789534880774;
        Tue, 15 Sep 2026 22:01:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 08/12] ASoC: mediatek: mt8189: Propagate APLL errors
Date: Wed, 16 Sep 2026 12:00:15 +0700
Message-ID: <20260916050020.14575-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_220123_446010_545EF807 
X-CRM114-Status: GOOD (  11.14  )
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

mtk_apll_event() currently ignores errors returned by the APLL
enable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 94c49a662e2d..4826ee250d70 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -485,6 +485,7 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -492,9 +493,11 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-			mt8189_apll1_enable(afe);
+			ret = mt8189_apll1_enable(afe);
 		else
-			mt8189_apll2_enable(afe);
+			ret = mt8189_apll2_enable(afe);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-- 
2.43.0


