Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B183606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 06:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WEHo65sf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvPVKgWa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B5lFknzbFblOuXPlPPjcfE8p4dbikqXW3Uf43fx34os=; b=WEHo65sfMBmUWF
	EGmcFyu6QQiVUKfHs7ErwQOLwNAZjE8XBCQzDfCpbQJ9NyqnRlgWRrql8xq5IEL/f6FsPXsuSlLB0
	XCHd34ycrLXRJfzx7wxdr/rmUlBq7NhL5uu2T+crisrXUeTDcEUMIiwtEs/PJrNL6cCTa8h1sIXVE
	TDD7kfkaEmgyX5GgXkr11O1VnE3Zmd7zfP8yc0SGR2NGmw6i1TWW8c2xMo3F+LsAQyyHKcxaRUtKh
	gC1IzNw4xGrXsiNyCeUNuz82N2Q9tXhx04mMHCLr3VeB4ed4292he1lY1L3Ys75T1+ve/WBTCNe10
	ZlVAMPkkHLTxO3gqEZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO9w-00000008nsp-0WJa;
	Thu, 12 Nov 2026 06:19:44 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO8J-00000008nP0-10St
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 06:18:47 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-91e7af9a67fso27591926d6.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2026 22:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464282; x=1795069082; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B5lFknzbFblOuXPlPPjcfE8p4dbikqXW3Uf43fx34os=;
        b=bvPVKgWaehBkb7+dCUbRYh2bZdFcFj89Cmio0KL0T6ncJxZAUwypHzudPx4j8rbn/G
         muhqkqCrvnyH1C4GAr2DsBin2xVImOPp1R0DZTCsl9UOT8IM3OzAWr5L4ybgkNnldaYL
         N9gKw8O0QOaJid4LKM+FD39G4a5tRfIDNnTZFrlqm9KnUy7fO6/G0ybje5BD3zHaKDnF
         p1diSVv9XC3czrB0jQduEe6eM4wUUvkRzv1ztBCZXZf/cpl2zyWrTfH851HNHwoix3yO
         zo0vNT8SEc5F7aDvvyGvdHBBVgxzYazVLciaObF5O0coauEPiuUAAoTEiuLMoi/a1Xga
         R7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464282; x=1795069082;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5lFknzbFblOuXPlPPjcfE8p4dbikqXW3Uf43fx34os=;
        b=OfFY/3U8oLityPZPpYcG3z0C9RO7JuutNwzyhy6lmrwmxYmh7JdMRZ03O2v6aQoY1T
         Sf3uA9khHe94dFjr2nJ1aO1VhUfdsTiA7MMDpOI+pIolh6vYZhdR/oPQncXBXp9e9//+
         5hrzkQnN04l3M6RywrZAfjWLbJe3arJSn9zI/QYvb+m9tnBQhGJMN9RozDI4M6r59nek
         oxnNWpQiD6Jo+FAfBHaUyeL637b4ZAOHdAEEeJ8LmTH9yZqZ1oVD4IFD9PkfCOTZSoFk
         STBW9W9bapZItHln3iY/arMYgPOllLYm2s00EtOWeWSTFm6MbOR2qijRP/Yf9BwjQBvg
         ls4g==
X-Forwarded-Encrypted: i=1; AL+hErE4IHFMJwH6Ed7pwXSBJwqu6nVWP7UKsBKODFDK5gsVdSX/T5z63d1U7dEre0+yfwRjF5mPrGz7r0ysKl/QCA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9yx+/guybSKV8rg94byR04lJmRzQYWMr80BKh0T2mxpx4ChyJA
	/pvAURfd6zUxxSYEHcOg9hISgDG9p8g+IEib7s5DG0ue4nUZSCSNCV4=
