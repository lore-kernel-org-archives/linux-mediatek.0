Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B81C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 09:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6pzjlGG3Q0YG8JGn42oNEFaYwQPaTRfTCR6g92UNf/4=; b=KiO1mah4v/ECGKLCtAb9cS02zP
	1gJLafoEzW/UTtw9hN52992ITNjM0M4MrvSzapZgeuuRIg9QW94GV7bMeauglL9SGb9FxdAzPCxrf
	uzUlQgzrLS2lbufB4wZ5gmraqrrz0u90XkV+V8l122MfUTzMMNoTGB7MltVCaF9IKEJehF/6BL9B6
	G1l9O17zSBfaBlolIoyOxsw1GLfmi/B0Ezt2smrclMa7tvDp85eqF9AN55WvpToHuuPsu+S+90Vm0
	DMviEZqrDUzVyfkoOQXwxQ8jvjc79qY5iRJ5itvzb1XFsYPS3et0u9Erxh3rOo/2TD375H5lvWIeA
	OS4x90dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTEZ-00F9jL-LZ; Wed, 28 Sep 2022 09:20:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTEW-00F9fh-Bl
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 09:20:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A2D26CE1DEC;
	Wed, 28 Sep 2022 09:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2440DC433D6;
	Wed, 28 Sep 2022 09:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664356793;
	bh=8L80Xj1FiutXYpNFzbgGiYF33cS8E/iW8AXgctuYFnk=;
	h=From:To:Cc:Subject:Date:From;
	b=Y3XhRyuAi84P9mK8NAl1qdZaq2LO34xmYFoU9aUtIqaKpKaLGW8pzrFG+eqB6wREd
	 5Wz+DXIk37mu6fyLQ3KLLWqvI6sSAhKmNC9o//sUOjoI9AZD8CTOoDiJSsQCiSrlgY
	 ARkhbQo7IcPEt8hbh44dM7RYptE1yQ9XBjwQm/y3kc9ub4gxabQE654O9b0NeRqSo0
	 n6GUOjHiS/j/Eb6lMfxFM11lLUI7uwzDlADFmgxZJo/HZgK3bxfP0lZZJOtWOgG9Pp
	 t1PnyioSLxowyuBAM0HobD1XULF/NCUBxEDlzp+knbrMh79jZkGWL5L83Rm8VW6Pzs
	 43mJr9sE5p1wQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	daniel@makrotopia.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] wifi: mt76: introduce WED TX support for mt7986 SoC
Date: Wed, 28 Sep 2022 11:19:40 +0200
Message-Id: <cover.1664356281.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_022000_924434_D15111B4 
X-CRM114-Status: UNSURE (   7.93  )
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

Enable WED TX support for mt7915 and mt7986-wmac drivers running on MT7986 SoC.
This is series is based on the following net-next series not merged yet in
wireless-next tree:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=377c17c6757ccf43e97f681a6ac5163d3735ab0a

Lorenzo Bianconi (3):
  wifi: mt76: mt7915: move wed init routines in mmio.c
  wifi: mt76: mt7915: enable wed for mt7986 chipset
  wifi: mt76: mt7915: enable wed for mt7986-wmac chipset

 .../net/wireless/mediatek/mt76/mt7915/dma.c   |  75 +++++++---
 .../net/wireless/mediatek/mt76/mt7915/main.c  |   2 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  | 135 +++++++++++++++++-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   2 +
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |  93 +-----------
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  13 ++
 .../net/wireless/mediatek/mt76/mt7915/soc.c   |  21 ++-
 8 files changed, 222 insertions(+), 121 deletions(-)

-- 
2.37.3


