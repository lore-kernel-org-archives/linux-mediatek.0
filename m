Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EB4C44507
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 08:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYICwpllA6REcHU83KV0EGKSQt2kKv+TAZuxEKEYalU=; b=bbVO60E8dJBjXM0bl+WjKJg5OX
	uRxAnlAmk3PJn6Pkz8U65bFXNXoTK5Eno7wDSmOFJZF8U00wI4o1ZcBoktgdzlSFGAfTwHNP7eoXe
	JrWJYFudAph2kh35NhaIUI5ImNVirL6h0cH+6iBDTSMy0DwRx3qYqFZrzXZ1slHX4SSBHWC6k3CHA
	LyxLCf+zCofs+u2s+OkyhYu0rMUu4lVcepElgn3tnKajnYRUyH3niub0WKnYOLw89dLyNP+WLDB9x
	rhohUcd0/WnKG57C7cjZKJ7my1b1daPKhTRW37PPZMvMtRKNSFNDDcC1CnlC9RTeWbDPgiBPr6NXT
	cKlox8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvO6-0000000EDbU-0oQr;
	Wed, 15 Jul 2026 08:54:42 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvO0-0000000EDVq-3eYE
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 08:54:37 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-848882fdb18so1897223b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105676; x=1784710476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYICwpllA6REcHU83KV0EGKSQt2kKv+TAZuxEKEYalU=;
        b=caJVJcxTlPAzGJC5nEH+B6iw1sKQ9TMBOzESSlLXuw65eYLSTB3ufNN9nqVgEoNcoW
         utogH1Wp89khqUU1nmR7mZTcb5nYYfqa0h7FEdY/IySqyikT4WjAn/MTKV/wDpMKQ1BV
         8++R4Dp6+hEY4wS8PAya11A4h16Soc0s5DKdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105676; x=1784710476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYICwpllA6REcHU83KV0EGKSQt2kKv+TAZuxEKEYalU=;
        b=q2EEa1KQGO9sD083VsYb5XeTdaFCGZZyliIaEJxhE94Z45AK9smK4IPLIs+BeA03Py
         LNBPdXwfs5mHq19/a9zItMykSMP+ujsvjHFo8e8qISKoq//An0kh3qxGcLM6AsYb7LjW
         MHnyQfhdMbsZsxdOZXiseJ91Kn6Qq0+PYChS5+CocZp9Gz/i2o7Oc/Pg0oS93/eJilEj
         cACYG2RGPUNLeTAcDGd1ltGkslSDDB3Mac1YbniUVgj4R+Fcoi68M8VH14UaRmxEOE3V
         OJTOWoWQ9jejgw9KWhgW+t9O9EohCtS+ak81ubBlpazDs0XlsJsZ03HrqgApql6xgIeJ
         wKHg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3WnCA7MdIG8Kk5Cvx60A4q8laLsCJKYGp0q4jKTYZW3Y3NelrXDbcn5s51wsAKpYvjEpcvConuob+XSg7fA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj0MnvG948dPHoz0kq9uQYnu6YaJn4o2SdK78ncUmm7ppDRDWe
	n/GvkMBdGfI/eg6la+SUclmuPJK6q6aAUFneE0FpiJTTzxtlU0hUNNPzywvY3YhSOA==
X-Gm-Gg: AfdE7cmJM6wVIfJfg8p91OKvFZ7M4MWjZL11NkjkO92lefj2+wdydhH8K5Brk2/743o
	IYqnNeiSWF1lBJjNFeKq77BimugU0PCzx9rBTpUrG9d6U3kQ/TlmDnXOBka4HB7Ug5tGZ8Sa4y9
	m3xDemjzp1a6s0QnUIjFFN2DX9iGJc4gp7/0Z7HuS0/0kyKvyfFvXxZr/2LsZbkkFdj0zaH042b
	1K0s8k4LOmLpafpgQ935J9Cb0zG3BC4tCxp9JLrRs6DjHabYPb66yhYILSk0NSF2/qalE5mdxBk
	3n3EwsWMWARmTAOWwvuT5zvi6cW/Mr6hNbXcM6uu1zDFLn+26Rbo0I9HlXy7FqqilMI7YjogfXG
	7+pbWHmJ7a10jTwDxNTgLhCXJOze/CZtuD7g6TYAieA/UqgsMI1JuXQ3CQXWv8cQ4n2Da7onok+
	jIgbzX/AWw12YWKpWA+Q+a62LEBhOVZl4kmDd757o9e2kceJObg0OHjUnSI543E1VgfTtelgyfF
	Uy6ZH/+
X-Received: by 2002:a05:6a00:17a4:b0:848:88e6:95d3 with SMTP id d2e1a72fcca58-84a673928d8mr1756444b3a.72.1784105676023;
        Wed, 15 Jul 2026 01:54:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:35 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v5 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Wed, 15 Jul 2026 16:53:34 +0800
Message-ID: <20260715085348.3457359-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015436_922992_EE06D7AC 
X-CRM114-Status: GOOD (  11.84  )
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
index 9b2bf608f9cc..36342c5718bb 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -896,10 +897,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
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
2.55.0.795.g602f6c329a-goog


