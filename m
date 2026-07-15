Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A27C44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jC877lcIipbzPO12i6mSRmQx7EEzSrLJZiMLFWRppMI=; b=SZKQmhHCfU1Ehk37N86dCFTEDH
	J2xLp6ypgSF1aIN5jJQYhUbFI7IsI/dEoTneP+0U/1M13/v/4nUlweBcPhHqxh5v9ngaHd/rsIiY7
	luyfdxd32ZyI7D7JukfZGvHY4VM4nAHoTP8p7RBxhAuHLGrBJ9aaAAFTUGJYGLyELkUvb6iRE5pDc
	nfTs7YTq9ejIYRvs8TfQbMYowBuShjFYidn3kMpUWkr8017pwYMZ12FybZUWfQii+YK5SZxugZzml
	kNOQqQj8hqoTmECJWNd43wST3LGiLaEGOeE8gACBPOKfYcdxjtN9ILvjgErYKqhiCKTWWSpTW4uv6
	YqRE1UzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOV-0000000EE36-3mPD;
	Wed, 15 Jul 2026 08:55:07 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOP-0000000EDtp-07bQ
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 08:55:02 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8486ac3f347so445487b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105700; x=1784710500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC877lcIipbzPO12i6mSRmQx7EEzSrLJZiMLFWRppMI=;
        b=U4DX1olSGqj+alqTbEYOR5m1672oMJSaBlCHyI9n/59dMr5Czc7XBl4e1iK+01d+zK
         uPC6JG2Tf653IlpFtwYZq1psdqWvaM4gV/X5PHgHuyypf8NBzNWAJbwuandUu5PSqAWl
         JUchWoOHCuJweFZLLo8Ley0K8PsKt/WS9xKLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105700; x=1784710500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC877lcIipbzPO12i6mSRmQx7EEzSrLJZiMLFWRppMI=;
        b=s2kX56rMCXIP3rZg8oYboaG7idl10LiFetX3vJx4aWQhI0ICtIxNEW7coLch9uTedn
         ew1euTX72N9cThMis1JBQMa7qYEm4MXHWDiXRKZaD5KKvJTrn46PLinji53rBh2y3KMH
         COmkNGxxQ+CcBY5R/BTGPHEf0NGtlrqQlZtRhoxpFs7xKXoQ4h/H4PsfaDPu2iQvSuuS
         ZckhPw8ggdogyP5AH5Ea8PT61jySdQhUSyYYZNJldzazLJVsBeeu3s+PIQNNNGaD4tKJ
         WUpFNeiWnLp9lsZL5DmhfDyLjW6MPZ6//ninpdlIlp+5ILS9MJlJtfEg9VoFyFuLma18
         2qeA==
X-Forwarded-Encrypted: i=1; AHgh+RoOmmQVIZ0dYA8Sa/ll4ii4YYZ2jKPYDM3lY3WIOA2gogxfjBXEIr4GCmrkK/L1lQO4jV3FzgV536Pip8fU+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyH4p+hbn5KhpiWwHTCiQVd8EyX351K3iV0wgdiGzyT44vM8En
	4rVQb6cgrTl725KY63eQjUG8R2TVxe+giQvN41DBIKzbCLaxOBxyjCWtgKeFuylIVA==
X-Gm-Gg: AfdE7cl4a1+3Vp/Dfmie+tlc7lREmBOVDXf43TWlXKmN2Rc8wE5R8hAarj3VjCkUzuR
	a3T3usTp31xIzxrWC/8lkxBf1daEB7kwGArcfFs/+WVvgW0FRirEND88zNLhZ5UZO7krrkVGxbY
	fF3Rakw/+8e66/LXdo+tUDWQ8sPCs/S9ApnArJ6fkOpbThejD4iA6g/HCDTNZbFGX4NaCDunNiq
	ZLqSW0SvpvCKHmnmb2th8oxmSlk8plWVdEK2WycTPyHvu26UvPQYlhuybJA8Z19Fe4HS7OWFIYx
	B9NQFksqCZFceuAmyBnldJRZ4cZ9uLAAr8vMsPzSWlSmvtggsWFamkeazlqImAMffYzU7e/Irxz
	ig8V9FcfzyA3Tct/oLKAK4IkV3HcgX9BNHdHxBrtrDV34QNZYLoKIPKo/DNSAcWfZCgtENFD7x3
	DzWHyxyCywYDP3cFwYo7zd2nZkfftKNe8th9FSOfeKUHuDot0/jmqCaBWnZ2yT57xLwXqG2Q==
X-Received: by 2002:a05:6a00:3928:b0:848:2f58:e1e9 with SMTP id d2e1a72fcca58-84870790b80mr18374319b3a.36.1784105700341;
        Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
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
Subject: [PATCH v5 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Wed, 15 Jul 2026 16:53:39 +0800
Message-ID: <20260715085348.3457359-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015501_126666_9E76D67A 
X-CRM114-Status: GOOD (  11.87  )
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 40cdb63b5333..47010090d3b6 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -973,11 +973,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
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
@@ -5434,7 +5431,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.795.g602f6c329a-goog


