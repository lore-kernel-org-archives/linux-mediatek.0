Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDE0C4452B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xc02KBsQrd1xdK8Ho0VEf5G63Rz5XQrKjQwFcbcQ37E=; b=1mp4dJUY4nsmrsoRey/5RSsBSC
	TWFFvyfIOoUvqGwtlivUEstImYEcgG0tymNeE07gVvHWWaAxw97LyATn7NRzA+nsFoUftTsXy0puQ
	f9PFCBuUMaipuNVY47QkF6vtHulfWyX/njw+euvY5RG8Bkk6qoxs6u+3o/QxvR58Lobv/sPoNPNZj
	O8pkgTCHgH94f5FiIv43sA7SF2j60jiCQIvzgJ4lGOZjR/Jjrmz/r99yp72RuId/K9vIn2ihaTuyi
	7dvIbImDCTejyVzabS3+Rvu//8MvQvtbqMlEk32BWnRsqT+rhmGVhx/kRLjC2mqQw1a1YUshP8i3L
	hDir7rxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NX-00000008a9P-3txn;
	Tue, 21 Jul 2026 06:54:59 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4NU-00000008a54-1HbX
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 06:54:57 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so22146035ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616895; x=1785221695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xc02KBsQrd1xdK8Ho0VEf5G63Rz5XQrKjQwFcbcQ37E=;
        b=E+mkBftsiU7Rs9hAgcfN+Oqdvf9H685WvkxlVtHCu0xZMPoLzuh0Ug9ALpywfnE3Cc
         Hx5STbHLDePUQDljPBTczH289ByODgWjLgTgKF9OHaxm6PmtkhvuesAKCzSNUeh9pUQe
         ctB1JfhaquS2rR0koJYHq1oF4tK9xRo3De24Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616895; x=1785221695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xc02KBsQrd1xdK8Ho0VEf5G63Rz5XQrKjQwFcbcQ37E=;
        b=bo5+3y/bYeT1it59BkAnBylIRVvZZO30QiQk7A97kd4AIBUOEJ6/vv2dURtr58LEzR
         ShpY1r+FCOGZuBmKsWTp0x6GFFXQ8+Q1qMDcQcZ3n4ObrlM5+vc+2HDVKIcxQINQhbnl
         KIfHItq7X2PWhxfaC3hZe6Srvve6Ynpi8gkHCElivT7VFKQ3sBzAHfbL+/HCNKMQ8uEp
         qyNt5yTlDw8SvWKXHXEMFeJdn3IN9Y3nZmd+Imm18XQBVgdepeWog84bp6GRNfwLmyRp
         UURK+eqwNKzUsTw3c5n/voMIwz0Z4p8ffmq0zeQscOJDkDJ2PLBwrlhz9ZUgNBxEG+lW
         WKfw==
X-Forwarded-Encrypted: i=1; AHgh+RoQsfPNirez+2QXPomfkrqWluqRkDH1OrspMGZ+0vYzTbxpR8cj6uc+8SUvxKrQTxubVFi1og2tSh7LD4FrNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVtqGn3kq2zuq84R+o+OK/AQUlLWY9v+fkXEroAI0LqM0avfzS
	FNXFJ020QrAh5Wo3wuNnGnDoW/L9BUXa7FtSVIsLVREnUC0faucJHkeMUwWpqGOZIw==
X-Gm-Gg: AR+sD13u8wJp4YzMBm+vNoM67kQFIgE7y2FDIw0LFGg0ukx1p/glLe4hd048/K5HyMB
	MB7FVJstoId7Aj5jpxMnxHnSE33/89Q36JeBoJU5GRZP6uMvg2g+BucSX0PaPfkjbHEg77+7cqR
	68O3SpT80vbUhVq57mPsXva4euR9guvJGhhQiYm3+4XT7Xe2FWQS/GrO8PKsy7GlhLEcRF3inJ9
	t6nIYmwXrZnC3MftPpnYSvGkjMXsJtwX/EVa9VLzYHRuKJyEPODwlPEJwBu2tvUKPeq3kRHe38w
	c5nsLUKTpmkDWM4xZxMHaaRIfXn3XQymI/YuhodzF5yOEMEJjxfa5sQNXDs9HK8bNVkYLn5vylM
	qILSy4DdN4N+my4UaKYurxy5o1y4/e4L4AQLjQap/HIFvg8Q3oXNNmiAWyKEtT6XMrqBz2Gd+71
	RXg31I+R/aDhX01oVVo6bqY1qQRXOrWg6Gu8POm87Wel38Y0eQDL7cHi/Tk9c=
X-Received: by 2002:a17:903:41c3:b0:2c7:1200:bd7e with SMTP id d9443c01a7336-2cf3486b0b1mr185750155ad.18.1784616895361;
        Mon, 20 Jul 2026 23:54:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:54 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v6 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Tue, 21 Jul 2026 14:53:59 +0800
Message-ID: <20260721065413.2306137-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235456_358005_F98A971B 
X-CRM114-Status: GOOD (  12.34  )
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

usb_hub_set_port_power() open-codes assign_bit(). Just use the
assign_bit() macro instead. This makes subsequent additions to
usb_hub_set_port_power() easier to read.

This change does not introduce any functional changes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Attributing suggestion to Andy, since the change was originally
requested as part of a review.

Changes since v4:
- New patch (split out from "usb: hub: Power on connected M.2 E-key
  connectors with power sequencing API") (Andy)
---
 drivers/usb/core/hub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 2cfe09a141d8..715f26f05a31 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -899,10 +900,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 	if (ret)
 		return ret;
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
-- 
2.55.0.229.g6434b31f56-goog


