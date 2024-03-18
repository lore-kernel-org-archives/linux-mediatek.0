Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E570C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 07:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xcvo1gZuVqBjLhcfS7TSD/PC3kFpSOSWEoB7WmuZ/vs=; b=QQ8DSzCNqcjlztkrxajhM61fbe
	HD9p5aPqr/Pn9Z0arYEL2TkLjqkWQQacW7+gsv6O35ttnoVK22cbZPrICoSddRSVyBzV/v4c3TIxZ
	IFuwjDXiS3IW2oJtpjv7uQRF/TegYxules5nyckWnB37jqgHwvaOe1vqIDFh+O5AwtLNNpEQbt4dG
	GqhtJ+6t8X0EFpNZkS5/s+3f+hEdt+nG2EMEbWDCG4CezHrSselCo1x9MRPkglNmllcb7F7yAC1vM
	gW4XFVX7SYV3Pp0rQ4Ega77xXjzS/ONTbXhlqBuFvqJL2PIIK9R93sOhkWTlGZSH3KMnTLocBeyJ9
	oGrgPh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm7iM-00000007eON-2F06;
	Mon, 18 Mar 2024 07:47:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm7iB-00000007eHi-2ILS;
	Mon, 18 Mar 2024 07:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3572960B47;
	Mon, 18 Mar 2024 07:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7FF0C433F1;
	Mon, 18 Mar 2024 07:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710748028;
	bh=0IileY4KTERKAEQx1LyPEiRlXaWXwOgaikBtQNDncX8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=D0RObpfF7D0s2IGO8bd9Cf3HmHJPOBYplNJgK0W4Jt4SUk951XgCcGTkDezqRAI2X
	 eYqH27vPts4qF4ZxANtnU2TAZXaqvFnzXVXkY5BS2eHIpNp2Fa7460/Uc8oNPqUWGt
	 U0/leJ9meebE4DLYCU+mdi8QjxtuphSPryzBgh1ceF0kbv/msElYYDyT2kMXvnh9Iz
	 kZgWk0tBPiB90URtD7dOqnUGM0/TLhbbX3uFoHp/vv56LpUq1PN0jymzLwQpybiG6K
	 vlseMFNv0daQMoSNXLJgE9LuYMxDtVLBS1KeVjNe7/bmIt5K9YRzyXOpVutGcRVkbx
	 98/MMd2QDtzag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3983C54E5D;
	Mon, 18 Mar 2024 07:47:08 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Subject: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
Date: Mon, 18 Mar 2024 10:46:22 +0300
Message-Id: =?utf-8?q?=3C20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v?=
 =?utf-8?q?1-0-3f17226344e8=40arinc9=2Ecom=3E?=
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAE7x92UC/x2NQQqDMBREryJ/7YfEGJL2KtKFxIn+RWNJpBTEu
 zdmNbzHMHNSQRYUenYnZXylyJ4q6L6jsM1pBctSmQY1jMpox3HPnHDw+3DWKI7yYwBNN6XveHj
 Psw12tCYEBU917pNRy+1qel3XH2pcu9x6AAAA
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, 
 Russell King <linux@armlinux.org.uk>, 
 SkyLake Huang <SkyLake.Huang@mediatek.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710748010; l=899;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=0IileY4KTERKAEQx1LyPEiRlXaWXwOgaikBtQNDncX8=;
 b=MvoN53hH2wrfbvyDLe2J5XZFtp6mqVf4l86LIsFblVBKfoyUfPbX/amdemD8asCtN6EGZKuEz
 u42E5pne4MiDXlAfYr/fO4zn5HkWlZDvIGDC85H9eXfauPMi8AW1P5J
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_004711_795471_0C459723 
X-CRM114-Status: UNSURE (   8.25  )
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

Hi.

This patch series fixes EEE support for MT7531 and the switch on the MT7988
SoC. EEE did not work on MT7531 on most boards before this, it is unclear
what's the status on MT7988 SoC switch as I don't have the hardware.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
Arınç ÜNAL (3):
      net: dsa: mt7530: fix enabling EEE on MT7531 switch on all boards
      net: dsa: mt7530: fix disabling EEE on failure on MT7531 and MT7988
      net: phy: mediatek-ge: do not disable EEE advertisement

 drivers/net/dsa/mt7530.c      | 7 +++++++
 drivers/net/dsa/mt7530.h      | 7 ++++++-
 drivers/net/phy/mediatek-ge.c | 3 ---
 3 files changed, 13 insertions(+), 4 deletions(-)
---
base-commit: ea80e3ed09ab2c2b75724faf5484721753e92c31
change-id: 20240317-for-net-mt7530-fix-eee-for-mt7531-mt7988-a5c5453cc0e8

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>


