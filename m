Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48D0C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 19:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vJw4BHrz+/0fn3azeQO9FVa5UZPonWXaeCsVNQa6nTU=; b=SsOZyfXangRvR8ttu2oK8x1kDG
	Fgz5OzS4YX+IPMtb395kJv+S+guypkUC5jBlJUyG3E/6raLDpsw129ulKenXjYaTV1bCP8UjfW2S+
	sNu51AKdEEI34NEKZAjnT4A8cIWe4tuf1Gbk7NqMLDRpExAKPpDJqz3ZCB4ZFhEPhBCAKG1pVRX9j
	LuoaCAThDnZLb+6ABO3eUJBTRfsai3r1qrm/l9KSfpMhXAcyOdRl+qxwd9b7vy4/DSImejECdANrj
	yYTruH4FDivEfa5VmWvvbh8kxlt/tonK9pZ3oHb14eau0DyUD83zmvEO7jXoucjRWR29I5wHyHVkB
	eQ+LMVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Sk4-00GZvZ-FS; Thu, 23 Jun 2022 19:43:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Sdc-00GWp3-MC; Thu, 23 Jun 2022 19:37:14 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 28B3066017E1;
	Thu, 23 Jun 2022 20:37:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656013027;
	bh=SszYF29Xfhiq12kJBG1G1/y6Ph0MBRLy+lseB3tR5Bg=;
	h=From:To:Cc:Subject:Date:From;
	b=Z6O3cmIT9MDb6i9dCp+YmBKAakgPjcwqeZydaCw41M/aIXlJJyJLkODehzc4YAp2n
	 s0bxjA4iwc5oPI9PWj+HeVyKl8OWuoV+l0GVbG3qyE6PLThQ3RojLsTqXaX2SRPwjX
	 hUvA09udlN+lGjovbWQFFVCtM4sUhPswe+cf74h6BrQuBAzjz3rlu1Is4f6H12iAEj
	 NztBdH6+dJk3ULFsNwkCwF01I94Ej9Vk+1iLb4Yx+2kSwV4Uphl9HvjHiVjXXow2uv
	 73NdxlDNtzC0NVFHhGZAsiHA+h2J2IxQ4y29zvv9vEGdw/Mqi/P+xhf+coYoa5QbxD
	 8ovNqnRooD8eg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 0/4] Fixes for dtbs_check warnings on Mediatek XHCI nodes
Date: Thu, 23 Jun 2022 15:36:58 -0400
Message-Id: <20220623193702.817996-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_123712_957523_C456CB0A 
X-CRM114-Status: UNSURE (   8.92  )
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


The two first patches fix inconsistencies in the mtk-xhci dt-binding,
while the last two tweak the Mediatek devicetrees to fill in the missing
XHCI fixed clocks.

This series gets rid of a couple dtbs_check warnings on mt8192.dtsi and
another on mt8195.dtsi.

v1: https://lore.kernel.org/all/20220617222916.2435618-1-nfraprado@collabora.com

Changes in v2:
- Made all clocks required in the binding
- Instead of simply reordering the clocks on mt8192, added missing fixed
  clocks for all arm64 dts
- Added missing fixed clocks for all arm dts

Nícolas F. R. A. Prado (4):
  dt-bindings: usb: mtk-xhci: Allow wakeup interrupt-names to be
    optional
  dt-bindings: usb: mtk-xhci: Make all clocks required
  arm64: dts: mediatek: Set fixed-clock for missing XHCI clocks
  arm: dts: mediatek: Set fixed-clock for missing XHCI clocks

 .../bindings/usb/mediatek,mtk-xhci.yaml        |  5 ++---
 arch/arm/boot/dts/mt2701.dtsi                  | 14 ++++++++++----
 arch/arm/boot/dts/mt7623.dtsi                  | 14 ++++++++++----
 arch/arm/boot/dts/mt7629.dtsi                  |  6 ++++--
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi      | 18 ++++++++++++++----
 arch/arm64/boot/dts/mediatek/mt7622.dtsi       |  5 +++--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi       |  9 +++++++--
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       |  8 ++++++--
 arch/arm64/boot/dts/mediatek/mt8192.dtsi       |  9 ++++++---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi       | 18 ++++++++++++++----
 10 files changed, 76 insertions(+), 30 deletions(-)

-- 
2.36.1


