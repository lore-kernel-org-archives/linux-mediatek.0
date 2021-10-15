Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F4DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 14:33:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF13D60E09
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 14:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF13D60E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s8zuRVghnKYtL4IkRzschPDXzXsd3Y2APTJYNssim80=; b=L+xphcRTk92A1y
	dhtowWdFtN7+pdQo9POwTqih4VehZ2Wg8AeZE2RoJe1NlAgulorDO9sR3uquqbq01QExARwPraOrQ
	Bt2U8tAsuMMTZXzPz6CdiP/i90lpipF8pASzyfHriu7i5JHB+Yxe+qNR3e9aPrLr6N/7mwN6SynTY
	Sgt7kbYbO1pdWOZDzjE2v4r6reMMGV6s+wZ6f4aiZP9qzyU6tzE+B6YrtedRMcfkrt6fBA/94sTpn
	iizU7gwmwdBlGcCf3/W7GiAadKodFcsga6t+IpF552nrZPjgj9EhxT6xr71dR3KtU2UtHnUI/1IGY
	oOb/uoW/k8XnhLz/CWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbOGQ-007cyw-S1; Fri, 15 Oct 2021 14:32:50 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbOB0-007aaT-Us; Fri, 15 Oct 2021 14:27:17 +0000
Received: by mail-pf1-x434.google.com with SMTP id 187so8484345pfc.10;
 Fri, 15 Oct 2021 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A1+buzEnWHFfl/ZaWbrWJXy+M9IGPXk9SXcGFxZnAfs=;
 b=mW0YwkEYI+SkJyiLxlQX3Zdlu5EyWW8zMrdZ1/82zOBc94fM7nZ5imuO8lI0tb5Mlc
 GJX5XvSWu1L0mHI8nSrIRx+Do7SdcoiQJmua/qyhISbG1tvsgGAtKU2iaSZvTJBb65H4
 yybCzMgblNgOoHva0cf/tJmCf6kFhrzB7ImRJELkl+97pLZdPXanfD/7ui3T8inIbbwi
 STKVz/5qY9Dvta4IbwFgUI2HPfp+DgGS87+bamOPu7vRmCtOakuf4SGBbo8DvAGhvNNk
 uMToZ3PnjDxeoU2qn1wjU0aa9BC12o3ATwUQxwGE8QbXhHsGamQhQZz4miZcGUh7D1CO
 yNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A1+buzEnWHFfl/ZaWbrWJXy+M9IGPXk9SXcGFxZnAfs=;
 b=Ta18B5JfVt0N+68883ddT7sepJxocas6lqAaelSjnu1xd83ZjfaEULkNVeMZZewWvq
 n5asFHtiP8xV5JdstxuaQ85h9T/ZUqdrQV5h2uimU1rZFkg2qPk9W8CYkBnGj7qWhaMD
 QIcLI4DjWI3vStirQrdThWFKvScJcP3GWisDGI1MgOiTicnLFo0kVUirkhxRjgN7cBip
 ZVlcrss/Hu9pmUJJ1U39ULzbMVi+ubWCp9FF7jLtPJHNi1xDZtw4nMOAng1jQr20wpnG
 kgEeBnfOTJpb+TieqFbv2pnA1eiAvWJfzwuw9cz2r736CB4X+TyHhJGHqlnhTiboIG2u
 DdGw==
X-Gm-Message-State: AOAM532LNawnWau73p+OPvnyxhR8L+Wa/Gmfs/CaXzyAos7LBXnChqtr
 /keP0L95z36WM+4LNIS9DAjwfbK23p6D4/nc
X-Google-Smtp-Source: ABdhPJxFKApjvWHOznC1si5BoWluKZQ8jEGESoKMvikMsJGlwrW7cHZUum4j158SdHMlbo9VkZ0e4A==
X-Received: by 2002:a62:ab17:0:b0:44c:f727:98cd with SMTP id
 p23-20020a62ab17000000b0044cf72798cdmr12077120pff.35.1634308032813; 
 Fri, 15 Oct 2021 07:27:12 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:5414:a8c0:67be:6f68:5d31:1ee2])
 by smtp.gmail.com with ESMTPSA id ls7sm5408396pjb.16.2021.10.15.07.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:27:12 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Cc: Naveen Naidu <naveennaidu479@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v2 00/24] Unify PCI error response checking
Date: Fri, 15 Oct 2021 19:56:31 +0530
Message-Id: <cover.1634300660.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_072715_090170_32ECA80B 
X-CRM114-Status: GOOD (  17.51  )
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

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error.  There's no real data to return to satisfy the 
CPU read, so most hardware fabricates ~0 data.

This patch series adds PCI_ERROR_RESPONSE definition and other helper
definition SET_PCI_ERROR_RESPONSE and RESPONSE_IS_PCI_ERROR and uses it
where appropriate to make these checks consistent and easier to find.

This helps unify PCI error response checking and make error check
consistent and easier to find.

This series also ensures that the error response fabrication now happens
in the PCI_OP_READ and PCI_USER_READ_CONFIG. This removes the
responsibility from controller drivers to do the error response setting. 

