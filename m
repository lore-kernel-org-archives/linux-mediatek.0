Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4FEC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 22:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmBiYRqhYAVz/iDBLu767wNTrndRtXfULgkers/pTPY=; b=A/e/xbR5iUH6I+NbSh3j5tCNH4
	HiogOAT6SUNzOH1VqSexSb/VOKMPbO+k7qDXXxVDptDUwIYv8GI7a1mx0KZrpzwr7lkXudEbko9C5
	cNMIZeWGkRhJmE5GZN0YKCfy4Spxt5/9bAnRvJ51uZVpDSPLdvLaG+qQgSLsIhmXO2iTdUWmtoXPc
	QTuVWYvNI9PJnHrfg2b6v9tl2rIrHkK8TkQXxDiFm7PCGtne3IcxE6YQ8R0PButegpK3YADYllDMy
	dBN+REZ+JWrKSRBaSDi4qvSQ7W1RsecFQ4hn+W/YpOMZX0aNDuGslZTEWhkfWaIa8WBcYLw4O172Z
	jc2Rgglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNd2-0061K9-94; Tue, 11 Oct 2022 22:21:36 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNbO-0060PJ-WB; Tue, 11 Oct 2022 22:19:56 +0000
Received: by mail-pj1-x1033.google.com with SMTP id fw14so13682180pjb.3;
        Tue, 11 Oct 2022 15:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmBiYRqhYAVz/iDBLu767wNTrndRtXfULgkers/pTPY=;
        b=LzE6t/3cYXnz2rTGxT9MEheD177QZHKBRMNwdbzh2qcf6GTNoab8z2SXezuoF/pr9E
         SrA8lRn5sGGBsjyEJ7gU+PIcdNT7XJvt6ijJLSbYqBfwtEi2omKfkkI1/DfR8X4bmgE/
         8sUYIQ4/L45L7wmSRObPBjq0cYMXzoqenO1YEu+uw7tN5hMtcDs5QNlxSNj703ocl9jf
         +vyCjPwKcdqgubHQUZqmPgts3J29IZ7TosjSSMdOTHR7L6idZvlF2Vs3ZfIUuyrEwssp
         ob/VDLP11hZtizqNHa9ahkaRTl1FKIEwyTF05BWFy3nFdwT3I8xdORUzKyR2xxky2q6Z
         xqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmBiYRqhYAVz/iDBLu767wNTrndRtXfULgkers/pTPY=;
        b=8GNF0GR4bLBsrSHjtCewVZ1OMWMaWwsS6e1n/pq97fa6XM+BAlZBbBcxxTEMrJ3UM7
         DvPx0fciquYm+NaT4BvCSg0jxLMDauD8RXRXGnEgX0WR+PETlGFlI/G5PNjrUOcUwNIB
         sUKSHecbmtmqFfj9SqN5x1A7rdvTwp/jKaLO3GHrngewNSTx44c684phMsx26o1sow6u
         nRDxJKEJUVjdcXUabaaaLW2damDtXwySs4dNZMAQih4sdvdOcQfbNxsSPok4NKhl9Y18
         e1pT/uNbf+VK5daAUObfFuHfiwzmmM+fIiGAJWu6qv+oi4FYGp6ZVP5o/LETUG8W+qFD
         CRAQ==
X-Gm-Message-State: ACrzQf3QZOfY3uxQ1q6mHak/6Ar78EuLUVgxsg49WWoZLBGlOeHrxR17
	NtC+a3UAlRGdXb1U3qEbtPI=
X-Google-Smtp-Source: AMsMyM725fhf87/+WnaBpOk4R+NTkdn8r6+mCYjks1ooHWHnlSaf2qQoW6rM0O/XPoNgCLcuRPbkWw==
X-Received: by 2002:a17:90b:1b0b:b0:20d:7c31:e75d with SMTP id nu11-20020a17090b1b0b00b0020d7c31e75dmr1440019pjb.101.1665526791137;
        Tue, 11 Oct 2022 15:19:51 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:becc:db10:eb45:dc35])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090ab70600b0020d39ffe987sm60151pjr.50.2022.10.11.15.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 15:19:50 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 7/7] gpiolib: of: add quirk for phy reset polarity for Freescale Ethernet
Date: Tue, 11 Oct 2022 15:19:35 -0700
Message-Id: <20221011-gpiolib-quirks-v1-7-e01d9d3e7b29@gmail.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_151955_066457_DF899E26 
X-CRM114-Status: GOOD (  12.20  )
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

Bindings for Freescale Fast Ethernet Controller use a separate
property "phy-reset-active-high" to specify polarity of its phy
gpio line. To allow converting the driver to gpiod API we need
to add this quirk to gpiolib.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 3200d705fbe3..c3d3fe4d927c 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -231,6 +231,33 @@ static void of_gpio_flags_quirks(const struct device_node *np,
 	    !strcmp(propname, "snps,reset-gpio") &&
 	    of_property_read_bool(np, "snps,reset-active-low"))
 		*flags |= OF_GPIO_ACTIVE_LOW;
+
+	/*
+	 * Freescale Fast Ethernet Controller uses a separate property to
+	 * describe polarity of the phy reset line.
+	 */
+	if (IS_ENABLED(CONFIG_FEC)) {
+		static const char * const fec_devices[] = {
+			"fsl,imx25-fec",
+			"fsl,imx27-fec",
+			"fsl,imx28-fec",
+			"fsl,imx6q-fec",
+			"fsl,mvf600-fec",
+			"fsl,imx6sx-fec",
+			"fsl,imx6ul-fec",
+			"fsl,imx6mq-fec",
+			"fsl,imx6qm-fec",
+			"fsl,s32v234-fec",
+			NULL
+		};
+
+		if (!strcmp(propname, "phy-reset-gpios") &&
+		    of_device_compatible_match(np, fec_devices)) {
+			bool active_high = of_property_read_bool(np,
+						"phy-reset-active-high");
+			of_gpio_quirk_polarity(np, active_high, flags);
+		}
+	}
 }
 
 /**

-- 
b4 0.11.0-dev-5166b

