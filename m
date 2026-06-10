Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024A9CD98CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYYX9NwLUP4rFqvakVHrp1Kb1i3tLTyqtPoxV/1lOfk=; b=xBZzz/ohT/gbvI1TaquMcOBNjT
	U0SKrFOSKa1X/9Gph9ntDU6iN0vZJ/7nKRNwq3Osu1aEpOdH4/ksb9FG3+4kGS1gMjoTuLMPA1MKo
	osbrUl/5NHivibTz2tKLOYa3cyaPmrPeDW58dFRw3dUUBbzaB+EY3h2U13apH3AumE/otYDf4e1tN
	FK++G4CbFpk2pGNp6HaxJUB6aQpchYBvhBrC9tXQFl8IjiYkPwThm0DnTcaZZ2+t5LIsQHb1kLqpX
	txqSnoT/BJYuh7F/saOELWPbM4emi1yaFfgk3HnsHuDw2OJ2wZ7uqPFSOKq6zoHxIbLuNPQCkIjmR
	2hrSky+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVH-000000075cM-49Pd;
	Wed, 10 Jun 2026 08:41:39 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVF-000000075ZG-1WsV
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:39 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf18c30bb2so47291365ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080897; x=1781685697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYYX9NwLUP4rFqvakVHrp1Kb1i3tLTyqtPoxV/1lOfk=;
        b=mFbubaU7Y3Y8JXQwlzh3kUeq/ffNzG5XHYdAOX3h2dDboH/2UUbd31Fb07i40Wnd2/
         sx49NjQtcgFVy3MJtkxiyGBIJN+fHr6yv80l4TBZO4HPrj8ELnhzp6jBpwztmvzaV4Op
         MATg3LXjwufSlutj6XBUA0/+qdDbkmYXJXVbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080897; x=1781685697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BYYX9NwLUP4rFqvakVHrp1Kb1i3tLTyqtPoxV/1lOfk=;
        b=Peec37pRRCC6WGFyNnjLMpJafxhsBI1ngNubQMLJQadiVyJqggjaIinrRc2wud+xuT
         SRpoVjB3is6GsVOzYuhVyh6Xh/Yl9CiOjxP8+vVick3qNJ5iuoHlN3j4hjO88yLqipKi
         EXZXrlGBHwjUs8frLmXd7e91AxljvsWQug2g8c6zOWqUo6yhjWh49OrOJR/8wnyvaP+O
         7wTOGKoh/RXdj88WYEsDa1G063t4Aswd0BO4IgijDFXoGyBr0F0ucN0xdnbtRopQZxRW
         rGRDtqrqCbyJi25j8MkItQwwi1/ZBiJowPGQlSgg9zm0gYtizyerZnMxMCwWLGF0+bBs
         2k8w==
X-Forwarded-Encrypted: i=1; AFNElJ/A+PAKIsnbnVhTuAPM7u9tmxtP5+sRmaqZApGUlcTD8ADjpapIvAtOY3DkcsciJZlRsvC0C0wv16QKmnGeEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwE8Cr3nTWfeBpl+yxDvjiPdfISMiePlr8unlTtJW9QAQ/84kqt
	M1TpKgyD4Anqm7zMV2aesJ4eZn9c3nswTfVNo8MZUoYkc+X+MAY4fvBvtMSFljtJLg==
X-Gm-Gg: Acq92OFyjBPu/ibkxRPIriaIQC0Zg++P53j+yKAQ9+q3vsPeGPCKMWV7RoK5l5Brxim
	GXKVLYkc2v2g3vnGo7SVaO1g91hU96mxfyy3gOvlX9OavarqezHm2gksDjGTrhlkS7eSt8iZkuM
	oQbDnsUGT6P9keALw1KBJs0hb4RwX/w8IcEQsbawGaL0oSHjcV0Pe2bLmsg6Rpj40RDpcvU1Ew+
	lN2BgKKpDXJPooN3GI0lqdZsFNedKoz4V0YoQmo06SidA0SC7U+xSne388oiYyvpvvyJ3S0tZWb
	J17939nSzWWSScgoVsIaP7nqPcVdPDlvo3P0kbgtp6oU3U5Kfu75B4aK4fgxINHmTLaPaoWkTBC
	lMctQeAFTKaodIS7vvObW7PQvmRI1THhh8X1VbqQVn72KIcs1BTTbTnpYLAPq/4FnlP/ZF5h2vx
	mu/CwGQscyEVJK2DtByDUAQjh2Vn2fwS/Bv4Ea8qDVsESYyorW521Q8u3svI/irtt/VTA2TAYEB
	QaYO+Quj6Dr+/3Fpw==
X-Received: by 2002:a17:903:1205:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2c1e80f9b57mr283573295ad.7.1781080896672;
        Wed, 10 Jun 2026 01:41:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:36 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 04/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Wed, 10 Jun 2026 16:40:38 +0800
Message-ID: <20260610084053.2059858-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014137_406765_3D0AF011 
X-CRM114-Status: GOOD (  14.65  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 13264e86bc6d..985551d013b2 100644
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
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret >= 0) {
 		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
 
 		return 0;
 	}
 
 	hub_disconnect(intf);
-	return -ENODEV;
+	return ret;
 }
 
 static int
-- 
2.54.0.1099.g489fc7bff1-goog


