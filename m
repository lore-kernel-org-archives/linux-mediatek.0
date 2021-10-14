Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C202BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 13:57:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C80E601FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 13:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C80E601FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWuFKR+2eQymSUFXXjWEkqG+HfFOmC1STJvdrCk/7Vo=; b=Qj5fp9FV6BHYEe
	/lfzNVzDVMQwPiWaeuAxtsWS09qbIK+orOs1du14jq0YZns33IY0rXkCOBUjUNDQ88zakcHma5wxn
	usQp/7D45lUKai6UKV5dLolRhyPSRIKH2MGR12ToIYXw0QR6a88ctpBPKTZRx8phLCwDSq1C6azBN
	FeHJumIP2B6Id/KwDmKRygG0o1waQlUnxURCRymE0uM2jX7D+VoE7Z8OB4rseYkR87rs9A5rVBOqD
	uAv3yCGXFPdVI1r1keC4TZFaax4LczVkualElSBJiSKsSSYJS0SEp7UOaUTRg1HwmbcGU7v3uy7RO
	50JL1bFY3Ze4iKqf7naQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb1Ep-003L0H-DA; Thu, 14 Oct 2021 13:57:39 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb1EQ-003KtT-Ej
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 13:57:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id u18so19889731wrg.5
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=31i1xoK4zj6WYEXJeZOG+hCuryOlTysPNDj29OD14Qs=;
 b=AbHERgV7hhK7Q6TsIVXDya02ZczmFNkqDkzMRSz+b+mHRNIq6O6J/3YIaczr+Yo5w4
 L9JZQ8vTipg5kViM+Gi+d62zIR9O0Nze896kdfMcAS5x2Z3MCeiUka1h8f8/EO4VfAoP
 Y1SIkDm6VKBF91hvtGbAzn7tK6qAo4btprN1Zf7wqxYeAv25KVG9GgCM9bH3QPOk6z84
 dtoqxU3Kj+yA8e/bObrV3McYIyICqYUULyvr7+Y0N7uKnahrTECmyrXw+uwe/YpjNldC
 Ur/IA7QCkYjR/X8Ta/9ylJhKw02phSqKkPvmkg+24El7J8HWAHSoFMiUHcNlDV2ncKhd
 2j3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=31i1xoK4zj6WYEXJeZOG+hCuryOlTysPNDj29OD14Qs=;
 b=DSMexBtBriYKZ7JmP9TfNSDP98nr7et2PteKOGOdFCvbSJbZjNE4/QcLvAkJ4WnFTr
 KISLsYs8jQriFywcrQBnmy6bGoUa4lOyMb9PN2DG9pfKRREUhLO173xruHWnHfB4mOVt
 K1olgkYaBOHJmnsVbbQ9WKCRI3mYQdA5KbqA4txpEG7mDE5ph6RG1VCZREDUQfoO0p9a
 4E2/GkhK4nvqyoAIBgrznr6GBQbumPSVyWh3cOM3sLCYBcIvKP62rrzIu8yVHJimUibb
 KvJz7AD0lftf1jf5clajZm42sA+miKCmVFLrdCs2DKsAHo+8jpKppqDj2qqi/hCHkh/5
 qhBA==
X-Gm-Message-State: AOAM532i/jedVAyjLf1iQfADgTkV6N/WPWGcqHxi9Dg4Q2QRzIzAcwBS
 2LpJV0AkzUKrax7iaT+BNZbc+w==
X-Google-Smtp-Source: ABdhPJzovFHxnVhnPJn8Z93ko4jfsXuTJHegbHkAVGuJQykKzBnhuZgk+oxF6vDUOvuqwSsAAyi9Bw==
X-Received: by 2002:a05:600c:21cc:: with SMTP id
 x12mr11267492wmj.8.1634219833159; 
 Thu, 14 Oct 2021 06:57:13 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id d1sm2596480wrr.72.2021.10.14.06.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 06:57:12 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fparent@baylibre.com, khilman@baylibre.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 2/3] thermal: mediatek: Fix apmixed error message
Date: Thu, 14 Oct 2021 15:56:35 +0200
Message-Id: <20211014135636.3644166-3-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211014135636.3644166-1-msp@baylibre.com>
References: <20211014135636.3644166-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_065714_513783_FCE26573 
X-CRM114-Status: GOOD (  11.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Seems to be a copy and paste mistake, this is the apmixed address, not
auxadc.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Fixes: a92db1c8089e (thermal: Add Mediatek thermal controller support)
---
 drivers/thermal/mtk_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index ede94eadddda..93ee043d70da 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -1050,7 +1050,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	of_node_put(apmixedsys);
 
 	if (apmixed_phys_base == OF_BAD_ADDR) {
-		dev_err(&pdev->dev, "Can't get auxadc phys address\n");
+		dev_err(&pdev->dev, "Can't get apmixed phys address\n");
 		return -EINVAL;
 	}
 
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
