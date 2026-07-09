Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1B7C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 09:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BG2vUOiSPIba29gWhBMtcZSw2rJwWxQBPPTNcsunIWw=; b=JY7Jmh8GiCRiI7F2/ZkwVSptxD
	1NUwuLTkXVFajbkq6HQ38jhaXBWQVczZTWJ8hkrvE3yqWgW9UjaLIgIiPUS0fQFqzJe4h0mD65LIs
	SP8DVeSO5Qfyqy1t0SjWxcTjnN0W85JmT5TMbCJCAwNiGPld0TAIM3kIJziBMmG2oI2mYH6t60EeY
	QidjofrnTENVs6/uhuxs4P+uKu3kPHc8EOx/4/J4yvXH0feQpfvQmR52ToyRrp19/DPPpT/z81dNU
	Hj61W6rpyNBrAQniBsCcEGsocLyc+YOtMyzP3QtaJoluPY4wyHpoHKz6n+25co0AmRxCMWf5yh601
	qt/rRgZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVo-00000001okv-3RD8;
	Thu, 09 Jul 2026 09:57:44 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVj-00000001ohy-25sv
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 09:57:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cc80b585bfso5636525ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591058; x=1784195858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BG2vUOiSPIba29gWhBMtcZSw2rJwWxQBPPTNcsunIWw=;
        b=FAei4X8wWXB9qqE1EhcabswGjgOCiH1jJoukClxddKTClVoJs2oM6CIlVAhcBQqaqV
         NEQyPdLlRTH8Pt2AgfajMeFuEegh001nxam49aIQYR3xGpLuCmrWGzWDkilAhpWiEv04
         QeVkmGGPxB+UAe7SWoP7Cm3Bq2+nWv1amWBfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591058; x=1784195858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BG2vUOiSPIba29gWhBMtcZSw2rJwWxQBPPTNcsunIWw=;
        b=jkhAUPME+XhtplWCWANoxHrY/V9lP7XcRuJ+wUcCIjbWnEzHTEWh/Qq6A+76ijyhbt
         SE/uNs6NnIVbsBwJsja8uq2BllDNRANWEcTvD6AH9IeGbREOC2jHjYtBVlsjo0CIxJYi
         Y1MrP89gWL2w7AVpjNs70Mlf6zfLyfs13WJWXKCRLCFav0KfB5PTlUyFHZgeas5z8+ft
         8NJbV8kHX30jZQ8uacunFqVzIN1XPEnW+BwtGPog0R6VNg2otPFR4FUONBNfnfbN00rM
         pGuecU+2j4lNQrpC4AgrHZcU/sbyYfbD73gcbt0tydEfV2AyTUtsai5TZgPNE9tG9Wv7
         FEwA==
X-Forwarded-Encrypted: i=1; AHgh+RrLKjtVNVWaqu6N/5J5dXdBnxJOwT68CyhaBzKYBWmvQghjR7PZVwSXgwEHm9UzTjBdHNsW8NLMyWjuAmeGDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj8QPb31kpZ43AUr/sXnepT32CJVk49/9cPt2cu9C+0OuE9f+g
	TW9Jx8b0R9XFZ1HJdfxFrMPtVjWJejc4nc12eVIkmQfmYA0UomSWGZtNvXEryoVIRw==
X-Gm-Gg: AfdE7cnISIZY76yO1BZXaEjfo6sZ1kZCEhk53qmsKYq+9ER0qDKHYS6z4Rg+tUKirOm
	Ofi64kThCDFykgoFsk7fr3NX7gb6pfz5WstdnTbBIl270rFzQxjk6snXX4qeEnd7vVSgQlioRqh
	kXHpRZf8XjRDwbXz+ZVLgVBK1zh5I7PXdvBQzZ9IMBrCLYC/G7zp4XgQLy2LjME2flPZnEABPO3
	mttZ87UAJ40ALeNZZmFQ7sqBtorltntspBt8RuB7GLuSD2Sw1uMv8rIeopHQZdlHq0B33XsFdLo
	gO5Z5xhcKnXerr11n47to/ArQmzmeVaeJtPvnMg7Gx7XzdAPNXR4O/YYQeRSqy4Aji7RdX+qAHS
	3vGOcu2M4huK8nTLALzSwqqpkyDtwjTaxRZ5WjtOVI/EH/PjEkY+bCsE6ib0OjwfdiH4j3RnQbi
	zkJew9U2H1g3k3cr1oNtTuSqVkuDI+cBi/w+LoX9Y6DQvEZn6ayIcKwfANNUou5aNOwY7lvZ9zO
	sCwf4bA
