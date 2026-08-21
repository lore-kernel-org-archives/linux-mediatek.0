Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8167BC5DF7D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 12:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4REjDq3qQ541r3i4ayJG3CleHwU/s8ILvHOWp0kZT8=; b=3KP2VpJlJkuaHvH4m1eUYFmTur
	hO/wyihuw7bwcJNMvocBy6DNvRAXHzKSeJVsWetMoNrwmo5KGAwDPczyhal3CJhUl2ZNVUemSYo2Y
	QaqX8CC1TW1iGSpEjsxV8In/lWN5xxyhz8Bher0VANIKa3zmtSfXyzCnzoKmkcEaifM8FrpnlgNCf
	3P/Da6qgiXuID2niO6HObZRFR6B+XibZ4QOnXXEwZDEG3/zOkcNFFme6jc6f3kQ3a6pws809f5auL
	LouP0p0IGHiDSRYjrDxTxHbM58R38UTtOAoX2Fer0Nn6mVXac8HGc4N3XPw+8uic6s27+HiUdqr8p
	T+qfBj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxON5-0000000DJ8d-2qJU;
	Fri, 21 Aug 2026 12:29:19 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOMv-0000000DJ2x-1bsd
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 12:29:15 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso10210155ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 05:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315348; x=1787920148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4REjDq3qQ541r3i4ayJG3CleHwU/s8ILvHOWp0kZT8=;
        b=Qd7L8QRcZSR7nY7C8NXICHOxtK/dSKW/kARoTkj4A+EwzSc3XUNdOqkf0LpIIbVKJa
         S/gC2VF1ZYUBvhXdVCyjhD25C6mcxIBz3ymfLMJZJdKv0H0zrHMwz6qYDGUkHLUZ0Zos
         jmfSbKhbrVa1MwP4SsMgCspg4bMKZGnq8zNCu2bTs5psR+fjvRoHXe3Crh/hWGH3W7QJ
         P48fEh5kBZ9K8YbqAWErUspk4gE6oHuryFFZNPPuWMNI0hZpan8GjvScGCAP7i5o0WbP
         xHCPszYow9I0l+BzTNPzeJxeyyTDtFKgSkBTPenaaIbfyR4uQsAxLdcu6z++dcJQPMwB
         dmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315348; x=1787920148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4REjDq3qQ541r3i4ayJG3CleHwU/s8ILvHOWp0kZT8=;
        b=YEOgXDAX/D+SCObjtgaYmgmvKYHgf4bqpRJfSxf6hbmrZI/kSAroM1ceDHMxBiaRHI
         Zlq97/KOOFcIZEjFVKp4A+ESKGPJeOFWrlJyLaWHE4UDzieV38o2y9NfdUGaNtYasQML
         ZstnGyU+qV6z5unOtEkcCB4oTOdJpQWdNqYkozWxb/Kk5v4yLAW3JziGJku2VidVaDYS
         tM6Mq2CcMv/GuFyJtLsxSnDXmY14o68Y/hE2ceimUEtyOExB8mO0hvAR3OV0Rnw2sWN6
         nCa3VnjoZF5Z6k90xAR3tr5DwOsBXrnEWsBR4iMfkguQ3aPoyxU0Fd9YJZWl+XuCkfGL
         HLlw==
X-Forwarded-Encrypted: i=1; AHgh+RrOaPnyCaOb1zAcJp8XhlksgKk3O7xJ5vLppExblCcPP/yDXiVNMOs7hK1w7yFVLzJZltb9BWqUBPlN9HbogQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1OGMOHiWt9m3NHBN7zAIU08G2yWz9y/sbdqNEKfX7HI4XY5WS
	DELVDssbmvh5HMfrLIk1VMmsCu6kRBOH3SisHd0o1dAn8GNSdAeYSbVi
X-Gm-Gg: AR+sD13uRiPY7mkB8+7i5dc9YIsgBP4NLPFAT/CRSWaZBAvY7QHYwnkDllzt9R/qzOx
	YUTN/8Sb9SnSHYFj0Zfvoqt6HsAC2DM4IbA9jBw4vFGjcxuBUhhGKJ7DS57A9Bj1Hj5YlC4CM73
	mcs+9MPV6TRQc1dDU9feCMiEHxR419ZzZTunfMIlO1xyAAMlZYevoXb/UclWaYTxmiKWbH38Rvf
	DLozQD146ByL+ArHj6j5jnc/j4IP2cdW/W5WjBruSD8wWTpa2veAPk8f8RVVv5SUSGjGhTF7ErN
	CYeaT8p5AZM9dQNuqJUWj1W95vNp4S9A4STmSXMXmd6rRY1btEAYBvfPYWpxsS7YwigL2kHGT3I
	/CAJ8acfEjQgWo84Jhm65l0nkGh5K8U/jcCHI8ILWIkoG3B9t0a9/1dJJMrUbDvUbeoLtgXcg/A
	/eRseGZP2MHuegMNIJIWVyW+Gx4Rm1gfTrkEo2gLViMvegnr41oMV/gtBhv5K2QF9T1cIr7StoV
	ggH1bllwNO36nwjHb2tI3/732olMinWu4VFHroPJq6OLiXeNHSEpTK3jNMEbcfMiKCu9kp7WDem
	3lKg
X-Received: by 2002:a17:903:2b03:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d64a9b349bmr122049005ad.0.1787315348266;
        Fri, 21 Aug 2026 05:29:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d554450sm18134515ad.2.2026.08.21.05.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:07 -0700 (PDT)
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
Subject: [PATCH v3 3/3] ASoC: mediatek: mt6797: Drop redundant probe error messages
Date: Fri, 21 Aug 2026 19:28:40 +0700
Message-ID: <20260821122840.41266-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122840.41266-1-phucduc.bui@gmail.com>
References: <20260821122840.41266-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052909_435876_A79901C9 
X-CRM114-Status: GOOD (  12.16  )
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v2:
 - Update the subject prefix from ASoC: mt6797: to ASoC: mediatek: mt6797:.
Changes in v3:
 - Add Reviewed-by tags.

 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index f62a32f2f2b6..dfe67727fe47 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -754,10 +754,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt6797_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	/* regmap init */
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
@@ -800,10 +798,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt6797_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		return ret;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


