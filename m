Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A63C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 13:15:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AC4A61466
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 13:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AC4A61466
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3e3J2eU7PwxVZtxSTWPAlhPGgPTQu6G8YRsMphbkD/c=; b=EmvJ95FpXutIeCL/MFIsfNb1T
	x0V9nDp5sAzUKZGxkmjSteldh22dK7vDsRz242juXo9zGzf9rR1bnheiCrOSDRU+9U9fSm5vqKBBi
	mYvBOVf/j3RjaFl91HrNQgogENQ9oJdTcGuoIhY8z9YroZjdvxq3IjKM3j1MZ+dPlQtjkjd8Iw7yB
	ErH1J2d8JdTozS+cXuPji44A3J/JdPYIM9mFF/D3NwVeqInXBQtDp8TBaFJdIG25kEvhfvIl4BdvP
	5+y9UhnTbwSFPpnOU45bUJJe8rL5E63OMApekkHqt3MEFR1Nvm3hS69QjnJ34UDHo+OyNgGLvjqY5
	eJFHPIEag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf0K1-00782e-NK; Fri, 07 May 2021 13:15:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0JF-0077qm-GN
 for linux-mediatek@desiato.infradead.org; Fri, 07 May 2021 13:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xcouiPP4ZWr6sE0GiZdxnLUxfCWsAQ8aBA7BAFbwZSg=; b=hYHwtRLS7bDKDSmUUuwC8djBZJ
 RJKVuKkZwTrEdpGTsn9VatlQtAbIafdSorfby4lHN2L5hHDhK+na8+Z2pvot3n43WLjGSmatzEjAx
 ScMF/8ZWQPnb9Q0GkZHMpHCkR5ciqPAFjKr1QtBqamyrelsANVgvejpcyFDThQhkZ0t+aNWgz93ru
 YGjqmv3FsvM8pVirN3t6dHmFTf8809KKcHR5o0WQNOqxr1yX/6ZSHp3T5irF5BfsN+SO0UUG+vsHi
 hs52YEzWRFA8lkTF9Dz5yAmWT+GK2QBMaU3SnkZFU5lZE3ipWeC6bqCtz2H8qyhW38s3k/PpFfHDX
 ZuciKWeg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0JD-006sZK-28
 for linux-mediatek@lists.infradead.org; Fri, 07 May 2021 13:14:24 +0000
Received: by mail-pl1-x62c.google.com with SMTP id 69so507064plc.5
 for <linux-mediatek@lists.infradead.org>; Fri, 07 May 2021 06:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xcouiPP4ZWr6sE0GiZdxnLUxfCWsAQ8aBA7BAFbwZSg=;
 b=Bn7vnWvwErgkHww/wyQaRKbnP9HyfiwnkzeUkAsUBO0BgofkV3NljJIagFWPurDaho
 YOgo+zkazaGGORdA2xpfpMGYBWtNss8jXkpPQf801I83KdaJkDXqOa8Na8gPZY/8+62T
 w2M9LP5s2KYkB90H9MdCsCEPDNiPtvh/h8Fmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xcouiPP4ZWr6sE0GiZdxnLUxfCWsAQ8aBA7BAFbwZSg=;
 b=Oso1Y/rLEV6x756dWNlsZyxYtkLtSKG/cuMa8HIPl/hc3K8DJcqc53dgwLZcdZBeko
 e7ecO4BavR4SnkpM8buJElsiQGfUDGVdrEpq1JI+SbB7or1DZezGeRR6FYj3UcTVmVeI
 UPdVR95jmqAIvTGbwxt3sHONr1PYNE4Jm9Zv3yRqFDlcTRwE2pGVYdOWC0po9hRKGuNf
 Jm9/KtnYZCmhYA7t1wGVzWGteOE908aE1/pgZ+VRNnCMRWStyL81OZM8lpPevpMe+px9
 ahh19V+oyVj4Lu9DlUAHoJs8A8D4cv+BLlHHpVR0ALHSnklpzLaoJ5hKChR1mCDu2rtS
 lyZA==
X-Gm-Message-State: AOAM531V8eR8IPbgbz6pjfYHf8Rcf8JY1cKEYy8hLNUBPZ98IJF98YYq
 KkCx2W5ukQdxucsm7iQAusfGmQ==
X-Google-Smtp-Source: ABdhPJzNumxAR1eE6lJcWpdeibTL2dL9mK96HWGhUZ0Oi+h7BgBrA3QkEyBkkzCtGm7At7VQeu0w8g==
X-Received: by 2002:a17:902:7205:b029:ed:6fc0:bbd4 with SMTP id
 ba5-20020a1709027205b02900ed6fc0bbd4mr10509724plb.4.1620393262574; 
 Fri, 07 May 2021 06:14:22 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:711f:8553:a124:a19])
 by smtp.gmail.com with ESMTPSA id z29sm4656539pga.52.2021.05.07.06.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 06:14:22 -0700 (PDT)
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
Subject: [PATCH v21 4/5] misc: eeprom: at24: check suspend status before
 disable regulator
Date: Fri,  7 May 2021 21:14:05 +0800
Message-Id: <20210507131406.2224177-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210507131406.2224177-1-hsinyi@chromium.org>
References: <20210507131406.2224177-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_061423_120985_9EEF2872 
X-CRM114-Status: GOOD (  11.87  )
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
2.31.1.607.g51e8a6a459-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
