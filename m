Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC89C55179
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 16:42:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DA4A2080C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 16:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I+WS+wZQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rOtvEQOD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DA4A2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VWOZTrmQcNVSHFSSudgBxvlnDBK82B0n+e27wd1vaWo=; b=I+WS+wZQNbla8DqEyzrO3b3Vu
	BeMYJJv47T/hawscCWj1dFI3FC6gMr8MXH9h7xtqpHtbKiRmUp+3608FgzxK5mr+9IowTx+VhTeQe
	q471UWCu+p21IGL+lfd/v/RqpHN2Zah+wpzydX5qJUCZ/7J62K7+qgUe1zVU5ZVtyLc51MMWeP6/Q
	ycpu0mK69H+XEijNcY0IS6JyYk6G8CWfY5FnxNw63IGoP5lO2Y9Q6bmyxfeqSj+afJMlAMYF15JCR
	2VCcjTSJGAzuF4xOb9m68wJWcEZA+OntpJEjf2xbC9Tqm+LCDCoWwgLEK9uMljoIRTNAc/dGO05Jf
	j3Y+2cU/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVHCK-0006Vz-C6; Wed, 21 Oct 2020 16:42:48 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVHCB-0006Sz-NN
 for linux-mediatek@lists.infradead.org; Wed, 21 Oct 2020 16:42:41 +0000
Received: by mail-wr1-x444.google.com with SMTP id b8so3943182wrn.0
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2020 09:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JS933voy/5ulGI3fj+GAntyF9rpzNqa0lFnIF6+V7Ss=;
 b=rOtvEQODVH17lLAdMVAKe/rIbWnNmfZ9BUkou7mb0yCv9F9XG8FRyBqy7VWOePZr3t
 B6bbFjV03umYPLuX1VcNKtC2+CLF3fFCFl2q6l/awYyDs/BPpvcVSF9hOKgrR5iLrW7b
 lEm+Km9Gh6CM0VkcmjHZOWplxr2pFhg6TscQAupU+C1yKCKQCW+rbog6Kl4pnvdbyEOn
 SzNZDXQVvd2fg/Ldq9HJBqhckN6lqdOML4KTnrtIsEdnInApEh5uCDhpgf7zIM3SZdVC
 WBK4gtXt1M8PfiI28v7ZS6ch4/9+wOq0c5udn+GBaDfNq9KzPkdqpzHy/MbqAzoo1fBS
 JMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JS933voy/5ulGI3fj+GAntyF9rpzNqa0lFnIF6+V7Ss=;
 b=EKJ5wiKNL/fQ8+guyZR5ss9npDT2PBKY4UlxxA0J/tTXObhYu4AYCyASz6bJYM7+Hp
 30k4RPDjDYFfR2yk0rwUR11lmTc6b6HgrJGzGWcWIA6rJCV+HCWagekdmb3w8gnkM7ke
 elaOGnvgvJMv/loOyBs8tcSyV4DaMl6sHumxL61+/rQOJh1PkTyiWNDzfMHOdZ4oBvQW
 jx/CcCSkAmP7GhjcfUnLmdgEKflobbjT8uaQZ138USZu1XKIbvVbi0XilMUS+R7v/1Y2
 qhdDp4/+ZaunQ1xJ+hjQs01noPftrCaydrRWdNTs4l7sV2G+o9N62v8hzrbF11jPP4Cn
 zDAA==
X-Gm-Message-State: AOAM532ObJiHFmi3LwbOfEU8g3Msqlsw1VfoLQwpIdr8EULHTDni6tUB
 RnBxhLIWUKhrr1jGRl0wn1AR8o8jvyXXJA==
X-Google-Smtp-Source: ABdhPJyYyY/I9sCo3RstG+oqSDx3Z55fChra8Y/tiA2UQ+4pfA1kyDm2nohjoWskkdTymeEFd2UeCA==
X-Received: by 2002:adf:fac3:: with SMTP id a3mr5613554wrs.240.1603298558589; 
 Wed, 21 Oct 2020 09:42:38 -0700 (PDT)
Received: from localhost.localdomain (58.164.185.81.rev.sfr.net.
 [81.185.164.58])
 by smtp.gmail.com with ESMTPSA id a3sm5321724wrh.94.2020.10.21.09.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:42:37 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: [PATCH 3/3] thermal: mtk_thermal: make device_reset optional
Date: Wed, 21 Oct 2020 18:42:31 +0200
Message-Id: <20201021164231.3029956-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021164231.3029956-1-fparent@baylibre.com>
References: <20201021164231.3029956-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_124239_814764_921A7419 
X-CRM114-Status: GOOD (  12.98  )
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
Cc: amitk@kernel.org, daniel.lezcano@linaro.org,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com, rui.zhang@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8516 does not support thermal reset. Use device_reset_optional
instead of device_reset.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/thermal/mtk_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 0bd7aa564bc2..149c6d7fd5a0 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -1052,7 +1052,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ret = device_reset(&pdev->dev);
+	ret = device_reset_optional(&pdev->dev);
 	if (ret)
 		return ret;
 
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
