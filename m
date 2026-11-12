Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213CD606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 02:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oTnlYO2x;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XD5EZNd0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FSEZh3NZwb1p2uiVs9pz/oK72BBc8y3UgjZImSYaxGk=; b=oTnlYO2xeWhQE6nVDYtdPO7pwA
	pCILiV87uJE9MxYf9U7kaVvc8AqLFNJw1BK/ZRDhcR5nGAkwzcwd7fsZzfc+dTcP4KHBuBZy/BLja
	WDiow4UFYVF6CXVKn2kGqH45a9M48Bp9FjMkvQzPlT+D+vohmTTTDr5vySQTIjPgVcQJNIfNVLJl7
	j5X1AMAcUIG7KJUufxj6y9cGkWmRO89L+JbfqDeEuZ9TnKqdUI25pBDlQvl8EjriFQ5UAHydAHfHp
	MD9BkmIeTOSD8L1JxOgaYU3dKxShinrci7dquXWwAomlZGcYUBMitKvTqAkQg7anMX/Ca+Mca/ymm
	1RpjKNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKUI-00000008VTP-3JlV;
	Thu, 12 Nov 2026 02:24:30 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKUF-00000008VRV-1vGh
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 02:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=FS
	EZh3NZwb1p2uiVs9pz/oK72BBc8y3UgjZImSYaxGk=; b=XD5EZNd0YTkq64O+hm
	YuLVoFqzWwZnpL4I1WMMwAXF+mVtN/Q+0SVXy/S+JNw77my+PeqIz82HDudtJhO3
	0grCrM7nJ2uFo0/CG59C4rB9RdLR1Ge5j3UVAAboBBz5WqJ5RuuRksyk1+pfYrCk
	ZGPyzuGsUrNtPlA7kdES8eIzY=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDXj+5GI_VqPgXEGg--.53291S2;
	Thu, 12 Nov 2026 10:24:08 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	thierry.reding@kernel.org,
	ryder.lee@mediatek.com,
	jonathanh@nvidia.com
Cc: robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v3 0/5] PCI: Encapsulate pcie_link_speed array access
Date: Thu, 12 Nov 2026 10:24:00 +0800
Message-ID: <20261112022405.1230200-1-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXj+5GI_VqPgXEGg--.53291S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar1fCryfArWkGF43tr1fZwb_yoW8Kry5pF
	ZIy34Fyr1UJFW5uFZrAay7ZF9Y93ZxC3yUt34rK34fZF13CFW3XFyS9w4rAF9FkrZrZry7
	XF13t3Z8AFnrAFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUxhdUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7Anylmr1I0kjmgAA3N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_182427_972741_F83CBFA3 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series finishes encapsulating the pcie_link_speed[] array by
converting the remaining direct users to pcie_get_link_speed() and
making the array private to probe.c.

The pcie_get_link_speed() helper was introduced and accepted in the
v10 "PCI: of: Remove max-link-speed generation validation" series, but
a few users that were added later still index pcie_link_speed[]
directly.

Changes since v2:
- In pci.c, extract the PCI_EXP_LNKSTA_CLS field into a local
  lnksta_cls variable in pcie_link_bandwidth_mbps() and
  pcie_bandwidth_available() so the pcie_get_link_speed() calls stay
  readable.  This addresses the readability concern raised by Ilpo.
- No changes to the remaining patches.

Changes since v1:
- Rebase onto v7.4-rc1.
- Use pcie_get_link_speed(), which is already exported and
  bounds-checked, instead of introducing a new to_pcie_link_speed()
  helper.
- Split the pci.c change from the other core conversions, mirroring the
  split between v1 patches 1 and 2.
- Convert probe.c's max_bus_speed lookup, which v1 missed.
- Convert the Tegra264 and MediaTek controller drivers, which were
  added after the v10 series and would otherwise fail to build once the
  array is no longer exported.
- Split the two controller conversions into separate patches so each
  driver can be reviewed independently.
- Make pcie_link_speed[] static instead of only removing its extern
  declaration and export.

v2 series:
https://patchwork.kernel.org/project/linux-pci/patch/20261108094034.679945-1-18255117159@163.com/

v1 series:
https://patchwork.kernel.org/project/linux-pci/patch/20260315160057.127639-1-18255117159@163.com/

Hans Zhang (5):
  PCI: Use pcie_get_link_speed() in pci.c
  PCI: Convert remaining core pcie_link_speed[] users
  PCI: tegra264: Use pcie_get_link_speed()
  PCI: mediatek: Use pcie_get_link_speed()
  PCI: Make pcie_link_speed[] private to probe.c

 drivers/pci/controller/pcie-mediatek.c |  2 +-
 drivers/pci/controller/pcie-tegra264.c |  6 +++---
 drivers/pci/pci-sysfs.c                |  2 +-
 drivers/pci/pci.c                      | 15 ++++++---------
 drivers/pci/pci.h                      |  3 +--
 drivers/pci/probe.c                    |  6 ++----
 6 files changed, 14 insertions(+), 20 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


