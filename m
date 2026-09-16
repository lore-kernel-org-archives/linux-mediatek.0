Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1730C88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6hZRc7AVMqT+dPho3OXEUUZfvSnaC+QBxw2ObR4QHA=; b=grtzLY5azOrBAe/mTH7f1IpGde
	UKxMi0PkMepZA1Z+H+dwuubElY79foq4jIqeVXrwU89mqUUxu89q26xPOj4Ur0QXf1LYLtI6pB3XU
	6cVj2STvzuMcy9J3ZgJKkb5j/guHnQZrJBVBZJfjH/LeePUNlAfjl4aFoPVzBiVtgM21lBZwLA4iO
	W7+l+kM7IJgWEh1CC2ooSFiH0jJO5q2oKqDRrvwvpw9c//FaUJPHC3nnAYTTQgEyowh78teelM2Mr
	xfHNROa4s39nA5VVmb6Tr0gZ1nURmWZjUbHzznX5N+q4Z0cr2FaNIYPmv+9cF37uUA6UAo0nGbmCw
	Vtg+fsdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlr-00000008LUv-3NWh;
	Wed, 16 Sep 2026 05:01:23 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlk-00000008LLv-2kAx
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:18 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-8633a38df87so272093b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534876; x=1790139676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6hZRc7AVMqT+dPho3OXEUUZfvSnaC+QBxw2ObR4QHA=;
        b=DKh4R777JktjKgCpGWnJkUv1dGL9LGYyRpqC69hXr1Sr1Ho/xfC0VlzfVxjopKslLN
         o6vPrZzvtrHZulMls2H1Pkyt2OV+xN6EFWuVW5mQ+Wt69Y8eAu7jLqeB9rBpFzsqPOrW
         x8PeN4TUm/cJ/FB1oBPw0vexaNfFXoUF0Ye4GL4tbinU6Y/2fkEbQldBJ1Y6Qs6FItFE
         DkRXNKKluBzMsqM34nmXu6ZAeBC7raNAuaNOUf+VzfWwZtvyd76OkoMTbNdQsUcXl1zN
         MsMlFCP72cxuicaTBor6gkXh+XV5EWQ+ga6eUrt8tfqw+FqSGq6gQcc+w31kq1/k3A6w
         8oCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534876; x=1790139676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6hZRc7AVMqT+dPho3OXEUUZfvSnaC+QBxw2ObR4QHA=;
        b=WYkMacAS3Q9Ic2GWMZ/c2C5XR+qNSCvC0eSzJZo99LhSAd+KYd/npvuSNmmYDjxR42
         zla08KhZDSbuCmP1Yc/Jjt0Ts14jCrC3HigJsZoxzfrrXSMeHlDNUACvn9Ob6hFYl/7T
         GrkBBlMtJ7VaM0BbuuvHTpApDtZxGfFZBslBBb0P1MhZ3p4kT8NHjucN5Xvv18meGqg7
         pBCdRLLKPp0o+WVQJj/JgdxUAlQO6nyKGNcIJ+Du8gbEhL6qPVCRGmSDl84PzkWF6258
         vS44sCTFJiGDPXDIIi4TNivc4921/gFyvZOb8+ExyVl8aNMPmNQmvmNs5Zr0fvxUPG7o
         eq9A==
X-Forwarded-Encrypted: i=1; AKwUvBz4i7R23urnX/qvwZrT+DPc9CA45kLZLbwbXiqcvYeSSIYD+qZ3ueS8ViQre4+BXtIMy0beOC3Va8rOi7oCeQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nTdZgY3G/LRL+MJqyaBmh07URlPkH24mGfIfzgo+ZsMY/evGls
	hSRZnFgjDg5KhaAq7/3BQ5v0A2AMnjr7kMvHci7qqzH3f4lWwK5Tjchw
X-Gm-Gg: AYBFou0gbiWtvhWXakhvxJjfxxGMZ1cSMHn8wIdZQSDYOAzpMxn8eUn23159wIFCoJv
	NHWJLsnObo7/QxG5HHIe+ygPpS2Ag27btcotyfZFpbsDLhv3u7WXlGwsl6d4B7IlmKDnMDyUMex
	6nQ5WIYSIwbAsSYqx3JrRg313lnAHzx7bzbOjimsz8f3orEO+3OIDHZyYsEs7MEvfDzZ43JzWvU
	VqMOozVCT6SEBaZtZopm3rJ6Xd6YE43cNmbQPZePn+eSZvaGZ/xti83JGLnSYLz2585XEeDXr3K
	WbV3TzS/sawq3ZFRJYDqQseblGGTvWn7FyVhdfT6PymFW9wQTFUKUDoaN+nom5ppuOwhHO4NKHJ
	5r8sHBRK2oGdMhu8fFubPZ1rL6Vu0mx3Uh+1yTvedndDWCjEYqlMzphxafgIad39sDsDMRxkccn
	WskcZT1kKmgTQUEzF8tMnO12mP/aF5KpEm9bLPq2XDPN1VisJ/aK5rGnSUtsprvm9DnR/30Jelg
	Dhe6BONKVyE2oldDaE6LgyVjudjvi2lDLpCkLNFpvLuilBjrQt5s8l8EC+H7ZX2uHfjcwXd0DB5
	UN55PmlvXARc/eA=
X-Received: by 2002:a05:6a20:d48e:b0:3da:1e2f:3be9 with SMTP id adf61e73a8af0-3dd5f720482mr3249802637.22.1789534875984;
        Tue, 15 Sep 2026 22:01:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:15 -0700 (PDT)
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
Subject: [PATCH v3 07/12] ASoC: mediatek: mt8189: Remove redundant error message
Date: Wed, 16 Sep 2026 12:00:14 +0700
Message-ID: <20260916050020.14575-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_220117_316409_1C8AB04C 
X-CRM114-Status: GOOD (  12.54  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 39cc2804ad4c..11dba86c3e81 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2486,13 +2486,12 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 
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
@@ -2526,13 +2525,13 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
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
@@ -2601,10 +2600,8 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
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


