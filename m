Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61123C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 17:30:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB6B761168
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 17:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB6B761168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZMY4tBT4jMDL8+S4atQahzbdZD92maplrS8fp23rW2E=; b=n6qMcNcfwt30cyu+Ei8WtVVr/
	xpHKM/N0DBrk4dP9Mg3KBrsfPPLWGBjHKz0QUr0x6bsHcvjqdyy2wb+ekVdVyA+bMm6KoQVQCu8s/
	wjLxbu/J+dHm811+jQt6hiN2rBSBuuBDG7jbBjh3xRtYQfpmoN5Of5YwavmflR9BQsZCV0VvKVRU+
	Uqr3TzjMIhvYFAxLvOfKgDmB2CvUMGqmd6VedgRW90Tr9s4UCCQ3mRTfya9o8toncWs85FOiMPCUE
	DUkE7N9Oax/4VOYLlWVIJYiU3wPreYRI+svtRdbEIGy1nyirKnYqr/eoHhmApHEOGwWHEGCuH3/xF
	aJxwsaWUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWjLZ-00DGas-84; Wed, 14 Apr 2021 17:30:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWjKY-00DGRF-BS
 for linux-mediatek@desiato.infradead.org; Wed, 14 Apr 2021 17:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=plmO0AdMl820K1E1EewPUIFFIYm0UYQ8GWMNCMfiNMs=; b=LfPUQvndWnlQX5oTV7XDAsvZVf
 PWOm1KL0aFGQ0Czw4HLnQanyCY+ndHpbeQ4XtFiW1j89UnBq28SNRTBBBh0Z8gg7Qofo6By1Y86zn
 PgywY7bJEe1mAFpnOjJr1ywSO7nJpJeK74BKc10MEC0H0xjdT7m0ZMgPa0cOHTkAyAYm69ZFKg/Mm
 BseF5UnifCAJTHE2svl2GDzPH295Su47Srflwg1ExpH1Swiqg5M+7crW5XeKPLjn7u2J+Ls8+oAOz
 llhhcfrckDEEZdylAMRqpMDYBfDMR6Gv6I2Azl2O6Z40HY0zq+ZQOVEAz2SjHzEkfy3wj2pYTFweb
 es/YcdCg==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWjKV-007ybJ-Tn
 for linux-mediatek@lists.infradead.org; Wed, 14 Apr 2021 17:29:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d8so10512125plh.11
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Apr 2021 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=plmO0AdMl820K1E1EewPUIFFIYm0UYQ8GWMNCMfiNMs=;
 b=LWWkG7tf2pAAxOYa62M6wF4DR6wuiuWheoc5zSNFuwA0w62Prt2SPX7h0tg3QF4d2V
 44nkwDeNFfIzGlhxsD0/euzgJwjZy8/voyo4Fri/H5W/ug6v0hmlUPQH+WHtMo0TjM9m
 zGTvuXagrcNpxaxXK+HoZoVJQf5Z62gbvDiKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=plmO0AdMl820K1E1EewPUIFFIYm0UYQ8GWMNCMfiNMs=;
 b=b7fAK8QnNI/+g9uHPaFK6UeAx4VxlQsEA3CVJREM5OURWW/Mjm/RkvRAOHuv7btOA6
 uLrXM+H2KqYwCslj7ygq0rkxkuOz5K/L8OgE76JJf2s1n8JYDbwVsJ51LAsdbQEMSSf4
 ujpK+CaukILVHIM+k6xgQHtK1CYWTx/ahsO8Q31wjKHqA95YgrqmwIroCLv54ckScLBH
 iKzGwfTEpVd7PDhD/pH0hrfoydhc+TbXtY74rp9+tCU9p5/Dcl631MUHLTITeVObudLl
 Y/uyP4ZCsLWsz+IRcupVxsSaEIyjLUKGQMCLc7827/NKCnV0Tq3Wsudt1ybVxPtB3obD
 dqgQ==
X-Gm-Message-State: AOAM530KEPC3x7H+Ld78MpW3IpTzx3BC+Bdl4Xz10UOXNvquSVEpK6aN
 zifvjJuOCZ+63zK8cA9be/kH3ZcV6m75SA==
X-Google-Smtp-Source: ABdhPJzqi2vvW8j/Szl8iVKwjP6K0nUzELS0dvdFZgmCztvcUb4kX2kyyJdsJNS5/ctFp046mYN23w==
X-Received: by 2002:a17:902:fe91:b029:eb:ad8:c5f with SMTP id
 x17-20020a170902fe91b02900eb0ad80c5fmr15248007plm.63.1618421371078; 
 Wed, 14 Apr 2021 10:29:31 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bae3:4af0:9792:1539])
 by smtp.gmail.com with ESMTPSA id e31sm63460pjk.4.2021.04.14.10.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 10:29:30 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v19 3/6] i2c: mediatek: mt65xx: add optional vbus-supply
Date: Thu, 15 Apr 2021 01:29:13 +0800
Message-Id: <20210414172916.2689361-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414172916.2689361-1-hsinyi@chromium.org>
References: <20210414172916.2689361-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_102931_977489_25EEE03E 
X-CRM114-Status: GOOD (  12.76  )
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
---
 drivers/i2c/busses/i2c-mt65xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 2ffd2f354d0a..82f2b6716005 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1215,6 +1215,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
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
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
