Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE6AC04FFE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 13:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KjbvBW6RdAEPTXQDkB746T8DtbLmBQp7aI+NR/HIMtA=; b=sxlxd9fdyPLWrGKjLNzEi0iBj6
	GFsdpAY0pWFI5bxvc8XQeFQ3WqjbKVkgOCfNCP9ZGLvhRrPQz6RHDyDJ6LXxB5Ap1+sg5UpRPhtYe
	YOtiWae1+9pbDn1Ilzwy5IaKpuG21FfQ/kbHKnZBjhubiqOTgQFZ89ApDhdbMskh3Hsy1Kk7JtmYq
	nzr3A9wMvDn8luFAANZf5IHz0Ytv4sC0VzqUo+8ptcI7wdTeE4QPehV1fseex/HlbU/2RDwR/kd9S
	Ac1PyCJ37lb7Yw+6V03nbPIZoWxl2Rfx8B2s0egpwR94D24gB3/hfIG35BGuvjvg/VcX5UE7AAtCO
	EAogDJ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2WlP-0000000CprC-1zNb;
	Thu, 02 May 2024 13:46:19 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2WlL-0000000Cpo4-3iO6
	for linux-mediatek@lists.infradead.org;
	Thu, 02 May 2024 13:46:17 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-51f1bf83f06so882885e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 May 2024 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714657571; x=1715262371; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KjbvBW6RdAEPTXQDkB746T8DtbLmBQp7aI+NR/HIMtA=;
        b=b/K/o/u7lJAdMxTrKL8qkyqYyA2chWD79QQwf9hXncZaWUCbmgepQ6VVTgCHnflXm+
         GdKVh7k89Ki8nqev867LqBvE+apAwyBZHyVYl7HWCSK31+WjBuRBEMrzeFebRB1h5t9L
         vkmNgtZnIFZ7uWrwBHAc8xKD6jZ1S67e2CPUy7WDQkKrEuy5ymxJU8eNdzCsno5nFy/m
         F0JhvIaOTZ1KbHOGtwJz7/nR2MBxp7WcfPPa4uOagxkvRVckp67D50lNypbEgaV185Sn
         w+fJanXP2DiyRaxQ6XtjYcG/6f5/j7mGT289FUYmIfkj4ZDtojU9CTWyLRi4g+OtI3Dk
         WGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714657571; x=1715262371;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjbvBW6RdAEPTXQDkB746T8DtbLmBQp7aI+NR/HIMtA=;
        b=hOdOdnPgs9xC2L4xL/xxXBXaM4D8paZVSHTvYQAmfnxhHT0XGyhA/Ox02w8wuyIF8J
         2NTgX7Ipx4TUDK0zrpYmGipH91AHeePk0TQ/Q74Vx+6o6Y/Fsy/Ivx28fYcxLZL3rMl1
         Lnp3Zng6qPC31//9Qn9H0iffwqo/JXrT/o0RsNhxEciInJUlzsK5ZETPSI+GtyYSKjW7
         U3+r0cxSlRRMWem676RMm3XbDW0cck7rg3lXYPRMMDjkA6Ex1/rHRsGv5JfxvpsD1Pyb
         4k6WQlDSQqCp/HfEAlAx5P1+1jR/bfPzp/QbVKKIwyjpHVHQVe0mI5VUOVw4A8yEVCeT
         hpMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0DoTUR+StpFzUtmGOi0fyAC32RCvuIEHKClDkHap24kFQ7lyTLUl0WKGC8k/hKTIj7E2H1QRaOGyBuN3GkLbld8jNmheKhmlLVNK9xPK14Xp5
X-Gm-Message-State: AOJu0YzO6ayYoiAA57ee6vEw0DctJVg3RWrxMLJplPIX1vPi2LqiajL9
	2JnCF4SfUKy068x+obCi3eBQ0lZEarfRSQDq4jfoekurZfBzBxf1xcAdagIkVzw=
X-Google-Smtp-Source: AGHT+IFep4NL01L9Ttyd1vLDcDsr7A1IdG5IgCdv67mtSJhnn0nKGdEu7Tq10aLQKCI1NwgsUJdJ7w==
X-Received: by 2002:a05:6512:3083:b0:51a:a400:785e with SMTP id z3-20020a056512308300b0051aa400785emr5147210lfd.43.1714657571559;
        Thu, 02 May 2024 06:46:11 -0700 (PDT)
Received: from [127.0.1.1] ([79.87.205.120])
        by smtp.gmail.com with ESMTPSA id c1-20020a05600c0a4100b0041bf3a716b9sm2014447wmq.34.2024.05.02.06.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 06:46:10 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Thu, 02 May 2024 15:46:03 +0200
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: Check NULL ptr on
 lvts_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-mtk-thermal-lvts-data-v1-1-65f1b0bfad37@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABqZM2YC/zWNwQrCMBBEf6Xs2YU0RFF/RTxsmtUE2yi7SymU/
 rup4PEx82ZWUJbCCtduBeG5aHnXBv2hgyFTfTKW1Bi888EdncfJXmiZZaIRx9kUExlhiP0ludO
 5NQI0N5IyRqE65N2uvBj+J/b8I/woy+/3dt+2L7gkdLaHAAAA
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714657570; l=935;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=umAKYkGw6Qh2FAI5WcUUghAsI5djPBhIsfyxFgp451E=;
 b=XsliQEKG1eu9+im+fcPyY5Bbcd0sVJkvx/RcjpKU1v7XxCLRK2GVF3ir4d6kad7e4Geja8X1n
 U9XUTA8WUMvBsVCV6f7yMC4aFi2H/666pKzVpdEoUoeX/0+JSCS+uxO
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_064616_025712_71F2253E 
X-CRM114-Status: UNSURE (   9.38  )
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

Verify that lvts_data is not NULL before using it.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
At probe, verify that lvts_data is not NULL before using it.
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 86b2f44355ac..20a64b68f9c0 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1271,6 +1271,8 @@ static int lvts_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	lvts_data = of_device_get_match_data(dev);
+	if (!lvts_data)
+		return -ENODEV;
 
 	lvts_td->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(lvts_td->clk))

---
base-commit: 9c6ecb3cb6e20c4fd7997047213ba0efcf9ada1a
change-id: 20240502-mtk-thermal-lvts-data-4b19d0685024

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


