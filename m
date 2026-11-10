Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DE1606A33E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 04:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1NM2m6ye;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qiiZhrvt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3KmBFIU1iR/HTXXXArEC7zokn13fH3rMiHXgEuMLclw=; b=1NM2m6yeaAx2y29KlqSp4zBUHL
	PWzFTNAtZ37xTy5KJAIGi5GO1dvY4fM8fwL4J8BeUVEpJhgHc6F8xi9wKsImb3fQhB2yJ/WWS4Hm5
	Gch5EMW6RKNpjbiy8WyW4TPmWq5tfw4CrekqFaTmkbl//U6xkvGLOsZiqRqCoT1LshemAoJtpa9+o
	MsIyWS2JIJXVbc1Pz0WHCQf445zE13ArfxhV84oUXkVLWoVJr/mmv0bsUpzdkAgojeYuKkarlhmKc
	673SzNH52eBS4PjjoOFU0b/0Zdj1aTz1QkEPN0H3y6UScbU4Hm/RbzoLh/qb5Q+OxoWEfuoLfMPO3
	omf4k1/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdOM-00000002NY0-1d5F;
	Tue, 10 Nov 2026 04:23:30 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdOI-00000002NXB-0o1l
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 04:23:27 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-93ece7a73b9so175639085a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 20:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284605; x=1794889405; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KmBFIU1iR/HTXXXArEC7zokn13fH3rMiHXgEuMLclw=;
        b=qiiZhrvt5Zt7AAcsSbHuvUzdX4PWWXwxTc1nvURHWqW6PixP3CxCq+eAT1Yz1I7Ymc
         CmSHzCz++NeJQv7rUW+xsfQFPfZO4d/lMf1CYmEoEq33PNT5pGFZ55CrJb72FiLONbTf
         zGeuy+IenBVy1C3NlBgLU6+g6q3xRdEdNFnJsVvDc5q6GHZmfLhFw6MkCQ8a4JR4Sgii
         ZrJme00rIYMR9tWZ/8F66YjvHgNe2fiKNoCUEnqL3vgnXkajoA5mmDLeAH3WSeFzZYTT
         W2iLhgLW5sjd8C0iI0WaZQgeHmGawjejs0+1oke3XwfGNohPDQr++WvDjq/tVrRr5JsV
         66TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284605; x=1794889405;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3KmBFIU1iR/HTXXXArEC7zokn13fH3rMiHXgEuMLclw=;
        b=JBei9dxpL2RqfiNYAsxjhZ6f37lu8ZdJDRE6V1nWH0HQgPGL43fniOuaFwWIMhGOgV
         9Y1scVh6P5d0Yaswo5oB+ijiyJrMIq++q3OhNvTMwwiz7NM57gea2Bl8GOlYFhFcNaBY
         xLpQREEzhjJ3zbOSVyW7rHzYYptZf+c3UVqDkrQGc/g1DQXILQw6gcErJiu56EbWFHdf
         +ASCUQVoH8R00lK490sapAkVbSJovV3KcClnHGbjvBNMDcJXzFk8He8s06mJzYzwQOvG
         +HxdC1oFBY4nQF1381RDgIEpcEABaOhpMT3L1XVNLOcvbTPLf6yG0peTOJCsxreMXzCc
         /RXw==
X-Forwarded-Encrypted: i=1; AL+hErHq9Xh3TTp8gI2bnFFSEEyp0Dr1B2x0LOph3G+CyXXiDyxMA4AYWVIDkNnNlew7OFYYRtmGdq5/+YkrmfHxpA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/QUc4YlK5MU8CnWt6A6z44a7MP9K+WNaqnlR1GDWj1UtNpAp2X
	JZ+igImGB0RD1dG8hdzOX0T6pnxzQXJF+rWC3rbViIKYZsZLFRvmY8/UzgOL
