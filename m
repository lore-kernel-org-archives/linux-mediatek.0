Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C24C4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 06:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PikPpNG9tyJS2WlCz6PzzNvMdtDPT12kgvNqoP9OXyY=; b=WbM7nXURK7YzRhH6Tc55z/MPP4
	mfUPqiiXYSfsUZI9Wk0hTXHeHlYerR/CS2t4N0cpkIwPGu+ffZ57BriLtz2J+0m1DNeS8yl+UYImC
	nJw7Wcz3Seg6aVajjCHt8LmG8CUv/hEjbWYD8lkdG4CnVKVFcAE7UprYaT4RZE7EUKRi4N7HpDfoX
	tQ0haqFkgfN8e3Oaseh4PAwyZ2Fdtct0XZTrGmvzwKJvt/aUbBXFzomTS4ywDMZ38xuxWcgYxkb6M
	XwnRwIdpB7TsqATkWBBTy+3pyetM+23j0PtAyzSiSQyehq5S00TSO8M7J+tpnoe5mxnAwh6X5Dqg+
	n9HH2bMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvt2A-00000004j8e-1e1b;
	Sun, 14 Apr 2024 06:08:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvt26-00000004j74-0y2d;
	Sun, 14 Apr 2024 06:08:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FD8660340;
	Sun, 14 Apr 2024 06:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7021C072AA;
	Sun, 14 Apr 2024 06:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713074884;
	bh=YiSrDyH5sar5y3AAnJV3/y0r3SDCqTTEYTkGIy6heR0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=SEHkUMEmMRU1NSxTzlRsFSA2+Q+JlnCtlECp9HaLuvhbW2/sc8I8GIYU8v7C2+qaz
	 4WJ+vZpavR8xTUxIkWrWouuv/0GpOTlXY/L/1u4CKOozSJSnwqOXcAt175bK6SJ818
	 Vg+9yPoNRIT0br75l+8BDsY9kR/M0dLFIIFikjrKMDTby4Yi2p3icEyUGet5tMFOM2
	 v/8L9rP2zKLRaTXndSe4iLpBk29OE/Vs462I5Ajr+/x0lAfPGyD/Nz+aiX1rXL6dqW
	 Im0NsKo0YuLh063uPdv1EXQQI23LldrtupKJrwyDMt7i9c2L1n2i0v8t06/m2dce6v
	 e72V+znTuRXYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4844C4345F;
	Sun, 14 Apr 2024 06:08:04 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Subject: [PATCH net-next v2 0/2] Read PHY address of switch from device
 tree on MT7530 DSA subdriver
Date: Sun, 14 Apr 2024 09:07:40 +0300
Message-Id: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-0-1a7649c4d3b6@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKxyG2YC/6WOQQ6CMBBFr2Jm7ZhSKqAr72FcFDqVSaQl04ZID
 He3cgWXLz95/30gkTAluB4+ILRw4hgK6OMBhtGGJyG7wqCVNqrWBnuDPgoGyoHeGafcnmuF87i
 idU7QS5zQZbTBYeJpfrFfcYhCGOeEjTFtc+466slCuZiFPL/3+zsUJf6c8CjLyClHWfeupdr3P
 cFUfyYsFSrsVXepG+d126qbFQ7D5TTECR7btn0ByX2KQRMBAAA=
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713074874; l=1173;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=YiSrDyH5sar5y3AAnJV3/y0r3SDCqTTEYTkGIy6heR0=;
 b=g9fxueRTXfEj3oZC0MCJ4YNUIg2UCQDKxUMG+k7tkIpM1X8wRBkaDFzzjQPI0maur/GbtwDQA
 XkxSk+hJOUQBe7QIamivKclcD7+/clBzTwLhvCbyKqayM/4lAqvdjrT
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt
 with auth_id=115
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_230806_436413_99CA49C3 
X-CRM114-Status: UNSURE (   8.33  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series makes the driver read the PHY address the switch listens
on from the device tree which, in result, brings support for MT7530
switches listening on a different PHY address than 31. And the patch series
simplifies the core operations.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
Changes in v2:
- Patch 1
  - Use a more efficient definition for the MT753X_CTRL_PHY_ADDR macro
    provided by Daniel.
- Link to v1: https://lore.kernel.org/r/20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v1-0-b08936df2770@arinc9.com

---
Arınç ÜNAL (2):
      net: dsa: mt7530-mdio: read PHY address of switch from device tree
      net: dsa: mt7530: simplify core operations

 drivers/net/dsa/mt7530-mdio.c |  28 +++++-----
 drivers/net/dsa/mt7530.c      | 125 +++++++++++++++++++-----------------------
 drivers/net/dsa/mt7530.h      |   4 +-
 3 files changed, 73 insertions(+), 84 deletions(-)
---
base-commit: 32affa5578f0e6b9abef3623d3976395afbd265c
change-id: 20240324-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-64476588ebea

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>



