Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACF4C61DC6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=; b=nJMi6De+mFwkl3Xbnl8PHunSY2
	iq8+cJLlMX1wCc+etThUF9UmbD6vtE+COeT/jQREnLdztz0/MkYBmrgg+NRng66w/Y4VsKy8ta3QA
	a4UjWfhfLvFHzwGbhhFVWEjonbqy6Ro7YzAWYC76ybhkhAcwYSRIFTj4QBYnbto59YOKV3t0nomoM
	psgmAjy39/aBAyUQpLHDWu9oPnTYdJgnxkev9jTQVVYMSk8uUfSw0T84aK9CiV2ZC9IPtys+/Rbkr
	N5q6f5Kw47wYgMU8L1h0K4SZLt/sdAeNFzst1yUO/D/QsPxaRZ3J/2w3dKoGx+x0F2tnl05QVYpDs
	B7a7CJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshg-00000005Qw4-2uZ4;
	Fri, 28 Aug 2026 09:16:52 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshM-00000005Qhu-2Zio
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 09:16:41 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84e04df8c46so1133189b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 02:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908592; x=1788513392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=;
        b=SxlkRyj3LRDwQzvx03sUQ0UesmeOpPAJOlmQ0dfwoaw60k8VxZwU72jb6n8/2WF4+z
         hRgvlzxDsgyNgkFnhwrHXod0z0oMrl46Vkkh3IBo1MZQ3bs3zMNIZSMx9ppQ+FHQQq7H
         /wjO2IGntYVYERlHLXFbGo35l18qJ1v7MwoP9Zig2llHioPXKibxOcXXzQaCzb4+tht2
         aJ7OYaQKXUE9ebmyuLgEv5J6kkmA9kkxzqnrxSHz0d9IBQ5/I96p5rh4JdO4Yz8QZ0K1
         1lLu6vSZOzr9Uw2o+5ayqWa+OZzZ+Yj05K0+n0ynYn3gUDbTd+1yRjMkzSITkKfN/rmF
         9EIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908592; x=1788513392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=;
        b=EOy9MKHWgcQA4JrByU7m7gEpfE33FRkepDZAC/s4l/JB3Am73IW1LhFiQemFY45grp
         67ENKcZld7UhRwEzUMJcPI2BTMtAgTzkfidVjTwzjS11d+6XhR3lIB0N0k5+p4ZZ1DoJ
         shOfdLboiOP+FowIqfRhiFUPfsNMu8LirsD0bvvHW36bBPNyvmPcQKf4rv9qPws48Cq0
         kDA3Xnvj+OG4RlsSAE4w6onXptU/IJBFyeGvpAEhD4exSY1gdh8JSBgVVhBD1h36wTi9
         kMGyqc+Q6Hg7FObZCclcpPGWFTcdwN2WznXgwdLl2QBMuoHp5yHS+HYPr8SpMoC+WUob
         w4fQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdsBPhAxCjGCWi2dvWBpVl9yOPQaDlajVAjE7ko5DHEwNOwx+C+UO4wPd9memvNhnbpqP+KtVak0AZsRnO4A==@lists.infradead.org
X-Gm-Message-State: AFuF++nhZtrJ7i+LMAq9b+aq/5klLRP6GhKCyEjnKxKjJUKZPkQirpXh
	Cvs8uZgPkii7r0dTcdQ6jLWw+Pa1lnBoLZ12xAuwR0NKnLaIcZbsL4gpPNUHBg==
X-Gm-Gg: AR+sD10NJAxV1S6sTvOyZvOYp8hyznjytVAyrZB3xWeoFzAhBcm70kCEBkCR6rirhH6
	LEPhGtoqE23fbm5zWdDTtKr4iFL4bsfVq9dnhcdOCxabt4SZEz9RO/qdySwXfcKpB2keZ1rcm87
	lDQCVcRQdr8c56AaBmVSvhT4ZrtOvXo7WJ6V0QlX292boS+S1ImwojIvjNJP+DEV6pjCuiwYbul
	67wJ3OsdigpXZQ/zph6h8URpxgs1u0AcB4YUgv9iHha3iRT0KBMiLtEHZ+yAwSZP6wtQeeDQx25
	sWBp/bCqRsEEcNXKEtoKHAGljmJ2YLUWbnKo13GCM5gpogFA/RA2U6/2aiRv4xpKs4qpRRkQH9N
	rhh5PisL/hk4h7dYIKy6OcvbcMt/lxrb00PpxKA9bI3yIfCSt1Qz3LmhVE93vcW0UeemU+ffneh
	nb2QDuuX8YTvVGd+EP8W6OWkacyWI6Nn1me/AV9z0hVgupvvZEn6RhRWUyoMycUrrhE97H1z3C4
	gto0CspN0VC3tAnXiFsZf/EWmtXsIRmZkZRgEhl6NyEwdRCpcZWc5LI7j5Up7dHOk2VsB3/UnrO
	GfUZ4jzdpfAnZ9A=
X-Received: by 2002:a05:6a00:8019:b0:851:d12e:389b with SMTP id d2e1a72fcca58-8562a8d4291mr12413048b3a.14.1787908591962;
        Fri, 28 Aug 2026 02:16:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:31 -0700 (PDT)
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
Subject: [PATCH v3 8/8] ASoC: mediatek: mt8186: Drop redundant probe error messages
Date: Fri, 28 Aug 2026 16:15:32 +0700
Message-ID: <20260828091532.600047-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021632_651804_09EB8722 
X-CRM114-Status: GOOD (  12.70  )
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

platform_get_irq() returns a negative value on error and does not
return zero. Therefore, only check for a negative error code and
return it directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 143386c54dd7..4bf098657fb4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2852,10 +2852,8 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* init audio related clock */
 	ret = mt8186_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error, ret %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/* init memif */
 	afe->memif_32bit_supported = 0;
@@ -2885,15 +2883,14 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id <= 0)
-		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
-				     "no irq found");
+	if (irq_id < 0)
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	ret = enable_irq_wake(irq_id);
 	if (ret < 0)
@@ -2957,10 +2954,8 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8186_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "err_dai_component\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
-- 
2.43.0


