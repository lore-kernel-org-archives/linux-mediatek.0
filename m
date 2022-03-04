Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D049C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AmpFBHYoV7pVXWZSlx9e2w0IrG+UEiLVdI7itZslrWU=; b=U2r9uFK4Y4oW4T
	TXUPTdyWztUeiHks9lWB20eQmLrVj8lF4HSkJH2Ncg05Ntu3Hqf98IetnVIpvyMxHROGxoEmwifTg
	oj+8YAhZKL8AYxcYfWakahKpIRtwob7TctMS4CTq5paYw+dqz9d3acOCB0dLZ6zKyMif4CXe4x7J8
	HsQShiuWvMOESF26qxcFwJYbpM4vj/1+4Po61QPcHwleiJCla2SXcPWDc2al6TObf+lh81ndXRic/
	1LdcJVh0WbQg5vdLbJPcM6+IAbxQ55+l7Si969ZCjNk4njPtdnE89vkAberLptKH9gIBBortKOrG6
	R20ong7XzDl5bPkUQpgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQAfB-00Azp8-Uo; Fri, 04 Mar 2022 16:20:18 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQAaW-00AxmI-AY
 for linux-mediatek@lists.infradead.org; Fri, 04 Mar 2022 16:15:30 +0000
Received: by mail-wr1-x42c.google.com with SMTP id j26so3055794wrb.1
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Mar 2022 08:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrMkWfnep54u5iNgaB4r+dAM8d1KFFgig+FJrYuk0pk=;
 b=BkiMi6QmBvXGp9TotIl0ob62+e/h6JsMQPZM3+y5rzZZJCBsHJxpaaaOjoXBA8rkK2
 r8r1pfp0/szpXWvqKiXjt3t4MPV1T2w82B6u6dLDyR5B+1jhu3PEJp5glLmIcCA2jtyu
 9RNoMu3D73Tw1im9wuhPGSmXNf1/5ZLMI4yekxVC6TQx4VTNQEByZ2OjIAUci2P/OFxF
 oX1swUgh/0s8jZMoZrdxMDkRk+7UbO6M5zgK096GY+itx49fUVAoQd1byRcon7r4k3tQ
 bTEmZlQL5UsxpOR0KnH58n6vHHJpyzujgEnj/1Bk4yDnbs702oZVl3K6spPdUH1RJ6QI
 6JuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrMkWfnep54u5iNgaB4r+dAM8d1KFFgig+FJrYuk0pk=;
 b=vUEdhCl49cNPYEarT9KtHpgq/qm4/ofAvsayw3Kt+xMGtBHYqdzSpAELDY4Bx8n3bk
 vYzMcHX61OMoveA63z8TEiM1Tm77yeF8hlqD8tKfYoMxX8gTDuL+D/9vDYy49QCdVAlt
 UkS6kmNVNSzegB/1aS8B2jp8JpGLRqrWX2Asi7Zt/grKOE/T+lV6GejU2kbmaQmZH45z
 CgFOw7Spz50nh+GLS62cwdv2ePIalv2NUXvD/WB4jI4aEtKUVnKUjX5b+TCwWsgBQ6gL
 QD8kUgU7jNFwK8UbFhFSi59uhlPYiJZf10X9OqqOwnuWtmSIAr/QbOiUWhiI1evXlbXK
 GxZQ==
X-Gm-Message-State: AOAM532ja2jBUjrrDbd27eX3DBayAkb6+LoTeNlOSuVhKeETpnowOSYj
 RfHWmHmlFVHKfT6PRQW8ymXLBQ==
X-Google-Smtp-Source: ABdhPJw+BrScSKY8cwPtWMHO+wpbI7pfRZr8TVd35OrIpG0qohLrXCNbxANPMJ2W58OrVGmXFPO0ig==
X-Received: by 2002:adf:a34e:0:b0:1f0:1a15:c9b2 with SMTP id
 d14-20020adfa34e000000b001f01a15c9b2mr13213798wrb.662.1646410525632; 
 Fri, 04 Mar 2022 08:15:25 -0800 (PST)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b001f049726044sm4937307wrv.79.2022.03.04.08.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 08:15:25 -0800 (PST)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 robh+dt@kernel.or
Cc: matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stephane.leprovost@mediatek.com, khilman@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v4 0/7] Add support of mt8183 APU
Date: Fri,  4 Mar 2022 17:15:07 +0100
Message-Id: <20220304161514.994128-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_081528_387455_4D020302 
X-CRM114-Status: GOOD (  18.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some Mediatek's SoC have an AI Processing Unit.
This adds support of the one available in the mt8183
(aswell some derivative SoC).

This v4 rework again the memory management.
Now, vdev buffer and vring buffer are declared in device tree with a fixed
physical address.
Using a new property named "memory-region-da", the driver can map the vdev and
vring buffers and make them available to the APU.
The physical address must be fixed so the firmware can convert the physical
address into APU device address.
Using fixed address is not flexible but this is acceptable since the buffer
addresses and size are not expected to be changed without a goog reason.

Changes in v4:
- Update the way to allocate and map the vdev and vring buffers
- Simplfy the code
- Add support of a second SoC (mt8365)
- fix the dt bindings error detected by the bot
- still use the threaded irq. calling rproc_vq_interrupt from irq causes
  a scheduling while atomic isssue
Changes in v3:
- Remove IOMMU hack. Instead, manage the IOMMU directly from the driver
- Update the device tree bindings: only use reserved memory for virtio.
  All the other memory allocation will be done using DMA API.
  This sould simplify the memory management.
- Add more comments
Changes in v2:
- Drop the workarounds needed to load bad firmwares
- There are many name for the APU (most common one is VPU).
  Rename many functions and dts nodes to be more consistent.
- Use the bulk clock API, and enable / disable clock at a better place
- add few comments explaining how to start the APU
- update the way to use pinctl for JTAG
- fix some minors issues
- fix device tree bindings


Alexandre Bailon (5):
  dt bindings: remoteproc: Add bindings for the MT8183 APU
  dt-bindings: remoteproc: Add bindings for the MT8365 APU
  remoteproc: Add a remoteproc driver for the MT8183's APU
  remoteproc: mtk_apu: Add support of JTAG
  ARM64: mt8183: Add support of APU to mt8183

Julien STEPHAN (2):
  remoteproc: mtk_apu: Use match_data
  remoteproc: mtk-apu: Add support of MT8365

 .../bindings/remoteproc/mtk,apu.yaml          | 155 ++++
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |  50 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  40 ++
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mtk_apu.c                  | 671 ++++++++++++++++++
 6 files changed, 936 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
 create mode 100644 drivers/remoteproc/mtk_apu.c

-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
