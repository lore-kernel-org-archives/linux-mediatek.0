Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3C6CD1283
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 17:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OhpY2/sSxSgf633Uejn3ClbyqlJ5glhXVmlmIc3u9NE=; b=F4tTjVFH0+KPWr
	NXAzCyHfMFT02vGSsVU3b1Z+FSZVf2yBQ9Y/cEcAZD3ExeW/Tur3K2AaszW6shKPcUGORbW9vEWHj
	aPkwsXpUdXNSIeHb+5Q4cnqx35DQ1xIAVmkoHEOfu9e5uevn0iMiOks5wpkGkISAQwpgeqreFnfEI
	DHfhpe7VfOqF9/XWzQWALIJYbhYb3zLm7uRyvVA2oHgMiIYQdZLm+vURZfugHNNQyYK1Qjk55vZXP
	1CMmxNOw5nfR7Y9hQbwZQOq40JqJO+aI6B93Ci8yYooyMozrtDdzPXKAgmtyBKi3y5vwYj/LDk/j5
	+PrpK8IhZKVrO37VmggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyV-00000001Siy-3Dsq;
	Fri, 29 Mar 2024 17:25:07 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyG-00000001SXU-3sKu
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 17:24:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-41494c040a1so14878425e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Mar 2024 10:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711733087; x=1712337887; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OhpY2/sSxSgf633Uejn3ClbyqlJ5glhXVmlmIc3u9NE=;
        b=dH5/n3Rkw/goQJ/YkhikssuRR12ZMnwDuI7LuFyIw3aDuu99UX8PCbXg66rorVX3YV
         QKUGaqEEZL1LhE3gad7Vewvm9xUY9yvxBreSdyju/vjRSi2nfEigcOvEu39uXXCrhbmY
         Dy0lmKXv4rcJiGr9xGAutY/GlZbJxIJPaQ1lAfMK6M2mOlMsUAHiVakD4reWj1HOcWxk
         9wcpYuwuE9lBcUkz656WtEjqWg7P044wq+sOr++7WwFr92mOT/bRy+18SkOuvtB70ytU
         oXSSv4kYMCqXbY6J8LFlOUsAgpqKMSO6gG2QCuHCEicF/8AOmAz5KK6S4LQa8TdGpdF3
         gDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711733087; x=1712337887;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhpY2/sSxSgf633Uejn3ClbyqlJ5glhXVmlmIc3u9NE=;
        b=mzDSmrv4v8YHby6LjFlSj8kQSNZX/tb/V1vRgad6wqOSq9TcqNWUvudphialMXafQX
         2QKV4FR+IVtCS2nVcAr9zbbHBnkp9GaVYrFsYXpH4UoV5kuL0oX5Ty57IAiWmfBQDDmL
         VTqnLYX3SWd07ehyoITZ1jLNii67EOgzMFiaajEO+C2vkAGK62UjelFY+2v8zKeVcqTx
         +WebWx9/8mgOISpM2AeGob0jHz9mBTgB8FELaqxr9ZUfja03gxAtJacJttsOV/uWNkZD
         SbeMdFBnCQbm2BwPYIcIzuN2026sPxaEFGJfZ5LJIIRxHSlffuBay2lJ9qKELeEGmCYz
         XE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSm9hbK+1xYwA05ghwBcj2mQzV+ffvmbu/4Wo6wY/tZDiflFzKQRrWZqW4bocdQo6A+qdopCNPmCXrdN4cxJenR16arKlnbzpAnA5MnP+5IT6q
X-Gm-Message-State: AOJu0Yx7q1V04IY9jMGImMHSCP6LMkwf0uPFh5QyUMiVROESOsjSZi0C
	U1v+xUWvQ9qx1XMvAl2HQ4GWlZyMKyxMoFKM6Xy/oPzPToixFILz3CtyNaQwwJ4=
X-Google-Smtp-Source: AGHT+IFEO2bOiupeq/1rDtRC/aMhJZXwmO7jnra5I7uHBa3pijFH7CMrdcmvi0s373UtBtHjwOFsDQ==
X-Received: by 2002:a05:600c:3115:b0:414:8e02:e439 with SMTP id g21-20020a05600c311500b004148e02e439mr2287942wmo.5.1711733087503;
        Fri, 29 Mar 2024 10:24:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b004149543c82fsm8491069wmo.39.2024.03.29.10.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:24:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/7] mmc/wifi/bluetooth: store owner from modules with
 sdio_register_driver()
