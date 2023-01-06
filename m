Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1595AC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HKjvAfR5Z782wk0fiZzJ13Gnekg9u8ek8l6xWElkU4=; b=LfezlDfHNBbuqFPrdwaiHJ53v5
	WAoba5XBFEAG3ba0/Oc0gZXBfdqE8QjRzuQNzpqB9tlAZwtr9S5y46wnY2NbtB7z+QsS0U2vu0bM9
	adsWmG5YuMsEuciqTgeCGZPVoVr9HInXupT8u/+5W6HpLHNk1w8sAHytJM/+6t+2CsqjXGBmvXU48
	QXx2I+94PeClYnOhozCm9OsxkGV4RiJsZjiIcT7QR/7l2Iu2xGop/5t5ybfJ5eQHrk27MPrRW7pFS
	nY2WNQdhWF3yFLIfcqzMGtfKLqBQOBtB0K1ln+ui3kZ3XNtWWbGTE5cNp1TsvWN0CzjieX+J+fBNR
	Ug2bcx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDpae-00A4SD-W2; Fri, 06 Jan 2023 16:29:09 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDpZt-00A31U-1Q; Fri, 06 Jan 2023 16:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673022501; x=1704558501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KPM4CYTOH2kJiIRbFngO28NyOGabwRen0ySdT9mHomU=;
  b=mS4GZxp7ZBytADBwKJCy5OUpFXA36IQOiDVPj7xS2oPCfy8hs2kwFzrq
   fwtn8OnOT9ooYPtcyCdFInSeIjBVvx8Z1UG1n2buU1MqfezOQSZVyJrp5
   zpjBzgI+3uWVMbM34oqiJpMM36RTJOPlwfQXW2CdmnVav/3BfUOYCrrSE
   Ntjb6LKEUoNKNfPgn6Jm88Wo6DhaZoAW7jqyaAEF4EUyZJo31g7Yf/66A
   4PrfGIs/aSKH3uZ43xKx4FnPhMpLIXMVkh6Ejlsdbqj/3uDI6sdOLlyaG
   ABbfvOCvwyPimWpjQuGMbYlleomqBnNnN4KuXq9TeAtraCCnT/BUJARxo
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="384808572"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; 
   d="scan'208";a="384808572"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 08:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="655987093"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; 
   d="scan'208";a="655987093"
Received: from bswcg005.iind.intel.com ([10.224.174.136])
  by orsmga002.jf.intel.com with ESMTP; 06 Jan 2023 08:28:11 -0800
From: m.chetan.kumar@linux.intel.com
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	davem@davemloft.net,
	johannes@sipsolutions.net,
	ryazanov.s.a@gmail.com,
	loic.poulain@linaro.org,
	ilpo.jarvinen@linux.intel.com,
	ricardo.martinez@linux.intel.com,
	chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com,
	edumazet@google.com,
	pabeni@redhat.com,
	linuxwwan@intel.com,
	linuxwwan_5g@intel.com,
	chandrashekar.devegowda@intel.com,
	m.chetan.kumar@linux.intel.com,
	matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-doc@vger.kernel.org,
	jiri@nvidia.com,
	corbet@lwn.net
Subject: [PATCH v3 net-next 5/5] net: wwan: t7xx: Devlink documentation
Date: Fri,  6 Jan 2023 21:58:06 +0530
Message-Id: <500a41cb400b4cdedd6df414b40200a5211965f5.1673016069.git.m.chetan.kumar@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673016069.git.m.chetan.kumar@linux.intel.com>
References: <cover.1673016069.git.m.chetan.kumar@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_082821_166097_F64847C9 
X-CRM114-Status: GOOD (  18.70  )
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

From: M Chetan Kumar <m.chetan.kumar@linux.intel.com>

Document the t7xx devlink commands usage for fw flashing &
coredump collection.

Refer to t7xx.rst file for details.

Signed-off-by: M Chetan Kumar <m.chetan.kumar@linux.intel.com>
Signed-off-by: Devegowda Chandrashekar <chandrashekar.devegowda@intel.com>
--
v3:
 * No Change.
v2:
 * Documentation correction.
 * Add param details.
---
 Documentation/networking/devlink/index.rst |   1 +
 Documentation/networking/devlink/t7xx.rst  | 161 +++++++++++++++++++++
 2 files changed, 162 insertions(+)
 create mode 100644 Documentation/networking/devlink/t7xx.rst

diff --git a/Documentation/networking/devlink/index.rst b/Documentation/networking/devlink/index.rst
index fee4d3968309..0c4f5961e78f 100644
--- a/Documentation/networking/devlink/index.rst
+++ b/Documentation/networking/devlink/index.rst
@@ -66,3 +66,4 @@ parameters, info versions, and other features it supports.
    prestera
    iosm
    octeontx2
