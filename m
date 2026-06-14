Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66785CD98D6
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SUVnT2tX7Y99O76KPHUYUD1f52zrxGJfCA6Tlu+Jsko=; b=O2e0CWi3Cki7nPemvZ8tqkeOgF
	VQ13y/Xvkb3PTaTdKSNRLIzc3woD6nB42hoJrXHfEsrl78IwT/TFOuYOq0JiJBOxTPyLvnlJ06OEE
	GttY16HGtd2XEsw/AFti9rzVeTRixwM4wc7jJEPTLQDxkeetQ99g10aMuDj2o6qW55dsxT0iPLmBP
	JTFxA7VaovJJ6XvUIvFmeH8wSv5ol5Rn4Kp3O7CCr3/bVZxV9qAyELQOyEOSruJwyVijcKawXgxjB
	PBTTc5SkRWNNCnaFZxyuM3Rt/RdZdC3pqNTHszpHqzynSBVNzH/3HzBJsbmEohBizxx6pBgDj0mMT
	GKlqQ6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYYVT-0000000CdYz-1GF4;
	Sun, 14 Jun 2026 00:15:19 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYYVQ-0000000CdYg-1RDP
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 00:15:17 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c168baac83so9947895ad.2
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 17:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781396115; x=1782000915; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUVnT2tX7Y99O76KPHUYUD1f52zrxGJfCA6Tlu+Jsko=;
        b=lo+iBd+VPIZaW9lfsDXrq1RNaZapHQVvsZcTc146QEWvaEIHJu7i0jQVb3L59kAgaQ
         1ep0S8LutfBXz8dCwykkqkyHSozof1diP/RA6rj63OtMNCUOlafgFxRUFd15kpqC2/ej
         LDRWKpYQlvtmxIRp/jpOtSOyUEFsazww/zhtwgWWxI7uKyC6vmb0ObmwFI4cfCAqStjx
         9zYm4XoUNy7nPPPld7m90aRgDdEVRV1eM+6iRJsuow6hgStGgtdjMPsTJD2hqHvlFoRg
         7LRecvKMgPQDjpNB1p2P25d0Cu113vdv5h9ShXbOOnCo96Ld8AeR0dCOFZrSKa2foSW0
         8cUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781396115; x=1782000915;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SUVnT2tX7Y99O76KPHUYUD1f52zrxGJfCA6Tlu+Jsko=;
        b=oRoODSapF3kzDB+sLjRCo0LZZ4nLMCvedUzcJnNm8GvVPqrm1kEFqw6CuKDXQ9aFZs
         agl0RtFuB9xT5IXJ8oqo+GYTO5Qi+Luh5klu+XdIxGDBvnMVEu2odlUqSMhF1jfreWkM
         5nGGyNDo8kG/OW+HHMA2OMeuAF8eMrnX0FRBcTNwJWZYilyq71goaSuc5sbaKosk9hNd
         LZuvU29se/iCZz3iPJM+2Px7OUIK4ZvsRmDdaHekLLkFjLATmvsjwYtDAfJ42NVvmk6T
         9KuMaVjRg5jMYtgwIMaeRJKi2JuiLwNmnutPZObpQ/IcXxWPAV49jNO3mPfXjda7Eu9d
         2Vtg==
X-Forwarded-Encrypted: i=1; AFNElJ+uEqvNu3xHvtGzJSzo2ovywN8EhUHrFZy3gFSK14iTuN090MaVmB0uoR+1W12gKWN6ROQsyEtWIXLNeajUxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuDYTjSeX9YujLzVMDdgI9Cf+lqSzxcaz4AkkzBEsYBz29FHMH
	ZD+46u5xKSO3cdlADJ8z3uw0KhpA0EwMqunlzR5RlBpT0XSKZTokL/IK
X-Gm-Gg: Acq92OHSV1ZJCBJtHeY/BfM7wAcmqTaiQmKEI4G1eofvwuKgrcWuui4g6PMtUKb2XcB
	qnHlpgJEXUPf04usNvBKJCCe4DvFveGbxzW+agomIxTBeuzUMa/t7PAO8xnmkpz9hOmutTkJbBO
	3G7lXHQCASMHGYvmqBNJ8I9L1rz/3WA9vsEIDUcBAokCu3ukqLJGJ8TzCeHyRMZAwHErO0sTuBV
	jUm1jSR9dxortFnYtfipcsj1ubyqmPwEIsXYvpJXgM7CviwVZQa9+tWIn7eLfUtT4EQe0ry/GLC
	+2X4VxMrA7rmQ1Ww0soLLUp59TimOB1AOQj24v0wn5GjZc1yGo8MgFyqvnn0p3aKzX1e9XKLvsK
	ZRgneMTeAZtt8MDWlaGGxOColtR2XnIss+YP58p9W2CnU4eMJLFBP+1hWbBOtCABjE6o6Br/O1S
	vDXYMukkE41tLYEMpsQU0qVz7Z5Go=
X-Received: by 2002:a17:902:d4ca:b0:2c6:5bae:f9ab with SMTP id d9443c01a7336-2c65baefa96mr60612255ad.22.1781396115356;
        Sat, 13 Jun 2026 17:15:15 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4330782b2sm63552385ad.67.2026.06.13.17.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 17:15:15 -0700 (PDT)
Message-ID: <6a2df293.6b2684af.263065.81b4@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Sun, 14 Jun 2026 08:14:28 +0800
Subject: [PATCH] thermal/drivers/airoha: Fix FIELD_PREP using wrong mask for
 sensor interval
To: linux-pm@vger.kernel.org
Cc: Rafael J. Wysocki <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Christian Marangi <ansuelsmth@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_171516_388381_B4A9A014 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

In airoha_thermal_setup_monitor(), the TEMPMONCTL2 register is
programmed with:

  writel(FIELD_PREP(EN7581_FILT_INTERVAL, 1) |
         FIELD_PREP(EN7581_FILT_INTERVAL, 379), ...)

Both FIELD_PREP calls target FILT_INTERVAL (GENMASK(25,16)), so the
second one overwrites the first. The sensor interval field
SEN_INTERVAL (GENMASK(9,0)) is never written and remains zero.

The comment above states: "filt interval is 1 * 52.715us, sen interval
is 379 * 52.715us", confirming the second value should go into
SEN_INTERVAL. This matches the Mediatek auxadc_thermal.c reference
implementation which correctly writes FILTER_INTERVAL and
SENSOR_INTERVAL to their respective non-overlapping bit fields.

Actual effect: FILT=379 (should be 1), SEN=0 (should be 379).
The filter interval runs 379x too long and the sensor sampling
interval is uninitialized, causing incorrect thermal monitoring timing.

Fix by replacing the second FIELD_PREP's mask from FILT_INTERVAL to
SEN_INTERVAL.

Fixes: 42de37f40e1b ("thermal/drivers: Add support for Airoha EN7581 thermal sensor")
Signed-off-by: Wayen <win847@gmail.com>
---
 drivers/thermal/airoha_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index b9fd6bfc88..e8a33234e0 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -403,7 +403,7 @@ static void airoha_thermal_setup_monitor(struct airoha_thermal_priv *priv)
 	 * sen interval is 379 * 52.715us = 19.97ms
 	 */
 	writel(FIELD_PREP(EN7581_FILT_INTERVAL, 1) |
-	       FIELD_PREP(EN7581_FILT_INTERVAL, 379),
+	       FIELD_PREP(EN7581_SEN_INTERVAL, 379),
 	       priv->base + EN7581_TEMPMONCTL2);
 
 	/* AHB poll is set to 146 * 68.64 = 10.02us */
-- 
2.51.0



