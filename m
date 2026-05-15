Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB803CD4851
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 09:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MeVtd5jgWtEcTyZTMUFtTZGp+FoBlkEpQv/hKwoH+Rk=; b=RcXgPvNsfRmcedLNixFet0IFuU
	1jLPIoBZKlfuVAZEQeab97hotSDlrmtii9IOSi2qCPqScH/hUTdPdO3TekPFjOifP+m+SignLhf6R
	OWz2rKFL5MFxGU4f2UZeeHzDPz2QyvEyIDESh2dYea6wrpKL6yOxa1aR0scRnsFZf5MS0lD9PLAFD
	1atTqNbWZxBA/ciIvrTNICxT+YpvqnKpmnBXQO05VrgtwsMzjubTl8otXNeDXbZGwbhOQ9Lemdicm
	PBZWDwHbuDTNWR85ozUsc2fYHuI0IKxIjCArLFju0zGkgIT5xNRfmimEpVptYMSmtc7DkBEhA+55q
	Mw0/1Iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoQu-00000007oZU-2T0T;
	Fri, 15 May 2026 09:02:12 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoQr-00000007oY8-0rLA
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 09:02:10 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so4897312a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 02:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835728; x=1779440528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MeVtd5jgWtEcTyZTMUFtTZGp+FoBlkEpQv/hKwoH+Rk=;
        b=YtDOxmCYYyt5c0hJBKra1EZHBRtXn6LzRKZR085rGC2D4EY8p0zjrS/M6dUQSfmQYw
         FyKgAMc63RDaV7J71lBvNvQ5RF/F/v/BOcA1UZLzWhI0Uw+qt/OZob/wjc2fpVIM/Kqq
         +y1qwQwZxUCJg0Zu45iF9gbbpwP5U3uBs1W+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835728; x=1779440528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeVtd5jgWtEcTyZTMUFtTZGp+FoBlkEpQv/hKwoH+Rk=;
        b=bGSGBwfybhbUs4eJPIV7A4E9qI8+tLyCmWaAWnMCnUepFA7wIqZfw/lDWq+2pRc7rX
         lcNGeYkWkz5z+J9ykfU0hI1phV5VHPUUdwGqysOaC86WjwdiIkf0NYUL/qH5GPBgIF67
         4SLfQFJDDdYDGHWCz149djQV6xxu7P4fM+q3PlMQI4LKla6Nejho5oBBR8QxqMl72mCN
         g6lMyohHoG3Vz2qPvOvkBMNleVxNLoESsoTuH8L52Ye5uELlS7zoY8htGu/WK3cGkbp+
         XbML9dzRqBMY2z02X+jZToe7PfiMwLGh548PViQdFc58INj3MW8vHlmqeGfbkeGPfz/j
         iRig==
X-Forwarded-Encrypted: i=1; AFNElJ+WwCwfsMdpVWV2Q9YtIVLtkyOKuXoThducioAb/6ePAWDURZzZnYElT1BAUePnlAtaW+v9aZ0277Z5WgWTLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyA9QrB0aGYQi1CWJmkChdbpsPwWaeb4QnNCEMJooNlu2Ea2x4r
	pjLPIWB1LizumNayaaNWdYV4Lg8Xe9q0sJ7tWtUKtctc3A+epZaUEe1bq9/FDVft5A==
X-Gm-Gg: Acq92OG3RG3SCgpawWYi80pdAkv8IqRGNVxAQBr1Uc+RQxkQzuYt5hC8G1NSStCL+JC
	HmHcq4WVguuvkrV1+gURHt+3U+zrv0C0o/jA7sb0iB24kw8j5acNjyOj8lgxqfQIYupSmSZFWcE
	DenIY8OwHBhUMlGdl60OjrLVqNP1Ny0HLa9Dsuzs+q3XyC5itZW5pWhREDOOzIaSbI98NbLhm5Y
	rRyPQAkgjon5WtHNEttkP7nZvjmPIIj140GmGJneIzGtYj3EjYBAS8hMa+Zr1EDTSRvzb+QLsPV
	IwfnMyAfKk3uwluB3LF/C3FhXzbS2cOakOz80SuFGK4TUF1b8msTNFGcl80eDrkDjiIgHnInPHB
	+IwJV4TZ0ciBlfKJV7dgnaG5Zn2oZzEAP9/Fgf6lcrrgy5zCRD0ArLgeTe1W5bLuV2OuBHa+kzb
	8gk6VyhtyKPKsBtmyYAubAUT+UsRJpIkZBTPeoxDvYN2I/rocTI+zHQbShXUxOR/N6w6eaHU+zr
	AdMDsCO
