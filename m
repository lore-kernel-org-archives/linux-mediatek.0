Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350A1C79F9F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueFbq8+vEvSr27HopAfMc9ldfFuJNT5gbHVBZLkrJAw=; b=iHBA6OrvY+SM0JbCiXHlsNddH5
	GFQ5O/4itR8YFWJkqBvp++0ECUGjoQ2XdCJs0v1rih16sntPNCowfcslzk/3Pmh01BHyOmx3j0xnR
	Wu6Ang/xENLLkkp4h5sxiNhA74vKba52Y0qPlCAshlUm35UoR6Bpx1J03i5sGXT5f1wcFTarlvtYi
	/j7da50OVmA9ZlZ8C0WmC+ZBSrzVxnHj9Z54eJiRRx7wmpN/QroOd7lPUpuNIS6wIkwx/3lknj7Ie
	A4uu6MfWkxJkMEzKFddZwXXfZexUdt2YZQbIaq+se37mxmn79LcOjMBc+HUiqgZPB8zGGp4mU+LbB
	0Tsv2egQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMV-0000000EOn4-1YpM;
	Thu, 10 Sep 2026 12:58:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMT-0000000EOkb-3cEJ
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ueFbq8+vEvSr27HopAfMc9ldfFuJNT5gbHVBZLkrJAw=; b=TuKt08VsR9/5JP36XM4kkKA8gV
	zrKsPgxaoQpiP+E187W1r0CTuc0W9rsN9rDVK1c1DF5tAsv3gB04yKrOdc5/QMWjbN+2u+BNmMsc5
	L2dz4SjWhfKsO/bv9nh9kx7lqtUcM8daL/HStn3rd1VQWhVGGmbQInhGbE1FadKSKft6GZLxyzVHZ
	WDXrOTxc6GcrB1ajBZ57z/iYoX6bzoUdb18frZYscIE033TKfGAGJrczUtBvxZHzV8YL46j1aQQLF
	+RftlQG47XrMOsG49as59DPCaL7nm3oamAzawzqqALn4pqSlSknSgM4cBblgeX4Ju780vmF0olaUy
	00UWRBSQ==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eMR-00000002V2A-08GA
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:40 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1562512a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045117; x=1789649917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ueFbq8+vEvSr27HopAfMc9ldfFuJNT5gbHVBZLkrJAw=;
        b=KYfYxmwBZUbenLvJAnAV036njjQZfi4ywo5mY7a0DBxG+MHlfTnRL8wjaTn4Ribrcn
         9Lw2XRR9ECs/qtv8uBthSBmK8hBTfy93Dk+I+xIXgtIHcwO2nJ8DqKgZ7QQqu/Xi6sVp
         LBpB5cO1LEVVqMqewF/GWKYVSMKtdTPTLKv4s3m1/d6meuIZTplNE9/iKikJLSH4dqag
         f8+NAG1GrZqteDk+tpPcTK7mHdw4N1aZRpAmjclY2iUalnNq7GqzQf/bkF9EpBmhNqfa
         0bQVYvB6w8VepSAtcGlUsFfv7BnMMTBNwlNpiLhJrzt5spm7KRcpX91TV1PQGqrvCPr6
         Bbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045117; x=1789649917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ueFbq8+vEvSr27HopAfMc9ldfFuJNT5gbHVBZLkrJAw=;
        b=pZW7zev5zFEywCFA3VBLUyLlSHDOluSq4FGxz2PicTsOOl6Is9srNG9UilFlwb64Fa
         ryLmZOHlymKlBGvSB/Wf8BUQxiUwZoPnK/WZH7N2Ops5/E9kAJ866Z8dgOYJVJ04Fw0y
         4kzy9VTSR5TDuAkjli6aCjWE9KlzfqI9q6YsQdj3feQCDBKcC/2NMoWDWiR+41L0QZX1
         +vCm9Ste+9kNkv9sSVh8NNrkjfgQgFgJnLI9wnM/wX+6+BjTpq9st92ExuviyiyISPnz
         czEny4wvo4NOvHn7G9BAG8MRD4eZt2EXydNl/Mo8Do7XKHPBa3KEpSnuTecdcdpJEbwN
         BXKg==
X-Forwarded-Encrypted: i=1; AKwUvBw679YI+58wHMf+4xvRtOuXyfcgn9tX3osl5dwcaaJEDg1JQfYRVWN8t1MsEUn4spvRnOAa8FWx+K43U5HzPA==@lists.infradead.org
X-Gm-Message-State: AFuF++kNo2AYkcQar4L3Rq9R6XWZRvVtKVoUZj3FxetJVePCH5g1Qpds
	3e0VlLZtAFvwjtmCiQU35AeJ8AcolEsNkxowPPI47Gq7ml4k4dh/e+nue2TuHQ==
X-Gm-Gg: AYBFou0M/TJMmUZaPuLSH+gbONaXhAT63gwOK4To4gcqri+nEz1SUdKrcyVYj470lpT
	SVrncJcsn/WDIy3ehIQEmbS1ZjkMn9cqmPdht474hpyVGghSTtK9mYxX4mkHhClGq1uneH5tP2A
	FMuXnnVLWwqBxpIIPMvnzlPFF3Wi2T/ZpsHkVpfTr2w7+q9Hnx2Vx/NpsRSKeCknuuI34c2NcSG
	430Vm4P5Y2ZiIgkW4A+C/fpYVFXCfN1S/na3GbMk93IRRfj7MPPHvsH24GhcPpTJXFD3rcFhSTs
	wZtEuGwDaEzx55oY+xiyR2ZXUKbMacfogPhajViLibkEtjO6MfHB8DF2IIOOAbGfkmIk75qid/v
	ShhtvcjBmsUT5nHLVHmhbLugR81dvGW+nMXNjFe2d5SL4FFHwCNRXMOYWCDS2gXZvim3LJx3vwk
	zcpzFbJuYvwfzulQ1CMLMJW1ttk//DGeuwvWiP9EInr78d6l265kwryesvMMwJT6Hzl3Z6hjOgx
	zOqz3/2uuLUvK9/JejrRxOMAT5W3r1WEG319+f6VGFD41aWoBSxri2Mk7pbsCQCJeXNao7Z2vcV
	EM3LXONPPOqOLKI=
X-Received: by 2002:a17:90b:57e6:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-39d70a34abcmr11658680a91.7.1789045117218;
        Thu, 10 Sep 2026 05:58:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:36 -0700 (PDT)
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
Subject: [PATCH 08/13] ASoC: mediatek: mt8189: Remove redundant error message
Date: Thu, 10 Sep 2026 19:57:37 +0700
Message-ID: <20260910125742.150902-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135839_201302_8DC667C7 
X-CRM114-Status: GOOD (  11.99  )
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
index 431320719b63..9335a9e44665 100644
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


