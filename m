Return-Path: <SRS0=WUpV=Y4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1693CA9ECF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2019 16:38:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE7C520663
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2019 16:38:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KB42OmsP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE7C520663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WrcAd7eQic9vtnLd7tj/vd/u65YzafyFcm4hgYfxl5Y=; b=KB42OmsPjqz36T
	zUIOPKrIhF/37Qqp4jYbg0Y5U99gj+1tgM9Cerbk22H9baxaOlMEW/SvoglpR4bScYT9/QDrfsbNL
	r9Ah/Pex2srn2Dy6QlgOwQnX99I5QZH7sy1HZB0lN+o2WpoeKGc5j8odhZmQN+NkblOHAjEDKxiJT
	Hw6emRIVWWbpMT3/3XAcoxZDvyfGeovvyFnh5LqOQB4HiRhgh9y+w4Ff9rYwtZW6It1E2f+I2cowo
	USMQrlfVscAFQYBIpnHBvDaZ5cMRKT9S18avCet3eFlej1TcvI+Y+RkQqjaXMuG/WPqPtwhS1Eyrr
	sELgNhV32vg18JvY60SQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRfNa-0006Cz-RD; Mon, 04 Nov 2019 16:38:58 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRfNP-00062K-2D; Mon, 04 Nov 2019 16:38:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7F041F1;
 Mon,  4 Nov 2019 08:38:43 -0800 (PST)
