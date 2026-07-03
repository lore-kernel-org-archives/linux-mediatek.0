Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11D0C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sqs/izjUXlQxLzNznfrFoz35GSBVfbHOxBq9DzMVAxY=; b=elrl8KQliResEkA4LXiMKzx0/R
	mtc9qCCbkNWCbKydFWtM/jqw8o8fsNbWvnFFfx7UUyH3S+wgHgx9b0K/Fh3FYSafwgBZ6CCSPMh/w
	nxahG0++qMy5Ml2Iy+UbWqSeU7wBzODA6KJJ1vxAlPuzPp/cCC+4AaUxAZLkCEy6ARyrgFzG6/dAQ
	CungPOCj5ezn6/SDYZ5swBggvKSFoSJHCaikcxsf/DQrDEZBp63DUstgsCu/FEwImXq5mCSGiMn9c
	FMMfFjySwcfsNz93zFKtGmM9KfXtOXkmFU2F4whKLNnt/5ON6gLfo60GnqYeggZWlBahIThrA16QL
	8KkattOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgL-00000006ktl-0lvE;
	Fri, 03 Jul 2026 11:03:41 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgI-00000006ksK-3EWf
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:03:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c82538b6b0so3487175ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076617; x=1783681417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sqs/izjUXlQxLzNznfrFoz35GSBVfbHOxBq9DzMVAxY=;
        b=JWNS2oiN/z7YNtlLmhZwJQqBr9S+XjAcpQfnXl+kAdZTLxYhVSo8F8iVQQSA8HT1jB
         XXD4nRgEvatSX/vJbxCqsDTzLZPNaOtQrd0edahqAfEkiBpnbPHl58Oyki5w/DhS2IGU
         43r5OdZTGffna2tazmB8N/5ZBj1wSjLKChOy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076617; x=1783681417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sqs/izjUXlQxLzNznfrFoz35GSBVfbHOxBq9DzMVAxY=;
        b=Fvf/LYcDxydjhXpENmyKcPsbrHSOjDZqIIALgVJ28evTn98PasujucNDJy8T5kYLLa
         gDhhSocElLW4zlm/IwG9aGpRtbZVP8JXHW0c9/QYOXNvWck0dzjBelU6myUqLtfkqOUN
         bg1IVWptyPP/PuRgZDlQkjOhrdB9EYUlH4/JMNOfJIXjVdCR+zBuqUgswTJRJFW21yUX
         Va92E+H+/7MrM0VaF3YqnWEKoH+5Ihz+C4tOOh7TfN1KHyJwd7zoMYSBTyojnN58WTXs
         aJc6+7LhhYXf0BoHhK/NiAYcJP5A5qP5ln95qPTjKyFbEyTQOVqTb4hWmhhb0CWnaU5U
         n+gg==
X-Forwarded-Encrypted: i=1; AHgh+RpxTZ39T4aKsNmx2Vls1umEi7+Inyg5mBz659ZexrDRfrUR29L1p9wO2SLx/usBQy2sqA7LH///4t+qWLqJsA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe0P2uvQ4zcp7AZPHw65iwixUisDhI+S2RWWaba9IqKgcul67w
	QweqNdpsMTMGRzR+9r+3WCL1I6dVdwhNbaj1/PSd03WFWaemavkhxDk/noqJA7R/8w==
X-Gm-Gg: AfdE7cnfFLgwMA+GdA1MkpCAPpwOvoaGWyUurTI/cES7rqf9pyhwgCaVhH8JPrwJvZn
	kJL+zzRRBIp4tdBkqX38q/HFw6ValzY8KcdgWrp/TDhfQXQg2waSkj5RH14Fis9Sd1q1zYmOxQ6
	KT/6KS87dzDMpN008tJaIqhFdkCUIEwhXnqkCIoruTYhF4dkCv53fiipETf0+j2Xrd84e0RxJma
	WwtBHDOQSeGHdQ9veFUKLg6P9bN6AyxwtMPFMZ6sbJ7CbGKGnC0Jb3zo7kEagvWC85oNF/6YNEh
	0Sb6zAN40zvnaJ6f/VPl1nTMvgOkU2dcP4v9QNpYRjgUb6N9/8D4ovmaiTQynCcfwMDlWWm2Fc4
	yGl3QbadbpDkhFfPerBIywQ2xATzOqkWh+BOnBncdgQ7+qoi9ArVzD37gRObBBRfJ1b+ORr3fQ1
	ygSNP750YwWZDW+R8V8Y1hz3CKwqXsdyid7xn7Adg3UOHPJY0+0QlH297XXGIhy7GpxfVYCQ==
X-Received: by 2002:a17:902:e54c:b0:2ca:d818:61e5 with SMTP id d9443c01a7336-2cad818638cmr21373785ad.26.1783076617402;
        Fri, 03 Jul 2026 04:03:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:35 -0700 (PDT)
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
Subject: [PATCH v3 00/13] arm64: mediatek: Add M.2 E-key slot on Chromebooks
Date: Fri,  3 Jul 2026 19:03:01 +0800
Message-ID: <20260703110317.1283411-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040338_867736_7735FFA6 
X-CRM114-Status: GOOD (  30.90  )
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

Hi everyone,

This is v3 of my attempt at integrating the power sequencing API into
the USB core to support the USB connection on M.2 E-key slots. M.2
E-key was enabled in v7.1-rc1 with just PCIe and UART supported [1].

Major changes since v2:
- Removed changes for MT8192 Asurada family: one of the device is
  shipped with RTL8822CE-VR, which is PCIe + UART and needs more work.
