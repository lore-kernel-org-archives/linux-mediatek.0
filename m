Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E43BCA5FA7
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lfbotW9h5DjJNCJiSoWtaX/OscTKUaTGY49TPTCiQk=; b=kYZEG6spwcf+/qT6g/hLpWnLHd
	MBpnE8ch6xvLF+4Yhqdl8YqCw2Z0KYdt1g6kI8tMUt83FOyhB05MbXpfkxnTaXkz2qedmBdMkjORJ
	kPfnkJUSX5MQY7uYJ/sQfAiRhqKt1D3poDJ9oDdX1TkozxgBkJH/8LRz2S+2VzXDfBbziebi9MAOK
	kwrSPCjHyhdMcuQp4IcIuWytmQZgIRCo7aGQSJ4juHuAGH/xnglaU7HkFFMbxHJSBAa7WrUztrCKu
	Q0PNr1NADfFqhFwp/To9o1n4SdGeHx0+bk5RUDxNebIOdDyA0XddSDzNELgepiA3zM2eCRGYvSXtS
	8Q4h9RhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR5F-00000002QDB-2AOI;
	Tue, 29 Sep 2026 06:12:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR5B-00000002Q9M-07hO
	for linux-mediatek@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7lfbotW9h5DjJNCJiSoWtaX/OscTKUaTGY49TPTCiQk=; b=MTur5Qn6l5PKtPxyVoIhxnZUZ+
	Z2fGDTe3/E/j1vStHCnmKeqDYmADn2YOMqzGdYOrdSBiaJZcnIcQDYM4q8pWr8mb8MJIMB/Lf4Vlo
	miAn2eDh+4eoWd/sBaBPkZu0L3U2UA7/NB3ztmHiJ8uFev4W0xhspzUv3QzzY1Q9FIRL51N8TOF3a
	RR8JyZ4e3yBjSTKghkwJhbVOOUK1/1qMEGq6OP9XCx9ldB6ypNHqySKO+JpWzYae04jZ8sWr8sxvK
	PuI0GjgP0JEl7W3bMJ9sjnybMckfl+rBYoTLhvcLvbFxjsJQM8f4FtYaQhcczJgPNVCVtvrXiPeKj
	qHYXsa2w==;
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBR4w-00000002EZr-1hpq
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:45 +0000
Received: by mail-pj2-x0c.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso1121614a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662354; x=1791267154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lfbotW9h5DjJNCJiSoWtaX/OscTKUaTGY49TPTCiQk=;
        b=Up3jpCt0EpzWjGc4X1jBZJf9rVmuK/r0tecryYPwW5NKFqjJnC4ShuTx/UYVqHMOjF
         dP5EHuUSpBvVQlgxyT72N9GybMCYfxV6A2BKMBmTTFpBvU0YizQwHdpEufpov2mx5ras
         7mcNZnF8NXEAe5mizgNI8OespDkXAmGGiu6FjrdMOndskTOT27Hm8g38OEGUrvdQwnVX
         JRf2f0eZmkBA86hin9Xjn0VuRLyrWXLLcflCsCdm/zzu0tybBdJaoYTksTsqQPQ7Bl0R
         16RobhRbvcPBrxx1x3Lj+8a9HN5yEj8Db/Z4+95Iv8Sm2tyxnqOZQnu0uLW15TdbMGrl
         v4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662354; x=1791267154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7lfbotW9h5DjJNCJiSoWtaX/OscTKUaTGY49TPTCiQk=;
        b=noZbL+crp/v93639oT/LneXRs6TUGo3FzwLL4cScQtUHaA91Y8sytqccP86vQ2g+2c
         2QjxuXdWQ6uQtzir2JE08EL3cn+Ex/VUKyzfqtZTbT3Ta0heiPWbG1faakeIOG/isXSo
         KFW04+D1FKfI7iX9mmCU/UGIIEELmcDIHgvX5FaosuYQf8z8Zo/6hd2wPpP1o1/ubRJS
         ybOya2jdDrG0aFoarkFAUXla/2CRRePdcWj7ilzKPUsw9Zf2W/qmzkpV96+OtfI7kx1/
         wKtXnnPn+L8HQ+d9penuR4EzqJ5CtQIrkttJ9mwdSR+/xWuL3o+3jouFyc1RWYIdEsy0
         EAqw==
X-Forwarded-Encrypted: i=1; AKwUvBx/2TTwKmXiTh/InpEl2SzSltxw3/+jM6MJPMNY1It1ujvUZ9DfIFSIsFTVDniEjw5epN+0rcoyCkYxBVLT2Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYLlIXBhkIkVwLRgGLE5lTjB6fP11KKYpede3D2ZjyjiRPNSJ1aM
	anUIl+2qU3BxDWkK8Lf8BhZ1IQ8itQ+HHQ4qTxu1zZjtjjjAAMzUw7iE
X-Gm-Gg: AYBFou3TnUqQm8GIi0hI/77/4Y1PJwmYYPV09X6HBOCzeKd7Rir3ILIU8z5A8QkDsPj
	zmH6FNF9EAMuPHqOW0ICXpadfLVGEHuBJtUSp9FjzFvzv3um8HOmUMfTMXdEKkRmvkQm/z2JfAi
	2HveSwPD9zNw7VhuRpmdZSGDxDBujpCCFjFksN2b8wqnkm8UgdzaGzg983WT25A7wN1nQ8lJQhj
	JTF9382dGo1cFaEPTPptr9MStWyEntyeM/QYXxUgqqHbnS7mPqV9vYRlN/00tSgl/ZWU2VoVwmq
	4XMcGzLDJcaNI+82MdhFHR88pd0V25s/W5NIF+Xl2YHDDhOzhaEoZ+nJtCJeuq/+75vPblYVdEy
	yBrEu68c4gBg/cGSGT24jpFj7ikMIXoHRH9e5015+tAQyfIPt/S4pdW7fG17v/4FKcUngaj+XA4
	kJwA4cZWiOX8iNlHSqf5ck92WWJl/GuojXfJqf1GFKMuaLwqiqR3/AqBkxF5IE3I/mFRbdp1yZf
	pzZN/ZxuGsmAi22Ih8CbRPDSehfMxd5dxxfNI0Yec+D2dppcM2J4kLIgdApDpYCe896cWSuDqax
	q0JEfWIws0CdZQ==
X-Received: by 2002:a17:90b:4fc2:b0:3a0:c276:1ec2 with SMTP id 98e67ed59e1d1-3a0c27621c1mr5466581a91.19.1790662354571;
        Mon, 28 Sep 2026 23:12:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/10] ASoC: mediatek: mt8196: remove redundant error message
Date: Tue, 29 Sep 2026 13:11:19 +0700
Message-ID: <20260929061121.124001-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_071243_774731_EDE62D41 
X-CRM114-Status: GOOD (  14.28  )
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
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index 9888812cd993..fbeba01b086c 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2360,7 +2360,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* init audio related clock */
 	ret = mt8196_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error.\n");
+		return ret;
 
 	/* init memif */
 	/* IPM2.0 no need banding */
@@ -2394,13 +2394,13 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id, "no irq found");
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2469,10 +2469,8 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8196_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "afe component err\n");
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 
-- 
2.43.0