Received: from e119886-lin.cambridge.arm.com (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4ECF43F71A;
 Mon,  4 Nov 2019 08:38:41 -0800 (PST)
From: Andrew Murray <andrew.murray@arm.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 rfi@lists.rocketboards.org
Subject: [PATCH v1 0/7] PCI: dt: Remove magic numbers for legacy PCI IRQ
 interrupts
Date: Mon,  4 Nov 2019 16:38:14 +0000
Message-Id: <20191104163834.8932-1-andrew.murray@arm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_083847_197514_88874C33 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
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

PCI devices can trigger interrupts via 4 physical/virtual lines known
as INTA, INTB, INTC or INTD. Due to interrupt swizzling it is often
required to describe the interrupt mapping in the device tree. Let's
avoid the existing magic numbers and replace them with a #define to
improve clarity.

Based on v5.4-rc5, compile tested

Signed-off-by: Andrew Murray <andrew.murray@arm.com>


Andrew Murray (7):
  PCI: dt: Add legacy PCI IRQ defines
  arm64: dts: Use IRQ flags for legacy PCI IRQ interrupts
  arm: dts: Use IRQ flags for legacy PCI IRQ interrupts
  xtensa: dts: Use IRQ flags for legacy PCI IRQ interrupts
  powerpc: dts: fsl: Use IRQ flags for legacy PCI IRQ interrupts
  powerpc: dts: Use IRQ flags for legacy PCI IRQ interrupts
  dt-bindings: PCI: Use IRQ flags for legacy PCI IRQ interrupts

 .../devicetree/bindings/pci/83xx-512x-pci.txt |  18 +--
 .../devicetree/bindings/pci/aardvark-pci.txt  |  10 +-
 .../devicetree/bindings/pci/altera-pcie.txt   |  10 +-
 .../bindings/pci/axis,artpec6-pcie.txt        |  10 +-
 .../bindings/pci/cdns,cdns-pcie-host.txt      |  10 +-
 .../bindings/pci/faraday,ftpci100.txt         |  68 ++++----
 .../bindings/pci/fsl,imx6q-pcie.txt           |  10 +-
 .../bindings/pci/hisilicon-pcie.txt           |  20 +--
 .../bindings/pci/host-generic-pci.txt         |  10 +-
 .../devicetree/bindings/pci/kirin-pcie.txt    |  10 +-
 .../bindings/pci/layerscape-pci.txt           |  10 +-
 .../devicetree/bindings/pci/mediatek-pcie.txt |  40 ++---
 .../devicetree/bindings/pci/mobiveil-pcie.txt |   8 +-
 .../devicetree/bindings/pci/pci-rcar-gen2.txt |   8 +-
 .../bindings/pci/pci-thunder-pem.txt          |  10 +-
 .../devicetree/bindings/pci/pcie-al.txt       |   4 +-
 .../devicetree/bindings/pci/qcom,pcie.txt     |  20 +--
 .../bindings/pci/ralink,rt3883-pci.txt        |  18 +--
 .../bindings/pci/rockchip-pcie-host.txt       |  10 +-
 .../devicetree/bindings/pci/ti-pci.txt        |  10 +-
 .../devicetree/bindings/pci/uniphier-pcie.txt |  10 +-
 .../bindings/pci/v3-v360epc-pci.txt           |  34 ++--
 .../devicetree/bindings/pci/versatile.txt     |  40 ++---
 .../devicetree/bindings/pci/xgene-pci-msi.txt |  10 +-
 .../devicetree/bindings/pci/xgene-pci.txt     |  10 +-
 .../bindings/pci/xilinx-nwl-pcie.txt          |  10 +-
 .../devicetree/bindings/pci/xilinx-pcie.txt   |  20 +--
 arch/arm/boot/dts/alpine.dtsi                 |   6 +-
 arch/arm/boot/dts/artpec6.dtsi                |  10 +-
 arch/arm/boot/dts/gemini-dlink-dir-685.dts    |  34 ++--
 arch/arm/boot/dts/gemini-sl93512r.dts         |  34 ++--
 arch/arm/boot/dts/gemini-sq201.dts            |  34 ++--
 arch/arm/boot/dts/gemini-wbd111.dts           |  34 ++--
 arch/arm/boot/dts/gemini-wbd222.dts           |  34 ++--
 arch/arm/boot/dts/imx6qdl.dtsi                |  10 +-
 arch/arm/boot/dts/imx6sx.dtsi                 |  10 +-
 arch/arm/boot/dts/integratorap.dts            |  36 +++--
 arch/arm/boot/dts/keystone-k2e.dtsi           |  11 +-
 arch/arm/boot/dts/keystone.dtsi               |  10 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi           |  10 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi           |  10 +-
 arch/arm/boot/dts/versatile-pb.dts            |  36 +++--
 arch/arm64/boot/dts/al/alpine-v2.dtsi         |   6 +-
 .../boot/dts/amd/amd-overdrive-rev-b0.dts     |   2 +-
 .../boot/dts/amd/amd-overdrive-rev-b1.dts     |   2 +-
 arch/arm64/boot/dts/amd/amd-overdrive.dts     |   2 +-
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi  |  12 +-
 arch/arm64/boot/dts/amd/husky.dts             |   2 +-
 arch/arm64/boot/dts/arm/fvp-base-revc.dts     |  10 +-
 arch/arm64/boot/dts/arm/juno-base.dtsi        |  12 +-
 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi |  10 +-
 .../arm64/boot/dts/freescale/fsl-ls1012a.dtsi |  10 +-
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |  10 +-
 arch/arm64/boot/dts/hisilicon/hip06.dtsi      |  10 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  10 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  10 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  10 +-
 .../boot/dts/socionext/uniphier-ld20.dtsi     |  11 +-
 .../boot/dts/socionext/uniphier-pxs3.dtsi     |  11 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  12 +-
 arch/powerpc/boot/dts/bluestone.dts           |  12 +-
 arch/powerpc/boot/dts/charon.dts              |  12 +-
 arch/powerpc/boot/dts/digsy_mtc.dts           |  12 +-
 arch/powerpc/boot/dts/fsl/b4420qds.dts        |   4 +-
 arch/powerpc/boot/dts/fsl/b4420si-post.dtsi   |   2 +-
 arch/powerpc/boot/dts/fsl/b4860qds.dts        |   4 +-
 arch/powerpc/boot/dts/fsl/b4860si-post.dtsi   |   2 +-
 arch/powerpc/boot/dts/fsl/b4qds.dtsi          |   2 +-
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi      |  12 +-
 arch/powerpc/boot/dts/fsl/bsc9132qds.dts      |   2 +-
 arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi |  12 +-
 arch/powerpc/boot/dts/fsl/c293pcie.dts        |   2 +-
 arch/powerpc/boot/dts/fsl/c293si-post.dtsi    |  12 +-
 arch/powerpc/boot/dts/fsl/gef_sbc310.dts      |  12 +-
 arch/powerpc/boot/dts/fsl/mpc8536ds.dts       |  12 +-
 arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dts   |  12 +-
 arch/powerpc/boot/dts/fsl/mpc8540ads.dts      | 100 ++++++------
 arch/powerpc/boot/dts/fsl/mpc8544ds.dts       |  22 +--
 arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi      |  22 +--
 arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts  |  14 +-
 arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts  |  14 +-
 arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi |  12 +-
 arch/powerpc/boot/dts/fsl/mpc8560ads.dts      | 100 ++++++------
 arch/powerpc/boot/dts/fsl/mpc8568mds.dts      |  22 +--
 arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi |  12 +-
 arch/powerpc/boot/dts/fsl/mpc8569mds.dts      |   2 +-
 arch/powerpc/boot/dts/fsl/mpc8569si-post.dtsi |  12 +-
 arch/powerpc/boot/dts/fsl/mpc8641_hpcn.dts    | 150 +++++++++---------
 .../powerpc/boot/dts/fsl/mpc8641_hpcn_36b.dts | 150 +++++++++---------
 arch/powerpc/boot/dts/fsl/p2020ds.dts         |   2 +-
 arch/powerpc/boot/dts/fsl/p2020ds.dtsi        |  46 +++---
 arch/powerpc/boot/dts/fsl/ppa8548.dts         |   2 +-
 arch/powerpc/boot/dts/fsl/sbc8641d.dts        |   4 +-
 arch/powerpc/boot/dts/haleakala.dts           |  12 +-
 arch/powerpc/boot/dts/holly.dts               |  42 ++---
 arch/powerpc/boot/dts/hotfoot.dts             |  12 +-
 arch/powerpc/boot/dts/kuroboxHD.dts           |  28 ++--
 arch/powerpc/boot/dts/kuroboxHG.dts           |  28 ++--
 arch/powerpc/boot/dts/lite5200.dts            |  12 +-
 arch/powerpc/boot/dts/lite5200b.dts           |  22 +--
 arch/powerpc/boot/dts/media5200.dts           |  26 +--
 arch/powerpc/boot/dts/mpc5121ads.dts          |  20 +--
 arch/powerpc/boot/dts/mpc8308rdb.dts          |  12 +-
 arch/powerpc/boot/dts/mpc8313erdb.dts         |  20 +--
 arch/powerpc/boot/dts/mpc832x_mds.dts         |  60 +++----
 arch/powerpc/boot/dts/mpc832x_rdb.dts         |  22 +--
 arch/powerpc/boot/dts/mpc8349emitxgp.dts      |   8 +-
 arch/powerpc/boot/dts/mpc836x_mds.dts         |  60 +++----
 arch/powerpc/boot/dts/mpc836x_rdk.dts         |  16 +-
 arch/powerpc/boot/dts/mucmc52.dts             |  12 +-
 arch/powerpc/boot/dts/mvme5100.dts            |  48 +++---
 arch/powerpc/boot/dts/pcm030.dts              |  22 +--
 arch/powerpc/boot/dts/pcm032.dts              |  22 +--
 arch/powerpc/boot/dts/pq2fads.dts             |  28 ++--
 arch/powerpc/boot/dts/socrates.dts            |   8 +-
 arch/powerpc/boot/dts/storcenter.dts          |  28 ++--
 arch/powerpc/boot/dts/stx_gp3_8560.dts        |  36 +++--
 arch/powerpc/boot/dts/taishan.dts             |  20 +--
 arch/powerpc/boot/dts/tqm5200.dts             |  12 +-
 arch/powerpc/boot/dts/tqm8540.dts             |  16 +-
 arch/powerpc/boot/dts/tqm8541.dts             |  16 +-
 arch/powerpc/boot/dts/tqm8555.dts             |  16 +-
 arch/powerpc/boot/dts/tqm8560.dts             |  16 +-
 arch/powerpc/boot/dts/virtex440-ml510.dts     |  43 ++---
 arch/powerpc/boot/dts/xcalibur1501.dts        |  13 +-
 arch/powerpc/boot/dts/xpedite5200.dts         |   8 +-
 arch/xtensa/boot/dts/virt.dts                 |  12 +-
 .../dt-bindings/interrupt-controller/irq.h    |   8 +
 128 files changed, 1326 insertions(+), 1189 deletions(-)

-- 
2.21.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