X-Gm-Gg: AYBFou1BYe91UwDShz7ocMKMOf2p/E4zh5DlEHpRtSrc49YbFn7G8CP9zkWsg1zgFKA
	fNZRkhiqsIUYH2W0wdyv7uGb609W9EULxN2CJXSF8BAPISA3WdFw9hDtACFbcQBIjEuaLSwVvDX
	rQFOZFE5mLPTlqspMqFdQt+0LOCu4i2w1kmKatAmRkqyTjxETF5QuFtnS8alx0M3Rpn7R8sgK+j
	vWiYIYgoWSqlfGJ8R4R2QHkgad2XUxkMv813ii040EfAdQmT/y7zNnPPuOOS3woPj0H8IFe82c6
	bArlPeJHGI/67yDBzMmacSfaByYVeNyOZmPbng+WSr5HDppYHRpvasqmoo3B3PaBxuJNEaBRICx
	/AvKW1ZHSM/J0wkmrx3FZ5KRMLf1JUL3SUsqw49d7uj276DFuu9zEykf0+7tNjfNprNyimIRD9Q
	rF2yAkgGJpqorCFOqlvkaGe+W03iBaTdaVjFI/9Mv3ghxxi3l4tOnEzzyAM1qpdYLr9SNmHv+Rs
	DlLf3QIOdzx18JBR+WZRPS+YIJbyOTLmhSyCWwm1QE1/faDA6KQSIw3zwzIQXIYE87YvMWRD5XX
	S7Ghoj0XseREAnht4wBCf14D3ddf6/3odh2aCdaRHXBJCC2y0h9ga6SqbTNxMmG81g+Ox/WF/zn
	ahIApd0VQo8u2RUNPR3ot3GfC2OJXf2Q7rqi4rdGTWTi+BWWzvQPNexpPstF3okKyYjqXYBKNIx
	Mz9cg21qCwq8JKJ0u0HNO++VbIrw5AUekEkUEi5y3TtAlpYOVmd/UH5g==
X-Received: by 2002:a05:620a:2628:b0:93f:565f:e46 with SMTP id af79cd13be357-947afff4ee6mr743160185a.52.1794464281908;
        Wed, 11 Nov 2026 22:18:01 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.18.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:18:01 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Subject: [PATCH v2 4/5] ASoC: mediatek: mt8195: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:48 -0500
Message-ID: <20261112011708-afe-v2-4-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_221805_673508_D00E4870 
X-CRM114-Status: GOOD (  17.65  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AFE IRQ handler uses afe->regmap, but its managed IRQ is requested
before the regmap is allocated. The audiosys reset earlier in probe
makes an interrupt before that point unlikely, but devres still
releases the regmap before the IRQ on probe failure and removal. The
remove callback also suspends the AFE, which disables its clocks, while
the IRQ is still requested.

Request the IRQ after initializing the regmap and before registering
the component, so that a failed request takes the existing runtime PM
unwind and the regmap's managed lifetime encloses the IRQ. Release the
IRQ at the start of removal, before the AFE is suspended, using the IRQ
number saved at probe.

Found by a static analysis tool under development.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8195/mt8195-afe-common.h |  1 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-common.h b/sound/soc/mediatek/mt8195/mt8195-afe-common.h
index f93f439e2bd9..905f29673d3e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-common.h
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-common.h
@@ -123,6 +123,7 @@ struct mtkaif_param {
 struct clk;
 
 struct mt8195_afe_private {
+	int irq_id;
 	struct clk **clk;
 	struct clk_lookup **lookup;
 	struct regmap *topckgen;
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 13e5bc02fac5..0cf39f66992e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3133,11 +3133,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret)
-		return ret;
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3192,6 +3188,11 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
+			       IRQF_TRIGGER_NONE, "asys-isr", afe);
+	if (ret)
+		goto err_pm_put;
+
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
@@ -3223,6 +3224,11 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 static void mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
 {
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+
+	devm_free_irq(&pdev->dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8195_afe_runtime_suspend(&pdev->dev);
 }
-- 
2.43.0