X-Received: by 2002:a17:903:644:b0:2ca:cef2:dea8 with SMTP id d9443c01a7336-2ccea46aea4mr43494035ad.35.1783591058447;
        Thu, 09 Jul 2026 02:57:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:57:37 -0700 (PDT)
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
Subject: [PATCH v4 00/14] arm64: mediatek: Add M.2 E-key slot on Chromebooks
Date: Thu,  9 Jul 2026 17:57:05 +0800
Message-ID: <20260709095726.704448-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025739_575801_EDCC9804 
X-CRM114-Status: GOOD (  34.76  )
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

This is v4 of my attempt at integrating the power sequencing API into
the USB core to support the USB connection on M.2 E-key slots. M.2
E-key was enabled in v7.1-rc1 with just PCIe and UART supported [1].

Changes since v3:
- Added missing stub function for !POWER_SEQUENCING (patch 3) (Sashiko)
- Added missing fwnode_handle_put() (patch 5) (Sashiko)
- Added new patch to move |struct usb_port| related declarations to
  separate header (patch 6) (Andy)
- Patch 9 (usb hub pwrseq integration)
  - Adapted to move of usb_port_is_power_on() to port.c and port.h
  - Simplified usb_hub_set_port_pwrseq() (Andy)
  - Renamed usb_hub_set_port_pwrseq()'s "set" parameter to "on"
  - Dropped usb_hub_restore_port_pwrseq() (use usb_hub_set_port_pwrseq()
    with inverted argument)
  - Fixed off-by-one access in hub_is_port_power_switchable() (Sashiko)
  - Assign retval from dev_err_probe() instead of the other way around (Andy)
  - Clear hub->ports[port1 - 1] in USB port error and remove paths to
    avoid other threads from accidental UAF while the USB hub device is
    being unwound (Sashiko)
  - Short-circuit out of helpers if !IS_ENABLED(CONFIG_POWER_SEQUENCING)
    to avoid errors from stub functions (Sashiko)
- Drop redundant device node validity check; device_match_of_node()
  does it internally (patch 11) (Andy)
- Link to v3:
  https://lore.kernel.org/all/20260703110317.1283411-1-wenst@chromium.org/

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

The series is based on next-20260708.


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

Patch 6 moves some |struct usb_port| related stuff from hub.c and hub.h
to port.c and port.h. No actual code or functionality is changed.

Patch 7 changes usb_port_is_power_on() so that |struct usb_port*| is
passed in instead of |struct usb_hub*|. This patch does not change any
functionality.

Patch 8 changes some USB hub port power control code that directly
toggles USB_PORT_FEAT_POWER to use usb_hub_set_port_power().

Patch 9 lets the USB hub driver look for power sequencers for each port.
Currently this only works for M.2 E-key connections, but it could be
extended to cover other cases. It should also make port reset via turning
off the port VBUS work, even when VBUS is not directly controlled by the
hub. This depends on patch 2 and 3 for the new helpers.

Patch 10 reverts an incorrectly modeled OF graph connection for the
MediaTek XHCI controller and adds a proper representation.

Patch 11 adds matching pwrseq consumer by "port@" node to the M.2 slot
driver. This is only used for the USB target, but there is no attempt
to differentiate the connection type. The driver simply tries matching
the "port@" node first, then falling back to the port parent or device's
node.

Patch 12 reworks the power sequencing targets for the E-key connector in
the pcie-m2 driver to add targets for USB and SDIO. The former is used
later on in this series.

Patches 13 and 14 enable the M.2 E-key slots (or slot-like integration)
found on MT8195 and MT8188 MediaTek-based Chromebooks. 


This series unfortunately spans multiple trees. The way I see it:

  - Patches 1 and 2 go through the driver core, and an immutable tag is
    provided to be merged together with the USB patches.

  - Patch 3 has an ack from Bartosz, and goes through the USB tree. But
    Bartosz also wants an immutable branch/tag to have a copy in the
    pwrseq tree.

  - Patches 4 through 10 (all the USB related ones) go through the USB
    tree, along with the dependencies above.

  - Patches 11 and 12 go through the power sequencing tree.

  - Patches 13 and 14 (device tree only) go through the soc tree via the
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

Chen-Yu Tsai (14):
  device property: Add fwnode_graph_get_port_by_id()
  device property: Add fwnode_graph_get_next_port_endpoint()
  power: sequencing: Add pwrseq_power_is_on()
  usb: hub: Return actual error from hub_configure() in hub_probe()
  usb: hub: Associate port@ fwnode with USB port device
  usb: core: Move struct usb_port and related APIs to port.h
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
 drivers/usb/core/hub.c                        | 71 +++++++-------
 drivers/usb/core/hub.h                        | 56 ++---------
 drivers/usb/core/port.c                       | 92 ++++++++++++++++++-
 drivers/usb/core/port.h                       | 68 ++++++++++++++
 include/linux/property.h                      |  3 +
 include/linux/pwrseq/consumer.h               |  6 ++
 13 files changed, 483 insertions(+), 113 deletions(-)
 create mode 100644 drivers/usb/core/port.h

-- 
2.55.0.795.g602f6c329a-goog


