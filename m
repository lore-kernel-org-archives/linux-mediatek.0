Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D511606A6E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 19:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d8DG0DZs;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eZ4jKi1X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r1t6hXxpnEN8Y+0K+jURR9P4uCOXwlVnTuqlNkdIH4s=; b=d8DG0DZs1cvOfio18WZl4dlDW7
	sROduJOaiLXxdghpakFAAqWHUeidNefz1kvPwIcB4z/lCiVaUer82RhnvCux98kgbrsLXesiTi79O
	uAJQOog4yfZzR+FEyPCzN8MU5s2VYY6bY6yaP78IbKKqm772CHQuRuXRftSPPjybwrpw555xtc8V0
	nnf3gMjh7ueWzFXkr0zKNzezU695DoeBXNxhbWLt2aXOCciPuYOE7i/jWQdnCVU1+XOSt+f3RyINf
	ALcWaxInfejgHjyCAMCgcRwWYKND5dhuG5uzVnVUAvVpJL6+1NZqhbC0HKeu5xXXUzB7uk0sB3SA9
	rekSrPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUDq-0000000G4x7-3K7s;
	Fri, 20 Nov 2026 19:24:34 +0000
Received: from mail-dy1-x1346.google.com ([2607:f8b0:4864:20::1346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUDS-0000000G4mX-0FNq
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 19:24:18 +0000
Received: by mail-dy1-x1346.google.com with SMTP id 5a478bee46e88-3821eb27024so2028194eec.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 11:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202648; x=1795807448; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1t6hXxpnEN8Y+0K+jURR9P4uCOXwlVnTuqlNkdIH4s=;
        b=eZ4jKi1Xf9lU9gL1R4l4Qs6pBX6FyzxRhijb9ihdNKTB9LXK0hHWv+p+4qOxrXatRH
         gVvz44JaK0dbB/LI/mItdO8MUW65EmqRdlW/pAuF/lWpA4TFOPxNCgKOkLeUVaQsOafj
         8G0QAcM8ixTXCzvnrnv0kokcCJDBaA7eSW7nhazBDnRz+kUMwkkI5Ct0dt9op/UQrN0z
         Hm5V45UKj5j2R5YLnN19xmfg2P87n7/1YUizxCyQ8ogj6TRDCM/Gp7g/hVCZZf8HWVgq
         vYzXccdPBeoQ8vnh0BXngonoYikCGV23LJc83jdH0SjD8owGvzTp0oDQ5ixfGuOjH3lx
         /2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202648; x=1795807448;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1t6hXxpnEN8Y+0K+jURR9P4uCOXwlVnTuqlNkdIH4s=;
        b=YMDmE0b91c5o5Tp9iVPC5Yg5NkJSOJRNlgGG/DehZz1HAdgnmOXJYoNilqC7HikOV7
         /9n9OXMseVpm02vHNKu/+DB6ZeXO0WLN8/UUkZuxSBZkzLtWGuBrPz29kU/sZXDL8xgQ
         5fDlRlYaYdJq2+tZALJWj7Nq72VY9xoIvUmONBFqFUusYROZDQyViTu8NxLzarGfz2iE
         1bG6Fi410KI1kiY7Cw5sM5UyenG2kFNdmYlYXiVGjjLAl3y56Es5DlFqx2BZSdy+qYyF
         Gla6NgYSLIuMkDyQBQPI7/WbBvkZF9ewsjtHKJcXCfz0pj+IsbafAjOzTRPnjUr7yuIi
         UPcg==
X-Forwarded-Encrypted: i=1; AL+hErH3MqB/R0/JrkYBlqnJNrOFmcjJwWa4r0PmcWcLznDtRv1uQVJfvYD2ND3LFAxQOPGiM0FYqUS1qc6YhOS2mg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8VE8LJTOuoNkeuQRQek4b2GEanFYTEW/g9f39Et8Zcao6/zczW
	dm6ynG6Z8oYMnbjLbuPUSLukWgj/7IfqG1oQOhcz2hQybxlojwyGVEbul7sijZqLVIL99b+nxWG
	axg==
X-Received: from dybmf40.prod.google.com ([2002:a05:7301:928:b0:36c:9b55:8436])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:7188:b0:384:b800:2adf
 with SMTP id 5a478bee46e88-38571027b9dmr3890778eec.27.1795202647857; Fri, 20
 Nov 2026 11:24:07 -0800 (PST)
Date: Fri, 20 Nov 2026 19:22:37 +0000
In-Reply-To: <20261120192237.2870582-1-elkin@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261120192237.2870582-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192237.2870582-3-elkin@google.com>
Subject: [PATCH 2/2] ASoC: mediatek: mt8189: clear afe->regmap on
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
X-CRM114-CacheID: sfid-20261120_112417_158700_FB4A50EE 
X-CRM114-Status: GOOD (  10.45  )
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

When devm_regmap_init_mmio() fails in mt8189_afe_pcm_dev_probe(),
afe->regmap holds an ERR_PTR() while unwinding through err_pm_put ->
pm_runtime_put_sync(), which invokes mt8189_afe_runtime_suspend().
Because mt8189_afe_runtime_suspend() only checks if (!afe->regmap), the
ERR_PTR() value is passed to regmap_write() and regcache_cache_only().

Clear afe->regmap to NULL before jumping to err_pm_put.

Fixes: 5404599c3292 ("ASoC: mediatek: mt8189: Fix probe resource cleanup")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index f39b01590f71..85b5be6d45ec 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2563,6 +2563,7 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 					    &mt8189_afe_regmap_config);
 	if (IS_ERR(afe->regmap)) {
 		ret = PTR_ERR(afe->regmap);
+		afe->regmap = NULL;
 		goto err_pm_put;
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog


