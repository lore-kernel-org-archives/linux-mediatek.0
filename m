Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEC4C79F85
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3sj2cYUAVCTd2rqI36VhEFdVQ+OlkMrPyaumoKtPAY=; b=4Wl0LqYffNsdHQFRMpeTGNTt8a
	R5W7Gnp2DPCMvJ1fHI8+eLDL4ipyYmjCHMyi8pTM1Pbvn1eZjuKf3EA9COZ8swL1OIPZ4Y2QowEz+
	zbiQDMWeqS3cTxPstdfZWSSCRvUIxeP4u5qpTDMfJr8qaYqOKmuScrNAPpNp0nBzBSbEN6901ZsVW
	IVX/uuU2/yRPvqRyjb3Nz6vJDdM2uAuOHQjEUxRkVzZ8ZNmXTTQ++dWSGGUabaYDVF22iyTMrN5+t
	wOLKQzmjIznFzjQ+P3V/ERovCBxBSc8RvkzkeGlJAiKzXbJQ1sat7PfHacexGVMfhYSYaV4cFa5K/
	7oCfiGgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PWm-00000001QCh-3DcS;
	Fri, 04 Sep 2026 08:44:04 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PWl-00000001QAW-0LZ5
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:44:04 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38511175ad3so655771a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511442; x=1789116242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3sj2cYUAVCTd2rqI36VhEFdVQ+OlkMrPyaumoKtPAY=;
        b=a0KvA08CVP3MyiIN7NFByhrpKLCCRw3lUB3eUsUHBqdJgJHl6/6RWoSGbwLKLSPx5R
         UG4VImPWPoOBicBETumSb8wpldAEhoK7ADVBNv0Mvx+0QuDCqry7HVKO5OYMrL9IQd0J
         HHlI3xz3jbwUUaynnu+TU1LMye/H0mbitmABw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511442; x=1789116242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3sj2cYUAVCTd2rqI36VhEFdVQ+OlkMrPyaumoKtPAY=;
        b=hxGepmx2f+qeh471ttLuUjnwB4vhGXTpPeKyDBa+vowXLjZ7uY4l1L2Y8/9nN8KrmC
         enrJ8A039TEw/LiurqSgjeIToa4hy+bXECqEc+Ni5gAD0QlgSrI9Q4j1Tqr7AC0OWCBg
         PAB9pjXvNsR69XxnkHy7WpAV0lo3BmfSVfxRIx0gTwlnC48g7LNSTUpBcUAVAU0og95S
         X/Z8byN/eiNHnPaKRYnD0hgEZQmA2+tnNc5t+nXEpwqfEXA3ihiluqzznNp1N+Rjb0h4
         Rrz5PWKpSoxUSggKPDAY92iCAHrryHRQHU0FFHRm6o/FSzEo61EIYrja3ywuq21ZTBXt
         dHPA==
X-Forwarded-Encrypted: i=1; AKwUvByCt3/fuDoClz050JP2DxdYmXWwpRdKNsryqXR+OTt9Nz5pO3kQFxYNR/ytIAfQx+KyFYd/APCwkF9IuWhPNQ==@lists.infradead.org
X-Gm-Message-State: AFuF++k+KTLp0GR/T/aVCC4GGFtBVJnKH5v6ENEOhkxkgHg+IjXzfTnr
	qvIcAQP3Rowumhw2v9alZ8RCHoZBPoHp3VQOSj1YzvtbtuzbMYbaLgs0diTK135iTA==
X-Gm-Gg: AYBFou0x16s6Ya4qpa+bvUTWgkzyvG50UFePhq0x8eCxKGtXjkp2fB2eiRABMFcS5gF
	QJ1fsMHTi4igN6RLC0Mz1b5B8d1/JVUSjWOxPIIgOWvYLte1+1v/PdOCEnZswKwMPwy+q9fQ9HT
	AAZcmUsg+jUltrbcQ0gR3ECgV0STUF0sn+jaFGdBHBcMlJXY4AblH4wGmbEu2+WhqjwoKtrJ4Q4
	0sdeWkT2AjsFabEiuGqbPhlVnovgqN+F+EMksTfEMU9o7467hSbxmI6RXdyRP3lW8fjxXBEx7bw
	hFz+Zn8FD4W9XsQ59hEkHWQJbO1BHRvAybgf0EI4KEVl15QwucHPV19gpqup0aZaYrB3RaoT806
	euYXnRKOETm+wpKn7FcKYx3HM4aYMMfAJ2ctRqBprDWYcApUL3gFXI+sK+sfQIsHygczuQZNXJ7
	SpNbAqRXI75fiTs+2tlKqXLxwr0JMey6WvyBMqEHpqzw3/NW99sutv9gfEOJjwroYmPR3uSNkvh
	bjyo6mLox0yqA21jtj117YLFnys0Ldpjf5tgmcve+XR
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr5803481a91.13.1788511442063;
        Fri, 04 Sep 2026 01:44:02 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:01 -0700 (PDT)
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
Subject: [PATCH v8 08/16] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Fri,  4 Sep 2026 16:41:47 +0800
Message-ID: <20260904084158.1341550-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014403_126619_8C042229 
X-CRM114-Status: GOOD (  18.48  )
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

usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
it to tell if the hub/port is SuperSpeed or not.

In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
state tracking field in |struct usb_port|. Either structure can be used
to identify whether a port/hub is SuperSpeed or not, as the field in
|struct usb_port| is inherited from the hub:

    port->is_superspeed = hub_is_superspeed(hub)

Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
|struct usb_port*| so a subsequent change can use it.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Adapted to move of usb_port_is_power_on() to port.c and port.h
---
 drivers/usb/core/hub.c  | 7 ++++---
 drivers/usb/core/port.c | 6 +++---
 drivers/usb/core/port.h | 4 +---
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 7f58d753d77a..1b891088a653 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3294,7 +3294,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3736,12 +3736,13 @@ static int wait_for_connected(struct usb_device *udev,
 		struct usb_hub *hub, int port1,
 		u16 *portchange, u16 *portstatus)
 {
+	struct usb_port *port_dev = hub->ports[port1 - 1];
 	int status = 0, delay_ms = 0;
 
 	while (delay_ms < 2000) {
 		if (status || *portstatus & USB_PORT_STAT_CONNECTION)
 			break;
-		if (!usb_port_is_power_on(hub, *portstatus)) {
+		if (!usb_port_is_power_on(port_dev, *portstatus)) {
 			status = -ENODEV;
 			break;
 		}
@@ -5437,7 +5438,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		 * but only if the port isn't owned by someone else.
 		 */
 		if (hub_is_port_power_switchable(hub)
-				&& !usb_port_is_power_on(hub, portstatus)
+				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
 			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b2e953f137f8..8d686d43e996 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -23,11 +23,11 @@ static int usb_port_block_power_off;
 static const struct attribute_group *port_dev_group[];
 
 /* Check if a port is power on */
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
+int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus)
 {
 	int ret = 0;
 
-	if (hub_is_superspeed(hub->hdev)) {
+	if (port->is_superspeed) {
 		if (portstatus & USB_SS_PORT_STAT_POWER)
 			ret = 1;
 	} else {
@@ -114,7 +114,7 @@ static ssize_t disable_show(struct device *dev,
 	}
 
 	usb_hub_port_status(hub, port1, &portstatus, &unused);
-	disabled = !usb_port_is_power_on(hub, portstatus);
+	disabled = !usb_port_is_power_on(port_dev, portstatus);
 
  out_hdev_lock:
 	usb_unlock_device(hdev);
diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
index 00f7500af336..2f4349b3ce6b 100644
--- a/drivers/usb/core/port.h
+++ b/drivers/usb/core/port.h
@@ -63,6 +63,4 @@ struct usb_port {
 #define to_usb_port(_dev) \
 	container_of(_dev, struct usb_port, dev)
 
-struct usb_hub;
-
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
+int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus);
-- 
2.55.0.979.g7e5102b832-goog


