Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FCCD68BDF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Nov 2024 08:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WQwSj5xR6nGvYCDQCoo3nhUMZFjcatPrNfcvO7y5U9U=; b=GwMLmtkyXSSDHt
	bM/8L3KfmvPb3PixnRo7+0tlU3Xa2Ub1ywFoAz9FOtPa1nITNNXW2wCIfYTHiU9jcxHdLfhzt5u+r
	aYMCcJkmNWODr3t0akEx7Lp3ajXOipZYVUE8Kag5KzhZC1FXyF1TMMfRk5e7k94wBf8Y/E6bBCLZc
	LKYxYUyim9hNo2PjkpSwHD6gJ6DCtGrRwsf1zDdw6ARoKpkK/kDoUe+WElX8QbRapYyATsWQMU0iw
	Wz/YtyeEeQq1NCB7YJJBROHGboNiFGKpSNK/gw6/1dSWkn0VSbN/sF5pGQXB8IUMLtB8pbiVECSXA
	Sz5xMsbxRZLWmY2636Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCE2P-00000005DJm-21Ol;
	Sat, 16 Nov 2024 08:20:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCE1S-00000005D33-2HsX;
	Sat, 16 Nov 2024 08:19:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AA9A5C4A76;
	Sat, 16 Nov 2024 08:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BBA0C4CEC3;
	Sat, 16 Nov 2024 08:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731745153;
	bh=ZPcVkadjDBIH9KyjVVtehzPEyudewRBoJZnsUiPtHcs=;
	h=From:Subject:Date:To:Cc:From;
	b=l1ukALJLq9djPcjX4RZX6DMrZfpGgYA09IdhhK6+OGzRNAWhBAYxuUwR8TkLIWtFH
	 WrcgAkmJjiUqu3r1inlGlPL3/7NlwBASO3o+yn/e2lsLIawTCLuwQKfXZvyj0e7WM5
	 3K57zhPE7Q1ILvzovVtOpgja7vLQE09/xfq/cIzkk+MQ+q9DQCrgDswoCqOGfXTPp3
	 MUkrXzCIUfJZXl6dQxjzNazcDuhZCe9lEGc0JN6vaMqx0r1MkXp8AL77GXJUchvN5s
	 nFPnp2wwKEvo7BtDIASih/0/TdE9mtX4C+z1gaNT/iY4JHUjUnB/TE2/q2EN/LgCO2
	 4Lzqrl6Ovd+4Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v3 0/6] PCI: mediatek-gen3: mtk_pcie_en7581_power_up() code
 refactoring
Date: Sat, 16 Nov 2024 09:18:21 +0100
Message-Id: <20241116-pcie-en7581-fixes-v3-0-f7add3afc27e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1VOGcC/33NQQ7CIBAF0KuYWYuBoUhx5T2MC0KHlmhoA4Zom
 t5d2pUmxuX/k/9mhkwpUIbTboZEJeQwxhrkfgdusLEnFrqaATk2QnDNJheIUdSqFcyHJ2WG5qi
 48h1KJaHupkTboc4u15qHkB9jem0viljbf1oRjDPruWs1SpROn2+UIt0PY+ph5Qp+EuYXgZXgZ
 KVtrDem8V/Esixv6F0A+PYAAAA=
X-Change-ID: 20241107-pcie-en7581-fixes-296505fd2353
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_001914_632015_E94CE9A8 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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

Minor fixes and code refactoring in mtk_pcie_en7581_power_up() routine

---
Changes in v3:
- add trivial patches 5/6 and 6/6 to the series
- rename err_clk_init in err_clk_prepare_enable
- fix commit log for patches 2/6 and 3/6
- Link to v2: https://lore.kernel.org/r/20241109-pcie-en7581-fixes-v2-0-0ea3a4af994f@kernel.org

Changes in v2:
- added trivial patch 4/4
- improved commit logs and comments
- introduced PCIE_MTK_RESET_TIME_US macro
- Link to v1: https://lore.kernel.org/r/20241107-pcie-en7581-fixes-v1-0-af0c872323c7@kernel.org

---
Lorenzo Bianconi (6):
      PCI: mediatek-gen3: Add missing reset_control_deassert() for mac_rst in mtk_pcie_en7581_power_up()
      PCI: mediatek-gen3: rely on clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up()
      PCI: mediatek-gen3: Move reset/assert callbacks in .power_up()
      PCI: mediatek-gen3: Add comment about initialization order in mtk_pcie_en7581_power_up()
      PCI: mediatek-gen3: Add reset delay in mtk_pcie_en7581_power_up()
      PCI: mediatek-gen3: rely on msleep() in mtk_pcie_en7581_power_up()

 drivers/clk/clk-en7523.c                    |  1 -
 drivers/pci/controller/pcie-mediatek-gen3.c | 60 +++++++++++++++++++----------
 2 files changed, 39 insertions(+), 22 deletions(-)
---
base-commit: ac9626f643ea9cde795811d924388fa49f2c4c0c
change-id: 20241107-pcie-en7581-fixes-296505fd2353

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