- Removed changes for USB A ports: VBUS one the type A ports on
  Chromebooks are not directly controllable from the OS and VBUS is
  modeled as always on. As such the changes I made don't actually
  change how the system works.
- Added new pwrseq_power_is_on() function
- Make new pwrseq integration effectively OF only by not assigning the
  port fwnode if the hub's fwnode is an ACPI node
- Added patch to convert remaining instances of directly setting/clearing
  USB_PORT_FEAT_POWER to usb_hub_set_port_power()
- Power sequencing state removed again in favor of state tracking by
  pwrseq subsystem
- Power sequencing descriptor again separately requested for HS and SS
  ports
- Dropped pwrseq_power_off() call before pwrseq_put(); the latter calls
  the former implicitly if the power state was left on
- Squashed DT binding revert and addition into one patch

- Link to v2:
  https://lore.kernel.org/all/20260610084053.2059858-1-wenst@chromium.org/


Major changes since v1:
- No longer adding the "index" parameter the power sequencing API
- Switched from OF graph to fwnode graph APIs
- Tie "port@" node to usb_port device, and use this device as consumer
  to acquire power sequencing descriptor
- Power sequencing descriptor now only tied to USB 2.0 port to avoid
  double reference
- Power sequencing state tracking added
- Link to v1
  https://lore.kernel.org/all/20260515090149.3169406-1-wenst@chromium.org/

The series is based on next-20260702.


Patch 1 and 2 add new fwnode graph helpers. These are used by the patch
5 and 8, respectively.

Patch 3 adds a new pwrseq_power_is_on() for a power sequencer consumer
to query the current request state. Note that this is not the _actual_
state.

Patch 4 reworks the USB hub driver to return the actual error code from
hub_configure() in hub_probe(). This is needed in the next patch to
correctly return -EPROBE_DEFER returned by pwrseq_get() in patch 9.

Patch 5 makes the USB port device associated with a "port@" fwnode if
available. This depends on patch 1.

Patch 6 changes usb_port_is_power_on() so that |struct usb_port*| is
passed in instead of |struct usb_hub*|. This patch does not change any
functionality.

Patch 8 lets the USB hub driver look for power sequencers for each port.
Currently this only works for M.2 E-key connections, but it could be
extended to cover other cases. It should also make port reset via turning
off the port VBUS work, even when VBUS is not directly controlled by the
hub. This depends on patch 2 and 3 for the new helpers.

Patch 9 reverts an incorrectly modeled OF graph connection for the
MediaTek XHCI controller and adds a proper representation.

Patch 10 adds matching pwrseq consumer by "port@" node to the M.2 slot
driver. This is only used for the USB target, but there is no attempt
to differentiate the connection type. The driver simply tries matching
the "port@" node first, then falling back to the port parent or device's
node.

Patch 11 reworks the power sequencing targets for the E-key connector in
the pcie-m2 driver to add targets for USB and SDIO. The former is used
later on in this series.

Patches 12 and 13 enable the M.2 E-key slots (or slot-like integration)
found on MT8195 and MT8188 MediaTek-based Chromebooks. 


This series unfortunately spans multiple trees. The way I see it:

  - Patch 1 and 2 go through the driver core, and an immutable tag is
    provided to be merged together with the USB patches.

  - Patch 3 gets an ack from Bartosz, and goes through the USB tree.

  - Patch 4 through 9 (all the USB related ones) go through the USB
    tree, along with the dependencies above.

  - Patch 10 and 11 go through the power sequencing tree.

  - Patch 12 and 13 (device tree only) go through the soc tree via the
    mediatek tree.

Some of us discussed v1 at Embedded Recipes, and I believe Bartosz, Mani
and I agree on this approach. The debate is likely going to be on
whether this should be integrated into the USB core or not. I believe it
should, so that the power sequencing timing is tied to the USB port
being brought up. I do have a fallback option of just enabling the USB
power sequencing target inside the M.2 slot driver if a valid OF graph
connection is seen. But this is less desired for the reason given above.

Please have a look and share your thoughts.


Thanks
ChenYu


[1] https://lore.kernel.org/all/20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com/

Chen-Yu Tsai (13):
  device property: Add fwnode_graph_get_port_by_id()
  device property: Add fwnode_graph_get_next_port_endpoint()
  power: sequencing: Add pwrseq_power_is_on()
  usb: hub: Return actual error from hub_configure() in hub_probe()
  usb: hub: Associate port@ fwnode with USB port device
  usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
  usb: hub: Use usb_hub_set_port_power() to control port power
    everywhere
  usb: hub: Power on connected M.2 E-key connectors with power
    sequencing API
  dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB
    connections
  power: sequencing: pcie-m2: support matching on remote "port" node
  power: sequencing: pcie-m2: Add usb and sdio targets for E-key
    connector
  arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
  arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot

 .../bindings/usb/mediatek,mtk-xhci.yaml       | 17 +++-
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 92 ++++++++++++++++++-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 73 ++++++++++++++-
 drivers/base/property.c                       | 47 ++++++++++
 drivers/power/sequencing/core.c               | 18 ++++
 drivers/power/sequencing/pwrseq-pcie-m2.c     | 52 ++++++++---
 drivers/usb/Kconfig                           |  1 +
 drivers/usb/core/hub.c                        | 78 +++++++++++-----
 drivers/usb/core/hub.h                        | 12 ++-
 drivers/usb/core/port.c                       | 62 ++++++++++++-
 include/linux/property.h                      |  3 +
 include/linux/pwrseq/consumer.h               |  1 +
 12 files changed, 401 insertions(+), 55 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


