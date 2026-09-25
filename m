Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B51C98306
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+a+AWZNIU0wqIWtIDJ3mjn2LblAPLsjjXpjUgivHtBs=; b=MwxD6giuhpMB9tGQTIHM5M1XjO
	WmrA7Su/96Ogg3zdlMpiS3mSKlwOrJcd+OY7ONEh16eFAug1fKdHR3lanjTnu9tcRLAvkXKsrX+uz
	GXUElgvdc+4yLoNalYr5SRRdCUFBveRm0XfwzV88+Jmnj/m842uQ0DqNdWslJOWbiWkIHUY5GQo3X
	5GgPmqR313ixfsR6EHz6TqizP+gUEt9BHNlRC5/K/jjSqpu6w2PsNRBS69K3u9DLFQGX3zGuGUxwC
	A3ZO+oYWjXXHGf90f62gyxaYMxYEzqafg3ogbY8CFKTcMidhfkWo3zYhVQNqRrzoHAdYuoy9YZVzO
	v2v6rc9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtc-0000000Cdta-25oa;
	Fri, 25 Sep 2026 04:50:52 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtH-0000000Cdb9-0BHJ
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:34 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so166147a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311830; x=1790916630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+a+AWZNIU0wqIWtIDJ3mjn2LblAPLsjjXpjUgivHtBs=;
        b=Y2AREudunaCtILrR9trX+0jG9VElVd3Bia0IR+1OiQ5nqetTxrpKY4odEMC9uHm5ya
         1RaeoyZv77jtMp+N4fYV1ww6MfVrVcaSeb//ofj9aGTxxYhUb57usFi3N6j4sEYWgvvd
         gjBGBvqRwU+zvWw4NsBcvRKk6Kt+QZq+/WA51v0lOLYWWwaJ3s5OzUOhpt1Hbaom6hqk
         XzpmfjHPbvjiNz6bTRDDsSeTkZBOCCxOwU/oaJeBqfn+Z3WEacs+dPLi+ChUMi8fxoUJ
         Yc9K20+r7blFrsCcecbr4swS3YcXq8naa9vhk+x7OvIBVDcktJRsH6sJZh9rup/TKbEj
         BH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311830; x=1790916630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+a+AWZNIU0wqIWtIDJ3mjn2LblAPLsjjXpjUgivHtBs=;
        b=Md8LrH5zO7x0WN/uPzMcEKxYDFfz46oJzNqZ//Infrdz5z3TwEbfZeSQBnL/K6V/2/
         GfEBYRvz+L6567OGg69/zy98Elg+8Ua7yHmhLTuV8YETtoj2jkPtypUrV9m633whixxg
         95AwJCTKsdtsXZ/cmrvzpoVXgDy/PSy0xQCi6czD0jAl9DbMbaR2d91n2gpMUVcTqhhw
         FXCgVdU52azgyYqaFdTxyx72KaY0kVX9LIGGEmsrfEesZel4YPXaLMJv1frL8PsSNlf5
         vRdiKPsBBfUxTMbW7bWOXI8OimqeWf2KKp80fqBQhdA5Pl3l9Si8HmWp9SQq8CF39KqN
         FcwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOMBrYVKJDjruO9+QESNanllZGRgAg2qhjXxUK+7BhP7RQu5LjXjFhZd2f98qWtM/RNewWLn0hpb8pyDr5cQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lazPS8Nq8irCthL67WQsiURgyAkHhrdRTWzBMFFSrJnPVcA4EY
	yB2kmVZSGNcXQN3SqpS4at4UB1OAnvY6tWhPmDlXgIwOMUkEcHV242KG
X-Gm-Gg: AYBFou3LlSIg1kqPu6AULqH15Rq0iwPbYQVPf12HrDkAOzbYyyUQ3VUcKDFoAaFqoeS
	PupQA/8066beQnigzRqZVNAyLI2qM9KrK6jEvuHRKgBnOnI6vS+URPD9rV1OObzjH7G5d69ygtL
	/Bv4v+2Lcdav1XwyX0iFVm29FcHJwWMGd9xJnWchcqlkECMj0rxlFFspgqH2Oen5y6+JGit9C2j
	NL6ZZzFJm9D4DgTiZ7g8XarqavONBBgBuRUIpQJAzuxrX1nuHqJnO/a3vz1QjGbw8ptjxKVT7PO
	w5uy9qwohsp69SoSBGFcq13upjsmnWKNzw2vpy3S/p5zsvnU7psplhSn+15239ILlav2VS9W63u
	G4dNcwg9hsAzMHyyAjLrI58I0862fzDVgCpwj2lIE55i1wfDxXl7GNVflhOlhdCtKew2IGOgpuG
	XBEN/1xuBUz8p4Lxw0/ZWmTY6Nn6ooH/Aiccaf5a4XWEGwttM5hxZmTd5oFZ6a+6s/yflHyc/ou
	7jwKe3XDcXyACRIl4CEkPTNvzstdWyQIBM6K6w2ZzuxWAcsxA2b0E6pkvumUt6BNwgApqWmAPkX
	qmiQ8ofUkyH+quZ+gKARUl18
X-Received: by 2002:a17:90b:53cc:b0:39e:6c6a:2096 with SMTP id 98e67ed59e1d1-3a098970bd7mr3908285a91.55.1790311830120;
        Thu, 24 Sep 2026 21:50:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:29 -0700 (PDT)
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
Subject: [PATCH 08/14] ASoC: mediatek: mt8195: Remove redundant error message
Date: Fri, 25 Sep 2026 11:49:02 +0700
Message-ID: <20260925044908.450775-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215031_100495_C8749450 
X-CRM114-Status: GOOD (  12.17  )
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
dev_warn() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index be150c0f5472..b8c3636cb64a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3083,7 +3083,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* initial audio related clock */
 	ret = mt8195_afe_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error\n");
+		return ret;
 
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
@@ -3130,7 +3130,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for asys-isr\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3188,10 +3188,9 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_platform\n");
+	if (ret)
 		goto err_pm_put;
-	}
+
 
 	ret = regmap_multi_reg_write(afe->regmap, mt8195_afe_reg_defaults,
 				     ARRAY_SIZE(mt8195_afe_reg_defaults));
-- 
2.43.0


