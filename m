Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE10DC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 16:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qZsu7mj1Fn2ASNqlKZSwGNM0qw48Fnq0jA605T3SWuc=; b=lcXtDMOsK2/dSvFo7s/9vvjBTF
	ytqoHbTnrJfMNYoLUbnc8gcojkAuRGn1gtBpb/17uDXDMUHt4i/gFEdRmTdnBXChq8Is/mcu+M1ED
	Asj1y5jbThAXngF3KXiQ/lP1n2ZeEfK462sP4fGiUX3YXTA8c5E7fT4+PnCVpjN243tYDa7JeErdx
	35z3mZrXsRZvzJT504zv0gNasj1jhefGe9o1odqx1TAZtE3EKqEydsMosJQaZ3F4dd/SfpySXBTSf
	yEFRMODAXseCY2F0JnX/c86/9ACdgUxcd1TuejMihadQkvf1EXfM3N4egPtco75UyiETiG7Ii/bQl
	yyIbDt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDpYM-00A1XX-CI; Fri, 06 Jan 2023 16:26:46 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDpYB-00A1Qi-Bw; Fri, 06 Jan 2023 16:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673022395; x=1704558395;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ctzDQnYxxyCDps2wP23DPf/rRuEaD1btA2BvbQjol7M=;
  b=XQHDujg/ndEr/yLcQQlgUi73zz+Qm77pURy8Xb8ljN8SAb6MlXM+w3fw
   JksDvS8w5XLZgkneyL3b2wpeHdddGecrhu7JtrZCGT8yn4aBcINjRC4OD
   Hwhuc+JYKJlN+2kzzyIKxV6ifJ3OxZGElNHFjIpc3jhbk9mn8TpnGjsJd
   9X7UIu7bqJs8LPvBAK3HmgJIr1fdEBIz2cJwi9nExbidKT0UGN4kLkIEX
   8Zepj1h1vTqcOh9GP7S17MYjmhB86RNJe932ZaNEF3oLu+hhGOdxUZciO
   W5qYPQpHLLHqkCnibWXhgD5HQP8SMBIsg9DJ9EXTbu+k2EZ4PCN/uAOOT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="321210296"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; 
   d="scan'208";a="321210296"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 08:26:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="798319063"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; 
   d="scan'208";a="798319063"
Received: from bswcg005.iind.intel.com ([10.224.174.136])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2023 08:26:28 -0800
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
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 net-next 0/5] net: wwan: t7xx: fw flashing & coredump support
Date: Fri,  6 Jan 2023 21:56:16 +0530
Message-Id: <cover.1673016069.git.m.chetan.kumar@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_082635_466042_52399826 
X-CRM114-Status: GOOD (  14.47  )
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

This patch series brings-in the support for FM350 wwan device firmware
flashing & coredump collection using devlink interface.

Below is the high level description of individual patches.
Refer to individual patch commit message for details.

PATCH1:  Enables AP CLDMA communication for firmware flashing &
coredump collection.

PATCH2: Enables the infrastructure & queue configuration required
for early ports enumeration.

PATCH3: Implements device reset and rescan logic required to enter
or exit fastboot mode.

PATCH4: Implements devlink interface & uses the fastboot protocol for
fw flashing and coredump collection.

PATCH5: t7xx devlink commands documentation.

Version History:
================
v3: Repost the series by setting format.thread git-config option to
    shallow as suggested by Brandeburg, Jesse.
v2: Address review comments given by Jarvinen, Ilpo Johannes and
    Sergey Ryazanov. Refer to Individual patches on v2 changes.
v1: Initial Version.

Haijun Liu (1):
  net: wwan: t7xx: Add AP CLDMA

M Chetan Kumar (4):
  net: wwan: t7xx: Infrastructure for early port configuration
  net: wwan: t7xx: PCIe reset rescan
  net: wwan: t7xx: Enable devlink based fw flashing and coredump
    collection
  net: wwan: t7xx: Devlink documentation

 Documentation/networking/devlink/index.rst |   1 +
 Documentation/networking/devlink/t7xx.rst  | 161 +++++
 drivers/net/wwan/Kconfig                   |   1 +
 drivers/net/wwan/t7xx/Makefile             |   5 +-
 drivers/net/wwan/t7xx/t7xx_hif_cldma.c     |  64 +-
 drivers/net/wwan/t7xx/t7xx_hif_cldma.h     |  20 +-
 drivers/net/wwan/t7xx/t7xx_mhccif.h        |   1 +
 drivers/net/wwan/t7xx/t7xx_modem_ops.c     |  81 ++-
 drivers/net/wwan/t7xx/t7xx_modem_ops.h     |   2 +
 drivers/net/wwan/t7xx/t7xx_pci.c           |  72 ++-
 drivers/net/wwan/t7xx/t7xx_pci.h           |   2 +
 drivers/net/wwan/t7xx/t7xx_pci_rescan.c    |  96 +++
 drivers/net/wwan/t7xx/t7xx_pci_rescan.h    |  28 +
 drivers/net/wwan/t7xx/t7xx_port.h          |  12 +-
 drivers/net/wwan/t7xx/t7xx_port_ap_msg.c   |  78 +++
 drivers/net/wwan/t7xx/t7xx_port_ap_msg.h   |  11 +
 drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c |   8 +-
 drivers/net/wwan/t7xx/t7xx_port_devlink.c  | 665 +++++++++++++++++++++
 drivers/net/wwan/t7xx/t7xx_port_devlink.h  |  86 +++
 drivers/net/wwan/t7xx/t7xx_port_proxy.c    | 135 ++++-
 drivers/net/wwan/t7xx/t7xx_port_proxy.h    |  16 +-
 drivers/net/wwan/t7xx/t7xx_port_wwan.c     |  25 +-
 drivers/net/wwan/t7xx/t7xx_reg.h           |  32 +-
 drivers/net/wwan/t7xx/t7xx_state_monitor.c | 134 ++++-
 drivers/net/wwan/t7xx/t7xx_state_monitor.h |   3 +
 25 files changed, 1634 insertions(+), 105 deletions(-)
 create mode 100644 Documentation/networking/devlink/t7xx.rst
 create mode 100644 drivers/net/wwan/t7xx/t7xx_pci_rescan.c
 create mode 100644 drivers/net/wwan/t7xx/t7xx_pci_rescan.h
 create mode 100644 drivers/net/wwan/t7xx/t7xx_port_ap_msg.c
 create mode 100644 drivers/net/wwan/t7xx/t7xx_port_ap_msg.h
 create mode 100644 drivers/net/wwan/t7xx/t7xx_port_devlink.c
 create mode 100644 drivers/net/wwan/t7xx/t7xx_port_devlink.h

--
2.34.1


