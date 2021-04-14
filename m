Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7817BC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 17:31:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E25AE61168
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 17:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E25AE61168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4LGsbJFruQyOyKfRSEwkguwsgxT4D8QbTlMwHShFuJQ=; b=CVgt1BxVydWfBfbBmOXsS4oUh
	wdDZdNa2mgq7FjQM8QpOvMvTVO+yP+5LgQmUJA6DDQzMnl1Y0TCaa2B2u0reVGAx7Wv1KAeMgdSVS
	MXjN3oYbo71MhSSLugwfaRLTvcxhz8H6+yaObJPT6a6G9ah3dSH374730W5i5ATX5V8TPsV9HEQQS
	5r7E50C/J3zRh18POn/HSUm7J59+B1uF0HKjp1+219AVT1LKMWIqtJc3awuVpQBOVe0WGc6B+v6LI
	s2drFL93PF7sEitXk4u89oEt9FPqzNy72eTSCFz1iATvkZs40eyu5lx+uklhN7+DYvaiSc8iWSPbJ
	NZ4CbrQuA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWjLt-00DGgd-Df; Wed, 14 Apr 2021 17:30:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWjKb-00DGRb-E3
 for linux-mediatek@desiato.infradead.org; Wed, 14 Apr 2021 17:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NtcyLr97vt7tBtf+Evf5JrbdU0JuK+5BO0OeaqqfGII=; b=I2LwVfy/z5JOolyJp+wflNB9aU
 83hKOobhxVPlo5FQxEepzGNx7lS6e3b+nLZoprERgH3fSmIM5uX7sgrRViTICvqfdONtcZHUA5vIa
 SGdDJSALJexENSNTOD/mNlSzgx8oVrZZt5VhN+xcwbfUR/c3i8bJWnKKuOxfiVj0QRwFJqkiSOXGw
 rutxjL7nxJx9oh0//kyMqbmMU7oT4Cv/U/ARdFb441nHPw/ZBnU44UOJCgddc2JjtULiS9/l0gOfv
 zBrTzBH8RCtPJNlCoizbhhCkQODT7t7tW8divi20GBXBn4x/CsfxwknxQsD9zhQkcLb5T3qn6ps+h
 RWn6nHcA==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWjKY-007yc8-V1
 for linux-mediatek@lists.infradead.org; Wed, 14 Apr 2021 17:29:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id e2so6215002plh.8
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Apr 2021 10:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NtcyLr97vt7tBtf+Evf5JrbdU0JuK+5BO0OeaqqfGII=;
 b=U3p66+Be9J9brLNZfLCAa72fmyHRhYkU2dLerndAukBzw9zqH+m1l2LBgLkyJu6/04
 s1uRRZ+UJIiAk+qKJDPUqbNlfS9edRSd1TqeoyJPJaOheuKDsALg4RevMCAL+aM1mJni
 RIbOhRQmnkWslS55DoyiBjiz4r02jbQvoJm18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NtcyLr97vt7tBtf+Evf5JrbdU0JuK+5BO0OeaqqfGII=;
 b=FIAig8WqKThx5l7kYUZFHRDIP5VuaaeQtyFZwYahh8QIj3NSsJE7t2scuh9So8DA/B
 fYRK2QgEHCEliQyYSq0eOW5bFycWRSi5yEcYbQdXBrbHvZeJLMI+kVTK/BeLKW+IVCJK
 ctZSxQzgi469p0BS/zftn6mmqM3waQNvRK5f+LoTDINoA2P/X+TWC/cy6X4Q9I/crjHw
 JCLbzLDDI4dtf7+9LI+ba9T0kSm2xqAn06OirIBn9Jbu7NWi7yehtvKGnogoaC9HaXIC
 GQGlG0lcLFSvLbN2Wt+Rry4NG/ZpNXjiMJO0E/GLLg8CajnM8K5dCoi4e/+gToen8cgb
 XegQ==
X-Gm-Message-State: AOAM5305ZTuatdJkLgsSLZz2mPQK9ynQ6KCmc9dqxON5leekib8wvcsh
 pqni9suutc5KJ6Otss8oQtOuoQ==
X-Google-Smtp-Source: ABdhPJwPcZosbX6F/FEtrRwct5NPpkw0jknr5o9f0r7xAc5sBoT3Dcx5C3arvvo3qFB/+caOXsY09g==
X-Received: by 2002:a17:90a:ce8d:: with SMTP id
 g13mr4686960pju.85.1618421374136; 
 Wed, 14 Apr 2021 10:29:34 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bae3:4af0:9792:1539])
 by smtp.gmail.com with ESMTPSA id e31sm63460pjk.4.2021.04.14.10.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 10:29:33 -0700 (PDT)
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
Subject: [PATCH v19 4/6] misc: eeprom: at24: check suspend status before
 disable regulator
Date: Thu, 15 Apr 2021 01:29:14 +0800
Message-Id: <20210414172916.2689361-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414172916.2689361-1-hsinyi@chromium.org>
References: <20210414172916.2689361-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_102935_014904_42784539 
X-CRM114-Status: GOOD (  12.27  )
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

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
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
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
