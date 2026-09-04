Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA44C79F80
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bo+9+1CvfJ71hhRjJqHX7wWrfIVVnPJvwTAuLV2zMPo=; b=hrGArulx5G8HKfFHZ/hJ4tKtXT
	r7hxo/uwlfOuKbLmxv8LSrFnKm8Smuq6nhnMt6xDMbrZZ3iAZ6qiMV4HYHsPNOzd9CwchI+i6D7T3
	6d8aKd0gOJsjLR/OTk4wHFJ10pLx7rNoPwxea8S+QU0LS9zneh4yt9TzlwMA4KJqb2azT3Rn4mNZK
	gYauKAwVlYzovUfyuySBxGryHg1x9P2t24j+IWd5PBF/HuktwsjRBF0VpiNy2rTkQ9A/tf+FEdLVw
	Ku8/DdG4ynkS8YLyZL0yOoP4NuT8PKvQG1wqYGLclWKcb+NSUhYOwDXYAX/80VSbPiPqW8nCm9ykr
	udzLBoeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PVt-00000001PtP-3yWa;
	Fri, 04 Sep 2026 08:43:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PVr-00000001Ps7-218t
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:43:08 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2d58efc7356so9777055ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511387; x=1789116187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bo+9+1CvfJ71hhRjJqHX7wWrfIVVnPJvwTAuLV2zMPo=;
        b=D8NgafGDE3zh8ilMqZMQ/2Bd2MbGElF2/hF8sljl6zs+vw3oELATJcpZdvmahJxS4T
         YkeVG17MUmkteszHFo2O/zfWgtQMS+bDhDFFCHQmIrDMT+3wgxWyFalQCucSPzqlZD96
         YrPohGnNmUZvVnbpqi1GMj5fUJiP1UHTSFD4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511387; x=1789116187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bo+9+1CvfJ71hhRjJqHX7wWrfIVVnPJvwTAuLV2zMPo=;
        b=FtP1thzNoV95tRUbgcqyX/DbnIupYEMz8XMgLeEAz2UWna3XG6cCVNc0sc33xZ1QYP
         F3Ayemm6y287asC9FmXkgpm8LW9TfVXrk2k0sabk8Y5HOJjahn/7llRkkm9Xa0ZYYOjl
         VqLaJCSd6LbgLsArc94OGRolStolGllMqNK3PenugeboLpaCbjBSQ8ziVDwdm8x0N6kU
         xHmUc5UDt9OfPp+m6b+1hOiAGL+RykX4wMSvUSiG+h6gtUiE41J45ZeIGCE+uKq+4pNN
         ITdueK+n7Zae4hWzbHd1Lakb26ZFflJyhnFv4ekQRhyYuW1yZQtF37rv3GvqVOL/PFwW
         5Y6A==
X-Forwarded-Encrypted: i=1; AKwUvBx/tjdbyTElXuyF67PH2LWqmm16I1SAebGuG1aIuJ7V5UfkdGklaHN2D1buE6TbyyXF5XGqV4yQth4aEi+hkw==@lists.infradead.org
X-Gm-Message-State: AFuF++nVqe9pHWs7XZ9nZAtn37dK2RMCaALGFVGy8TcbhrgJnpn72YeO
	8UgCXmbt5ZWDDsSDPuOS8ASr61m9J2KBa4Aq08PDljDav628i8MsDG+7oW+85iuYPg==
X-Gm-Gg: AYBFou1CJ9htPdLrTDxQnR2PS35mci55B/WzfEmuycFt9SYTlhqIH3inH/nRAOfi3Vo
	vULrO4yBfAtC/bB1MJOkQ6n0380XzPRSXJaDEwiuwoHZw3W10x4Ds7+YhJyuz1dbedJ+rL5R9Di
	3vIb3rX9RsdNdwT16myod3uyJlsY20SAOT1s/p50aAx67410NLPNT+mHdnaKENIaA+wdxAw1bMa
	jCTwLGzQhZ9irzdM2+8dwVEqpHZq9W1ykl3BZ3QXxauqcL+GOwTdGToqvzkboHAkkV3lhv+T1EE
	cBmtYeQoff65blIyxoXCN/9+0foBo8U8/ufaAJD2qddJfUlAHuyUNkk7ypGPwg2BbbkaX8Ikszp
	8cemkICFCXgkIMjup6QEOn0r0tl6inP87V0ZkjUSUNaRYOz672kg6ls3sYM5jWdcskcKUcDBt/p
	HaGgbUtGEHbOognd9Tcgz6hR+z6erYW95OPVMjUfm27V41Ts+oWa5V0lGFOn4ToPfB9OUIzi2cj
	bkkhmjGvvmXUzJMuh6Z1Spu4FFuNV8yZJ0IXQmmCkQt
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr6986016a91.5.1788511386742;
        Fri, 04 Sep 2026 01:43:06 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:36 -0700 (PDT)
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
Subject: [PATCH v8 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri,  4 Sep 2026 16:41:44 +0800
Message-ID: <20260904084158.1341550-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014307_520420_C691134D 
X-CRM114-Status: GOOD (  15.69  )
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
index 16e03ec8d1ab..c19c9912c740 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1870,6 +1870,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2001,14 +2002,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
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
2.55.0.979.g7e5102b832-goog


