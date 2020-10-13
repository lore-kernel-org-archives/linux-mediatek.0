Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C88C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 09:27:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 565F020725
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 09:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iG/oBnzB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XHfjcF0Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 565F020725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kOCLOMAPISH1FPFPNDTrgJP0jWC+un6GXBj9urJHW9M=; b=iG/oBnzBq4NvZhHeyb7VOHVO7
	b+XXrccJCnd2A1OMFugpGHn7OXhyq5axykwPMD+6LqTJLnEYWUcZHHT4DRwZ6QlVpiQ0dblNWpDb2
	RSdROxphgLzVVJSLhERiiFt/EYgOe3mYGSuc25ZE1cL3Gb7l/rHJLquqDKysDk/vM2kjH1wn5K3iX
	iu8ULlv0K83RZURL1EOGcRbqnOq+6uCFUuvfHa8n8mPx4GJI6eEHrc6IN6O0eBOvZ1TA9HMdozhUh
	akMtI+j1+vmCUyWl9pb589FggrAv6EtrXNL0IVB99lgObag49jNaXqiYe5xepDDmGo6Y1Y3YovOGS
	2N6qp9Ovw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSGac-0004VI-0v; Tue, 13 Oct 2020 09:27:26 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSGaT-0004ST-Uo
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 09:27:18 +0000
Received: by mail-wr1-x443.google.com with SMTP id n15so23152479wrq.2
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z8a9970NyoL8j/WouYPI3QrVUX98ELJ53wzM6Z8s7NI=;
 b=XHfjcF0ZziDDiY5hGxeJXZG6wHx+Mq3O7G0F92FKfFobe2YcU9Phyc5G0rUD1jDbGk
 w0yxK2uXGTFkfgajQvrtp7y46i/m/OD/KTnxf63f6ZEuCTWkzZbfk970AUST0c0le71N
 KpegIlZ3ee5uccsOOK2TBrIfT2n8JmAOS5wYyLwN/Von53kMhx8OaVjSPIpBD3ElrlWQ
 tMIjAzJTVBxjOZ+7+xJBG1XLMThQKZBdskghBck7fhMnD2XuIDQsDFlOqBOda7agxQ0q
 tYmpBahs9mj53RdVlX4Jx1+t1/6NQN1N/3sBLPr6uxvcGrJS2AarVnv8FlF2vm8ZyaxV
 um/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z8a9970NyoL8j/WouYPI3QrVUX98ELJ53wzM6Z8s7NI=;
 b=R6RIDniY8sUJyUshQjuiFMaGjZCn6sVXk3LSA9zH/yo7Fc2toB/0Hi2a02+iQMmDal
 JS1lTaH7m44b4gaFp7eTIuk9Sm3IVHMyk/DUUCWr4KIiGM5sa7kH9pXoS6bBa6A+O6Kc
 cexeyJvjqAfcfXCQnnC2nM/Hrhckerzh2N0luOLLYlF6llkvmAau5d+wNa+qwF3tQrEe
 wsWmzNHO0A07f9AA35osnxUfLt4JB1MbQitHTNMFzajSRTv5Ss3jZqjjZG5UopiVxQEl
 dsAZ/l3AEkfUrd7dmFgTowLyp/FVxjJKZCFYDXiaPbOIWFj7zAwDz4wFnLacKfxM2TF7
 +VHA==
X-Gm-Message-State: AOAM5308pXERdxSGu6qEOL82BKTtNDcbZ2HHgHXzTkHr1ApOlhU59Ocg
 mnIztrJlF7Wm7EGiyrbd26Q2VeKHQADdV750
X-Google-Smtp-Source: ABdhPJysxJ0YjqYhgvuz7yO6DNijyqhaPhUZZeVNIIdsnRzkGQZ9wKFCrAovRtTSeI2LSqBeku+mIw==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr19794943wrq.129.1602581235480; 
 Tue, 13 Oct 2020 02:27:15 -0700 (PDT)
Received: from localhost.localdomain (147.169.185.81.rev.sfr.net.
 [81.185.169.147])
 by smtp.gmail.com with ESMTPSA id f6sm14484830wru.50.2020.10.13.02.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 02:27:14 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH 2/2] cpufreq: blacklist mt8516 in cpufreq-dt-platdev
Date: Tue, 13 Oct 2020 11:27:09 +0200
Message-Id: <20201013092709.3336709-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013092709.3336709-1-fparent@baylibre.com>
References: <20201013092709.3336709-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_052718_070618_3E5EC7D7 
X-CRM114-Status: GOOD (  11.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: matthias.bgg@gmail.com, viresh.kumar@linaro.org, rjw@rjwysocki.net,
 Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MT8516 to cpufreq-dt-platdev blacklist since the actual scaling is
handled by the 'mediatek-cpufreq' driver.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index b8d48ed37156..73cb8f2ad9d4 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -124,6 +124,7 @@ static const struct of_device_id blacklist[] __initconst = {
 	{ .compatible = "mediatek,mt8173", },
 	{ .compatible = "mediatek,mt8176", },
 	{ .compatible = "mediatek,mt8183", },
+	{ .compatible = "mediatek,mt8516", },
 
 	{ .compatible = "nvidia,tegra20", },
 	{ .compatible = "nvidia,tegra30", },
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