Date: Fri, 29 Mar 2024 18:24:30 +0100
Message-Id: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE75BmYC/x3MSwqAMAwA0atI1ga0KqJXERfVpBrQVlr8QPHuF
 pdvMRMhsBcO0GcRPF8SxNmEMs9gXrVdGIWSQRWqLirV4e7o3BjdbdljIHGoJ2qIK1NSW0PqDs9
 Gnv85jO/7AURoSI9jAAAA
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=eEGxfdcCTYxCSdsfWcOpsv23ZxFAEdyVBf/IME0qEwA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBvlWLp0DJFC/xhyQE8KhK45bNEoEr5kpWe8NA
 fcOQnb5UbaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgb5VgAKCRDBN2bmhouD
 1330D/9XTfkMweODfG2XrR3FLnaH3Zr2uZ/dY2eMyoYxEu0KTLG3NhhtuhezcWz7zl7D2tbB9UK
 aW6s/NpxvXHUfNdDOxG0VlnsxUBNcaAT2M0vixWp8+ZK8pdJ9Ka/vgijrEUSuspUWTnWhLRWaBe
 e+QuLQOk1A+uqpAc32pXtZu1WyMlyH8UGC7um0bX/T2d8UjEx9t8iFn6P9d2+YOnbnupzMULOyG
 OaxRhTTdxY51AfqxDqjpJwQvURBPgP56r0fLdLzbN2EihTvSut00JGGgHYjo7HkOBZYyNHmHkF7
 a5XAsxk235XYdMgeeXzN03hWgWPyVi6do+UVE6ceJ5Fg4JzCQHdgSdqfEj6hbDcWSo+SDggIU++
 v7zrmJk7V93QujfnpWpb9tH7Dz32/c1YZpHpeJKMq52lIKVeY1Uu5cbXKV9Z4CKNr1AvuUNe96N
 yIdYojpfGg5KNOo7u1fI9sWZ5CrbHBK61EYC11w90cdsvcX9gL7gK+1cT96+QLDT9lWD7OcRgQ9
 gmsRazF1JjIynVJMw4UMCMy+xgQUqJvwaHAFuT+FhyNLTc0tpwH+PHMVB4RU0c0v9XeCZ4ZuDB1
 Y1ggLd8QLzYOfE8l2GybSOFzwT+5sphcC/0RlIT8n0zrY2rGg/zlk0s0ebD1NnLCTbAFujltFLe
 qqFVa0e6yTfXaJg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_102453_044069_8E9C64EB 
X-CRM114-Status: UNSURE (   8.68  )
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

Merging
=======
All further patches depend on the first patch.  Everything could go via
one tree, e.g. MMC, or the cleanup patches removing owner would wait a
cycle.

Description
===========
Modules registering driver with sdio_register_driver() might
forget to set .owner field.

Solve the problem by moving this task away from the drivers to the core
code, just like we did for platform_driver in commit 9447057eaff8
("platform_device: use a macro instead of platform_driver_register").

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      mmc: sdio: store owner from modules with sdio_register_driver()
      bluetooth: btmrvl_sdio: drop driver owner initialization
      bluetooth: btmtksdio: drop driver owner initialization
      wifi: ath10k: sdio: drop driver owner initialization
      wifi: brcm80211: drop driver owner initialization
      wifi: marvell: mwifiex: drop driver owner initialization
      wifi: silabs: wfx: drop driver owner initialization

 drivers/bluetooth/btmrvl_sdio.c                           | 1 -
 drivers/bluetooth/btmtksdio.c                             | 1 -
 drivers/mmc/core/sdio_bus.c                               | 9 ++++++---
 drivers/net/wireless/ath/ath10k/sdio.c                    | 1 -
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 1 -
 drivers/net/wireless/marvell/mwifiex/sdio.c               | 1 -
 drivers/net/wireless/silabs/wfx/bus_sdio.c                | 1 -
 include/linux/mmc/sdio_func.h                             | 5 ++++-
 8 files changed, 10 insertions(+), 10 deletions(-)
---
base-commit: 087c142b2b04898c897aa77938d05a93907150e5
change-id: 20240329-module-owner-sdio-abd5de3f1d74

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