+   t7xx
diff --git a/Documentation/networking/devlink/t7xx.rst b/Documentation/networking/devlink/t7xx.rst
new file mode 100644
index 000000000000..de220878ad76
--- /dev/null
+++ b/Documentation/networking/devlink/t7xx.rst
@@ -0,0 +1,161 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================
+t7xx devlink support
+====================
+
+This document describes the devlink features implemented by the ``t7xx``
+device driver.
+
+Parameters
+==========
+The ``t7xx_driver`` driver implements the following driver-specific parameters.
+
+.. list-table:: Driver-specific parameters implemented
+   :widths: 5 5 5 85
+
+   * - Name
+     - Type
+     - Mode
+     - Description
+   * - ``fastboot``
+     - boolean
+     - driverinit
+     - Set this param to enter fastboot mode.
+
+Flash Update
+============
+
+The ``t7xx`` driver implements the flash update using the ``devlink-flash``
+interface.
+
+The driver uses DEVLINK_SUPPORT_FLASH_UPDATE_COMPONENT to identify the type of
+firmware image that need to be programmed upon the request by user space application.
+
+The supported list of firmware image types is described below.
+
+.. list-table:: Firmware Image types
+    :widths: 15 85
+
+    * - Name
+      - Description
+    * - ``preloader``
+      - The first-stage bootloader image
+    * - ``loader_ext1``
+      - Preloader extension image
+    * - ``tee1``
+      - ARM trusted firmware and TEE (Trusted Execution Environment) image
+    * - ``lk``
+      - The second-stage bootloader image
+    * - ``spmfw``
+      - MediaTek in-house ASIC for power management image
+    * - ``sspm_1``
+      - MediaTek in-house ASIC for power management under secure world image
+    * - ``mcupm_1``
+      - MediaTek in-house ASIC for cpu power management image
+    * - ``dpm_1``
+      - MediaTek in-house ASIC for dram power management image
+    * - ``boot``
+      - The kernel and dtb image
+    * - ``rootfs``
+      - Root filesystem image
+    * - ``md1img``
+      - Modem image
+    * - ``md1dsp``
+      - Modem DSP image
+    * - ``mcf1``
+      - Modem OTA image (Modem Configuration Framework) for operators
+    * - ``mcf2``
+      - Modem OTA image (Modem Configuration Framework) for OEM vendors
+    * - ``mcf3``
+      - Modem OTA image (other usage) for OEM configurations
+
+``t7xx`` driver uses fastboot protocol for fw flashing. In the fw flashing
+procedure, fastboot command & response are exchanged between driver and wwan
+device.
+
+The wwan device is put into fastboot mode via devlink reload command, by
+passing "driver_reinit" action.
+
+$ devlink dev reload pci/0000:$bdf action driver_reinit
+
+Upon completion of fw flashing or coredump collection the wwan device is
+reset to normal mode using devlink reload command, by passing "fw_activate"
+action.
+
+$ devlink dev reload pci/0000:$bdf action fw_activate
+
+Flash Commands:
+===============
+
+$ devlink dev flash pci/0000:$bdf file preloader_k6880v1_mdot2_datacard.bin component "preloader"
+
+$ devlink dev flash pci/0000:$bdf file loader_ext-verified.img component "loader_ext1"
+
+$ devlink dev flash pci/0000:$bdf file tee-verified.img component "tee1"
+
+$ devlink dev flash pci/0000:$bdf file lk-verified.img component "lk"
+
+$ devlink dev flash pci/0000:$bdf file spmfw-verified.img component "spmfw"
+
+$ devlink dev flash pci/0000:$bdf file sspm-verified.img component "sspm_1"
+
+$ devlink dev flash pci/0000:$bdf file mcupm-verified.img component "mcupm_1"
+
+$ devlink dev flash pci/0000:$bdf file dpm-verified.img component "dpm_1"
+
+$ devlink dev flash pci/0000:$bdf file boot-verified.img component "boot"
+
+$ devlink dev flash pci/0000:$bdf file root.squashfs component "rootfs"
+
+$ devlink dev flash pci/0000:$bdf file modem-verified.img component "md1img"
+
+$ devlink dev flash pci/0000:$bdf file dsp-verified.bin component "md1dsp"
+
+$ devlink dev flash pci/0000:$bdf file OP_OTA.img component "mcf1"
+
+$ devlink dev flash pci/0000:$bdf file OEM_OTA.img component "mcf2"
+
+$ devlink dev flash pci/0000:$bdf file DEV_OTA.img component "mcf3"
+
+Note: Component selects the partition type to be programmed.
+
+Regions
+=======
+
+The ``t7xx`` driver supports core dump collection when device encounters
+an exception. When wwan device encounters an exception, a snapshot of device
+internal data will be taken by the driver using fastboot commands.
+
+Following regions are accessed for device internal data.
+
+.. list-table:: Regions implemented
+    :widths: 15 85
+
+    * - Name
+      - Description
+    * - ``mr_dump``
+      - The detailed modem component logs are captured in this region
+    * - ``lk_dump``
+      - This region dumps the current snapshot of lk
+
+
+Region commands
+===============
+
+$ devlink region show
+
+
+$ devlink region new mr_dump
+
+$ devlink region read mr_dump snapshot 0 address 0 length $len
+
+$ devlink region del mr_dump snapshot 0
+
+$ devlink region new lk_dump
+
+$ devlink region read lk_dump snapshot 0 address 0 length $len
+
+$ devlink region del lk_dump snapshot 0
+
+Note: $len is actual len to be dumped.
-- 
2.34.1