X-Gm-Gg: AYBFou22hGGE+fVbBmK8srOLEipgbc3qZ53/1nG41AN6IcUsH+EizZTD4HoSmah/gUT
	iNk9P3/bSxU8dFdvpK+45flU75WJS2snoq3gVA9PHTBWy7LQ6jpeWTyRv+k/BIAko7GMpWZqieo
	mh8yH1ypo2lo/dLLxXEjux5Q+5CReiitkk6T/IeEMp4e1XdOGcX0ifiODc5zWMWZDksfQZM2z02
	+2gSCmVupRXoLiTzwgD1KZ8ftVf081sIq1hd8AzyZ5Ywyy8MoPkC2lxwqET05SO1J4ArBAKjddC
	lb8AdQUXul1LRhEw8YfkquoUztK495K99m/axdXgXEyjBt81a65uymmxBKBBcbMmMOLRZd9GbOf
	suDlzC7XHygTVrznIODpxXUk51rDHiS8LLgzBjMjR+NLqQYmgBvTWNDSggREAzahMw+k26niqTV
	S1NwQfr5vD+Fib744U5m811cNnaiLcSH+xAOl7/Ji8WKYkyBO7scUJVFmjYZIQ0gwfc0vRHiQUT
	vkNJyIlx6SCvlkjbf7Rupp1QBDh2vQX0BnfchB/guF+DvC36LGlY6Ucqw2xlSkYlti410D75kRP
	gjr5w9D4pQ7p/n+nin9E6m6q6IkC5fG+s1CId1KNnGGK7ZkWQyD1tgtAt/clTrIPUAl6rf/eP16
	qZReQGnFjuBXH2O6utWRzmS4ct05qgsbglnQRZgPiA5Us+911W5rUxehpzt8Qlqgs
X-Received: by 2002:a05:620a:28d6:b0:93f:35fc:5253 with SMTP id af79cd13be357-9479f34274fmr240626485a.31.1794284604776;
        Mon, 09 Nov 2026 20:23:24 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e61b8f8sm136682085a.1.2026.11.09.20.23.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:23:24 -0800 (PST)
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
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] ASoC: mediatek: mt2701: initialize IRQ dependencies before requesting it
Date: Mon,  9 Nov 2026 23:23:21 -0500
Message-ID: <179428456134.51374.1588994696516825613.mt2701-v2@gmail.com>
X-Mailer: git-send-email 2.47.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_202326_244548_992B81DB 
X-CRM114-Status: GOOD (  15.29  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ASYS IRQ is registered before the regmap, memif arrays and clocks
are initialized. It also remains registered while remove and probe
unwind disable those clocks, allowing the handler to run without its
dependencies.

Request the IRQ after initializing handler state and successfully
resuming the device. Release it before PM and clock teardown on component
registration failure and remove. Check runtime resume errors and avoid
running clock cleanup twice if the manual resume path has already
unwound a failed clock enable.

This issue was found by our static analysis tool under development.

Fixes: 43a6a7e71063 ("ASoC: mediatek: add mt2701 platform driver implementation.")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

Changes in v2:
- Rebase onto current code.
- Replace devres actions with explicit IRQ release.
- Check resume errors and preserve CONFIG_PM-disabled unwind.

 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c |   27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 3c5a76591..4054083e3 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1620,11 +1620,6 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (irq_id < 0)
 		return irq_id;
 
-	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret)
-		return ret;
-
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(afe->regmap)) {
 		dev_err(dev, "could not get regmap from parent\n");
@@ -1684,15 +1679,22 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (!pm_runtime_enabled(dev)) {
 		ret = mt2701_afe_runtime_resume(dev);
 		if (ret)
-			goto err_pm_disable;
+			return ret;
 	}
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		goto err_pm_disable;
+
+	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
+			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
+	if (ret)
+		goto err_platform;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
-		goto err_platform;
+		goto err_free_irq;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -1701,21 +1703,28 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 					 ARRAY_SIZE(mt2701_afe_pcm_dais));
 	if (ret) {
 		dev_warn(dev, "err_dai_component\n");
-		goto err_platform;
+		goto err_free_irq;
 	}
 
 	return 0;
 
+err_free_irq:
+	devm_free_irq(dev, irq_id, afe);
 err_platform:
 	pm_runtime_put_sync(dev);
 err_pm_disable:
 	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt2701_afe_runtime_suspend(dev);
 
 	return ret;
 }
 
 static void mt2701_afe_pcm_dev_remove(struct platform_device *pdev)
 {
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+
+	devm_free_irq(&pdev->dev, platform_get_irq_byname(pdev, "asys"), afe);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))

