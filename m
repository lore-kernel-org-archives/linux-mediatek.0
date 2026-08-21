Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09A5C5DF7D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=; b=i3qYdv5NvMC4QcqCs8Unix46nH
	oYcKEL5jpxtTPDxNJQxOYuVVTZIJ+IQeChrzGWRxN2TPlMWy7XfagjTrjUpj1N5yQr3DLuo3cyVo/
	cHhW/ze2Ymyp9gqBx+86jxBIxrZDSKxfikGrg/5iexqMEzTb+Hj/bsg+JWFJCrf7rfcTZpMgs3inN
	IKDssnOBzGf2HXXT+h5/MYhTqbTj9CNVa0UcDkNmP6hxJKEIfK4eHjOKNLNnvIdwAt8SBzhHzzIIj
	a6IwLMGhQlW1S8a60nTZEF2iqOtIewjLTdBn53RRzc+hYECWnyz2qNrRFkOYw7KXgb8PVGC9V5yUR
	sJ2temmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONq-0000000DJco-3TVm;
	Fri, 21 Aug 2026 12:30:06 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONm-0000000DJYh-0eU1
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 12:30:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso856764b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 05:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315401; x=1787920201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=;
        b=WfF6Hbha3PLuyAPCNM5gC5jsLLKP1zfbxpdwK/bUUNUz3kAkMV8hqMJUZ43v49wKjv
         bDPAnstDPRdTFuL99umq7xuIwaWeP2DHKQisFAcFA2o61jQ8b7Qlrgl+kKPvyVzV7kVO
         y+RWgLzHWEj/lenRbcc23vkrYfwBU0YnOkUKU1R5McB05ov82ksWHZngHECDqYTNhGv8
         V0AmnIS9YrfhBqq0zUy5djMkF22lDYIsnf+k/nPV+Gc1QULMr3F92XBb4zzB//IpKkSm
         OLPtBp0NYCGhjP2ROSJ+y9oVDuO5ZCVeMu2MARQB0d6Dwg7BlnTjX+Xlyp5sqpCD+hhr
         caZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315401; x=1787920201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=;
        b=dv8RN6sJvrwwK9S8OLFqLUSE7Ksp967MQc4vXDxryDB+TEoVGSLf/IerHsnV/Er9Lr
         k9k+SQLnfXkOT7IKBpuzalSsincGZC78zzRzKf21ZSIC6JY62Rj/5ajci1k202AsXFjz
         ETXPR62Q4Dh9uBI5nkKmtYWO2fwazo8ROtd0KmwkLeqy/0ONGDlby2XJbGMXNHiO9XbO
         B9anPPaq/IIdlg0WRQb5HHjJju3Hrbu6vghJ0wa9ta/RbTKnhJOkbovktfUaT7M79+EK
         R90ZU04xxEGMVQ7lbsDxXNg8vflW4AitCSZRZnJEyjO6GLtEaGqk3bP1/PIgQcUZN4A4
         cHrg==
X-Forwarded-Encrypted: i=1; AHgh+Rp077x75JCEPhWKN13762eu95N6Pdu7cp6nc9ZKvRqLMyUzsr5o0/5YDQZybK0jGWhWokRiMkzKZ3DuRJOAjA==@lists.infradead.org
X-Gm-Message-State: AFuF++nx2tyLg96YnEavt57tiD27kMv6ZXR4EGwJHRd1OiwaS6tEJBmM
	T8plUTdijYuYfCe3Fc9BXz5/qkvsyoh921GPgdkU8USIBvov/1+rbiLd
X-Gm-Gg: AR+sD12G95S8aeyMOd+HvymcWrZr39v8LaWbKV1/yZIKXX540bx0r3FJzBPT/QASnvB
	z8W2CpmN5957ssoknltXF0cxkOeaVXqSFh+9/ctPajqdcjQQtFEOwfm2zk7c5P1vOR+ZgiTkng/
	4fhp/CWpCLNwAlnTxdEUsiIazxhz2+rAbM4wqacsDD4GGecVPR1mO7bwgpwh9po3rI6aurBNFGG
	YyT+XpHVyE+6RkH4YfJ/ltXLAFNfUZYyxMaD/VqjM0WpM/s6nsLZXNmLUtHqypYieI/54tA0kEe
	sETl5Nyo7qIJLGmdmwRHZDw2rOFbG2GuU9SIkfN3Gwn+t/6j5EAuSke6oTw1Nn/a/4BjNHhckCm
	RQrlKkuX2b41lmmxWHhwwuiGYDWfTsH6gUKIkzRP1SqVEWUFj58Qsd3ncivv5lrpgixbxN+qhAM
	SbYF4fTByra/OmThRgIRW4CVHPEVvSwOmhodeBhK3Hz/TooaLyAt4bKS6Oohj4G66QWv+9ZV0Us
	2IsnHDy5/87gikmctiEBfoVK0tPvyeSvcWF1cJKuGAdd5p7BtHUUQPGxwActEtVCahj19+lPkiK
	97EX
X-Received: by 2002:a05:6a00:32cb:b0:84a:646f:193 with SMTP id d2e1a72fcca58-851f969b3b6mr10656377b3a.0.1787315401447;
        Fri, 21 Aug 2026 05:30:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 4/4] ASoC: mediatek: mt8183: Drop redundant probe error messages
Date: Fri, 21 Aug 2026 19:29:28 +0700
Message-ID: <20260821122928.41343-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122928.41343-1-phucduc.bui@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_053002_248913_EA3D8792 
X-CRM114-Status: GOOD (  11.53  )
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
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..46b7a2bb6aaa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -809,10 +809,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_enable(dev);
 
@@ -903,10 +901,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


