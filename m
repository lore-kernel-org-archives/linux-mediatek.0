Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7809BCD8CB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t8gJIv7IXV+GGLqttV7BJHv8HtnJej0L7a6gfaEYMf4=; b=yWh+jHLNRd4YomylEtln5hMpcq
	+pLO3SLc3xowBVGrvM/cpYQ2vdE3cIKDpGF6+PzdYR3SWSOHvNa9KP+GpChfm+taBA3AqvhK6QW+K
	CTYny7S55X1lnTjkkfXJvFsoHOGa0g2W+BlhtQ/YycXm0/+wkNFjbQcnrISIyRrobImuHHOdOZkrf
	8fs90JbfL+f5Wpn0YzSc0PAenFR55Hk7KgrfKXVF46Pmz3KtI9HxrJStCQosx6X07i3NaAob4HmQ/
	6ezJ8p63U14Iq4vOITpOrp2iZyFi7alkCbHJ7yjWHIv3b7iWZx5eaRkO4TfKMAoFnLyr0LFSCugQz
	3mc7IvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEV0-000000075Nr-3lBD;
	Wed, 10 Jun 2026 08:41:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEUy-000000075N3-1OBY
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c27fc587ebso13995175ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080879; x=1781685679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8gJIv7IXV+GGLqttV7BJHv8HtnJej0L7a6gfaEYMf4=;
        b=d5tLPUE7GKPHtiqr6/EpYf5gMvd2MFlONJtYBb0HzM8g5N+7sO6pxYsq/LF9Yk+KiC
         2XN2eNjBA7uQnkLp4eDDcygZ+Hyorg9H5yW9VTBSkYJV+qQRR6KdMH3AlDuvuGasu42b
         o4Qu7uEUtM6O7gL4Gxj7zw8QNqvZyX/KPbXqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080879; x=1781685679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8gJIv7IXV+GGLqttV7BJHv8HtnJej0L7a6gfaEYMf4=;
        b=SO2BnYKdJxWKDLn7zmq7MP8y6JbGIZARcq2bUq8qD0tT8fWoDl5Cb7ZK4Y5T8QNt+t
         emZeFADQi7Fz9EY5BSuA4Zky1lkf1okP1m9N45goZJ4qxS55sqkcspLdhvQUSm/6G4dv
         NZ9Xvm3PJFFKSkQ/lEMZh0MCEG3/79mdMcH5k5QHpaaTkYanyfJGeCW14YrPyTORpHhA
         fI7MBX8lAVMkNg3AlGxz1QrwFg44mXPfew7zqtRDpQjEmQmAyTVFQGImWJLz+HdL+Ww+
         jc0FvTp3pMXYrvM7b+cNzrR84COOz4xrFUdWBCZNwthMsiaMLGACi9nyNwL42OkwNu4e
         eSJg==
X-Forwarded-Encrypted: i=1; AFNElJ/fi/BisxlLumFoMiMHnEgfLsECmWHyYf8ubzFDvcBZzHUMUsYqgZV3FOUfOP8BU6CH3JAQDuHbGsa/EWVqng==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRCWUnkwY16MooDLaDFFcmtjSFiEtiaRbqbAxAxmeL2vdeDIy/
	JN7ucbB6eePIEzMfzOhJ9fC5yGHJL4KKNWbdVGlfxEn3Y+oH2xpR7Q+QpwMITrq+7w==
X-Gm-Gg: Acq92OH2CbGOnUUpAl8GFvhtUL2y2+QxSgEC8Nw62fBwXHvm8pKPQeXI/jN7h/D+3Rx
	ofjF4hE1xAr5Aopcw51KNZADtctv7MJ5rnv21faeDoPZXsC/8GwbPUVWBqZL4KR/qRF1HFz2cWH
	t/7rVWldU7qPy0d2tOPUm8yvLkuaYKL1msc66o4EAEHA+eeJvXuEJSQYp2qm2snve7+9Jb9aMYl
	D4IFipNVcTTsaOWOxInyA4xN3yrFgJfQtKqbZ8Hxah9I0y3h7Iy9PqpWuXY1U2Ppd7saj/qrS7I
	hva7l2ck9C2zd08cNb3e6QZMp7FCWqPBcAALS052aelxlGjWPIXdEPwFUGODXVGEivIpn+ERQ40
	S4/oXP2NpV77yDsckmZG194B7m75fMsXF49q8Bg9zQ1wSa5pk1D5Llhy3ZJGMFrp/D8eEI+pdRq
	keo4bi1BTq+D3AoP8FAKK2u9ZVYlRtoCMpkygu0UZTODqgJOhRJcuN4fCNR/3khKtsd1FP/wTX3
	lXSIyzgCSFnlmhENA==
X-Received: by 2002:a17:903:1b67:b0:2c2:c0db:964a with SMTP id d9443c01a7336-2c2c0db9991mr33186765ad.26.1781080878941;
        Wed, 10 Jun 2026 01:41:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:18 -0700 (PDT)
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
Subject: [PATCH v2 00/16] arm64: mediatek: Add M.2 E-key slot on Chromebooks
Date: Wed, 10 Jun 2026 16:40:34 +0800
Message-ID: <20260610084053.2059858-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014120_407573_CF3FBEBC 
X-CRM114-Status: GOOD (  27.36  )
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

