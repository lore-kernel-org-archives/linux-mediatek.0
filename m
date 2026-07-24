Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F090EC531FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 08:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=; b=ecfyhcWuUfpXifHrf0sHnb4F+R
	OZOdbZcpd8GDOx5VGoisdSoOqd6BW0om4+3u2bBBvaikuWuwFv0l2ONEzB0IIiBoDlgb2TLgVtOtH
	HYyiRol3WQDPPxxdHJDLLP74ZlY3qkGxylIeQ7OUhSXyXz/WOZlRQs1zJZC5uTNKxq8u5B9B7XTD7
	eUl2WPdnYmj0d907J3LTeDPJPITJCN/UuW2gto9zZegzRpOl5YvYZ1g9G7ARWR1A08JiEKnRO0JMX
	p5xRGxNo6smbLj0Z2msclu8WjixnlR7ultNFtkMu3whDt1wpTOLNHys9Ee3+0onpr5NAqtyEOjbTk
	km54EAxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWG-0000000Fqkd-3len;
	Fri, 24 Jul 2026 08:44:36 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBW9-0000000Fqf2-3JJE
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 08:44:31 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so132106a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882669; x=1785487469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=niqVoCNCb4miM6Idg5lVXjzOnFwsAWNkrJMmtumFuROlKw+JQkSG3xFX1mo+3AWkw2
         0Eh6POCc5uQjZaDWzVFzV3h9pQII6vMgTevbMxEn4fqtiJlsP1iwNpZlwhB1QnSFHsAp
         6iimy8foYpEFNyOLq/wqyChnT/jDtTkcHgusE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882669; x=1785487469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=MhTfp9hqx/cGuwgf15UJ/iB+KewZGIC3JMPWOi1aOTdsRbt3TURF10czm9DEYCJ1Ve
         NoNe5C43FuqHnigIdXVt/hiq2pdVlh/C8XphdAoygw9LCNcnt2gG3mBbxhtjgRzzotvg
         ki5aOM5saarZQGMrqT8+cUtxWLxgu90pv7fZZH5HzRkSrmFE75m3S4tKB3dYcO4TjaNw
         guL38Tq3DPvX3GhCLnq+CpHiclrjkj/YMfBVRRc5NbyEEJ8BvZ14eHzjQt1KN+EPqy6C
         MRvzGu1JZX1xWwV7YAmqUUcKlTDIh75iW0NUCnstPEGJfm2Bj9dwZ2VC08DQNWIZscXI
         tiXg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+4sQ9Er0r94/5PX7PBhy6/oulZ0T7ULrT9+oFm4Ue7LvYbE1Iw7UJ0FC3eO20yfwGl5+5k/nt/HCItTSdAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHDtCsMi4w3xiTHKIbenzpgWqm1t4cytkT7rJBRaNXU3Z/qUac
	eC0p1mUvxyx+tU2zOaqo2AQzhlwuZqB9WKY90rqkDNbbj4kvSGdvhhkkIi0EAhujvg==
X-Gm-Gg: AR+sD13v6E5/kg342/MdrAcPi5M6/GCvMq6iQqpeK94bgz7Wl2WtbkofZBHx+XcHrmh
	djo+Ej81JKYQd1gLa8uAHE53dyQFiN3FYq8MCP15Nt9+oS/e3JcEzy3rnlayWu/cpA+HP+v/9KG
	zah1xeQDjSmKjTkGI4ZZy/Q8Q2YRYtgteSjNCNMfIN2D07P+TiDA91a/smle17w35ZirKC83ueY
	Rf1jYtsmOBuU+XIzAOJ3lF6gM1x7GTZoIHQqA2YCRsiPbWfy8HzSjvzwov69COPIje4toJRUdUX
	8XtWREPgzSNnzUCjqo0mROtsZ6P/QIReqc7MW1HTC18he9vPA21mEuKxiT/WJqcnNPhRkk0JuRE
	A/YA+JER2iyfU6zhcDaCdBdEDZviWUA46DYM8T5V1lg+5aZJAJKaQDfPlue5ccicvYSJDARS0ls
	A0zXSkLWb9y6uS+HGuUxFocg3lVj4CN6FhxZX2X6uF2MEjyekt/3jLxN2ejhg=
X-Received: by 2002:a17:90b:2e03:b0:38f:1f8:1fa with SMTP id 98e67ed59e1d1-38f01f802b5mr3474310a91.15.1784882669036;
        Fri, 24 Jul 2026 01:44:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:28 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v7 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri, 24 Jul 2026 16:43:14 +0800
Message-ID: <20260724084328.3943997-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014429_869513_BC328337 
X-CRM114-Status: GOOD (  15.03  )
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
index 715f26f05a31..8f8624a0d36a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1875,6 +1875,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2006,14 +2007,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
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
2.55.0.229.g6434b31f56-goog


