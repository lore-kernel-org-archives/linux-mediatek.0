Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECD6C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 05:38:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93CB86052B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 05:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93CB86052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eoPcker/Id8z7WIAMkOeRy21+lbqB9Qn5VUqZ0Ari9Q=; b=RRVByHjyEgXlqUtUJspRDOoRB
	gvQScfRNhpheSw7+mZgTrzkS3ucJ4Ub08zU2ayYd+LibIgTUlroQlhOEpB5WdTPu3m3FpuHVWWxIk
	6woqoJc+5V/ROleoS2BBgWEcOo/fqRINmC0guanlugIsPdrly+CSRAyP/+0Yoa2kquwXiaIOtvy0w
	1jxKrbKcYCG7sk2AO2sepz9GwaKrQwfeYxJ5ZNt0C3BiYXqyZNJlC7Ef6SIfRfpA08JWpJ/iE+lbq
	x0kXPkURNTuaDKILro7O2dyuuM7OFS5TDSAWxdlcz1Ie0OLtQpgBrF1PwE2ISzviRK7iyi2oTGr4V
	3Blpr6R3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbGQM-000lNU-M6; Tue, 27 Apr 2021 05:38:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbGOj-000l8S-H1
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 05:36:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=DmgNhZA8y9OcAqQz4ZmmKKT0ZJqTstchwxs60f43ujM=; b=vGW7BfeMggu9ZlTdylKZKFE+8k
 YL+ZRZz/lPH7boc/oTZcCP5d73EBVhBqN3FlElEhgSQecD0NHxAADFJe0TH92nvSl7UiqDQYqHdzf
 5shDKy+TOnN6STE6GJerRFxZ45nsseTV96Keq0Z1psLc7i3GSAXxr2OqyUsfYrQjDlIk7y8lS6wQt
 AHDMAxQIuk2tT9spHwo5pvFhqLPDNBbOfI+MXQ57xlSaE/a7fTo3oZhXdlg7GBlgQHT1ogYazBm5e
 5Lou1HjqwcWxbby1prmaxztMYUFpK29Br35iuMwfnkCsDAM5zsibWL8jMDUVL4V4zW2mpo4pfx+1y
 9Nwzhw+g==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbGOh-00GSF7-4Y
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 05:36:36 +0000
Received: by mail-pf1-x42e.google.com with SMTP id j6so1200085pfh.5
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Apr 2021 22:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DmgNhZA8y9OcAqQz4ZmmKKT0ZJqTstchwxs60f43ujM=;
 b=WcmtSLpGOQppOkaIFOJglGs6qgpdhC0GBDegcigac4xtnNSkBc9/CcqiQgJ3WbKILE
 Gs2oyMEkt+e4hyjxptvTbycReZ/0RwvAPQoZlwAZ8sZ8XbK2+xHnKRKUYQC2mDqLEl+w
 5J/SbXVbV6dmGGuYilQX3FBKckI+jX+WUcTww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DmgNhZA8y9OcAqQz4ZmmKKT0ZJqTstchwxs60f43ujM=;
 b=iwGDjBupIb3FQ5zG1cf9xxJiuMIhVnRuxHueAZroJ77g3BZFAyXt9iUgta2TIQW13w
 ZvXiYKkmE5XmYjtTZLAycMZhcbJRorH74YTznoD/n9IPTxxqqbkU+mu7zs5pX+fyqZvT
 hSbhfyVqJo5KITFPgntmg2COodJN7OKTwIyu3OrcAJFW/20edmsXtAFFLaEfCAG0LGsg
 afkwJ3/CCSwRaHrfi8KS6fGhrJPLA6EYRBukYxAx2cLYrMYJ8/VwKWGNoKrY8lIPxoKq
 OwiEKODLdhT4njq0W2wSCqpIChNea5HFrxdv7iMgx8LZycBesGBVTbH38e44ZyEHy3Ye
 vvqQ==
X-Gm-Message-State: AOAM531Kk5dj+BeopeyuwNJbnns8cg/pbdAs5ERug0HizCdcNfKG720Z
 dMvuR3rtx1Sb/MqtRSvPnM+NLw==
X-Google-Smtp-Source: ABdhPJyK6HPDL2dVl6Wi0k4rLfJc5+VoFT3tTwCq+4rkqx1pDkHVS+yVt1cvCRJAGH6jG1yUhZdMcQ==
X-Received: by 2002:a65:6414:: with SMTP id a20mr19805719pgv.96.1619501793489; 
 Mon, 26 Apr 2021 22:36:33 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3984:c4f5:8612:6b3e])
 by smtp.gmail.com with ESMTPSA id gc15sm993529pjb.2.2021.04.26.22.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 22:36:33 -0700 (PDT)
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
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v20 4/5] misc: eeprom: at24: check suspend status before
 disable regulator
Date: Tue, 27 Apr 2021 13:36:16 +0800
Message-Id: <20210427053617.27972-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427053617.27972-1-hsinyi@chromium.org>
References: <20210427053617.27972-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_223635_185477_C730621A 
X-CRM114-Status: GOOD (  12.08  )
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

cd5676db0574 ("misc: eeprom: at24: support pm_runtime control") disables
regulator in runtime suspend. If runtime suspend is called before
regulator disable, it will results in regulator unbalanced disabling.

Fixes: cd5676db0574 ("misc: eeprom: at24: support pm_runtime control")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/misc/eeprom/at24.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 926408b41270..7a6f01ace78a 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -763,7 +763,8 @@ static int at24_probe(struct i2c_client *client)
 	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
 	if (IS_ERR(at24->nvmem)) {
 		pm_runtime_disable(dev);
-		regulator_disable(at24->vcc_reg);
+		if (!pm_runtime_status_suspended(dev))
+			regulator_disable(at24->vcc_reg);
 		return PTR_ERR(at24->nvmem);
 	}
 
@@ -774,7 +775,8 @@ static int at24_probe(struct i2c_client *client)
 	err = at24_read(at24, 0, &test_byte, 1);
 	if (err) {
 		pm_runtime_disable(dev);
-		regulator_disable(at24->vcc_reg);
+		if (!pm_runtime_status_suspended(dev))
+			regulator_disable(at24->vcc_reg);
 		return -ENODEV;
 	}
 
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