This is v2 of my attempt at integrating the power sequencing API into
the USB core to support the USB connection on M.2 E-key slots. M.2
E-key was enabled in v7.1-rc1 with just PCIe and UART supported [1].

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

The series is based on next-20260608.


Patch 1 and 2 add new fwnode graph helpers. These are used by the patch
5 and 7, respectively.

Patch 3 changes the power sequencing framework's Kconfig symbol from
tristate to bool. This is needed as the USB core is bool. And since a
later patch introduces power sequencing API usage to the USB core, the
power sequencing framework cannot be built as a module anymore. This
patch needs to go in with "usb: hub: Power on connected M.2 E-key
connectors", or we will get allmodconfig build failures.

Patch 4 reworks the USB hub driver to return the actual error code from
hub_configure() in hub_probe(). This is needed in the next patch to
correctly return -EPROBE_DEFER returned by pwrseq_get() in patch 7.

Patch 5 makes the USB port device associated with a "port@" fwnode if
available. This depends on patch 1.

Patch 6 changes usb_port_is_power_on() so that |struct usb_port*| is
passed in instead of |struct usb_hub*|. This patch does not change any
functionality.

Patch 7 lets the USB hub driver look for power sequencers for each port.
Currently this only works for M.2 E-key connections, but it could be
extended to cover other cases. It should also make port reset via turning
off the port VBUS work, even when VBUS is not directly controlled by the
hub. This depends on patch 2 (for the new helper) and patch 3 (to avoid
allmodconfig link failures).

Patch 8 reverts an incorrectly modeled OF graph connection for the
MediaTek XHCI controller.

Patch 9 then adds a proper representation.

Patch 10 adds matching pwrseq consumer by "port@" node to the M.2 slot
driver. This is only used for the USB target, but there is no attempt
to differentiate the connection type. The driver simply tries matching
the "port@" node first, then falling back to the port parent or device's
node.

Patch 11 reworks the power sequencing targets for the E-key connector in
the pcie-m2 driver to add targets for USB and SDIO. The former is used
later on in this series.

Patches 12 through 16 enable the M.2 E-key slots (used for WiFi/BT) and
USB type-A connectors found on MediaTek-based Chromebooks. These are
provided in this series for reference. The USB type-A connector changes,
while not directly related, have overlapping context, and was easier to
include. They were also used to test some extra local changes I tried
to convert the USB A connector from an onboard USB device to a power
sequencing provider.


This series unfortunately spans multiple trees. The way I see it:

  - Patch 1 and 2 go through the driver core, and an immutable tag is
    provided to be merged together with the USB patches.

  - Patch 3 gets an ack from Bartosz, and goes through the USB tree.

  - Patch 4 through 9 (all the USB related ones) go through the USB
    tree, along with the dependencies above.

  - Patch 10 and 11 go through the power sequencing tree.

  - Patch 12 through 16 (device tree only) go through the soc tree via
    the mediatek tree.

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

Chen-Yu Tsai (16):
  device property: Add fwnode_graph_get_port_by_id()
  device property: Add fwnode_graph_get_next_port_endpoint()
  power: sequencing: Change CONFIG_POWER_SEQUENCING to bool
  usb: hub: Return actual error from hub_configure() in hub_probe()
  usb: hub: Associate port@ fwnode with USB port device
  usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
  usb: hub: Power on connected M.2 E-key connectors
  Revert "dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed
    EP"
  dt-bindings: usb: mediatek,mtk-xhci: Allow ports for USB connections
  power: sequencing: pcie-m2: support matching on remote "port" node
  power: sequencing: pcie-m2: Add usb and sdio targets for E-key
    connector
  arm64: dts: mediatek: mt8192-asurada: Add USB type-A connector
  arm64: dts: mediatek: mt8192-asurada: Add M.2 E-key slot
  arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
  arm64: dts: mediatek: mt8195-cherry: Add USB type-A connector
  arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot

 .../bindings/usb/mediatek,mtk-xhci.yaml       |  17 +-
 .../boot/dts/mediatek/mt8188-geralt.dtsi      |  93 ++++++++++-
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 139 +++++++++++++++--
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 147 +++++++++++++++++-
 drivers/base/property.c                       |  55 +++++++
 drivers/power/sequencing/Kconfig              |   2 +-
 drivers/power/sequencing/pwrseq-pcie-m2.c     |  50 ++++--
 drivers/usb/core/hub.c                        |  55 +++++--
 drivers/usb/core/hub.h                        |   6 +-
 drivers/usb/core/port.c                       |  72 ++++++++-
 include/linux/property.h                      |   3 +
 11 files changed, 583 insertions(+), 56 deletions(-)

-- 
2.54.0.1099.g489fc7bff1-goog


