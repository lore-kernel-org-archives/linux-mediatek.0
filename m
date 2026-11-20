Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9C8606A336
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gda9JS7T;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h698WeW8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=; b=Gda9JS7TxnYvrGQCElHsJIhQPG
	HgMjBAbz/yTO44e+K0BD9BQ667zs6BsFalgXcq8lQIDeEKAiaLlGuC7n/pMfpEDfIygqkkvKZNKnw
	e9R/zL07ul2aAr2djGfU1atdnAWGl/OkARd87D8xvyZN3AEu0LouNw6tH8kuEM4+LWjIXWM1oX0C6
	4xMyIK/ZDcwN2GeBkNiXlnJ/0+CTL9CBd4T9A6dd3ML8sUEllcF/5VJ0cj17Ev7euNdCjoD4qHgCZ
	BnaTCHsuWtwH9oyBbf/5rB/E1yj0YwUelKrLLQ0NlCoHyHyRGM1OcaoBcru47mgO9/tLrHOQIczRU
	xMU7b9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUDZ-0000000G4qO-1Wqy;
	Fri, 20 Nov 2026 19:24:17 +0000
Received: from mail-dl1-x1248.google.com ([2607:f8b0:4864:20::1248])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUDN-0000000G4kM-1uon
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 19:24:06 +0000
Received: by mail-dl1-x1248.google.com with SMTP id a92af1059eb24-1a71dd190b0so3646286c88.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 11:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202643; x=1795807443; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=;
        b=h698WeW84YwVu2mvFkW/MGMrD7+4YaxjFyztKjcNeMIMad0rcU+ke6Qrq8fTBoHXzv
         As9YWeh5yiW/HylV9ybgW5TXGJsPZDHBYZfd1rCof/9T2l/wqSOem6xmPp5f/Qra1jnv
         BUWh1gtVtmL4PVdinoHQ68lld/53XcvxUjpYKFYhwbNfjmD0jP3jYxK3tBtJiUkuf9JC
         Q564wrcSo8yNKLjIVI6Hv/CIaTVRlH3dVWesh5P/YkYny3+q1A9Mdde0A7u4ls129pPJ
         GvMx36YxJ5UzGPTlLZvUZIq96W40bUbHkmF6GU3vqmxwHAcGP9tNTGl8zLlyVrO8WZzH
         ETow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202643; x=1795807443;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fhhPGjS1thNHUB3b+qhtFbbHubj0JR+3bV6/IGk4t4=;
        b=XbjzfvpXacoEZCYggsxTL1YojSStaFPwRZF30VAr/vLH2QdgUmWv6FU6nkiCRhyZYc
         YyoK+iAN7+8Ht40SYcHoaVPQmHbhVf8yzQcZp++YrI/bJQMnpvKIjFh+kfdu/KMfmVnE
         tT7L5AaoX+dQAjifgnIiI4LnXpJSHv80Pp9AKED6v+47m8uCi9PnJW/pby+4tuGU1T0p
         TFiQlHoXMAaku1RsSSj+W/cP5iKnVuS/zRdv8X0hDzlvqgwlPfpgsrW/XtRqvPQCJLH8
         2gpgywpECE3Zwb05Kc3g/IoyY91+uI8xW1TT6n2kaM3fhAn2ruAPKXV0b+7Xs0ca7a5R
         1Pxw==
X-Forwarded-Encrypted: i=1; AL+hErEeiilXtPk6JSleQggzeaB8NPId0bY0IQBpM/ntNfi8CD7AGAdsDdqwAGfSTz+QrKzMHsNSjRwVEFfSfx2Mpg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/HzJmVXQrifucAtL8rLbpLZSBbRJZ+vprjXU0A4StqvAAKraRe
	V2eKGgXTHwP1O3hHSSQuBDTRts6hx2JqlwFJvocsZOKQU1Sd4Gby0ux2rhyBhVHTmCu8jEzeYwX
	yXQ==
X-Received: from dybmh16.prod.google.com ([2002:a05:7301:f10:b0:386:33c7:a7cb])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1715:b0:144:f089:b189
 with SMTP id a92af1059eb24-1b55691a623mr3662644c88.36.1795202642255; Fri, 20
 Nov 2026 11:24:02 -0800 (PST)
Date: Fri, 20 Nov 2026 19:22:36 +0000
In-Reply-To: <20261120192237.2870582-1-elkin@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261120192237.2870582-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192237.2870582-2-elkin@google.com>
Subject: [PATCH 1/2] ASoC: mediatek: mt8196: clear afe->regmap on
 devm_regmap_init_mmio() error
From: Elkin Cruz <elkin@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_112405_493214_BC1C61B8 
X-CRM114-Status: GOOD (  10.17  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When devm_regmap_init_mmio() fails in mt8196_afe_pcm_dev_probe(),
afe->regmap holds an ERR_PTR() while unwinding through err_pm_put ->
pm_runtime_put_sync(), which invokes mt8196_afe_runtime_suspend().
Because mt8196_afe_runtime_suspend() only guards if (!afe->regmap), it
passes the error pointer into regcache_cache_only() and crashes.

Clear afe->regmap to NULL before jumping to err_pm_put.

Fixes: e38353138a09 ("ASoC: mediatek: mt8196: Fix probe resource cleanup")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index 82b5ae91751a..3028aa82c4a8 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2450,6 +2450,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 					    &mt8196_afe_regmap_config);
 	if (IS_ERR(afe->regmap)) {
 		ret = PTR_ERR(afe->regmap);
+		afe->regmap = NULL;
 		goto err_pm_put;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog


