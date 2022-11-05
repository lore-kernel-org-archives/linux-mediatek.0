Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF592C43217
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Nov 2022 22:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BQQFa5rAiETHZqyuMJQY6B8pE/A5TPrGPHWZr+P0PCQ=; b=nycXfoped2KE8i3Gvm26CdFArF
	z5V34Msbqb06Ay1+AyG4h2dWZNIXiAbQzTsXTWvfyUAxJMLQuSG8E1DlqxMh19EirBpzznXG5A9FI
	qB1S+ZU0bg58JRKOTsltVmxFjeFP5o5K4OR3/HOzKeyqYK8nBnr05pdYsShihmvzf/DUB780kxRLj
	uuwhnyDBP7YbVY+P2h/a3FnbXPEbaQ12q8UIcLKPjKGZZyEXfsQz02FJvM+iQFRJKNma4cxTBjDYk
	V3tN9OJD73IpfQntckXzv+76Tu4n9mzhvC3IdgmkvccY+kAb/GoN1kSPm1CYPFskl4w1oJtFfMfka
	oWtCx7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orRmF-007K14-6o; Sat, 05 Nov 2022 22:36:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orRmD-007K0k-0h
	for linux-mediatek@lists.infradead.org; Sat, 05 Nov 2022 22:36:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9306260B98;
	Sat,  5 Nov 2022 22:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D12EC433C1;
	Sat,  5 Nov 2022 22:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667687791;
	bh=4wbJ4V9ftwA4chQ1NoT4hKYIC4+12nuKIWSBJd0mldk=;
	h=From:To:Cc:Subject:Date:From;
	b=WzPisES4dxeQsw0+FzXV5/k+MFyI/lR8FFMY+E/BC6ZJ4m0zUIbspb8VQ9a8aGJOG
	 QE8u2jcLgHBzb45z1wG/QnJO3t5amsPgPvEZtoI6tDpJzmAKKMXJ7ro++ndRsu9HCt
	 s6bFHjxocAsWgkR2fDGiwDnbcS/b4pE6gOaEFOuq7R/mfW0rdWq6wHcivRG82POYUG
	 Uxkt+EV5phzWQhP4EMTqo9jrSgt1/nCICUgRWBrvrx+X1qZi153L89CmLEn/5dDkUF
	 ayf+l8+0y67z+1vAUSzcHb6BEKR8s86u77XEEgWqpXe+TnhYq3y4bFbPkiE2qCGdPu
	 nmwmo9KxeW0IA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v4 net-next 0/8] introduce WED RX support to MT7986 SoC
Date: Sat,  5 Nov 2022 23:36:15 +0100
Message-Id: <cover.1667687249.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_153633_177254_7CE74BA2 
X-CRM114-Status: GOOD (  12.16  )
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

Similar to TX counterpart available on MT7622 and MT7986, introduce
RX Wireless Ethernet Dispatch available on MT7986 SoC in order to
offload traffic received by wlan nic to the wired interfaces (lan/wan).

Changes since v3:
- remove reset property in ethsys dts node
- rely on readx_poll_timeout in wo mcu code
- fix typos
- move wo-ccif binding in soc folder
- use reserved-memory for wo-dlm
- improve wo-ccif binding

Changes since v2:
- rely on of_reserved_mem APIs in mcu code
- add some dts fixes
- rename {tx,rx}_wdma in {rx,tx}_wdma
- update entry in maintainers file

Changes since v1:
- fix sparse warnings
- rely on memory-region property in mt7622-wed.yaml
- some more binding fixes

Lorenzo Bianconi (7):
  arm64: dts: mediatek: mt7986: add support for RX Wireless Ethernet
    Dispatch
  dt-bindings: net: mediatek: add WED RX binding for MT7986 eth driver
  net: ethernet: mtk_wed: introduce wed wo support
  net: ethernet: mtk_wed: rename tx_wdma array in rx_wdma
  net: ethernet: mtk_wed: add configure wed wo support
  net: ethernet: mtk_wed: add rx mib counters
  MAINTAINERS: update MEDIATEK ETHERNET entry

Sujuan Chen (1):
  net: ethernet: mtk_wed: introduce wed mcu support

 .../arm/mediatek/mediatek,mt7622-wed.yaml     |  52 ++
 .../soc/mediatek/mediatek,mt7986-wo-ccif.yaml |  51 ++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  65 ++
 drivers/net/ethernet/mediatek/Makefile        |   2 +-
 drivers/net/ethernet/mediatek/mtk_wed.c       | 619 ++++++++++++++++--
 drivers/net/ethernet/mediatek/mtk_wed.h       |  21 +
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   |  87 +++
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c   | 387 +++++++++++
 drivers/net/ethernet/mediatek/mtk_wed_regs.h  | 129 +++-
 drivers/net/ethernet/mediatek/mtk_wed_wo.c    | 508 ++++++++++++++
 drivers/net/ethernet/mediatek/mtk_wed_wo.h    | 282 ++++++++
 include/linux/soc/mediatek/mtk_wed.h          | 106 ++-
 13 files changed, 2256 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_mcu.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_wo.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_wo.h

-- 
2.38.1


