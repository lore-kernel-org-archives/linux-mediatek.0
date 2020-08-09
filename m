Return-Path: <SRS0=12Pn=BT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4193FC433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 16:32:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 107F02067C
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 16:32:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nuWaBxAG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jMvsw0Xa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 107F02067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tgsYWryZa4a6A7MYm4jTgQBfRgmQGwBRZcqRz6du3L0=; b=nuWaBxAGcrGZldrBhTMEPigpfK
	PyDFpUoJu6qryfCyewElAw7w8a6EYGhM9zxqJFI53uxWrJowd0mo+ipTdh9q+OkpeIBB+nlGsSIsm
	csILrFwvE6wRpFMWx+NXgB+fDGOzyF0x9thcmxICoX+c9sPHGMVLwysjSnO5BhuVVussavemhGkoK
	1uRzC/QMFOFPDQ4Umm6J3qrIg10KePXLkepfhl9iK7Eu1A8LUH7Op93o81um0865xGgJ5pQgpTe3i
	0la3pIkSW3xc8yDvoCKU8RizjfsMDt10GD7DFXkb01OK41+QL/0Kh5gWYA9IpmIVDGg42IYrcqd01
	y+NVNOdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4oFR-00020c-65; Sun, 09 Aug 2020 16:32:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4oFN-0001zn-24
 for linux-mediatek@lists.infradead.org; Sun, 09 Aug 2020 16:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596990752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=PsMQY7jSXY4+oAbixnAnftAfol98FgMKGuspJ+Q9XFk=;
 b=jMvsw0XamlbV8rE9O8KbTOLCiQOy73sMe5fdr3zybVkRzJzuDqam2kvFiYLxnTT0Ui9oPD
 +UL8GDX1nr1wB3GOXy1hl56Un3hQW1G6WKCHzO+FIZBQzmaowWVIULNxGJdXtwAZgthuFx
 msLAAAoqW0hR5H8LMu7dpIFC5CQXDN4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-eehDWhFsOw2RlsOrg5DDeA-1; Sun, 09 Aug 2020 12:32:27 -0400
X-MC-Unique: eehDWhFsOw2RlsOrg5DDeA-1
Received: by mail-qv1-f70.google.com with SMTP id q4so5664394qvu.6
 for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2020 09:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PsMQY7jSXY4+oAbixnAnftAfol98FgMKGuspJ+Q9XFk=;
 b=D7jmgG65VZMneeAkM6hUMGDPquZvLIRls3tNBrYfEi4skfyzOiF81hrBymj13O7VQx
 K2FoLfCIz4owLhOTwBD84iSlAG1kty8AHh7WVDFAhY1jG4fwFoCzLTi30RSe4u6fi/bV
 bDur7jPd6iLVGsuPHzDWheiKmqYw2tBWAUTwcQObnrYeoJ1uNr+n4/Dz3kZsDvYGchI0
 HS9aEOWt/lRgloWBE8nA5ixzC3j1EQeKGxGEpwRfzpkYnC50iF9OEFlIRCTZxWJ/LvYu
 VsItwO+fmVNszesvPSNCJq2untYI/xYR8eINU2QnenMI0gceHL9t2/MJPeCxYQL7+OwY
 NkmA==
X-Gm-Message-State: AOAM533f099wBMU/aW0ZmJeuum9TZ1iClMWI3wO6BCcvMq0WEcHTbc9P
 z8H0sbv/H6QZfe8VDpXD4r4dP5+gWSTCd9zjvnSsKnGE3yb154R+i6sVsrcBiZ+SgKj7KrYgcHf
 /0g0S3i4L7+3Gxab8fbHOXiSMhm3QMSh6
X-Received: by 2002:a05:6214:290:: with SMTP id
 l16mr24599890qvv.187.1596990747394; 
 Sun, 09 Aug 2020 09:32:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxma2GBDDu2oNvsxHZ9yvLuxWvPbRyHyBBHUXJQyxP4tzEslX0cuIqMV03P+K7mAvDDQKZmWw==
X-Received: by 2002:a05:6214:290:: with SMTP id
 l16mr24599873qvv.187.1596990747159; 
 Sun, 09 Aug 2020 09:32:27 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id y3sm8304604qkd.132.2020.08.09.09.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 09:32:26 -0700 (PDT)
From: trix@redhat.com
To: sean.wang@mediatek.com, pavel@ucw.cz, dmurphy@ti.com,
 matthias.bgg@gmail.com, jacek.anaszewski@gmail.com
Subject: [PATCH] leds: mt6323: move period calculation
Date: Sun,  9 Aug 2020 09:32:21 -0700
Message-Id: <20200809163221.32413-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200809_123233_123686_79FBD01F 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: Tom Rix <trix@redhat.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Tom Rix <trix@redhat.com>

clang static analysis reports this problem

leds-mt6323.c:275:12: warning: Division by zero
        duty_hw = MT6323_CAL_HW_DUTY(*delay_on, period);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is because period can be 0.

	period = *delay_on + *delay_off;

There is a later check that *delay_on/off are valid.

	if (!*delay_on && !*delay_off) {
		*delay_on = 500;
		*delay_off = 500;
	}

Setting the delay_on/off means period needs to be recalculated
anyway.  So move the period statements after this check.

Fixes: 216ec6cc4c19 ("leds: Add LED support for MT6323 PMIC")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/leds/leds-mt6323.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index 2a13e3161bf4..7b240771e45b 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -248,15 +248,6 @@ static int mt6323_led_set_blink(struct led_classdev *cdev,
 	u8 duty_hw;
 	int ret;
 
-	/*
-	 * Units are in ms, if over the hardware able
-	 * to support, fallback into software blink
-	 */
-	period = *delay_on + *delay_off;
-
-	if (period > MT6323_MAX_PERIOD)
-		return -EINVAL;
-
 	/*
 	 * LED subsystem requires a default user
 	 * friendly blink pattern for the LED so using
@@ -268,6 +259,15 @@ static int mt6323_led_set_blink(struct led_classdev *cdev,
 		*delay_off = 500;
 	}
 
+	/*
+	 * Units are in ms, if over the hardware able
+	 * to support, fallback into software blink
+	 */
+	period = *delay_on + *delay_off;
+
+	if (period > MT6323_MAX_PERIOD)
+		return -EINVAL;
+
 	/*
 	 * Calculate duty_hw based on the percentage of period during
 	 * which the led is ON.
-- 
2.18.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