Patch 1:
    - Adds the PCI_ERROR_RESPONSE and other related defintions
    - All other patches are dependent on this patch. This patch needs to
      be applied first, before the others

Patch 2:
    - Error fabrication happens in PCI_OP_READ and PCI_USER_READ_CONFIG
      whenever the data read via the controller driver fails.
    - This patch needs to be applied before, Patch 4/24 to Patch 15/24 are
      applied.

Patch 3:
    - Uses SET_PCI_ERROR_RESPONSE() when device is not found and
      RESPONSE_IS_PCI_ERROR() to check hardware read from the hardware.

Patch 4 - 15:
    - Removes redundant error fabrication that happens in controller 
      drivers when the read from a PCI device fails.
    - These patches are dependent on Patch 2/24 of the series.
    - These can be applied in any order.

Patch 16 - 22:
    - Uses RESPONSE_IS_PCI_ERROR() to check the reads from hardware
    - Patches can be applied in any order.

Patch 23 - 24:
    - Edits the comments to include PCI_ERROR_RESPONSE alsong with
      0xFFFFFFFF, so that it becomes easier to grep for faulty 
      hardware reads.

Changelog
=========

v2:
    - Instead of using SET_PCI_ERROR_RESPONSE in all controller drivers
      to fabricate error response, only use them in PCI_OP_READ and
      PCI_USER_READ_CONFIG

Naveen Naidu (24):
 [PATCH 1/24] PCI: Add PCI_ERROR_RESPONSE and it's related definitions
 [PATCH 2/24] PCI: Set error response in config access defines when ops->read() fails
 [PATCH 3/24] PCI: Unify PCI error response checking
 [PATCH 4/24] PCI: Remove redundant error fabrication when device read fails
 [PATCH 5/24] PCI: thunder: Remove redundant error fabrication when device read fails
 [PATCH 6/24] PCI: iproc: Remove redundant error fabrication when device read fails
 [PATCH 7/24] PCI: mediatek: Remove redundant error fabrication when device read fails
 [PATCH 8/24] PCI: exynos: Remove redundant error fabrication when device read fails
 [PATCH 9/24] PCI: histb: Remove redundant error fabrication when device read fails
 [PATCH 10/24] PCI: kirin: Remove redundant error fabrication when device read fails
 [PATCH 11/24] PCI: aardvark: Remove redundant error fabrication when device read fails
 [PATCH 12/24] PCI: mvebu: Remove redundant error fabrication when device read fails
 [PATCH 13/24] PCI: altera: Remove redundant error fabrication when device read fails
 [PATCH 14/24] PCI: rcar: Remove redundant error fabrication when device read fails
 [PATCH 15/24] PCI: rockchip: Remove redundant error fabrication when device read fails
 [PATCH 16/24] PCI/ERR: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 17/24] PCI: vmd: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 18/24] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 19/24] PCI/DPC: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 20/24] PCI/PME: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 21/24] PCI: cpqphp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 22/24] PCI: keystone: Use PCI_ERROR_RESPONSE to specify hardware error
 [PATCH 23/24] PCI: hv: Use PCI_ERROR_RESPONSE to specify hardware read error
 [PATCH 24/24] PCI: xgene: Use PCI_ERROR_RESPONSE to specify hardware error

 drivers/pci/access.c                        | 36 ++++++++--------
 drivers/pci/controller/dwc/pci-exynos.c     |  4 +-
 drivers/pci/controller/dwc/pci-keystone.c   |  4 +-
 drivers/pci/controller/dwc/pcie-histb.c     |  4 +-
 drivers/pci/controller/dwc/pcie-kirin.c     |  4 +-
 drivers/pci/controller/pci-aardvark.c       | 10 +----
 drivers/pci/controller/pci-hyperv.c         |  2 +-
 drivers/pci/controller/pci-mvebu.c          |  8 +---
 drivers/pci/controller/pci-thunder-ecam.c   | 46 +++++++--------------
 drivers/pci/controller/pci-thunder-pem.c    |  4 +-
 drivers/pci/controller/pci-xgene.c          |  8 ++--
 drivers/pci/controller/pcie-altera.c        |  4 +-
 drivers/pci/controller/pcie-iproc.c         |  4 +-
 drivers/pci/controller/pcie-mediatek.c      | 11 +----
 drivers/pci/controller/pcie-rcar-host.c     |  4 +-
 drivers/pci/controller/pcie-rockchip-host.c |  4 +-
 drivers/pci/controller/vmd.c                |  2 +-
 drivers/pci/hotplug/cpqphp_ctrl.c           |  4 +-
 drivers/pci/hotplug/pciehp_hpc.c            | 10 ++---
 drivers/pci/pci.c                           | 10 ++---
 drivers/pci/pcie/dpc.c                      |  4 +-
 drivers/pci/pcie/pme.c                      |  4 +-
 drivers/pci/probe.c                         | 10 ++---
 include/linux/pci.h                         |  9 ++++
 24 files changed, 87 insertions(+), 123 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
