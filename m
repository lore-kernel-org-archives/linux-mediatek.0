Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD59C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NOayELjm3/+NeKg/MUGc6Z0GBz34hjktNSI4aLdsWw=; b=QOqpGsWN+EceWxJKUNDlQpOsbq
	hHOghQeCuYvTQiBRGszFqaTfPMagZhqiYFIlAvLVEN7Qq5/8e4/quY/AlSLyCkDDUnqYqPYKaFK1Z
	a2MNXo79DAioqGVWKJKB8KegyVt115uIvnZZvLvjIwvHWz3C/extnu2Hcq6b4WaETrseQQo2mtW9k
	denwkhdfXsCdZiLHYoVYCJCNEtcjaQulGdm19ru/xnnHSR1rV41un+pTi0qSvjZe5wTD6qHSM2N62
	k6maZDJWKaR3J4gn+Iypc5MzIIDlnY2oPUSlUDoNxloPKmyGxmaNty5u279X5aPSVMj15gODzxHdD
	ieTpq2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWQ-00000001pU2-0jyo;
	Thu, 09 Jul 2026 09:58:22 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWN-00000001pPy-1DmQ
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 09:58:20 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso16600535ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 02:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591099; x=1784195899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3NOayELjm3/+NeKg/MUGc6Z0GBz34hjktNSI4aLdsWw=;
        b=Ztdts66laL/X9JLSFiSdra5USuwid7TkcB4WMH4brXZk/yr/MgpAQ8lzhKn9TPvR/E
         XAPIMXaR0BfnoZZ+fELB09QMwQ/MPx8ySBdk1EBv9aOtnk5gIJZ/MkZsqWz+zHJlkcBk
         95yhLQ8x7OZnGI8GYZMGIypA3IUU6wuCf3yUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591099; x=1784195899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3NOayELjm3/+NeKg/MUGc6Z0GBz34hjktNSI4aLdsWw=;
        b=rpcuyeIJMs5VMwb9la5rBT6/2xuWZdrhCt9Gv/BQBH417BfDRBm2p6o1JTBWa/QmV+
         KFbE9c3Zvm9a/lMAznWGdl97Fi2qWsYjEtdu5nXWMVFjqo4TgWShnkQP0KO4i7K3DT5T
         cQ0IorizoYtpilK8sxc/s5PgJBpgvtv/8eOlgmOEiTLMjuNsBuKZLh4xQbai/QH/BN8I
         h/HKJ/klBVxTNlwQiF/L6oAav5iAbu8ef/UupI6OrQd0fUpghA5QNzHvE/GKHsXVhP1x
         4wIGJ1dfOJXm3M/1M9Rvm5ockvEXMhUCnbZidWCvkth0i3j81EFqSvLThiZ3GMgehKHP
         Ge4A==
X-Forwarded-Encrypted: i=1; AHgh+RpNZKUNgpv90fNayW463Uk0bbIzisw6+vP3/9RMg1TD/BO1LkoxHYpdMijLlg3gD/VLAK4RcSqxlQ11Ba6vMA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6OfuYfF1g4fio0hfSSk64nCybHDreEq7i0Dd4EDku+jBHeovQ
	b3gtNymB5+0wDTeeW3xHcdjsXhRtrgJfAYQ9JgdcE2D7tVg1V9qeqfBy+zCZYEupvw==
X-Gm-Gg: AfdE7cn/jul72Y7IrM1iKjA+zTxA/1nBxRWYCMT6WzCaW7q+Q37c5FPSOm6YJVpL/R7
	ZEd5Uvp/lS0jVgYcVNhdwlwFlPFCgFWMZZ9VbKkI0AmZtUiCaIWwNdmjZ5O+nOUl5GI8Ps8xsbE
	wbEUWOuZQOloo1HMxyh5BWDiob/ezbxJqTL8nIOjaPG7VOb7hvVvuCJ66flyW7KhajmJIoY5T43
	rx0vi8rn8bqPGFx1UENImBq+N9SvXMxCUVFcXEItCRp+e+Y4E95BOIRxpqH12CBxHWidRUxPnx/
	87fJdxajvbkWennEJ+JqFT+5vE6EvntnhnwQpP5btagwkv3vRMGGWHpfTFbemM5R0c11rtvLS/4
	iAanCN6BNSBUYyR3m3IuiTrThfI7Cni9Lj+8kwl2uDx/hTvJsaP//STAsgIZ7J4u7m4eKrU6f50
	A9Xkk1gAVPbuLRKYFUSDytjvLFXupqfLiivDg9wqeEv+B1VJLampYEXnug7QlFB8FAynOOZxmE4
	TpQxeZi
X-Received: by 2002:a17:903:1247:b0:2ca:eea:eb5c with SMTP id d9443c01a7336-2ccea373170mr66966485ad.18.1783591098706;
        Thu, 09 Jul 2026 02:58:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 08/14] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Thu,  9 Jul 2026 17:57:13 +0800
Message-ID: <20260709095726.704448-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025819_337331_A656E441 
X-CRM114-Status: GOOD (  12.04  )
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

There are still some instances in the USB hub driver where port power is
directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.

Switch these instances over to usb_hub_set_port_power() so that only one
unified function to do this exists. This makes adding external power
control with the power sequencing API easier and consistently applied.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index c7fa73673582..369280a217cc 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -975,11 +975,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
 		dev_dbg(hub->intfdev, "trying to enable port power on "
 				"non-switchable hub\n");
 	for (port1 = 1; port1 <= hub->hdev->maxchild; port1++)
-		if (test_bit(port1, hub->power_bits))
-			set_port_feature(hub->hdev, port1, USB_PORT_FEAT_POWER);
-		else
-			usb_clear_port_feature(hub->hdev, port1,
-						USB_PORT_FEAT_POWER);
+		usb_hub_set_port_power(hub->hdev, hub, port1,
+				       test_bit(port1, hub->power_bits));
 	if (do_delay)
 		msleep(hub_power_on_good_delay(hub));
 }
@@ -5436,7 +5433,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.795.g602f6c329a-goog


