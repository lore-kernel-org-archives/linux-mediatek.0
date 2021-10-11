Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9D8C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 17:36:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E14760E78
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 17:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E14760E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tK4mF4G71Iz5IwfeKouMXlBFUEwViG4BaHBQLxp3vf8=; b=WTAdMgtUcM/6Ih
	mbV6Ax9oTIo4GjlxHwBquPW9wGdRLnwxqXKaxzqR/DEZ0yzK5zfA/J8tCUBQTpTuGLz37m7rBY/Yw
	g1jEqtgE4HvT+wiZ05PTlxy3JuKtDpxcITh4JF8uKGRWgiV0utouRX8uuBQnYnTkSNGN9jYMNL0FT
	AIGWCZMLqNfu2d7jaDXuovoz1Y4pND5R19PIzIWvzjO+V+NPQxTObOvMv/dDMH53bbW+Wkv3GRUVc
	IaGA7CImuEr/2yHAMY9iyMSAOQYuYxTYKdHvuJEsyPZpYoONtHdZaG2kCBo1LU2Tdy5DDRY8/Zej9
	/gjOBzbNnCn1AUTyOS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZzE5-00AFKc-BG; Mon, 11 Oct 2021 17:36:37 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZzDr-00AFIt-FC; Mon, 11 Oct 2021 17:36:24 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so536383pjb.0; 
 Mon, 11 Oct 2021 10:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJzzZJUwpzeKQJlZIVOTzoqmYp8CWlcv3F3YYYU8MOg=;
 b=UQY5fuaeniwoPT/xwHQ3Ao7FeWJFVAhorTY5szyrGdLOGVxLcMbAyI4cuBXif1/HZV
 /PdEKOkP4XWO0c1FKucvGnQLn0BCRsberthTXZxRsm1u3v89wk2oZ3zOnqs9s4ya43NQ
 XWiezH28+9l/P3xR5zTpFmo1T95D98vsV/3nNl6990Qagg8v+WrADDXJx/HGiSOFn4hX
 5XoI5q9TiV72vLFs2lDVIeFnusAPqBeanD8oUQ+lBrDxUns/MCcRe2AdoX2SLgHAI4o/
 QqyEPf7f9Stid6ShIEinzes0Ri61q601MnMDe/BaR+6QaqRYYe4anDzLKd7yAt8ZQLMR
 cfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJzzZJUwpzeKQJlZIVOTzoqmYp8CWlcv3F3YYYU8MOg=;
 b=EaI5M0G5bmsZnJSL1yRcuGxqZQiYT60rcj6OzTfKVTJe8Ccu/VlJ6GzTkcJ8qdhoOQ
 z2rMAyrZPhwNamZBEC4GKAqWQFdkvPO3FpDO0aspuN5OCgwS4eG8I2LZFwHopVEuvCXw
 8wTWx9JbgCnlEyCJyW+AL3YUHbYECnztG89dZC6zZ+Ad3iGx4K3UsmLzU21+z5FYYUvg
 tQUwLbbxosuEp3UEk43glEj+bx3mOyu2GsBVORvpe7DG2G+rRzzu4vMkHWGkwGwGrmEI
 Iy1//MU40l0cPB3zTmqtcj+VoWtvnzuIyzxmXaLETeA2pGEecr/K36EALNf0PVC7l2Fa
 0kgQ==
X-Gm-Message-State: AOAM533JFasQz9KL2P1odBqZKmY2zef2N8GcnQ3FlkuYb6V2kJSoQHrq
 eCXbqZ9mXXYEdPHIoIz487I=
X-Google-Smtp-Source: ABdhPJxbCg5k83AJkkf7TpRQJrReqilB+qCC+1rDSbSN1M5Qa0bgpA3LMBJFY9nGSbN5K03Q8ex3zQ==
X-Received: by 2002:a17:90b:1804:: with SMTP id
 lw4mr354756pjb.174.1633973781406; 
 Mon, 11 Oct 2021 10:36:21 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 z8sm8859954pgc.53.2021.10.11.10.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:36:20 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Cc: Naveen Naidu <naveennaidu479@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/22] PCI: Unify PCI error response checking
