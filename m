Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F7FC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZO05xNK1Hbq+tmP+bxjD79MnCLqnvQlOFToHRwo4P0Q=; b=CL/pWoKdAkUWj2PLXY8ll0sr5e
	oH+dQCBpt6RC5qpfmZtsQKjwJAIlmrT8Lp+R0v5dlRNwub8nqEV6wH7PxxRz8GyiXZOA2VqRKZFDK
	jj6KOTRmJwqZYOwvwRStRRHfrLhf1Y/m/tI2tsWM6S9MmxvDnU+x/blUqQueZC6Cgp1hWW4BI4TE3
	Jz+KUod3ag02N3+84O6xYX8us1oWs+t/ZjIXqlp1kwuwjuRefsHIxrFKTbJirTy5LQmbpKtFnSUS+
	CT4GS+kVe/2F4Bze8cpKQko2a9anM/l+B/lJt9sQoE/uihk/DSuNzAOaowC2+zHLa7IB1ckAmabtX
	HDJBoLtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlW5-00000001p31-0mbq;
	Thu, 09 Jul 2026 09:58:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlW2-00000001oz2-2GFh
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 09:57:59 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cad225673bso14662085ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591078; x=1784195878; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZO05xNK1Hbq+tmP+bxjD79MnCLqnvQlOFToHRwo4P0Q=;
        b=JbEJVf6OLQXW6UlPfgtbTKUDSOgWFtzN//NG409OSkqxbKMICsCsy6zsM5gOW45vbw
         q60Z6qUvFsprHDck8rv3xhLPnn9tbZiIM2GLaOfbUo9ix22QE2SV4LM72r55mEmsKeBX
         abPvBiDqjCeEsP56ZFM0brX8n/38k7tPAAnOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591078; x=1784195878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZO05xNK1Hbq+tmP+bxjD79MnCLqnvQlOFToHRwo4P0Q=;
        b=Z7x+vvMn+4UaPGp0OBWhcTMUSjHyy0jJmKvsOd9HyYKRJQ3KuA3LqpACMtVOkezjUk
         rdBIc60FznyqLPvm/DZ+EQrZqZ+1S6h/7XI0OvEeJzS2D7GhJaJzG9ap5zWvSo/B9G46
         QPBcd47twCEUQwBkAW7yy3W1lCvkwQ8murO35b1pDNKSXXjEmyfhbG87mrylPGgVFTV1
         5JQVjvdjVfDWyV31ghoxaBI8TfR2cdzmyJ6Gxx+29anThyUALDA8yHBbJzenBcHrd2Oi
         q/RMgoAxnhThJ2Aca4FtbImj/ydvmycKW40TrtN51/3HnvM9iJF3EU9fOJiDIxR2CjUt
         aLKA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+rv2d+9Bw6Vx0Nqn3QbsI9uCurE6AEqlwvIUfnRqvHPMOQHBq8jEX9R2mqIO7QaqYhTu8hJv9CQv2elqZnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHLjuZhDovlDc5o1A3A+cyuIagQ3AX/rsukJelRFL25mrZbRJW
	yHJk/RaoN4rsIObya8euAIM2UFfznmjIy4PWsNaXDeY8J96vTA9K+2s9GJ+tJ5iOEvobIXlDeYj
	I9Qg=
X-Gm-Gg: AfdE7cnJYt5DGj/MY1HvvXQWxKXWx4k2XvbBW73tQ2rVBNYrTDumKr2oJ21/xEC5cqF
	earhT3k+0SZggY5nFX0NzTCsu9qtn2bqKnrt8UCZWuZhNlIr5T2EkO2jNvkJRUZbSoYz9pEnDZF
	2/bsm8kyG9gnxLNhCJZtc5eM5GqUp2z5g25M/sPmZ0nw0wz4J3cVj83vUq5/xbtpS2YIrpH2kjq
	Am5b5OIc3uhtWCotMsagJVBXnVSyy6v4HmeM8lg/fTf+a9I/4ey6gdS1eQghCw9olRTioEPbftE
	VMeMCq2dks6b5NGwtsjHMykn8BSeK7ipBktLwXxrmr6ygb1uEt/Nn47gtu3NtqXNt7DMdFQynxA
	zeQB0J8MbF9MkZSfJ6kAJKZrxWOUB0nwTEkIWX7/WxataITo9FIMHYFtYRUaK4olEI3dnxdSJdI
	4vLigbSKShC3GVkFBtSYnv/ZG05X5lXZYL4D4jOFuEMq6ASadP+MHLFX8iAUuAu45RbBp4OQ==
X-Received: by 2002:a17:902:e78e:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2ccea1a4d4cmr66175845ad.0.1783591077993;
        Thu, 09 Jul 2026 02:57:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:57:57 -0700 (PDT)
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
Subject: [PATCH v4 04/14] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Thu,  9 Jul 2026 17:57:09 +0800
Message-ID: <20260709095726.704448-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025758_606098_F974D711 
X-CRM114-Status: GOOD (  15.43  )
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

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Also rewrite this section into the standard error handling pattern:

    if (error) {
        # handle error
        return error;
    }

    # do more work
    return 0;

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Rewrite into standard error handling pattern

Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 13264e86bc6d..fe10d72ef39d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1874,6 +1874,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2005,14 +2006,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
-		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
-
-		return 0;
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret < 0) {
+		hub_disconnect(intf);
+		return ret;
 	}
 
-	hub_disconnect(intf);
-	return -ENODEV;
+	onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
+
+	return 0;
 }
 
 static int
-- 
2.55.0.795.g602f6c329a-goog


