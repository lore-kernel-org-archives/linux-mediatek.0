Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A804BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 21:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0lyUV6xhkVX1jxFg/jG5gRApY46OlNTkuYd457vayac=; b=0lfXtfyIKq9x7dcsKQWCDozGgO
	7CPo7gOK9zYCNO+p4u6f3eBgqYlddUjEermf/eeIKuXiWAwKwKMEKox63gYD0VpexpHCdMc89zrJx
	uZqGvu8NPgcmD/tES8hUzgSU+aKxtSXkbVw2Wb9HgL6gI0MD+MAAqBl/HZ5kR6QDfSh+cT9I29bKa
	5p+PjkNKfRrI8NqYVty9TZKmOjGpKiD5vrfEK9z1F4jhcQjI/alT1up2C3APtyl5eEzVy+oWonucH
	rt9dcSdQVdvxV5aO/M42oHIYq0JSFoDmH4Ur+j1Wx+uEgF89laqSKLp1D5tXz0Eqy0TxvLz/WklLd
	fYeHq3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7kHe-004RbP-54; Tue, 20 Dec 2022 21:36:22 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7kHP-004RPC-FA
	for linux-mediatek@lists.infradead.org; Tue, 20 Dec 2022 21:36:09 +0000
Received: by mail-ed1-x532.google.com with SMTP id m21so8949386edc.3
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Dec 2022 13:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0lyUV6xhkVX1jxFg/jG5gRApY46OlNTkuYd457vayac=;
        b=gVqohdibGEdeei9fsTgHEy+rBBwRrMzzoJpK2ZVW3G/htQHdtR73FFjqXBBOVHjtZJ
         QlcZAxPDEeh7Gwvny0Gbp+BQrILe6FPlYbPklqq6B9zN590KtTZCOOXxsIJLHedbZlG5
         gTQfOMeEnrIuREejUNygZ1QABsCVtWel9RHSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lyUV6xhkVX1jxFg/jG5gRApY46OlNTkuYd457vayac=;
        b=6xjl0tJ8KXfAtO2ZLhaqexIQJCQwCkcV8FoAdd9i/JmPX/K/4q1iGUwIlGgAxLIzRq
         Q9qZv1eIyYtRtmqm995EOcQukc+iYPlzjwTKJJPaHop1SELGTPM8XcPefogRtrOquvV9
         uOsq0Z2B9n8H6SKE8STgjlnY9X6GVLJUWHv8K+HRGe8pGMIR41FBXMZ1yyetgAlJ2ULP
         YIMfTeOXao997PaxukDR0iH6WaVNDNzUXTzlDJEkWZMeUwbGW4YeHgEGyxK82N1zmvWy
         3enJzff2cqL5DKGT4Gpejlri5uT7kNhPVVxbnmzPRnyj5cw0RxfF623zQHYLvZBQGovn
         2daA==
X-Gm-Message-State: ANoB5plikUUCSIs6KbrG9vi0FonrBLe18w61bEHDbmoRIHDJYkG5kecC
	GXfU9tvXT5/JruFJobpnEYM2B/zZ2+GvyNUZPEM=
X-Google-Smtp-Source: AA0mqf7bNWoFW5s7NHYngkKWVC/m06khl90VikHTGVzQsD2M2A5s8J3bZ00PCQ+tgoyaSGhIlfjEfg==
X-Received: by 2002:a05:6402:48:b0:470:411f:3609 with SMTP id f8-20020a056402004800b00470411f3609mr26747749edu.1.1671572165411;
        Tue, 20 Dec 2022 13:36:05 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id w26-20020aa7cb5a000000b0046c53c3b2dfsm6215407edt.38.2022.12.20.13.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 13:36:04 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 20 Dec 2022 22:35:59 +0100
