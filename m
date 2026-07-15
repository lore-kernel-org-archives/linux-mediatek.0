Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD69AC44508
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PR/rf/FwXUFRek4b9eCK6DZXZyozjvhZuepJNtfrJR4=; b=PL3hCWZw6BmtUcUIS+r9fm3xY9
	10CWKIk+zs+hcaQQCOHBwuNVEVzBYCQjHsgjvMAW1UNEmEuzag0y12saNBSJVRXyihUFLQ9Ex+yeK
	Ak/AxVNlHlE3Jo+F6gUChP0nZtY+rHIqaLdOdCFh7L0TSTGAmUtGvMmQZq6BTL6pnVQXwSrryXvt5
	n8nFBPHG9DvCcXuRgVLBGTZXG77u7jXkCA81B/gy5wD2HZb64+nAOpRtvwQOVn2yjfCYN6YHCIkAR
	rAqMN3gceWCBxIkDeNKcP5cCOnX/E64Lry9yWb81dZA4yQQ5TeIL/P9r1JJycdMvMeb9AH5fGha7U
	dpJ0degQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOA-0000000EDgk-2aGn;
	Wed, 15 Jul 2026 08:54:46 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvO5-0000000EDZz-2nup
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 08:54:43 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so1846560b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105681; x=1784710481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PR/rf/FwXUFRek4b9eCK6DZXZyozjvhZuepJNtfrJR4=;
        b=bes5tvMeUIs+alm3kRRupRj5w7ICp4HcGSfXMN3gjmPSIaBECmcXKHY6nJdlPU8zVD
         trf2zYF9/jD5BX865dEgNfGhRCQeb0ds1zyCI6pJcCBK2xHYjI6YxdhfGRcF0cf4b4/R
         ShXNmK4guC9X37+EhpZcHyfVOOLTjPVThNuso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105681; x=1784710481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PR/rf/FwXUFRek4b9eCK6DZXZyozjvhZuepJNtfrJR4=;
        b=dmtKXTHjZt7jetXOuYO9bk+PdJK7Rf++PueNLXd0RkbkPZL6g3t487D99PJHhRsvgs
         C7ZR7dwcL3VgkFSe38UgQixDWLJkjfhXrMZym2NwzNWeSvB3fXqYQ+qqnvfnRVoU98IZ
         qskbaCh4XbgmUy+ZYLxxjYPxB2W+VgJZacFy5cPLK/TREEz5faNpRWv276vqlqXamlkJ
         VLa5fHnjN3KWuVx/N/rxjVrlbe95cSon6NIuAFTdDtjGupkngVEtrOLClhhwMRWjLHW9
         HkPUpWO44ZRH0lLVkP/wwyqywxpcGFvA2yFqiqZY6bw9er8aCTjpg8QFxvVvGavfw7Jj
         bYtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnSrzQR27vnavRISQ4IjQyZqLRmd2xyQ5n+M+VWyTk33hnrn7hFqIkX1+wB4IiK1G/J4/HQJkyOApDlBchhg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6IDNvKMJFZH6J/ZlNbPGEmDEr8GRUlJydpU3bbe+f9OgALNga
	nnrTqVoAH1dJo6nboWd9/IAR4D6MkB3OrUYHpYeAGBt4lEOVY8FS5VqTiZwS+VnMBg==
X-Gm-Gg: AfdE7cmi9yUSx8wwWduoMgOZqV0/XVp3TiVPJCBuQvWLsMn7raBvSGFm4+9+L0CdUmK
	VcwRFHWrs4wA1/9YrVSCk+PasfnEPt6SUJnGDrNLJ7rO7eFI4Lgq5c1RqeAFqWqyKt2gtGgEJfe
	7lx4bkbP/kaZtGxlG220UoG7bahYn8eGtN08/W3+5B+ty5LZBhZbj51yIv5MUA3OJQQrrp9Lbbz
	q7d2DfbEVkXc1eKHFXbx6UvLHxLvurLey6WmWbEWcmgEDUWPw6qMNQhc97PVPlvql/7RI06exhb
	JKdsdufSUBdDwI6GlJMhd9DByDJ2lnCkb0TEj/wNhWNPQt1lCRAIg1ckejS303CYXPKVrJM2Q4y
	WA5R7km7g+7du+fNCYPrFzlRYjanCTtjeTlDzDJ0h/P8iFJeMENqUCk70XPob1JJJdbT4t5qcYy
	RidGjNUnC41mGCyacyK2rJm72RgmLt16wQy6dcoE7A1thj9lCvmKe/7QkBMYfxU0zHU7SpdA==
X-Received: by 2002:a05:6a00:2384:b0:845:3033:6cbb with SMTP id d2e1a72fcca58-8487036fc99mr19629780b3a.11.1784105680847;
        Wed, 15 Jul 2026 01:54:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:40 -0700 (PDT)
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
Subject: [PATCH v5 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Wed, 15 Jul 2026 16:53:35 +0800
Message-ID: <20260715085348.3457359-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015441_739809_B425704A 
X-CRM114-Status: GOOD (  15.22  )
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
index 36342c5718bb..a260148091c5 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1872,6 +1872,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2003,14 +2004,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
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


