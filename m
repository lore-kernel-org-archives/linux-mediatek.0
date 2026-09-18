Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01CAC982DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skaVQas2esAm6HNfYY4sXBxMDL3EKxsTuH/rubWzjqw=; b=aST5IAF98QXij28OENyX+a0BIa
	OL98dTfDZUAHaUDVYpz4/IqHpcbU+EzruloULAH9q4RHvrsrBDRRBcqdJ7Vz3HuGWs/pCHxsnV4LH
	Uo+29jPrt5tGK/b/K3QrL2lYyKq43v9kuLa6nWg118keSaCh0w/59N+1jJEtWly42w2klCE8Hl/io
	59d3e2CvKksGcjQfdD9ZaCbPIU6F3fU8xpsJdWT1c+aKfl1Q7qE+LVe+iljQ6XHlwOfVmJDWlNlze
	6H372wOQSJnU6Cd9sEyLPxW7rdV6LhIOviTDCCweWukSRS40lQU44KzTjY7CwfMIpIzKqrKng5thc
	Qwr8mcrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ypj-0000000EbNU-2Vd1;
	Fri, 18 Sep 2026 13:40:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpV-0000000Eb6N-0R9r
	for linux-mediatek@bombadil.infradead.org;
	Fri, 18 Sep 2026 13:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=skaVQas2esAm6HNfYY4sXBxMDL3EKxsTuH/rubWzjqw=; b=TvHgz3XEzFM0IabcxywpbUiCrv
	Pl1jO9Fd0YMPbstFuxPAGpVqLjvclrafCRs6SXqmVm7/x5vVbUJlAm3ZrRbhEyv/kZBxD+lVnGqxO
	76bw4skvnkeXSe2CRy2y0rXv9mp9vRdRWY/jVuA9b+AcLRbKZPX50IUVVKX+tJ5W7o6t6ZXFt5kOJ
	GEiX6gWwQjwoEWoq92ZCRDOOuA928G87sqZforqmmIho5Bjrl8m2xYPhEfIYCmpbPuqYsZfAt13nw
	yugBcHShlJ51yD3uVivu57vOG+K0fmgRS+HypcuztJ+tD7om86/xtEf9gvZvjroWlWfGhGwwdk937
	ijSqY/jA==;
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7YpS-0000000A9P0-0qWA
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:39 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso800778a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738835; x=1790343635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skaVQas2esAm6HNfYY4sXBxMDL3EKxsTuH/rubWzjqw=;
        b=BCVudIkpdkI7VFdv+emRCGjxihvt9rJ4MWaqJgmNgaLOoTeUYnCoIXi9GRHFgHKrgG
         dzTqca5ri7LbKHdbDCjYcijAOcPgtoH8W15QScTJcYLUAezDm771rkI2c+KOCa+oJLgt
         f6LEGmnxT8/FYoEeQ5ogqszQnQU4kO5lSB0EIGM4td2cvNcrxtHhJwnoAZhPESQK/C7i
         /SRsmX1vbqOi8wSNvjDee1j0J6SHXhrhdCOngkh0HP9YdpeOG3zYCRCpwB8raW8AjqkZ
         jwWVgsGjOmCnOyqbimhicAOWbj4y28hWb0/8WpCErFg+Z9Bc9hr3A7g9APL9qjqyNSgE
         josA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738835; x=1790343635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=skaVQas2esAm6HNfYY4sXBxMDL3EKxsTuH/rubWzjqw=;
        b=22eqvE8QfNAJdqBVe/awzQFSS+Xwy/2iXkadfBAhpn46RS1DA/WCmne3M91zIlJPae
         uL6nt8PSkKYxkasr2Cu7KVqIpbHBzjSi9zIk/tV20oDPtysr3LSv/oNXHMP/pwXuASIs
         T4jNfWXkCSkBlRwKxvkfzEzuXrbT6UcIVqTFH847FhhrDsuwraqgvySa7qyojukMbH7D
         HmjxI81+stCuSz7RwPybtUnc7+sRHlN2Os9A9o8L1YOY0Ye1pwohbUtvHrO3SvvIxszD
         QzhFeoO+dlXlFGueiLG6Tq/WzI2n9RZV1BS5O0rXNoSQSjNv5mwPC0658L1lhAeSCW87
         Lggg==
X-Forwarded-Encrypted: i=1; AKwUvBzo6moe3gqCnubhiyJVEMLYzwPXrTes+a1ifB72QVMsstTcfUT0V7DvvZVkc2cRy+Lam+jW1G2ghzl1qSYldQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lM2SdLLEP/KLFsdFfyaEX1RdujQRaiyuoqUY9bIJg+RlbuEHRW
	6ChSf5PNoMm9vqjSnypH8JuxoDFeKw8pav+9r+tokryBHIAM4yS9UhaO
X-Gm-Gg: AYBFou3bsCzfElkYsIP9ubktb8deoTg3NlkNbwg6ZOpbKtxgBIf3efncUMHPbhIY7Vb
	2a3fDBYgDUzaV0wGIOuexrlV98s3Op4nhJHuFbj3x/tY5afEzoewPuqDoX9M4e/oB2xdmkxYISW
	62yzjOQMy25YVL2LmUDpXWmrSsahqHNabHGUhrQ+QxPkUpfv1nvGEHBPkZ5iCkKBUyi3+Yt/6dv
	+g0EXWxU2KM0j6tXPnmhi2TjJ6VAyDJk79i270CpUs7VaDILllXlocOpC7FRdbMz1Rgv3pmvvxA
	+EELoxmJFA6BYXpy6IttXFRk98pm3WWqlAg4BJt66ti3ql7JmSJ/Hv4912EnfaHkSUo7WnfpxTw
	IpCoOE77m9pPizGJ4oBRHgwwuglu0WXeEYCckft2xSbUgYnelykeqIb0zJDaHWpN0clJNEFi0Mz
	hO4sFUqQuvn42bPdvmWo06ifeCcU05CUXcpXDvR1o0EkNvfhV0lkvUtia6gXpxRrhVaix+k5hrw
	un5yfTOhvhqzP4Ad62YFJQTEACRh19EuB7BV9RFHPCM7I/GY6ojHA4RQDtTvogU1WTgMpQAeafs
	DzStg2KCgVISxWo0E5aEAXKxig==
X-Received: by 2002:a17:90b:17c5:b0:39e:1633:d29e with SMTP id 98e67ed59e1d1-39e54cc6ef6mr6089597a91.5.1789738835185;
        Fri, 18 Sep 2026 06:40:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 11/15] ASoC: mediatek: mt8192: Remove redundant error message
Date: Fri, 18 Sep 2026 20:39:07 +0700
Message-ID: <20260918133912.133799-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_144038_382706_FDAC601E 
X-CRM114-Status: GOOD (  11.73  )
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 5aaff5bebfb6..45addf9f3790 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2192,10 +2192,8 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* init audio related clock */
 	ret = mt8192_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
@@ -2271,7 +2269,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_id, mt8192_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


