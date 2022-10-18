Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D07C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 05:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Iq5wXewW+3MLQ47QaRSsdQhrIqjL73N0jwmptRfg2I=; b=UxPyKIaDFdRxNuElw6uh2I5950
	71M4DDqbICmzuaS34ykqBLaFJubSwgSsvXPAN/iBbltQNi6lpmpJUFSLQmBuTTGbkilw8fGdE/Cjf
	FIbIBRlsa4CXDJTVFkjm0BWwVz+55CQu2wWY+hDEDfCnOvGq0bWr6wyrix2fZob6SUpsAhCN0epNv
	TC84i1rsRz1IB3RzrhfCoPf4f6f9ZYzX/v6zNpiTTiyNjBzpOSuYvMLwWIpSC0t3+/kMbmCW4qIPR
	+/LsaeuwkrL+cwvT0kjbtFSEOj+gvS+vINMH2EOs2XHd9UhvMg+ainLyyB3CfXWaVmiotAV+Wtv9B
	naLERKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfNy-002rfW-If; Tue, 18 Oct 2022 05:43:30 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okfLz-002qS7-F2; Tue, 18 Oct 2022 05:41:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d24so12826767pls.4;
        Mon, 17 Oct 2022 22:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Iq5wXewW+3MLQ47QaRSsdQhrIqjL73N0jwmptRfg2I=;
        b=JQB+eZ4i05NAahlAWprnOds04fTCwA66xi1PBCvw2NsAD8IJGCoC03i4GSFNm5yadT
         FcBha25882OHsG44R9qqRzBjDU8V6yiJphui8DvrJE2VWzWRHTH2PtAml+vDOXmI+HAH
         0BRxMcBqGj4GPM5FgMS94xP5gLNiGpGa9hYpBTAETp6KMSh0uKbODdUKLZIuCfwLwibj
         tSA9REgAVhA10Mu6VLAH3HPgmOy/r/2cQ6K7y45shGOARzDZafsWzMzxXZu7ivqD37y1
         pFfOP+H7Z6EfGIfSRE2fHOQFfL1V5LAlyELPuzSEPSHGRphzr9fABIfNGKHZZ/1a7cHc
         h0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Iq5wXewW+3MLQ47QaRSsdQhrIqjL73N0jwmptRfg2I=;
        b=AAIw0309fmOEd588QwzRw9f9H90Xf54gNGd5MwZEFUxzDT3QZg8t4ZIc4Mq/xHz5Hs
         cjW1OBot6hwEdNk1G0PsYqwp136/SP0AoSJXiblrDpGJ4jDOxFNHmWS5pDD/Cfg4VgG0
         gSrk0Wq1Ayzlrk5QbgSZs8+FH/M7YTrbzvJcfjFfJZRzX8KmGt/L/7ExJKqVOQB9b9Jw
         HGcYTZ9KIUW4uOQCkISH/nFG4BdqQ5xtXkTxdQLItTO67SJuhtSapzaT2GH4626OLc66
         52XeFkvvrBFOguxHzmFuwjztSI8TLEYnj1+J/jO9Ye9DZNutOES+Kc+4+OnucmzCp8zI
         BJ3A==
X-Gm-Message-State: ACrzQf0XvclDHeFDD6+K0J6x+3GXUUkP5RFQpMWUxmTLbX8x1ZFYDzuZ
	Za9nSopjzF307oqEnBr6eZk=
X-Google-Smtp-Source: AMsMyM5gBeGncCbF84yTFH4n1ABrlLB8WKM8Ryt93L29N3lO44OWDACsNtGrHRQRXDcKIK2MujAfpQ==
X-Received: by 2002:a17:90a:1a43:b0:20a:ea98:b962 with SMTP id 3-20020a17090a1a4300b0020aea98b962mr37411322pjl.118.1666071687002;
        Mon, 17 Oct 2022 22:41:27 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:f7bc:1bb5:e0b1:92cb])
        by smtp.gmail.com with ESMTPSA id z7-20020a1709027e8700b00172f4835f53sm7597435pla.192.2022.10.17.22.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 22:41:26 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 06/10] gpiolib: of: add a quirk for reset line for Cirrus CS42L56 codec
Date: Mon, 17 Oct 2022 22:41:07 -0700
Message-Id: <20221011-gpiolib-quirks-v3-6-eae9cc2ed0a1@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
References: <20221011-gpiolib-quirks-v3-0-eae9cc2ed0a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_224127_532729_01308821 
X-CRM114-Status: GOOD (  11.28  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The controller is using non-standard "cirrus,gpio-nreset" name for its
reset gpio property, whereas gpiod API expects "<name>-gpios".
Add a quirk so that gpiod API will still work on unmodified DTSes.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index a9cedc39a245..ffdbac2eeaa6 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -418,6 +418,9 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		{ "wlf,ldo2ena", NULL,		NULL }, /* WM8994 */
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_CS42L56)
+		{ "reset",	"cirrus,gpio-nreset",	"cirrus,cs42l56" },
+#endif
 #if IS_ENABLED(CONFIG_SND_SOC_TLV320AIC3X)
 		{ "reset",	"gpio-reset",	"ti,tlv320aic3x" },
 		{ "reset",	"gpio-reset",	"ti,tlv320aic33" },

-- 
b4 0.11.0-dev-5166b

