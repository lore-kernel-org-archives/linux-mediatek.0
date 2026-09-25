Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0C5C98321
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=; b=eefoPUJCjmreuEHAj5d1g4siTl
	EYZ2AtbA6n/8gBCXfVBqEai5yvzu5gTILQCSvyPExGoNDrW9g4ccvUpuL/E6AJ5qWNKcPEgIqd/NJ
	NYJTnB5aZlu6JvoGNkXlNK47qzfvhsnKJ5V6z38NQSV3gj/38DtsiGQki/IVZ2WXFPqfNSQwWwr0e
	Pn8S8AsgDOCCBnaJs73m91BZiOneXinZ1s5224Vb2PilffR5CeN02soeSAl0RHiuv5Em1eVffZjKm
	q7GC9wWTPADIgKBl9be8owqE28xELk6mVa+YkgooN0lW1If89+BNiJMxZ3h13CU53OhWgGtgEcSli
	f766/A6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xt0-0000000CdPQ-49fc;
	Fri, 25 Sep 2026 04:50:14 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsu-0000000CdKO-1V2x
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:10 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so147238a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311807; x=1790916607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=Ef21Tgbsi/T4sSIegWiCYQ/xH9Ug8HmqqRKSDnqrDwl7ltW0W5rQp8Wx+YqBHBueNp
         MK8i2CWDI6Uy4c8/DKYypXLDD0xzGBTUvmLcGgd19eyX9Uc5/wLMCOLeTEhdRY5D9e+T
         Im+ajjo82l+ma/Bytzoo578I3HEvcdEhURzNL8aF2qsN4a1Bdtgmz+MpFu1i4zVjbJMM
         Pb+VmQQkpL4tM1YReeWtj3LL+Of3P/WKxYaKxJP1r7Bl95goiW/KcbAfRJ+0b6zqukzm
         NhrZOKGJhPCUICdGaF6qh0gcprbL0BZNPPnWAnoelCLFHR2dE5RXtqBq9SqdRbeGiPr9
         wOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311807; x=1790916607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EuT5sR3QJJEpUFIiZqumIPgjPq3lYxiQww7DYh2KWes=;
        b=mYDVAvz0R8FrZTBPscccaSXdG/NA6V25fWfKzfuhH/95rrNx6n3JrVQjnv2MxGKAF/
         TCC4S1FJyGIv26Gz/TqnuaYI4pfenO+Mh/nscQwsWK2hirMxf8IyUcENPaLakK/13c2C
         7rC8/2mh4UTRBGxlmd2jajGTLMGr3ND8IbAc/pocPDa1pxewEY8QgQaixdTC3AzrzDye
         xQJ7jHq+tanSooBQhAyhPPYQQ7EBpSjsFLKevMHiljKAsgWgR9leomeV/jRshNL/V0WH
         XmF3CBvPbm36T6E4wmrpIGxHIlUOUz0S1QpgqzVE6WJXqEBOTtxzAAxUoQPNXk1VjoH4
         HlKw==
X-Forwarded-Encrypted: i=1; AKwUvBzEn2Z8AALzNbuSscLcVM7YhavUsajrZV7gbeTUyj8PXNw0V2Fcvxau6G+NqMLGoxdGnGb0kJfw9VdA7rn6pA==@lists.infradead.org
X-Gm-Message-State: AFuF++n6FZ5N0qJ0J4/m8xcT01sVxpzwB+eGZuLJ9/Bdh6FyaWpBOC0h
	I4Hu9kFjB0+gBImM1iiRxGkFUos2Xgr/1anni/L2sWDc15yoR6wKpTEb
X-Gm-Gg: AYBFou3Z915KP0R1gVMRhGGqtoexvAkbGxoRGF7kyj7OW0ha32dnF908XWPwnFyTD0j
	MuCKQAy89jb3oIhJbnuVK0p7UBtDQ7fJYAO6nz+d7rk2oc+L09tRdyGXE8T66d8RxvfXIi1LP5B
	K+PDByvHoD8j49RxKS6kq1NqySly9YPaboBbBvtDja7k/ogFxKJHnbLNRue1/0F7fGysS1R3qd4
	dVtPSQmxfDRZF6PExgsz9XUrynR0zp8Do/zQGmaXHSp4BRt1FKV/BOo4Vnji3oxSMiPIeLEDHA1
	vm+UYX0tO/lqIOjHYimmaGxN5iqa5EPHfdygg8IfjpNjzK2eO9eJlrNhMXebnWKoow/feO/jrAK
	2yxS52MSjOijwflUj3yOD3gH7nZbC8ZqCfKidZRgU95hX8DTzu4xCqJQjK23SfLdTcJ03jq3rb9
	qIAhewckxTpC07gLcQnLRDIOX6+K/QrKw073sYV8K0k0nn1NmF65geJX3iVqAZGYZ/NtEtXahnT
	8Yqo1gbxFc50TkS9baU9GjP+edoH9A4VlgzgUDdzJlnoqMvVNt7shOjm+vA2NXBDeNYlBRrkCqP
	yoAX2a0nNTQb4w==
X-Received: by 2002:a17:90b:1b06:b0:3a0:8133:69a0 with SMTP id 98e67ed59e1d1-3a098b93cb8mr4058209a91.14.1790311807298;
        Thu, 24 Sep 2026 21:50:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:07 -0700 (PDT)
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
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/14] ASoC: mediatek: mt8195: Fix register access clock error handling
Date: Fri, 25 Sep 2026 11:48:57 +0700
Message-ID: <20260925044908.450775-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215008_396938_F78CDF4B 
X-CRM114-Status: GOOD (  14.15  )
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

Check the return value of mt8195_afe_enable_clk() when enabling the
register access clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 12d8159338be..34c828fdea29 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
 		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
@@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0


