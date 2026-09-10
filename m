Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2ABC79F9F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=; b=nIo358iHBstojxUUG4XCGqkSSW
	i4Edqvfwlpejq7Upd2mGvQVgG/3wnXeoVQzW+Rbr0S18vyWgYBrF8UnEWXD1UfcnvjgBnygTamHdb
	xSU3NzoF8toGZNSBmfZamEUA1Awh5rnmq5CiRIKOKnLw/sw01G1mmyqRDlhIvwooNtMg9GoZi82tk
	I2YrFGDLbObHE/UxLYVPfuqQsQC8T+RPmKxaFUT2ysiXVpTqu7k9NXljGPw9B62UrcpxWTqO6LCl6
	nVwTjjf3C6wUgA26YXgK9+UraydXZdlpFIElVKo64li475gAnIt27OsT35NohkfyNg8WszcYMk9Qg
	heG7QQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMb-0000000EOtF-2I8D;
	Thu, 10 Sep 2026 12:58:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMa-0000000EOs1-1Mcn
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=; b=DTq8hhhH6aY05HvnIt56Pw73gK
	w9AALgvkbXJ7lIB65mXIEPI0RYB8hhiDmgDKJH+hhfrLexuQLnG/ioNr8J0HCiEE8NExmaGyRyJ4A
	T3yWW5lkM/GTK9VGqjHpQ0Anp28rzfLWlMWciQdUHIj8MTfymRYXGNh5fGR0aJXsjn/ArEeyZ3hkk
	KJe/xsSnKHm6s/6HguUONMIV7ncfcefQT723kfoPTQb0fmQpImbuKJGUz5WOgB3P91doGdNXow/OM
	lzVIc1uFO7iXr5GdHXY2GYRH6R8pSSKRD7FyCsAX3bDSxTQGeRinx42r2wy22l7c0Fcki5BTMqQtg
	zrpywT3g==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eMV-00000002V36-2TZI
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:47 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38759bcd877so7553349a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045122; x=1789649922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=e96/x30bWCgspKWjVLzj/r6aE1K3GMsziUUOtKi+Gc9isKTJhPxQgCQTEpRuCoohSn
         3Yw3GMdotDUa3SQJNydxlNACZrWf6B7rv2TFLWNTOOioT2sD+HlHrtShVyKl2Lk1jIHu
         PgIWP9fFVqqnNZ1oBw3cSQ/05tZuWg9foL/iUx9b/UfiVlpf+3RpYD0H4LDcB3aTlsuy
         4D2akGRankpdZINwtaH5bjpDtjaFOzSyq9mI/I07FA7yrvnAYMurYtc/p8nrodbNQA9g
         F/oD/1rvmXLjSjTnnQEmrOwgVjpERDYNEoQxEdCfAT2+lWF2S2Bv5HjJ2Qj1Sy0t1GIH
         xUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045122; x=1789649922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=OcvEnPZ0TFo1Ql0Ox7vShms9eHguu4Mrs2oe+K5Gs6HMGsBXRaqhZbi9nAarqxuicQ
         oJKoP3HiDB6q8FHaDjpjk3SR1unLtxh5Q5sMRqjGtCFkc2BmK4zQQBFk3EVSqnoiOSJI
         Fk4N7Oeq/qi38OLCUymn0qLVmeDC77BSokzEfcGDwVlSOaNEShVumagFbcUxuC9jIroA
         RM8lg+nlbeWhgcqOW0gDf8x+54ZGfQu9460fa9uFr5OittIs4GfxsyePzpuakZCXKIld
         br4ufR3gSeP5q5CPCEiZ9uGII37MjOYOFf4kgj0crSY6QMHtBdexvyZjbbcJ2qW+6GIm
         ThNw==
X-Forwarded-Encrypted: i=1; AKwUvBzYAhOlyf5ZcYQDzoF8gc7v95gXyROTI3uKZ0/t2jxwt1FUnXTCzTZtotSMhShSbPmFee5ZIqdY13p5RnmHYQ==@lists.infradead.org
X-Gm-Message-State: AFuF++l1zsdJVc38TCMz7G9k0lazA8ktyvcg+Wm2V3yU+HnrrxRuPSMU
	fRVnbwTgCH7thtTsO0zsgUwEPesjtZo1mXh5D5RouGP/X/JF05KzZA11
X-Gm-Gg: AYBFou3L6pN6QQTsAknq0pEAWwrCX5OPfDVq2HQ/2Brf/iBcz/xJM2L4e52elhwpyaQ
	cbCajuAmK9PZyRAba6JGhr2svh7JiR5jiuVW7aSsyS0jMdRm1xEPLMpQ9cnaYniUdemd6Aq5ddc
	lvWzaJ0jEgt/gU1+pl0WT7smiEYoa9sJSzjbAs9AcusvSJULRUFc6tvZYbjbYHXQaap3ti/U+Xb
	7mj3s7d+CPEdlOKVLMrn2pzAVcoYyiw5MHeyxKBN2dXQ/9ziAZ5v7Ec0QHD8YG5/ONPIOiT3U38
	7kBE8mM05DiAZjypHATGTFalG3U7zVspdYztimoxShkIRqLPX/TJHQudhHOFyo8yC+h/O0qxOWY
	guLChl/cmu/in94r4dxjlABUinE//pGEgDTEzEZDGmI4J6KtT4p+VAWStNhvLm3SOjJgdAnaIF/
	6mgkaq5kRuvq3CGP2CwQXYHYzZ0z8UJeTbwPDfoErYe+Z76ETmWjetcyWkDqoveih4amTao8O8G
	pt9Yd6Gn+Jqf0eWneIo2Q9X1O/oXb7ZQJOMmGl9aXRYQqpJzIoik5gihxvWvRjLOrb1Itv7YjPG
	45tSO1Q5vkJys/T5l1opHJ8sMA==
X-Received: by 2002:a17:90b:3b52:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39b26101d25mr61915384a91.8.1789045121712;
        Thu, 10 Sep 2026 05:58:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:41 -0700 (PDT)
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
Subject: [PATCH 09/13] ASoC: mediatek: mt8189: Propagate APLL errors
Date: Thu, 10 Sep 2026 19:57:38 +0700
Message-ID: <20260910125742.150902-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135843_769752_356D5D4A 
X-CRM114-Status: GOOD (  10.87  )
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


