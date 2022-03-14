Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF5DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z+W0UIxzYNmTOftq+FeNUgbpg3mzdv5buFR9kStD0Fs=; b=ENNoxYr0COCA/5
	c6NLt60UQ4MSEVrg+ZaPhsv8nf0U0kDAu2Ny+VKRJH2l/RHQjq/LWciW4P/XoVtFEyc8yT2y5Ph43
	Lq/yQDO47mSq5BwE2p5F2Qex58Z6FSTVMfk/0ZiT7YdRFnBL50S6dBWG7aFk91EoDqj6Gopz2dFm+
	oqGsj1XvXIkiP/SWUshr9q0Blhux4UQOeDCdiEpydPX4+tIpW9Y8sG7r3eK72+2g98srsVPgs7qgr
	ctnNSmsOP5etcgzGRvkwxCxerD93iI/Ei9YcV7eeejxjngS8gE+55oE58hJ3SrQRxNCF6nw7G+88f
	Fh0x6lqfE2YHz0fCZSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTgJa-004a7D-Vo; Mon, 14 Mar 2022 08:44:31 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTgJT-004a1O-OL; Mon, 14 Mar 2022 08:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gEjIrVrHn3eb7KnLlR0Ulnx8nKpDWdumMEp3yGatCz0=; b=H46iA3i/OFVLt/jhYxzGisPS3a
 EGVtUGF06T7b+w2VkEtCnI+LK6fr5gh8Sael6Duu1xIMIzJ3upYbECEU5Wvfs/sAL+p6clJHUeuV3
 yLw6HrNb7ppzCChxEdZqt3k4AKnqTrYppts8/Kq9SBiID3G8gzZPBZlCR+claAr0TTV0=;
Received: from p200300daa7204f006c015a90d6b6c4d6.dip0.t-ipconnect.de
 ([2003:da:a720:4f00:6c01:5a90:d6b6:c4d6] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nTgJO-0002UN-K8; Mon, 14 Mar 2022 09:44:18 +0100
From: Felix Fietkau <nbd@nbd.name>
To: soc@kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v10 0/6] Clock and PCIe support for Airoha EN7523 SoC
Date: Mon, 14 Mar 2022 09:44:02 +0100
Message-Id: <20220314084409.84394-1-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_014424_086084_19BCBDDD 
X-CRM114-Status: GOOD (  10.66  )
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

This patchset adds the remaining patches needed from the last Airoha EN7523
SoC support series

Felix Fietkau (4):
  clk: en7523: Add clock driver for Airoha EN7523 SoC
  ARM: dts: add clock support for Airoha EN7523
  PCI: mediatek: Allow building for ARCH_AIROHA
  ARM: dts: Add PCIe support for Airoha EN7523

John Crispin (2):
  dt-bindings: Add en7523-scu device tree binding documentation
  dt-bindings: PCI: Add support for Airoha EN7532

 .../bindings/clock/airoha,en7523-scu.yaml     |  58 +++
 .../devicetree/bindings/pci/mediatek-pcie.txt |   1 +
 arch/arm/boot/dts/en7523-evb.dts              |   8 +
 arch/arm/boot/dts/en7523.dtsi                 |  66 ++++
 drivers/clk/Kconfig                           |   9 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-en7523.c                      | 351 ++++++++++++++++++
 drivers/pci/controller/Kconfig                |   2 +-
 include/dt-bindings/clock/en7523-clk.h        |  17 +
 9 files changed, 512 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
 create mode 100644 drivers/clk/clk-en7523.c
 create mode 100644 include/dt-bindings/clock/en7523-clk.h

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
