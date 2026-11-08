Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4582606A31C
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cBzRO8lT;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Gkku8EDR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=l+50H9UydDgvjDUOodm6tPmjOieLyAKe00ss8qncm54=; b=cBzRO8lT4Bw8B+ku3bGpZ8ccnK
	2uWwo+JeQWskEAAxSvv0al1bxaYsilWxD4A6u+LnfjClgbxw0qzWx9b33ZteE//roDC2g+nIMpo8z
	hIVIVujDdATz0AlLdphgpM8fu6cQk4j7EDPlbfk9Ay707nuIWvI2EbMHeRmCOw2td0Co3+WuvzKSp
	ql6Dm6io+pm/aytxa3a1OYVaAt9At4i7TP/ZpqT3KarKlZ5ohTWscaVVgffnp5uMMvNb8zTSzIXEj
	iu8+9aZV18ZnkmKFDleSO3cKG8FYL1UrBq9uvkxTxSSIJ0srljakDT0hqQMT5jOpbUQC5yIKaFcqb
	yRwqwkoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzOg-0000000FvDo-1aEw;
	Sun, 08 Nov 2026 09:41:10 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzOc-0000000Fv8C-1kB0
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 09:41:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=l+
	50H9UydDgvjDUOodm6tPmjOieLyAKe00ss8qncm54=; b=Gkku8EDRpHK2BOv3RK
	zcXV72FgYqH1xGfyYocVTtkXEYOJLKbRW3s+36B2QVaKjcbcQOiBPDus9+3+wuOq
	XCIRfxKMXn1n4jp9i3MGdk936eLruQYHkksXsBAR2tZ+oRPrUzZAFVz4IHBCKtAD
	eEAFN63OBFk6ytwHAopEhFGnY=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCXz8OTQ_BquUg4GA--.62891S2;
	Sun, 08 Nov 2026 17:40:37 +0800 (CST)
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
Subject: [PATCH v2 0/5] PCI: Encapsulate pcie_link_speed array access
Date: Sun,  8 Nov 2026 17:40:29 +0800
Message-ID: <20261108094034.679945-1-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXz8OTQ_BquUg4GA--.62891S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar13WFy8trW5tF48XF1rCrg_yoW8CF1rpF
	ZrK3yFyr1DXrW5uFWDAa4UZF9Yv3ZxG3yUt34rKw4rZF13CrWfXa4S9w4rGF9FkrZrZry7
	JFnxtFn8ArnrAFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUxhdUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7BbMcGrwQ5b4YAAA3R
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_014106_771560_79302E38 
X-CRM114-Status: UNSURE (   7.82  )
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

v1 series: https://patchwork.kernel.org/project/linux-pci/patch/20260315160057.127639-1-18255117159@163.com/

Hans Zhang (5):
  PCI: Use pcie_get_link_speed() in pci.c
  PCI: Convert remaining core pcie_link_speed[] users
  PCI: tegra264: Use pcie_get_link_speed()
  PCI: mediatek: Use pcie_get_link_speed()
  PCI: Make pcie_link_speed[] private to probe.c

 drivers/pci/controller/pcie-mediatek.c | 2 +-
 drivers/pci/controller/pcie-tegra264.c | 6 +++---
 drivers/pci/pci-sysfs.c                | 2 +-
 drivers/pci/pci.c                      | 9 ++-------
 drivers/pci/pci.h                      | 3 +--
 drivers/pci/probe.c                    | 5 ++---
 6 files changed, 10 insertions(+), 17 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


