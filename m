Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983C8C88E50
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvhy8CjCHaEUNOyzqez3eokLT1azbHniSOhw40sTHWA=; b=qAZnNZUYXdnkK0aaD+yfsGwcwG
	F6XhYgUyBj6z4POnhmxjCi6z+zG64KM5AuAq2xXsrRt7Kn4aQ2Qz9YaurL/qWyRaa6JB81methW6F
	f6wGfKNzNAfCXbJgi5Wv2p/xLzuuqPqaCS1XHPvCyxLdF3bd6Bbc84BQOja0MrKEY8UUE3lb+sS6V
	1PcpDIvbU6bMwifPez5rxZ1r6ygtFYsrO9KvVELX/d+pXd89zLCWqlAdO+R/s9UQ2xfRRFLMpe2Xy
	rplylIk9ncoeiIiUFbc3UmZK6vwEhRKp+82WAv1SkeFTAD5J2LAwS0iJHdTmpt4hXvOKPNyOTC3Kr
	qS2Oitjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618K-00000002YkU-3DU9;
	Mon, 14 Sep 2026 07:29:44 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6189-00000002YXE-0YI9
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:35 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39d654f02baso1403564a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 00:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370972; x=1789975772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvhy8CjCHaEUNOyzqez3eokLT1azbHniSOhw40sTHWA=;
        b=X77zCsbLwhoamD5JEVFMp6W6HlNZ6ndf5K7tL5wa1d7MG8yNhm4dQVO822gICle2Rx
         WPjAkhf+qKrzMnetlx49YCwokWXJMGdT+ENJB6gWggko8Es07t0aBxGk14gHiRz5uw+Z
         VtnFlbeq+WjftO6By/BdzfKfpl00HDE3vrJpq/TLJT5nD09azGC/uylszIM63qN/HHC2
         aWaOhCoKg6UIRMtZVWV0+IyzY/LDHZPKFyUrsvkPiZswKexhAjk8bMfc82NKMBmVKFAo
         Lic1wVfxleZWjmZz+4Tr5sLEn4z1gQUplEUZhsafSUbVOshs0yRDOdUFkORNm0GPItpB
         L+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370972; x=1789975772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kvhy8CjCHaEUNOyzqez3eokLT1azbHniSOhw40sTHWA=;
        b=ThmrayqxrpsDNrEdzpdl71ccPUgnGG1BF41N5IN2Vdbx2gFkkTr1TK1CN7K4H7r65j
         1tNnCnrEQ/wjE7rfegocUeF7pZLsgIMna6E8xSo+XKc5sQQ1dRC88NB5js8H18L/10mo
         C27hlwt602k+WKgt6tWND39aXQ4xOEkEPSDGcgZv38pP2/wzpY0Za7ynlHPTuGEb4gwG
         fH7WaqGcqeGyM1P5iJHIpzSEgMXfD1iqHkni4bozfl9PRHztPKRLbidF+3h7FzFlqawZ
         rqW1ZvuSoCcSFqkvhX7GpfY4DjgFKpPb8MZb/aWzA+xZ5DRRfyAupTuwQQL2VsfUMIIK
         6mig==
X-Forwarded-Encrypted: i=1; AKwUvByfSfyZ/QesyF+FTdXSpYXoY1jqU1ZcRrUyWxFKcUBxZT3spQxbsi006ACzenQ9SvDsDgZ7kMsWX5XkjcCR9w==@lists.infradead.org
X-Gm-Message-State: AFuF++nU0H9kmGrz25B7YbFn4y6Xr7+C8Pl07DtEKvu8LhCByN1IQ6c9
	3AzqdUkzvGECferLCNSpUm3h2EEJpim2OnoOrDt3416P9NwOPKk9ptVP
X-Gm-Gg: AYBFou35eiUswI7YvvMPwJU4CKBQNUtQk1M2WqMUNwnKTk0wS3q0kpiamHERgC8xL37
	l5kWIkaDDPapcTAFjyZQeofTYqro1WgSkOpSeT38L/8bD2RiYwwfkxx76uZ3NEuvk8xR/b/0lz1
	aOBB2keAsU64IJutF+Sd1oG+1fJqOVtPUHHSB6eRei5leySRmkyAVdaDvASSmXrBIUx/NwQawQt
	5TCqV6SFxiuFFJ4FUwBQh1JgWupmfIVxJiX7ivZyimI+r3qYrc0pNgmn3xVOBEP0PcZHj6BPpat
	2Ag49zOzBfRsiblF/WqitFCVj9orsIAVqnhoaCb1xMdgpFBqXKekkg2KDEaJ9b//om2C6heAipQ
	bFwn5+ulk1oNM/T0ITNX+7DN26H95Gj0uhB3FS6LNTj7NGhJuTdDWRTELidXcgytTDPFPgcHcPi
	EpiZXc+RrSpX4XsX3KkNQsz89lkFSSceytr3eLGaU7TENpDW2CJPyE+MivkmfXtwh8aUi4aNKH+
	nHCyQPKtJ+Pw8oR1xc02WpFZAg27GHI47jvxroaBIDHLi6eFhn8gEZnXfJ7zq2XJLpVENIpaTrO
	7wAdFClxCnDzjCgwpQKnE+tUhQ==
X-Received: by 2002:a17:90a:1189:b0:39d:f064:3a76 with SMTP id 98e67ed59e1d1-39df06469efmr944725a91.15.1789370972413;
        Mon, 14 Sep 2026 00:29:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:32 -0700 (PDT)
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
Subject: [PATCH v2 08/13] ASoC: mediatek: mt8189: Remove redundant error message
Date: Mon, 14 Sep 2026 14:28:37 +0700
Message-ID: <20260914072842.24420-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002933_201192_9CE95028 
X-CRM114-Status: GOOD (  12.07  )
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
dev_err() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 67fa40afdefa..981e660981e3 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2488,13 +2488,12 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
-		return dev_err_probe(dev, PTR_ERR(afe->base_addr),
-				     "AFE base_addr not found\n");
+		return PTR_ERR(afe->base_addr);
 
 	/* init audio related clock */
 	ret = mt8189_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error.\n");
+		return ret;
 
 	/* init memif */
 	/* IPM2.0 no need banding */
@@ -2528,13 +2527,13 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id, "no irq found");
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2603,10 +2602,8 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8189_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "afe component err: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 
-- 
2.43.0