X-Received: by 2002:a17:90b:2d08:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36951ca6064mr3062453a91.23.1778835727968;
        Fri, 15 May 2026 02:02:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
Date: Fri, 15 May 2026 17:01:36 +0800
Message-ID: <20260515090149.3169406-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020209_277158_039FAAF3 
X-CRM114-Status: GOOD (  22.43  )
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

This series is my attempt at enabling power sequencing for USB to support
the USB connection on M.2 E-key slots. M.2 E-key was enabled in v7.1-rc1
with just PCIe and UART supported [1].

Most of the series is based on next-20260508, while the DT changes also
depend on some other DT cleanup patches I sent [2][3].


Patch 1 reworks the power sequencing framework to allow matching against
different USB ports. The consumer API gains an "index" parameter (which
is the USB port number on the hub), while the provider API is reworked
to pass the index to the matching function of the providing driver.

Patch 2 implements the index matching in the pcie-m2 driver. Matching
only happens when a valid (>= 0) index is given.

Patch 3 reworks the power sequencing targets for the E-key connector in
the pcie-m2 driver to add targets for USB and SDIO. The former is used
later on in this series.

Patch 4 reworks the USB hub driver to return the actual error code from
hub_configure() in hub_probe(). This is needed in the next patch to
correctly return -EPROBE_DEFER.

Patch 5 lets the USB hub driver look for power sequencers for each port.
Currently this only works for M.2 E-key connections, but it could be
extended to cover other cases. It should also make port reset via turning
off the port VBUS work, even when VBUS is not directly controlled by the
hub.

I expect some discussion on this patch, because a) it adds some
OF-specific code into an otherwise generic (core) driver, and
b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up powering
on the port twice, which negates the port reset part.

Patch 6 reverts an incorrectly modeled OF graph connection for the
MediaTek XHCI controller.

Patch 7 then adds a proper representation.

Patches 8 through 12 enable the M.2 E-key slots (used for WiFi/BT) and
USB type-A connectors found on MediaTek-based Chromebooks. These are
provided in this series for reference. The USB type-A connector changes,
while not directly related, have overlapping context, and was easier to
include. They were also used to test some extra local changes I tried
to convert the USB A connector from an onboard USB device to a power
sequencing provider.


As this series changes existing power sequencing API, and also uses the
changed API in subsequent patches, I think the best way to merge this
is for Bartosz to take the power sequencing patches and provide an
immutable tag for Greg to merge and then merge the USB patches.

The DT patches can go through the soc tree once all the driver and DT
binding changes are merged.


Thanks
ChenYu

P.S. I'll be at Embedded Recipes if anyone wants to discuss details.

[1] https://lore.kernel.org/all/20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260505101408.1796563-1-wenst@chromium.org/
[3] https://lore.kernel.org/all/20260514101254.2749300-1-wenst@chromium.org/


Chen-Yu Tsai (12):
  power: sequencing: Add index parameter for getting power sequencer
  power: sequencing: pcie-m2: implement port index matching
  power: sequencing: pcie-m2: Add usb and sdio targets for E-key
    connector
  usb: hub: Return actual error from hub_configure() in hub_probe()
  usb: hub: Power on connected M.2 E-key connectors
  Revert "dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed
    EP"
  dt-bindings: usb: mediatek,mtk-xhci: Allow ports for USB connections
  arm64: dts: mediatek: mt8192-asurada: Add USB type-A connector
  arm64: dts: mediatek: mt8192-asurada: Add M.2 E-key slot
  arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
  arm64: dts: mediatek: mt8195-cherry: Add USB type-A connector
  arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot

 .../bindings/usb/mediatek,mtk-xhci.yaml       |  17 +-
 .../boot/dts/mediatek/mt8188-geralt.dtsi      |  93 ++++++++++-
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 139 +++++++++++++++--
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 146 +++++++++++++++++-
 drivers/power/sequencing/core.c               |  12 +-
 drivers/power/sequencing/pwrseq-pcie-m2.c     |  65 +++++---
 drivers/power/sequencing/pwrseq-qcom-wcn.c    |   6 +-
 drivers/power/sequencing/pwrseq-thead-gpu.c   |   2 +-
 drivers/usb/core/hub.c                        |  22 ++-
 drivers/usb/core/hub.h                        |   2 +
 drivers/usb/core/port.c                       |  54 ++++++-
 include/linux/pwrseq/consumer.h               |   6 +-
 include/linux/pwrseq/provider.h               |   2 +-
 13 files changed, 508 insertions(+), 58 deletions(-)

-- 
2.54.0.563.g4f69b47b94-goog