Subject: [PATCH v2] soc: mediatek: mtk-svs: Enable the IRQ later
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-mtk-svs-v2-0-145b07663ea8@chromium.org>
To:  Matthias Brugger <matthias.bgg@gmail.com>, Roger Lu <Roger.Lu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ricardo Ribalda <ribalda@chromium.org>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2191; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=ZkyAdASklJW55ktI7Cr1DlzlpiQsAvq/12fzDjEbbmM=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjoirCWGDzP8RsUxqTlT7kRNFrvvvoqGTcR0Pq8Jvi
 Ifipfz+JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY6IqwgAKCRDRN9E+zzrEiN4AD/
 9xQxyU+XNUoy+PyFq1DU1yoU5ZQ6tk7Gopqcf8zrq2y5J7KvTQwWrRTc7uPWkORF8rAmY7zSkYN+qw
 H31Z0qvTHIqouB33gUly+eJkPak+idn9LPZYuz0mj1GPUaoXzO+nWIqV12X5wFgjjddhRMsBaz7FTI
 WV3I5DtNennC0jbea49wD7HNJ/jEnkwnQ/4lhmsYeRPuK4OxVPRVGSCeOnJ7muXDv/okL9bfhE+dVK
 tuOqvN8w6gw0toavDXcR4ac7RrVFb+57A/aAe+HdsT1rnAQNBkfElHnhNpjFZoxQIdAeUHk3O10qMP
 hXUQsI2cNi5+/l+TE/NmLEw4Iw4Uk6ltXCtBsmVsodXi5dS62gG39vhOiGVo74sC7ul2Y6n7ZDAGni
 ebPfnjZCvIPA9T+DtbKgnrC73tolrAOPPPssPdJSXNefpy0OCYtNoHFvNGnHkFwxyer0OQIWtdHKR0
 6V9MrtfSoK9mhKlzJbplndsVUHL7ETIadXYWwKmLP2/ZPEL64eZAc/l8SF/X1Mh769BM0WiHRDfeXu
 er44ft/maUSuAGhzkw0WKr3pPtYgBYW1W8nsOGTAtn4T1oDSOxn6zlDn+LR1B0Ea5tGXPsH+1EKG5j
 +LoOSB2Qlbm9kWKsymSsifnYbjOhm6vmTR0iE5Ykz9L+2uqM87S4rB4vFCvA==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_133607_524409_6EC45019 
X-CRM114-Status: GOOD (  12.37  )
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

If the system does not come from reset (like when is booted via
kexec()), the peripheral might triger an IRQ before the data structures
are initialised.

Fixes:

[    0.227710] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000f08
[    0.227913] Call trace:
[    0.227918]  svs_isr+0x8c/0x538

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To: Matthias Brugger <matthias.bgg@gmail.com>
To: Roger Lu <Roger.Lu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
Changes in v2:
- Enable the irq before svs_start, to avoid MT8192 not starting.
- Link to v1: https://lore.kernel.org/r/20221127-mtk-svs-v1-0-7a5819595838@chromium.org
---
 drivers/soc/mediatek/mtk-svs.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 0469c9dfeb04..75b2f534aa9d 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2385,14 +2385,6 @@ static int svs_probe(struct platform_device *pdev)
 		goto svs_probe_free_resource;
 	}
 
-	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
-					IRQF_ONESHOT, svsp->name, svsp);
-	if (ret) {
-		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
-			svsp_irq, ret);
-		goto svs_probe_free_resource;
-	}
-
 	svsp->main_clk = devm_clk_get(svsp->dev, "main");
 	if (IS_ERR(svsp->main_clk)) {
 		dev_err(svsp->dev, "failed to get clock: %ld\n",
@@ -2414,6 +2406,14 @@ static int svs_probe(struct platform_device *pdev)
 		goto svs_probe_clk_disable;
 	}
 
+	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
+					IRQF_ONESHOT, svsp->name, svsp);
+	if (ret) {
+		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
+			svsp_irq, ret);
+		goto svs_probe_iounmap;
+	}
+
 	ret = svs_start(svsp);
 	if (ret) {
 		dev_err(svsp->dev, "svs start fail: %d\n", ret);

---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221127-mtk-svs-add137fbf187

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

