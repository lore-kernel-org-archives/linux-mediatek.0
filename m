Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662C5C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFzm6a3OkT0i9mJjLjkWWJLXNlo1hESx6fgfPVhA+Mo=; b=D84ioNc4WEWIXL2PjSBiallw6P
	IghGLi7qIpCmCPDqXlk4vL0LGQOZZeDMnQrpAzwBabyhsJ0c244lcVX1SSdS28xqc4JC5cfBuaPd8
	87W58bEwXXiyQ5yuL//WgnV/aOXwMIHq78xDs+DzdKi2vE3XljQQ/U4Xl/s57vat/yLKipLIp1Meh
	WOHqSsRPmQw/8NerNBIY3qrT9d404wN6NLhZugxzoERdDugnUsUQ7u168L+13QreX99g1gI9rVZ4v
	ThmASNYeR1P3juWoTNIjXm43mtXxHkEYPEYvOTriRpff8qw/0y81Feka+JKTqCLSVdoTpETU8Y7rz
	qwgmYhyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyY-00000001SkK-20AA;
	Fri, 29 Mar 2024 17:25:10 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyH-00000001SXZ-1ciZ
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 17:24:56 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so24623971fa.3
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Mar 2024 10:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711733089; x=1712337889; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFzm6a3OkT0i9mJjLjkWWJLXNlo1hESx6fgfPVhA+Mo=;
        b=lBETSi4qyxA8CPO5Gno6Z5yUgO20lFLj+EcR53K5gadZmJ4TyhKOMJalYXsw6+70a3
         7cAz9QIzZRxfciNMjuYIcfyGVtMfrqn0lnj7iR4ayhIqkvPSwblpZJi5yBOf3hFHOGMK
         lc/1xrnnvjuEeGsCzzAZq7H7KzO9r2KuqsaNWTgMqBNc20HiysG8o7b9YAU87daE6AUK
         siuF2UoQDNQKH28AGutzI94SuXzNBaHwvyzUqrsJEYOKFtdJ23m0dsB2e8Dg95B/VluN
         SLBs6kmCjWVPuozCelKPfVlgb90l6ZgukhfDojcks77kBR/zbfY/jLfmryvljnmYjUHw
         JxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711733089; x=1712337889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFzm6a3OkT0i9mJjLjkWWJLXNlo1hESx6fgfPVhA+Mo=;
        b=byNC3gSnvdaW+nBTBATou1iWRHl5qZ7+JVPHdDc9yka275XPQA3jhd2GcIv7sEgpWc
         kn4dXDP6LWARVaOKp5oKpfi1i+PIaO5MVtr9UDtXuvmzHBLdnrYm/1HdIxb3ZHf7fEwg
         PNttcGQ/J0IeVQASQczprhwx7E/iYnCKBnENvM39zoXg3dhtllnucueCLu790Sa6fgp7
         kJu5/P0z/USOStX3E7zaNcayT1SRDuKGMF2rX5XC4txIecFUHGHyJ3Y2JjpP7dVye4zP
         zoN4dlMb4nVbhLF4DIDCZUj9C6Immj6ipfORFW5j3XQINyDI6se67/9oV77NUF3vPTaL
         B7RA==
X-Forwarded-Encrypted: i=1; AJvYcCW3M9ZuQMga/6IBrGVOIJ7jdpCQ0K3whjmIYuYqas2q80Zu8INlwU/UMVTELEey571uH38EX5a5FemLBKXO8UmjSOiuN4TxR56DyfXXs3A67Syo
X-Gm-Message-State: AOJu0YzyWupWrGlWjjhwYD0BADqs9JF1xVONN/q7t0khkUdsTQX+Tykr
	+HKvr6XjWXojN13/sefH6YtfWJv9kyEpILW6tZUW2aczjM36l7Tth/Fq5aJIjlI=
X-Google-Smtp-Source: AGHT+IEvlw0UDH7tzNTWU9VGLGTzRW3UloZfuSRTHRpoMppAqvCzJhzmyXnGRBdjVA8i4o7Ah1qRHg==
X-Received: by 2002:a2e:aa14:0:b0:2d6:fb69:114e with SMTP id bf20-20020a2eaa14000000b002d6fb69114emr1610147ljb.21.1711733089178;
        Fri, 29 Mar 2024 10:24:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b004149543c82fsm8491069wmo.39.2024.03.29.10.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:24:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 29 Mar 2024 18:24:31 +0100
