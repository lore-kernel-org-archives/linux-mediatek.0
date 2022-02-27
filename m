Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAC5C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Feb 2022 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wv04eccdHOHnBh7WcD4Q1WNKeHow3qSAizRTwxRvGYU=; b=Qgc7m2u8v9ZxAN
	f2tGs3TNvuH0CKO1beZcZS6mhJWi9X6TOzS3slLDhX6o97FmwMot0ojSeINGjhymdpWAElLNMUPLM
	cghBAyk56Lm7rtF4tzWjLpQr6NumTN2XYp6DK1gre5/dA59n/OEKCVXp+nH0G4tIEZchXsIb7JUk/
	GqxBzybm3j3/L0/0OkQbepxcHqvJwmjTaEB+dnk7cLSbF2D8kVQEE2EVKuSvN3IdnIzmIRD+BSeMs
	K46rHlASXDjgRbT726RE4tMvRN9oFshbn4K5KaP55fwIE0KYNsTBB3yqL7jbvIPSbEXVioZXTNWCa
	AAICzmlRynX/2JiQQfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOMiK-009oYg-B4; Sun, 27 Feb 2022 16:48:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOMeW-009muw-7E
 for linux-mediatek@lists.infradead.org; Sun, 27 Feb 2022 16:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645980245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V5Y+mhXtEe4aHWk4DE77nNDoAlUo3znM4yBU3KLbx5o=;
 b=PtoP22aLZkHm+9erZ0TpBKv6ojexO/LGxEzAEPDnayrtV9fLK7417UQwBe4oLqnCIQxr/B
 SRIZs1xTNDinaSCc5+WBTXLcgRizrccfItrPE49vqMEWLFuu6FwaDl0nT9H7dy+TFf8jzs
 Y0mrAAAai0dJ+wdBDfov+L1qG3NxVVE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-YirKLO4OM9GaXRag9VIw4Q-1; Sun, 27 Feb 2022 11:44:04 -0500
X-MC-Unique: YirKLO4OM9GaXRag9VIw4Q-1
Received: by mail-qk1-f197.google.com with SMTP id
 i10-20020a05620a144a00b00648d4fa059dso9629979qkl.0
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Feb 2022 08:44:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V5Y+mhXtEe4aHWk4DE77nNDoAlUo3znM4yBU3KLbx5o=;
 b=huyGcbJZj+QV0Rd2hf6FhXaBc8ITMjtg94P9DakZnD2kWiPQE8dc84lKe7qZecPzP1
 HiuERQM9kWPKZIOXwgauWTkxAb2oRs/RBDC13qTjXjPIm/1uTrQDMwNEqrFhulvEX/0N
 c6jTj/kvhxiF0FuCrRTGSFsm3a9ESndahUmdTTfzY7XHVg8NagjSfe1Wz6i8L9jx9sCi
 +s5czSM/WhE0W5G7b2fnkWMqlc4F1HmtPAvdwYqYZUHIKxQvyDTONYtQ8R2ZkLI0KpMo
 DOErg9ZoeqzyYbEMiNLBQVVvTiI9It3hHnXCF4jYULbIyidNRhy4mPFbbHBDZBKfTWvX
 BxLA==
X-Gm-Message-State: AOAM532gbTL6oSjx+I9LmjxChY2x+1PofEJQrsCTT2FBdD/4Jk1+8dBB
 dCmFN1YwbrjPhkKAaqihpD/SGXL1/w6JfRWhkvRExeiBhwxz/lAIM9mc+RhDJ0CA29V65BG2wua
 Sb8ajsL2EfflczHY9C3jsU3iyYbOHuQJb
X-Received: by 2002:a05:620a:1fc:b0:60d:d438:d628 with SMTP id
 x28-20020a05620a01fc00b0060dd438d628mr9489743qkn.388.1645980242784; 
 Sun, 27 Feb 2022 08:44:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmEEmzM5eDcwZIwdUdPIYKMl5r3tEeMsKZSwUZGmeUMBHmHQtSkJ2w3iQrxB7UtVNBvR5apQ==
X-Received: by 2002:a05:620a:1fc:b0:60d:d438:d628 with SMTP id
 x28-20020a05620a01fc00b0060dd438d628mr9489721qkn.388.1645980242555; 
 Sun, 27 Feb 2022 08:44:02 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 w140-20020a376292000000b00648e88c1f05sm4010675qkb.67.2022.02.27.08.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 08:44:02 -0800 (PST)
From: trix@redhat.com
To: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
 nathan@kernel.org, ndesaulniers@google.com, linus.walleij@linaro.org,
 ardeleanalex@gmail.com
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] iio: adc: mt6360: strengthen return check of
 mt6360_adc_read_channel
Date: Sun, 27 Feb 2022 08:43:57 -0800
Message-Id: <20220227164357.84742-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_084408_525467_873D0298 
X-CRM114-Status: GOOD (  11.92  )
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

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this issue
mt6360-adc.c:277:20: warning: Assigned value is
  garbage or undefined
  data.values[i++] = val;
                   ^ ~~~

val is set by a successful call to m6360_adc_read_channel().
A negative return is checked but within m6360_adc_read_channel,
a non zero check is done.
Strengthen the check to non zero.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/iio/adc/mt6360-adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
index 07c0e67683910..9fb6dc305a392 100644
--- a/drivers/iio/adc/mt6360-adc.c
+++ b/drivers/iio/adc/mt6360-adc.c
@@ -269,7 +269,7 @@ static irqreturn_t mt6360_adc_trigger_handler(int irq, void *p)
 	memset(&data, 0, sizeof(data));
 	for_each_set_bit(bit, indio_dev->active_scan_mask, indio_dev->masklength) {
 		ret = mt6360_adc_read_channel(mad, bit, &val);
-		if (ret < 0) {
+		if (ret) {
 			dev_warn(&indio_dev->dev, "Failed to get channel %d conversion val\n", bit);
 			goto out;
 		}
-- 
2.26.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
