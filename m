Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDA1C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXNEvMizuglXOCjkp4mAG2muXyzVgQAtby1OdmgJjvw=; b=ZjKJwV8FX35EPG32f3Haqp9A/R
	SKNkXpNbhhGSNiWWMM+OS2G6q8BwgS+bUPETSo6aZsdt1xImZButGu8LwxHW1PUaQliIfL5vKu4QB
	66ahuHgjyqYBS2kBJPWhk85VTniuxQ0cwP6WJFtPYBFBMWWh2AsVer0dh3CTP1e5CNACMnAfYzufN
	kKlCJBY0Wt8sVgPsbYd9iFai3vfVM5xBxd2wJmTQZ+KtEmpYI8ydP+jwY+XQ3MGLiNd/d8TnkuKr+
	/63tfDePaqqPOYDw4pRPzunESE56I2gVdLqqL2JYJXwCVMHyNCCHYPVWphrxCWGAlWP+MkGCppWU8
	EEC5j0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgc-00000006lAy-0jzr;
	Fri, 03 Jul 2026 11:03:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgZ-00000006l80-3JJ5
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:03:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c7cfa17fedso3890165ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076635; x=1783681435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXNEvMizuglXOCjkp4mAG2muXyzVgQAtby1OdmgJjvw=;
        b=T4AcuYf3QA8vohqbBvnx3NcyDhFO0+pPDv9qWz+8yhCBWyTUDnLRCFrl65iug+SPQ9
         3p93A0wD7ClvtUPo65skKcW8fO6qrtG/AVuYlO8r0X2ba6mXT+yUVRLorR1iSRFg32zC
         Javi7+gTdnYjLosQazIRpwKXrQDLqyTCThTdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076635; x=1783681435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yXNEvMizuglXOCjkp4mAG2muXyzVgQAtby1OdmgJjvw=;
        b=jr345VHdV0PDdv/BeyreWcK31dpFM1M+9rgxzlehmzvIEejEE2PWjPvrNwlnerVswl
         IFGVAh3piPzKyIueRVYyG91fz1qTx4DyRj2hUwyn21BsYb1/3/4RUsLs2+1iDluXRggD
         f8eIlVbV3K6SlU35R1AKaefgIukQkydhzP5K4d7Qkmz/UtAms61sP46oVUcBAWlJo4AQ
         HmRDZpYxqe+yOj7cqhl8KzD7q/YgC7PTDZZAh3M/kO+yNJucrzEtuRhY98J746SYGIoV
         AFcY3OkWyBO+fngiU7RPV+AQwEq6ralhtUPJSCUYnlDW3YwlrkMz5AlCU7+wjIpnlBln
         3Tdg==
X-Forwarded-Encrypted: i=1; AHgh+RrEoUOerXuldzEgfQjxh4rViHcSnVzHmDHdiWhIcdtOGBtsJNJ5PGm1puMNupDqGvRdVyCE/dGT2QnP+aStUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzmNnSMGFEXEiqAVhOYvFBqoOlZmTWMzs2cqz/Eycxcb2oTD5a
	dKcb9SF7HP6PfbW2WXnFVF0u680o5SpnIZFCEgy7KaXvSpjE3QfpSOFUduIt8l+3CA==
X-Gm-Gg: AfdE7clddAxnYiLPzSba0uXpFoqQS7ZdP7cws3M4JwZYxwDz9GSlW/qmp1YjWHCfbvp
	VpZXTS4lDK8rPf/87cFZwafQUz6xAA6OGCSeWJoo/BRkPNZTwpKjdoNVZvsVhio6WmkRturty0B
	kUHBXCuMmx/qRti62ikGa682orrd8rSq36AKhEN+xQlTYwGK0lmQvPdeZr4hRTyiIN+9PRpEWfF
	LEOuSlJt8U7g945UOhPKoUCp7U9BIDox9zF7vIdB8nEI9e6XxsyoegwgVypxNnY34H1mG5fNkaP
	L1w0mUvprqZu4Ag1zy6IiFg+EMPfB22H0npcGeNgrwLSZM+xY2VKQKu9eCCM58d6x4Gaa1FWqB5
	VbizBYpMzl5bpbwulr8tGWJxrHZvkqa+JCBKyjHwkBB5qulXMQ1F3V+m+G+44LGgOx5MtmFjceh
	YJWKs7nz7yfR0jUS0QNSlConqFdvUHjUsIgYO+H9I2cvpcwihUv86hgLMPDpeyWyVHxXmwkQ==
X-Received: by 2002:a17:902:ce0e:b0:2c9:b01a:fbd4 with SMTP id d9443c01a7336-2ca7e6c4036mr107709695ad.16.1783076635124;
        Fri, 03 Jul 2026 04:03:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:54 -0700 (PDT)
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
Subject: [PATCH v3 04/13] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri,  3 Jul 2026 19:03:05 +0800
Message-ID: <20260703110317.1283411-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040355_832302_C511537D 
X-CRM114-Status: GOOD (  15.46  )
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
2.55.0.rc0.799.gd6f94ed593-goog