Subject: [PATCH 1/7] mmc: sdio: store owner from modules with
 sdio_register_driver()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-module-owner-sdio-v1-1-e4010b11ccaa@linaro.org>
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
In-Reply-To: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2435;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qIRA9OHgdR8YIBTlq3gIwcNOO+uS8S8xKPRXlpB/umk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBvlXjkx37wyBAQGQOT6sB1E4cO+yYNWsO5eLT
 rZK/pkw8gKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgb5VwAKCRDBN2bmhouD
 12Q+D/4r2bAXL0I+Rva8krUxwDKONjhLy/RAdoomv1G8VLLxgxmRMOfpm1Pkxfo9yTW9xR0MrXU
 F0kxQO2ER7mBPNdakHZtypI3ta0tuqVPymL4CPLM+PlkzV+HQeerwPcrRK47nag4Hp96k1+UihU
 2mXL4J96PzaFw1gUSyVp0R/qXXbnYL5mHdRtQODuH3UKrGles3CpAGCcNNJ0IbRGizylng4Gydd
 P83OjP3n6MPDstQzggysCFJ6SwZ8Xfwx3KGZdIezOx/iHBAKnezGHYRbaM8iRTkVQ+/poTSmkMh
 IKPK3lqz7DlsykQ5m6hW5ON8FKt0wKzepa7yR5dG0z143oWXLzCGrQXLaclD7preMMjprbuyDpn
 pI/bzPvl4IsP9DPOXQZP2Zs26nJghFSH2i/U6awAMDC2p6E/fsf4NVw+OQTVm8lkSStZDzV6/Re
 7mYjBBMVt3wMA4PN7Gc3uidvAQyYOdEDQeS+iUSlpLZ3V8b9QiiU/QGirxRmvpNHc3rr42O2XPR
 zJWsf5wVpTTlEGkl4WojuuesQzHs7Pp5xjl2L+GfiQ1vLypFxr31wnjMmqUTbHfhH0SWKcA+jke
 SaIstusD9D1XQLVDVaUEowVbTM/223LViZ8CIY9saoDAv5BwcQAVxH1XFJA1TkLrg+GybsqZ3X3
 rUDwGILZTCIgEyg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_102453_516329_E0E6F25D 
X-CRM114-Status: GOOD (  14.93  )
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

Modules registering driver with sdio_register_driver() might
forget to set .owner field.  The field is used by some of other kernel
parts for reference counting (try_module_get()), so it is expected that
drivers will set it.

Solve the problem by moving this task away from the drivers to the core
code, just like we did for platform_driver in
commit 9447057eaff8 ("platform_device: use a macro instead of
platform_driver_register").

Since many drivers forget to set the .owner, this effectively will fix
them.  Examples of fixed drivers are: ath6kl, b43, btsdio.c, ks7010,
libertas, MediaTek WiFi drivers, Realtek WiFi drivers, rsi, siano,
wilc1000, wl1251 and more.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mmc/core/sdio_bus.c   | 9 ++++++---
 include/linux/mmc/sdio_func.h | 5 ++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/core/sdio_bus.c b/drivers/mmc/core/sdio_bus.c
index 71d885fbc228..c5fdfe2325f8 100644
--- a/drivers/mmc/core/sdio_bus.c
+++ b/drivers/mmc/core/sdio_bus.c
@@ -265,16 +265,19 @@ void sdio_unregister_bus(void)
 }
 
 /**
- *	sdio_register_driver - register a function driver
+ *	__sdio_register_driver - register a function driver
  *	@drv: SDIO function driver
+ *	@owner: owning module/driver
  */
-int sdio_register_driver(struct sdio_driver *drv)
+int __sdio_register_driver(struct sdio_driver *drv, struct module *owner)
 {
 	drv->drv.name = drv->name;
 	drv->drv.bus = &sdio_bus_type;
+	drv->drv.owner = owner;
+
 	return driver_register(&drv->drv);
 }
-EXPORT_SYMBOL_GPL(sdio_register_driver);
+EXPORT_SYMBOL_GPL(__sdio_register_driver);
 
 /**
  *	sdio_unregister_driver - unregister a function driver
diff --git a/include/linux/mmc/sdio_func.h b/include/linux/mmc/sdio_func.h
index 478855b8e406..fed1f5f4a8d3 100644
--- a/include/linux/mmc/sdio_func.h
+++ b/include/linux/mmc/sdio_func.h
@@ -106,7 +106,10 @@ struct sdio_driver {
 	.class = (dev_class), \
 	.vendor = SDIO_ANY_ID, .device = SDIO_ANY_ID
 
-extern int sdio_register_driver(struct sdio_driver *);
+/* use a macro to avoid include chaining to get THIS_MODULE */
+#define sdio_register_driver(drv) \
+	__sdio_register_driver(drv, THIS_MODULE)
+extern int __sdio_register_driver(struct sdio_driver *, struct module *);
 extern void sdio_unregister_driver(struct sdio_driver *);
 
 /**

-- 
2.34.1


