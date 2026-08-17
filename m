Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB28BC5DF66
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 11:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=; b=e4hVnvh+CtsNRVa0HMnRwVJ8qF
	EQU8rZJ3vMCLFI7A1Wzm6rf5xG+rTBE8po8aMxEgkFU2IWZNDMZ3zI1ucPsQEfo+fdUdVDetJxuqN
	+QaKpqIrZJdCjEW87/ybzZhAuMc8xDJJ/9RH8/U+H5GUv7hpd0FC6T4CRSviRrM67G3Cg9x7cpAOT
	WIEVw27A8QkKNTYyLXGf/h1E0GaekRoO+s7nzrIrSqsrq6LYZ6IbBAlCHTuj6YJ66EzaonKwSomgg
	TLsIi2xIX3lVIxBkV0Lg8JVc0u4d64Jknk68+QJDuU5TX1N6IgKzB5iMgCeJqljyn8x4MfE52J3KU
	jMBtuPOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvaf-000000061qN-1qRI;
	Mon, 17 Aug 2026 11:33:17 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvad-000000061oU-2cKL
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 11:33:16 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38dcbade417so3231306a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786966395; x=1787571195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=;
        b=WoEwAS7lO2owZEyOxAqIKz4p53jclZYOmFGL8bTrtn3h/elg7FxJbrYh9RxdUSqRQo
         Fgw2N7LLvr1PCa3NwwftoynpL68z6claRy2MWnaXW8GP8YQ9aFzgDMbHdJof90GafC1n
         1MSxxabH2b8KoD027DZsZyyQmtKitEOtWMwuoA2evKdzozXMBmGPIq66ZRF5Ktlvfa9d
         yeJhBeiVMEEJG4VtP+EUfg9XV1su4Jsn3j+JruQI16x2DOAhgIEjfpf6qzSQbG/gdKi2
         Xi9nrZSI/RKWiw6YWM1QAuMGAcEls62NQ6T3P+7TYmWSxyO5X/5vUmq6q6EoGbJ4SziY
         0lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966395; x=1787571195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=;
        b=V7+KaqCp+JYqxaHuVj2fCRa/f3qhb6JTRK59IgTHGVpUawm24ifLz6IwHPePefIqLL
         /nMY3uj9Cf04dgVzJVdGgze3STyMazSzdOYUv0CVp5GasWD+AmMQ8lkEJrRWPiyBALxV
         TZBrOvA7ptpS6ADAPvjNfnxcbOYbFQvqZDO9TXWxy3mlte0YAXn9eYQhsTVRRb4OZHC8
         nCsO7OI1n/aFQql3AQKRjAlgiVAZh9Hzt+E7Xn4Gk2HswlY/IIjlfnfGzPK4OftejnIk
         gZSjiQcFlXoFNKtzwPJsT3GAKzCV67WjdHrX8dnRTKR0DDPfigm6WVibxdJ+XXfm7/SA
         7TFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBqIJc67TG8vqlwOg3Tt9DxS2bfogN9OyGaeDoDpvzB/GHYnkPJB7j2NrgXkJJIhOd5CCOPqUXuIKM1o3nIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEiJ5FwB+ONt5qbXKeSuIrF2J9Bx/lD6ARUzMMUgpqGcJLgtgq
	KGSZXfNXHs7YmYN7eWX8MHjVjWQnWLU+UcMvc5BISpmnuETLLRZjFihT
X-Gm-Gg: AR+sD122XNBpvgsEjqa1u7O//VuGA0XjoiG7WVgcjKJjH4nEK4ptzOpER96jMuFQ6f5
	4iUeEIyXtsXfS8yEVuCPd+La789WrV23mVtAA95hs4x2l5ECLB3yTgSQfmeHLv3rCwydhmpfA6Q
	cvO62OSOKhD4XrTPdEEDbrAoC/QK/Y4BFUXnGELdAni5ZzM3bRdnLe8Xarvo7c1ICkYE5BzoDLv
	gRrcdretqYA7KNu26tR6EG9opfg4NJbXEEEyQ+woSbrTI1eiobl7jjtAqO7ooUxDqgIN+Cwb3k8
	esdpYfLuBgJHOt2nhmuMBiAz+hcdCny/lR2OWn3Qogg3jERtJ+46mcLCC/QxWI0aQG3OD/7fAX4
	0EI8N/GL3UcuJZMVPEhH5NFu4RzKou1JxQfl9o7AA0Y+qvOUtlVGOZGKnXClQzMum7DfJkJb6fD
	UuXBwIOq16K7XwOVgqrDAaqGmHyEe6z/bJD98WN69nmLswS+nnw52OfPp6VzlcsMR06ZP5ngYxf
	cvQiske3mxeREy+o0+7Ss7GAbRjJW0JAiDCHjCPpAAMxQBseFMuQ0FqiCl9PnjlJBcrmHdPkzEN
	T+NC1dEpNIHU9/0=
X-Received: by 2002:a17:90b:1d45:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-3933b7ff941mr24717362a91.8.1786966395038;
        Mon, 17 Aug 2026 04:33:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b3b91sm2071705a91.13.2026.08.17.04.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:33:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: mt6797: Drop redundant probe error messages
Date: Mon, 17 Aug 2026 18:32:49 +0700
Message-ID: <20260817113249.69252-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817113249.69252-1-phucduc.bui@gmail.com>
References: <20260817113249.69252-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_043315_676464_7387D899 
X-CRM114-Status: GOOD (  11.33  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index f62a32f2f2b6..dfe67727fe47 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -754,10 +754,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt6797_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	/* regmap init */
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
@@ -800,10 +798,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt6797_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		return ret;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


