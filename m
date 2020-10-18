Return-Path: <SRS0=ckIt=DZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CDCC433E7
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 19:47:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E33DD206ED
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 19:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="abJiRwFI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="B4ezs0jn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E33DD206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tUYcFabW5jR7R0Zl4ZcuENH4UqL/1RAtNRUfy+5PbmI=; b=abJiRwFIH435kEN9hGpafF8We7
	kcLcdB7tMhViGF8WyRywH73HWbjdOLSqifFNN4/mzdrjhaw8OrQ440zqHvjQqekxexYetqb1BXSNI
	6NkB5ggkhuD+5b1F1ME7N6FXbBctbMO1hUM14QjVxSQ99g4ph2tgVn851LG35CWPdNzYGIppuXsnS
	nzXMalPxGpP9yalqf/ag2xRxSt0xqVBanxL+1BbRU7NLFtUhtP5noh7SCV3Xt03qahftzVaYAqgWJ
	avWQbXWuMBopl/Zissr50OuPfGRYnrqmioZWxjBY0sDWqe49w1H1DKszyOjLamJ/23TSFK6vi7coc
	WFS57aLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUEdq-0007ft-IF; Sun, 18 Oct 2020 19:46:54 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUEdl-0007eL-TA
 for linux-mediatek@lists.infradead.org; Sun, 18 Oct 2020 19:46:51 +0000
Received: by mail-ed1-x544.google.com with SMTP id dg9so8052380edb.12
 for <linux-mediatek@lists.infradead.org>; Sun, 18 Oct 2020 12:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldXak5SnxnljogjS5BR4bzLQ/cs7o2P5Z7xi0J4e2zs=;
 b=B4ezs0jnZXe0OoPEHTaO2JK643odWH4jcP7VGXoLrgJtEmJqs5BvZhLnBxMIWt+CT5
 1EWAqMem9TADkZ65DuSA50Wy/qjZA3RLPgSKDHv3+nOg9DVXsUnQ1DdgKr31mrz9Gxga
 xVrX6vtzxaOj/9PT6tYsrqUIwHom3lkoIel0j236GdPrfCjfwpPzIoFokkZgit0joRIj
 DnWuK4Arv4Jqv+aQ6olPyI7cLEKVnNDjdvcnTNjlj3K2ovuLtZdOewVvl/2i1+0J5Edm
 hqOXWZeM1BBlxpcUl2RpKARhqurr7BBshgHZjGNJ6TkyRK5C8R6HYgmJJJKV8XL23rdC
 R4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldXak5SnxnljogjS5BR4bzLQ/cs7o2P5Z7xi0J4e2zs=;
 b=lusl3aLDDXEXy8XFtk8Cctw4WiTTGbu4eiROqOKhx93/T9w4eZ6fEdFRUqvqI/WOOi
 zw7yFyZ3CRk+V83m32ERk4TDdQ3vRh6/AFHLZmUoBMyHyS9quBUfo9YauIcG/NrFQZK+
 Ry7gVgOeSd/B4FCvFhH4N4/itHVAvny2tsR9pdmnhn0zLWlqrVjgxfiXQtOxu0Z88CuY
 qG4xcUH63eKrZLp8f9UqLFmVADd3vlcXtQjLdjcKGiIiHjuYPWGoJLeNOjEewescmAF8
 uqPPRkDrDjzFvgEsqe9ZXxh60xe8TcmfXqp4ObuOIdABVYxhy2gZO3I8GRh8mz7uN5i7
 6tVg==
X-Gm-Message-State: AOAM530vFZgq/6ReF5QawXBfeQd6rV3PpOTHqB4h98maGfJRzx6QKBT5
 WhDwpGRWDsxrQTPkCMVXErKJUA==
X-Google-Smtp-Source: ABdhPJwY6G8XBmaYMPV8hFHddmJ/OHEgz7gA3xdGXbTrVFj3gqbUp+8slxRYnn6QASjh7AGhTznBEQ==
X-Received: by 2002:aa7:c659:: with SMTP id z25mr14681221edr.219.1603050408832; 
 Sun, 18 Oct 2020 12:46:48 -0700 (PDT)
Received: from localhost.localdomain (124.171.185.81.rev.sfr.net.
 [81.185.171.124])
 by smtp.gmail.com with ESMTPSA id c5sm8009574edx.58.2020.10.18.12.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 12:46:48 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 matthias.bgg@gmail.com, jic23@kernel.org
Subject: [PATCH v3] iio: adc: mediatek: fix unset field
Date: Sun, 18 Oct 2020 21:46:44 +0200
Message-Id: <20201018194644.3366846-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_154649_990055_66F239C8 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: Fabien Parent <fparent@baylibre.com>, alexandru.ardelean@analog.com,
 chun-hung.wu@mediatek.com, lars@metafoo.de, pmeerw@pmeerw.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

dev_comp field is used in a couple of places but it is never set. This
results in kernel oops when dereferencing a NULL pointer. Set the
`dev_comp` field correctly in the probe function.

Fixes: 6d97024dce23 ("iio: adc: mediatek: mt6577-auxadc, add mt6765 support")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---

Changelog:
V2:
	* s/of_device_get_match_data/device_get_match_data
	* include mod_devicetable.h and property.h instead of of_*.h headers
V3:
	* Remove extra space between Fixes tag and Signed-off-by tag
	* Add missing Reviewed-by tag from Matthias Brugger

 drivers/iio/adc/mt6577_auxadc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
index ac415cb089cd..79c1dd68b909 100644
--- a/drivers/iio/adc/mt6577_auxadc.c
+++ b/drivers/iio/adc/mt6577_auxadc.c
@@ -9,9 +9,9 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/iopoll.h>
 #include <linux/io.h>
 #include <linux/iio/iio.h>
@@ -276,6 +276,8 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
+	adc_dev->dev_comp = device_get_match_data(&pdev->dev);
+
 	mutex_init(&adc_dev->lock);
 
 	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
