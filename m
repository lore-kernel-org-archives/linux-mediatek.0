Return-Path: <SRS0=ckIt=DZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B24C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 17:16:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33BA62063A
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 17:16:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UDT0EiqM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OWNhjTRS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33BA62063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RVIKxDDWeFM6e1FQi3csU1GICR4iPBdHK8YPykoG38I=; b=UDT0EiqMvC2UHtBRAldArUfvtC
	bFy0yqYKnvLe/BfulDNFwfO/fCSiizCswFumi1odo1DD/PdWMubG7UIP3JDRZOLNNq++WFhzWUmcl
	Nc3p63CfFJgjfXcguG5NCQyHCAI6Lz3e7zcvPS0+xRlTS5qW7YneAABlcdZXKj+0ipHA8cTN3VpAS
	+IKzn+Vh+6XJxsXZGs1n3VyM3AOE3Vmpe2ganjYDsNO5LqIAXa94gY6lcFFb/wrTE2e0C5KoRPjLI
	S+1lCRQYn6ErxFPJjEvcEpWesE3RKsJGuQZJyDKDLgG8b1ow+dKlNaNUzYVNQ+uT4W3jVJATbxJAC
	Mu7MbUfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUCHk-0005YK-Hd; Sun, 18 Oct 2020 17:15:56 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUCHf-0005XP-Pp
 for linux-mediatek@lists.infradead.org; Sun, 18 Oct 2020 17:15:53 +0000
Received: by mail-wr1-x444.google.com with SMTP id e17so8755086wru.12
 for <linux-mediatek@lists.infradead.org>; Sun, 18 Oct 2020 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e+RWq//obkFsbQkf0frorg8nADONbMbmIRghejO+t54=;
 b=OWNhjTRSyDd9oXlWWD/2w8WrkivJIuxojfj0590PSh5jabXJAdOmR9+6YP2AxW43tC
 tWWr2yMYXCmDlFaQTBSzjkvxVlzzkpY4DZsqFNrtwWzassbwFHgfFrwN2xtrWMEqSp1m
 LNhD09fuVCMfYUz8Z8/mNAXIFLmM4oQzQLFkJ7MUKByzptDAovCoSo+SCawKJX+LXcep
 Iy9eqEr/S4aUHk8ZuCsri9MJ/lUoFz+HlifTvkw8TD4kPPz7+yj0h/WXDHUZ0O2xqVds
 Ojuw+uTtUft2ziHX2qewu/JcwlMwUK8TXqgm6ouPlMjPhPGHTsF9dEPPRBlRVS9zMOyU
 fl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e+RWq//obkFsbQkf0frorg8nADONbMbmIRghejO+t54=;
 b=izehfQoTrsXE/nHjytSXwmrCIe8P73mhGlqVFFIO45ffRm7Pd20zP1Xv95wirEt8Rk
 iZT/uBWU5gun9afV0aGLjJoHOrBAdWmZuCp8Cca4Atjt5+M0q/wFjlqsR65Kn/mdaMyR
 0QewAW7UQqb/C+PBtWj39RsovbkNUZonVkbFm4+49uyl+n55GVE+iU4oyDzOisr06qWF
 XEE7WjttrnkpKpfUcanl/li+v1luRP14GMYKDqsnU8HxOz4WVvHRW1Mn8gEOEeBCkPqP
 G4FQUfl6HVbwany+4uNHKfxFIpFum4abiDJrrPgjWoJog2xueKkg1jTF6O9adwtRiS2F
 ZaKQ==
X-Gm-Message-State: AOAM533kfgvWf+m5s+SVGqrq1XnUZKITokaTRYTc4ZgSHxTLOp2aDEyS
 aHpOpDwAc/1qosEC/TabNwKQzw==
X-Google-Smtp-Source: ABdhPJwrLsEQG5u2+3sJluFInmC+o3UDfLKxPtnMSYaPxJJL+OPjcGL9AzT9Yzt8tJP8+LiwH6kBlg==
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr16752792wrw.229.1603041349031; 
 Sun, 18 Oct 2020 10:15:49 -0700 (PDT)
Received: from localhost.localdomain (124.171.185.81.rev.sfr.net.
 [81.185.171.124])
 by smtp.gmail.com with ESMTPSA id b25sm12013701wmj.21.2020.10.18.10.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 10:15:48 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 matthias.bgg@gmail.com, jic23@kernel.org
Subject: [PATCH v2] iio: adc: mediatek: fix unset field
Date: Sun, 18 Oct 2020 19:15:45 +0200
Message-Id: <20201018171545.3190476-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_131551_940128_C37D156C 
X-CRM114-Status: GOOD (  12.71  )
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
---

Changelog:
V2:
	* s/of_device_get_match_data/device_get_match_data
	* include mod_devicetable.h and property.h instead of of_*.h headers

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
