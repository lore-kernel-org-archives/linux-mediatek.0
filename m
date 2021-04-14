Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB19C43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 08:39:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D73C8613D1
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 08:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D73C8613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4LGsbJFruQyOyKfRSEwkguwsgxT4D8QbTlMwHShFuJQ=; b=W2NStTQ4Mnh+xz0T775b0VV1l
	+vtsf8fNwbLgSRhhQUkG0Gq1DdUmvxlkUHaiOMKnvLYNtgCIp9bdBqcAjKpeO1ytfL6UFgZ62bXG7
	6Uj1mcqezgwbs7sN8rJaW1O2aXOSkJVUtuxeAcP4J+3v14YAVPIk22WX2wWZZVOjGLqfS6HPGYV58
	posD73yfM6Hy9piI64dy51op+1QWmvf1HIcEbZeSKrSXj4kXXzxv6BcQ7EG9gMMIfGsYUEKWwjfCH
	lJJcGMY+81t9lxz5sCfpZebxNQR3yh/aSFA0npl0RjNhxx0NwKUMVJ3KmrcTI53lpyg3c+TnwJ9ZB
	N4dX0sgcw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWb3o-00C0hc-E1; Wed, 14 Apr 2021 08:39:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWb2a-00C0Qa-SH
 for linux-mediatek@desiato.infradead.org; Wed, 14 Apr 2021 08:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NtcyLr97vt7tBtf+Evf5JrbdU0JuK+5BO0OeaqqfGII=; b=v84ZLxL1oCEjC1WHZis063h6fF
 C+tp/TGP09dN2qwpLQB9lK7EjC9CqClanbUetVWgNIjJENUHuv9Rfba26aGCdNEna4J825jciSBba
 URLVsGZ2ud33gGlII3Cpr1mGPezaNip8R5oo8xkAZ9ejvuHKHqGpNM34T0fnoj2nBLnTc4EP/Zw7O
 bXzRnRh9XPCSbSjsf44q62X9LsQTovwWvUjii5fj/RUBN4GeqMf1IV8ERYHqIZGitRf/QJt+6XP2/
 F/dYvBBNJ9R2TogYet7HZM/n0grYbJuTRDDbDSva+O4xsLeosuiX2ieVlFXHPqi+1l7ws68Bv86DI
 AmTeqiBQ==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWb2Y-007cN6-Cr
 for linux-mediatek@lists.infradead.org; Wed, 14 Apr 2021 08:38:27 +0000
Received: by mail-pf1-x432.google.com with SMTP id b28so1830156pft.8
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Apr 2021 01:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NtcyLr97vt7tBtf+Evf5JrbdU0JuK+5BO0OeaqqfGII=;
 b=M2Qed2dqPK3r2F98RhSaRL4bhJ+/mwydP58V5jXiwgHzzCjhvHuA6DumjP2cVJF/PE
 LpXbYiNhZZrcgzcxjfHV9MolbdoNxqDa+iBVipjy7/zVGTBS4fe7vwq1/dg8wzSWUt5+
 lwVsSMsZUN5IC3SmEKK+a6EIiwtDNx4SUXIDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NtcyLr97vt7tBtf+Evf5JrbdU0JuK+5BO0OeaqqfGII=;
 b=BJFos3TfInkIPjaGqWS2ncWEm8aiYsol1zsYrK307dLDIW/YiJ/VCkTXokwaKozYzz
 woPFaqFwONBrASt9EbSLngISD1NiF8izmBRqM71XLmVni3ppzpmzug5bsfJkeOeYf7Ju
 3zeZ2j9h9vzt50qBugG61Tobr3IkWGqbfrKb6/btXybrqePkwtcYV4nenkqk4iZw7LPh
 vVTb3r00pVSiwsXmBe/CgAvD8iaMTbI3WgGcPMbUWwA4ZHE+30aRc1ewhc/OV7dEMMP2
 ypIWyS+WXWC5Dv9gz0CBYs7nGlIAI1AT3Z61FNLvRp638IjYUld8HCVMLw2LW23SsqkZ
 yNVw==
X-Gm-Message-State: AOAM5326gat2ldVp1xssuVMuiWJ+U2xOh8VIpa89gk2M2Apygy2okDlU
 +Zfu5hW95lVUkoqcZTt3se7PEg==
X-Google-Smtp-Source: ABdhPJwD4LQbePm4sDMFJpfH5dE5UMs7w65+Ap4I1G0x9cqB/s9fdo197WaPyYM+2axsd1BSLYd4ug==
X-Received: by 2002:a63:4413:: with SMTP id r19mr35948254pga.75.1618389505195; 
 Wed, 14 Apr 2021 01:38:25 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bae3:4af0:9792:1539])
 by smtp.gmail.com with ESMTPSA id g24sm8901582pfh.164.2021.04.14.01.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 01:38:24 -0700 (PDT)
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
Subject: [PATCH v18 4/5] misc: eeprom: at24: check suspend status before
 disable regulator
Date: Wed, 14 Apr 2021 16:38:08 +0800
Message-Id: <20210414083809.1932133-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414083809.1932133-1-hsinyi@chromium.org>
References: <20210414083809.1932133-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_013826_452489_D0010957 
X-CRM114-Status: GOOD (  12.06  )
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
