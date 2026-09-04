Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4363DC79F80
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFmIb/8YvdtZL49BMQqQktnO00n+EPHrLzK7Dg1eMRc=; b=v6WG3rc/0vm3ESSA+S83xkqNbh
	JNsWczqSMxC0jWdPeNi422z62fgAuGT0JrYSGbLWwjeln0gRnXdEULT3IIReXHxFVZ9sAryXieNE5
	GBxFIQQBf1waJoaSM+N+BciasAIsLggkatPJcHDCOrKeKQ3GejR0Ncnf9EhjCTKfhxqAZFvI0dzik
	BIv9ixHNxEdMlSJ5xaPY4QLjJq3mMMyJYYYBL7t/hG0UVdqQBBbSo7BNcEuZUkS7JVXXpw63GcJ30
	xW449WPokdRIraUpKFrBH4UibTwK6QGxbzPF+AzNhQQ497VFouep6Ih+rxBAk7Gq8FXN9Tuic9Pzd
	O8w65pPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PWs-00000001QIW-1TK5;
	Fri, 04 Sep 2026 08:44:10 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PWp-00000001QFm-3gqr
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:44:09 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-398e9698a70so665796a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511447; x=1789116247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFmIb/8YvdtZL49BMQqQktnO00n+EPHrLzK7Dg1eMRc=;
        b=IFakvcIYdmmu3tOpr5d6ItCCCEtaI1Zh7g5BGclmN9KVrzTqQDqD4D8+Lhurde8SXq
         7kiCs9lWdNCA4qVduYUkXVN9CDHqzkhd3zvy9bf2lC05fRK2jf11cofBHJmm5EZEJvKT
         uJIyntbHrsh8tctDHb1YsqDxP5rYO9oiaf72I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511447; x=1789116247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFmIb/8YvdtZL49BMQqQktnO00n+EPHrLzK7Dg1eMRc=;
        b=Ud0PA0PepTUbx5akMxmyAOaudnYFRtD+ZDQyKt0iOaPdIk6BFpCxVk0z9pwpMZ/6wc
         U3hLG2jJgD64A0ve7FHiMDu+yAJA6jlmgElM2/X6Txy2fH4bJJyoCO4Lo3SRHcc6KvHF
         m/7iVyUrwsz8zfkCJoYlKvNhGOyTq93YcZTdWO2A6uWjm68A/C5iH4skWHptWS6Mowc4
         hyHwQQ3DhbkEnV8wPNZKnitSRRNQtIdG2RQWJdBcUCGRidxlvAoRyL5uYWX0IXDRD1PS
         h7UYU8bNeXHdy/E6xnIwsC6wUiYXGEQViS6h2Amq6bDE2QtSaAaghLzDIG5YneQo0sC5
         e0Jg==
X-Forwarded-Encrypted: i=1; AKwUvBx5Q0YkF6YhisUfHeINnUozv29T7qWg7JJCUZRBoo5Brh4uJ61YqGsaP0iXFw2EBLHZPVFVTSC4SFcdH7ZQpw==@lists.infradead.org
X-Gm-Message-State: AFuF++nn6xt4RExCzfXjfygMcSQ6mhwebge0YGsKIVlnlWZhmfBs+/0l
	+CHXZgBkmyGqqi1mSjYnff6yX29slH1CUCebN7uH9tQyj05zINNnl8zodx9vSwGhZQ==
X-Gm-Gg: AYBFou3TSclQWYeuK+FptWFWno43X5EtmdoOPVMk/oQGrV6ekKqf0aPQrI1ihCfLbkd
	5lepDUke6o3z8zSJYEY4oSBwKjvf9ku8M4p1XeKDVh51/cI+URNAIVapNS+v5gupvICFWI+U4q5
	byg+wT7l27aqokKsIJp2thty9m/8dgSokHkk/1JV5UqWaZjs8IDnDpdEBZuj9zWyTi8beq8EuWO
	Y55M1LxAcN3MdlYnnFZcpq3W+bTx1h6oUljshzTbNTAN+vJ6BxDc7vjDEcfYDi3HW/EuFmMm3MO
	N+fG3Ql96+IE8vuZLwKui+meBKCQPBGMQYWOiuDxbEcro9/pwfFYfY5WyL+bZHb4FLBbtzvSBw4
	tlTY3G/d3y1ITYAuGW57yiZd+CtJnsch4ggOzgXEVK7/dkw5tHZXQN9TLb2XFmQBRwykmuZfTDM
	JXww48tGjat5nGz0p4Ko9RqrbCWoQjlBa8NgT9gPkv1N6x9YfbafsSvIwcE0f47eef/9GavYddm
	yx/I7JRi+37q1opSwFdUI7lVVO2ra9M1WQUTxazRKef
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr7127157a91.25.1788511447090;
        Fri, 04 Sep 2026 01:44:07 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:06 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Subject: [PATCH v8 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Fri,  4 Sep 2026 16:41:48 +0800
Message-ID: <20260904084158.1341550-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014407_920435_443E0E43 
X-CRM114-Status: GOOD (  12.11  )
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
index 1b891088a653..b7991eb53197 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -976,11 +976,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
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
@@ -5440,7 +5437,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.979.g7e5102b832-goog