Date: Mon, 11 Oct 2021 23:05:47 +0530
Message-Id: <cover.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_103623_539021_AFA48F12 
X-CRM114-Status: GOOD (  12.18  )
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
defintion SET_PCI_ERROR_RESPONSE and RESPONSE_IS_PCI_ERROR and uses it
where appropriate to make these checks consistent and easier to find.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Patch 1:
  - Adds the PCI_ERROR_RESPONSE and other related defintions
  - All other patches are dependent on this patch. This patch needs to
    be applied first, before the others

Patch 2 - 13
  - Uses SET_PCI_ERROR_RESPONSE() when device is not found

Patch 14 - 19
  - Uses RESPONSE_IS_PCI_ERROR() to check the reads from hardware

Patch 20 - 22
  - Edits the comments to include PCI_ERROR_RESPONSE alsong with
    0xFFFFFFFF, so that it becomes easier to grep for faulty hardware
    reads.

Thanks,
Naveen

Naveen Naidu (22):
  [PATCH 1/22] PCI: Add PCI_ERROR_RESPONSE and it's related defintions
  [PATCH 2/22] PCI: Unify PCI error response checking
  [PATCH 3/22] PCI: thunder: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 4/22] PCI: iproc: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 5/22] PCI: mediatek: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 6/22] PCI: exynos: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 7/22] PCI: histb: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 8/22] PCI: kirin: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 9/22] PCI: aardvark: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 10/22] PCI: mvebu: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 11/22] PCI: altera: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 12/22] PCI: rcar: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 13/22] PCI: rockchip: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 14/22] PCI/ERR: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 15/22] PCI: vmd: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 16/22] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 17/22] PCI/DPC: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 18/22] PCI/PME: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 19/22] PCI: cpqphp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 20/22] PCI: keystone: Use PCI_ERROR_RESPONSE to specify hardware error
  [PATCH 21/22] PCI: hv: Use PCI_ERROR_RESPONSE to specify hardware read error
  [PATCH 22/22] PCI: xgene: Use PCI_ERROR_RESPONSE to specify hardware error

 drivers/pci/access.c                        | 22 ++++++++++-----------
 drivers/pci/controller/dwc/pci-exynos.c     |  2 +-
 drivers/pci/controller/dwc/pci-keystone.c   |  4 ++--
 drivers/pci/controller/dwc/pcie-histb.c     |  2 +-
 drivers/pci/controller/dwc/pcie-kirin.c     |  2 +-
 drivers/pci/controller/pci-aardvark.c       |  8 ++++----
 drivers/pci/controller/pci-hyperv.c         |  2 +-
 drivers/pci/controller/pci-mvebu.c          |  4 ++--
 drivers/pci/controller/pci-thunder-ecam.c   | 20 +++++++++----------
 drivers/pci/controller/pci-thunder-pem.c    |  2 +-
 drivers/pci/controller/pci-xgene.c          |  8 ++++----
 drivers/pci/controller/pcie-altera.c        |  2 +-
 drivers/pci/controller/pcie-iproc.c         |  2 +-
 drivers/pci/controller/pcie-mediatek.c      |  4 ++--
 drivers/pci/controller/pcie-rcar-host.c     |  2 +-
 drivers/pci/controller/pcie-rockchip-host.c |  2 +-
 drivers/pci/controller/vmd.c                |  2 +-
 drivers/pci/hotplug/cpqphp_ctrl.c           |  4 ++--
 drivers/pci/hotplug/pciehp_hpc.c            | 10 +++++-----
 drivers/pci/pci.c                           | 10 +++++-----
 drivers/pci/pcie/dpc.c                      |  4 ++--
 drivers/pci/pcie/pme.c                      |  4 ++--
 drivers/pci/probe.c                         | 10 +++++-----
 include/linux/pci.h                         |  9 +++++++++
 24 files changed, 75 insertions(+), 66 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
