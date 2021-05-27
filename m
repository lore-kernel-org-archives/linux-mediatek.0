Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB4AC47089
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 07:59:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBF35613F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 07:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBF35613F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGWRTo+AShTObmmfpZwzZe632uDPnTceBkIKM+VF2XQ=; b=avRkF4WrgEXJe9
	vIBzTshRx3KqWYD74WjezOszxSxU1mdCNU3akDLSjBtQwWm+808mN1gaefn260KIwEpsZ3zv8mH/g
	40umh9olsn+NrN80H2YfMSl2+nGAbqDLTf+8EeUjtwwMjVIF2XPfdVcJ3CZy+CjazmGY9JoBwr2gH
	3loKCTU2nHOz3ysYnyVsBvBiic1NFMPqiCHGJn9yAD8PeVba/rlNzke17oo6RnHttA2PuUAk3RSKi
	6N9XWkJF6RN7VQMFO1ERc4XxOlodhAr5avpwFbz4QVpYO4vrCyg6pu2OyCdHWkhRcCdchxtnX2R7O
	FFzZx/jUWnZoZDciI4NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmAvN-003ada-5J; Thu, 27 May 2021 07:59:25 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmAsF-003YdJ-7O
 for linux-mediatek@lists.infradead.org; Thu, 27 May 2021 07:56:12 +0000
Received: by mail-pg1-x52d.google.com with SMTP id t193so3093313pgb.4
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 00:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8pyuCoGKMnN2+h3a3mvyZQi+Jw/dfI3iorf08UqC1XQ=;
 b=Bh1k5AsMvov0F8xhU0fy1JXtiKqODUjSEBaJH/LGR0vli6my0OASfRNaobtKGmuGra
 0NicyBnDSjqwDNdJYbCBXlocfR3dyN8wQwphQ+txLBLfmIc1bW1CmAwxYf5RfPHxoxB9
 GPaHUPZO1dOsaD7vOAlpSC38lh8+S3wQk6Ccw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8pyuCoGKMnN2+h3a3mvyZQi+Jw/dfI3iorf08UqC1XQ=;
 b=e9GvVq30My28dxq3zbvapQhFenltcFjWVILymJFSSM6mNXRpBrPTtxKg0/SsKQO60H
 3U+JurAGNPbCI7UHVGAh+zY4q7Dlp9KsWvLy+7LEN/oWnOcUNLSteCXEcS62mfcalKME
 F+i+uofydUhLgZuWHl1rSOg1fy9cgVzZrDR7Kcj8xDQYH8oc8+UUm3ia0fHtCs58K3jU
 pMKJVGBMZgz8/NfD9BMCx+SmSonzyKQbfExsHGwnCIkQUxl25qLkalLMJYHk7fymbJLx
 0lz9GdUqeQFcVy9Mlu9XPRE2eFFuT3laopdJ6CiZBjKtlfXGthNU23DrFDqP1gh/asiG
 2NEg==
X-Gm-Message-State: AOAM533DDtXVYcPUmCgBuWON0vG91k9MxP9CnsZIp6+VpU8y48g5Z00+
 HlGZyd+GxYeFfo8ABc8OJ+w8Ug==
X-Google-Smtp-Source: ABdhPJy47jhHWTE50bdT7rNK/2BImA4ZBMyIusHrtkWOEZQI1HmguHizcP2LilT+5zCs4TFmn45X7Q==
X-Received: by 2002:a65:625a:: with SMTP id q26mr2482964pgv.311.1622102170122; 
 Thu, 27 May 2021 00:56:10 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ece5:55a4:6ad3:d20f])
 by smtp.gmail.com with ESMTPSA id 69sm1217790pfx.115.2021.05.27.00.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 00:56:09 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v21 RESEND 3/4] i2c: mediatek: mt65xx: add optional vbus-supply
Date: Thu, 27 May 2021 15:55:55 +0800
Message-Id: <20210527075556.1709140-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527075556.1709140-1-hsinyi@chromium.org>
References: <20210527075556.1709140-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_005611_328186_17E3EF42 
X-CRM114-Status: GOOD (  12.60  )
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

Add vbus-supply which provides power to SCL/SDA. Pass this regulator
into core so it can be turned on/off for low power mode support.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5ddfa4e56ee2..22d1d14b5de5 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1220,6 +1220,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	i2c->adap.quirks = i2c->dev_comp->quirks;
 	i2c->adap.timeout = 2 * HZ;
 	i2c->adap.retries = 1;
+	i2c->adap.bus_regulator = devm_regulator_get_optional(&pdev->dev, "vbus");
+	if (IS_ERR(i2c->adap.bus_regulator)) {
+		if (PTR_ERR(i2c->adap.bus_regulator) == -ENODEV)
+			i2c->adap.bus_regulator = NULL;
+		else
+			return PTR_ERR(i2c->adap.bus_regulator);
+	}
 
 	ret = mtk_i2c_parse_dt(pdev->dev.of_node, i2c);
 	if (ret)
-- 
2.31.1.818.g46aad6cb9e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
