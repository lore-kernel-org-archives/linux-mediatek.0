Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180F6C88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 07:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EP7B7Ij+uzgh7ozqOWENJmY+4dziA6HYdxmCK1rOAM=; b=shG8MAkAzl+/BW9Dtj/wOg+Jd5
	6DGzgDsrThcUlQaDxsAtpFD3R5m/IVlS7ouQqyvt5UDde0JP+ClDAzR5ymdLXpiNBg5dLT6gG8Ids
	hZAaVSbzbIjhm/9o85k93ue05bbLnEnauRq0ClgtK2CpJZ1NSlDea37qB6Mgr4/IPOfjimkIE3kOd
	rc/myZYTFX6R7vSa1GynR/eQ0F03s9Viu5OgU2mPpWRft3UeVRwX5rLGyJAkQkRy/hQinXr0aNY/e
	eDPyNcq4OI0Jh+oY/CAdOepLPqAX2IRACt55xo2QxIJ0yJYc4hMzelCXL3OAndEO11Uix02jSyGzH
	5D6rJc0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kY2-00000008e6Q-0625;
	Wed, 16 Sep 2026 07:59:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXY-00000008dw8-13LI
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9EP7B7Ij+uzgh7ozqOWENJmY+4dziA6HYdxmCK1rOAM=; b=QCtjwq+sPvdB96hHa+SHqAMEIs
	Zndwz4Xr1QBXxWpTYsCtd4calHyLRrK0f1LuXo1Dib1NI/7nsZFvX6FVp8/KcGFapVgdsx1ix1cba
	Zu80urTsCpS1WCzNHd7+qRAzCj1kiXFK68PGVe+Lv3f9Ch7B+PmeKCE0XbZCpxzbbdd9aJXb+CqZI
	qCCSuc5fGPyzrwekYuSzMbnwp0TN4osAGuIzSLZ2AMUMUll6R5T7E+5FcNkBVWi3lclWkowGwW463
	Umn9q/DmPezsE3uI789ilKittq7wIlQ8e+hKw6JDbCrR8xaeuiHefHM9KoNekgsZm+lfcx2LDg7pH
	4+NIaLkg==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kXV-00000007bX7-1q0t
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 07:58:47 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so353158a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 00:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545523; x=1790150323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EP7B7Ij+uzgh7ozqOWENJmY+4dziA6HYdxmCK1rOAM=;
        b=Kiq3QmgT6WF5AmV6SiJHQ4YT3TQWXBh6/3/mSp8EQ9U86N02CXMm82vUIHDwlPpjbe
         7eW6pUzLNqUTKGzDUEljQMmEg3zmYX2//lj5xYAdJ9yGTy2mY+KZGMuWMEDr855lOLS9
         PtTP8qIs2S19N7x7qnPJqVKOJyj/t0mlaJDrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545523; x=1790150323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EP7B7Ij+uzgh7ozqOWENJmY+4dziA6HYdxmCK1rOAM=;
        b=FTWSv2OdZluI1uLDQF8dkWIsRW3o08UkU8lvl3DX0ZKl7jA8ifvSGo6UVnMsmo0jKL
         HkqQ/G3cg2fyMTvV68Snugwyq+aYg8KztHw48I+8/fvD/i+FXC47glfuRhwEXIkjXhEb
         ZZmjOr7L/gtMj+AbEX6vMvysFjGM2AHAgvNWlceM2xdHMPYmAuKq4wW5t0/YcA0/HQlw
         sZEP8O55jmp5jD02M3q6VWFz4baFGx0GfaMAz2HEf7/eLart5oJeJi0qezrIsRg943Eq
         K8E8zFYDj+2sXXlLuQsYF/0mFmSHlHTaknfsCLNusbdTwdjDyisfpglsq5gOPAEpSl2k
         Cdgg==
X-Forwarded-Encrypted: i=1; AKwUvBxcdqm/kyAhgku20phFMwdouhkF5xrTLQvkbqZkMIDvrmMuLNDuqoKewjegPCfVb7Dz4S7nB1YFAC9V9L2hkg==@lists.infradead.org
X-Gm-Message-State: AFuF++kGABIfx8VmSbBLkdScWi82LCzNbozEVVMdHBye0tK567dZt4aw
	JeNuXPJ7wGNn/dq0KyOHibXQ9OIr0CPUtC+WBL152Fw6pmqDwjWQ7gaBCGV8P1nlPQ==
X-Gm-Gg: AYBFou0gq8Mum0xiYQjYEfH82t8Q5l29RD7+1/xrJ2EHbW0bStdXWPHuY2bxb2Ea3re
	MEw+f/zk5lT/EbZB3Zn39H39pd2zvin++gDAdP7Iu9ZqDfgqSCBG816KoHQ5bF0kHErpHyov9xW
	YEMlvcUJFdoEn8P5Vb7YYgUQlBukSWD624KF4b7C3EINW/2fnkiah4NMoHz1elc9PvSUThgk5Ho
	B3poGK425tjBjDWtPTKum9/TKUmje+HtVYa+rPzTXK/Zua5ueI4wnSOQsRUDuIXdG2vY+bbGxDP
	bGStjIJpholAqaO8fr2gpsN45k8BiJR89Gp0W4GHFzS/YMX+cKw/7a5AMiNz4PfzknotqFm5/DA
	jAQD6pgNzDHhOy766HSFRa5tKHLtE4p5EpImKfVomKLp5KYPzN/T7mRoiDqkLlm/VakMSPJJjtc
	kssuI22j7PBVvEfuddc8weyChbuHMTU8g4+sVsvMmFpi61DNOi18tLDsF0qnHH3OuXMVadGP7u2
	yi00IDC1bjgPOr/pmyGjtlGWCtaEXoAR7MgMXxSxzjhxH9th5BLXRhuyA==
X-Received: by 2002:a17:90b:440c:b0:39d:fea0:c17 with SMTP id 98e67ed59e1d1-39e1e309c21mr3792094a91.8.1789545523106;
        Wed, 16 Sep 2026 00:58:43 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:42 -0700 (PDT)
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
Subject: [PATCH v9 04/15] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Wed, 16 Sep 2026 15:57:30 +0800
Message-ID: <20260916075745.3549953-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085845_677206_685656A1 
X-CRM114-Status: GOOD (  12.17  )
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
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
index 199d3f535a89..a4ec79a06a5c 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -902,10 +903,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
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
2.55.0.1032.g73a4cd73de-goog


