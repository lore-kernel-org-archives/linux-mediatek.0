Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86280C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 19:46:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2BF22074A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 19:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xcq7XGUv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xQrjEJD7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2BF22074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWxQO30P2sZ5e4lwM/haX2zaiVGS86NPwEowhdBIXxc=; b=xcq7XGUvDtjtN0qacHi/SYHvNt
	5IiOxfp45WGrGdRF2qMPVloR9ROwCxcIMoeRbu0rfUoszBSt2HCwStwvEy5UIKAk01J5KjWlpgHPC
	wjYsCWMsEVPQGOE1r0MEByvg2vAnVv1x/pYECiC+AfwS+iHk0h5iBEpL0w46sLNJ0BeXYehE6owpC
	Q1PhBp2niCxJKdwo3GaElqVfoc3biU1n7qY7kYJqF2gkm9mEl/PPTfZPX5Wi1AWdebAU3/hsLEsns
	q+oTPm8Mtlrxk1vhYu59YSmDotgTw/WNiykCzKXIyPOS+KosPuUthpl/ys1Ys3wkz0Qky7bVQB4Ae
	eu3jUKxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kS3m7-000582-Me; Mon, 12 Oct 2020 19:46:27 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kS3m3-00057F-T4
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 19:46:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id q5so18765229wmq.0
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Oct 2020 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lJUgYY1wIsYehEysHd2Kh8lV4o685yjBc0pclwWahLQ=;
 b=xQrjEJD7DwGgvhsePMttKT1lbjtB/P+TL5KwJS6udeu8lwG2/PiJwn0HQIIk4EVLPw
 3Aj2fF36QqZwby7SLpRW3F1hTOLziJPhbnv/qnWYYWWpy4e5RFkRdola0lwLjODrTxHi
 W/U3wFnc5gz/qqlA93pG1CIw0XxnJjjvhQfas5lMnWUh7HgNoZfok7DW+c+4IuQg5Q4N
 sRXW96q5CyL1vReb3Q9Db0lwCZigR2AeoOT6YDzCB6atz5quv7BCwvUqU0uCraF1hKhZ
 O6yHHgx/nol8/hUBpVhIeihEXKfu5LkfVHVZ9W98lAQ/vUiEtCu+AraE+VGhcAmkkzAB
 xY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lJUgYY1wIsYehEysHd2Kh8lV4o685yjBc0pclwWahLQ=;
 b=niaznjYs1rmRX367HBBsxuDwEpnJrCoWUcixVGLLVqu0F78QN75t2CFjvfzBbaKK7W
 I55812/iDJ44OpaMpHGnA5GP72AWZLxzPrruTfFOIdk+1s/aFRgTrqN+2fhl3ey0lI3K
 q8N6f42BakBJSTK7Z6NrNDe462P3dmSSIJQ42mcO0chiwjIKrufZhYSqZzFZKoX/aR6P
 dsSH8uMYCHK1fOtOVar+XYtQqei+bs+khe92Vel46Gnyumohzg0jo7GE+bJjAIDjVl0s
 WRTbcAea+R5l38yvwDbkNgaH9JyzHEtC0tCmhRUrTj7O4wLkoPmmO0YhEV7fcB5dW8bn
 Mtqg==
X-Gm-Message-State: AOAM530OGbykfnstc08U4b+/SBAeNvE6+dmZLf4gIx3zbZePCggSeP98
 WvOfeOi/5uU+btaXep+TVF7BBw==
X-Google-Smtp-Source: ABdhPJxE4rAMqZqFJQmBSrB789tdjZKukj9/n7g9ecDb/QcaExAQWtKUFEeX0l7QGMLG2PJ1ll5eMA==
X-Received: by 2002:a1c:3d46:: with SMTP id k67mr293583wma.150.1602531982526; 
 Mon, 12 Oct 2020 12:46:22 -0700 (PDT)
Received: from localhost.localdomain (170.175.185.81.rev.sfr.net.
 [81.185.175.170])
 by smtp.gmail.com with ESMTPSA id p13sm24590363wmb.5.2020.10.12.12.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 12:46:21 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: [PATCH] iio: adc: mediatek: fix unset field
Date: Mon, 12 Oct 2020 21:46:18 +0200
Message-Id: <20201012194618.2170970-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_154624_262844_37F9217A 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: lars@metafoo.de, chun-hung.wu@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, pmeerw@pmeerw.net, knaack.h@gmx.de,
 matthias.bgg@gmail.com, alexandru.ardelean@analog.com, jic23@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

dev_comp field is used in a couple of places but it is never set. This
results in kernel oops when dereferencing a NULL pointer. Set the
`dev_comp` field correctly in the probe function.

Fixes: 6d97024dce23 ("iio: adc: mediatek: mt6577-auxadc, add mt6765 support")

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/iio/adc/mt6577_auxadc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
index ac415cb089cd..7bd48377cd79 100644
--- a/drivers/iio/adc/mt6577_auxadc.c
+++ b/drivers/iio/adc/mt6577_auxadc.c
@@ -276,6 +276,8 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
+	adc_dev->dev_comp = of_device_get_match_data(&pdev->dev);
+
 	mutex_init(&adc_dev->lock);
 
 	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
