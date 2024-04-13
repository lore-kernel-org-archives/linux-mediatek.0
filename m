Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8715C04FF8
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Apr 2024 13:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MUwGbPTqCYDhsSRb9lV9bNeLvqVaOUnWJsZzYawoAeA=; b=yDTIpVTxFAJUEfo3t9z7gcQHO3
	pxU1o9E/anV4fvEiAZn21Kk0jjRNwlsTbP1VzzSy1tKk1rlK+wUQkI1oFCx1g9WcpEIjkqCYBx34y
	qGARuPP4gb8ug6GYh1LSpaTP4GFxmpH8wofp2TGVUt/7KkYvbf4/a2L/1+ouMs3RYarPIztNBIM+n
	S25F85V/4hBFEaylvtbSeq6kcz1C94L2cAI/0Z6T+N84j6WNsTxlJCWIpqJ6tbxH8oe7cD9SL52NZ
	JeXIgroWZ8/9bqwPQlIK75WWoWAv1uU3Eawvcxus8PSjeEDzf4BF4qj0sVJzAKUZRVJSgKILpD2Tq
	BgRnzfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvd1t-00000003B0I-3cyG;
	Sat, 13 Apr 2024 13:02:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvd1o-00000003AyP-1Z8X;
	Sat, 13 Apr 2024 13:02:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCF3E602C3;
	Sat, 13 Apr 2024 13:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E372C113CD;
	Sat, 13 Apr 2024 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713013361;
	bh=tIwVcmzfuWrvRXOL2CNVlGRiqUSlmA862fC7CswLoWc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=deo0xecYYCfglU3Qnkjrp+fBSTarRhRzy5Wkb+HRTFB/TCH86sEw1QEtdUg44zetl
	 8j3+ZwE1Xu/AfpM+HTm2tVamGaXnhq6WRbDEndUL6Vl+33P+FA//XQ4qCIDWsWtPZ7
	 /6PJ5o346Uut0w9afs9rWXYxBYtdQLfvzFr+vx6M/ZI/5xT+AhurbhIY/fymh9MxtF
	 Mr/MTN4EjV/YNR2kvxbkoGIfctF1kh0yeUEd5UOy2Z1/wN3iBMOPxOhNkEBAmWqb8f
	 4LKZjaCXG3Re0/Jcy4qJK10MWiUAg6T+vOmwzanoyGw0GaI5JHAJK6hm6QyYpsfJRr
	 uOe1zwvE5MQXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C374C4345F;
	Sat, 13 Apr 2024 13:02:41 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Subject: [PATCH net 0/2] Fix port mirroring on MT7530 DSA subdriver
Date: Sat, 13 Apr 2024 16:01:38 +0300
Message-Id: <20240413-b4-for-net-mt7530-fix-mirroring-to-local-port-and-mt7988-v1-0-476deff8cc06@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADKCGmYC/x2NQQqDMBBFryKz7kA00cReRbpIY7QDmpFJKAXx7
 k27fPD++yfkKBQz3JsTJL4pE6cK7a2B8PJpjUhzZehUZ5RpNT4NLiyYYsG92F4rXOiDO4mwUFq
 xMG4c/IYHS0Gf5p82Oofa+t51YRhG66HmD4l1+b+eoObgcV1f7Wt53Y8AAAA=
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Holger Stadali <hs@giax.de>, 
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com, 
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713013352; l=731;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=tIwVcmzfuWrvRXOL2CNVlGRiqUSlmA862fC7CswLoWc=;
 b=AIrFvlQc3tcxviGzOLIGmBqZmIxEahKHRc9YPMCzCUupD2yadJp90xxhu93W3CrPfWgGyLLED
 MCUb176IfZaDE61ysaeVKABk/KB1+fYyhH9GXZ9wKbm+94vAREIVkeP
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt
 with auth_id=115
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_060244_514583_45319070 
X-CRM114-Status: UNSURE (   6.15  )
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

This patch series fixes the frames received on the local port (monitor
port) not being mirrored, and port mirroring for the MT7988 SoC switch.

Arınç

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
Arınç ÜNAL (2):
      net: dsa: mt7530: fix mirroring frames received on local port
      net: dsa: mt7530: fix port mirroring for MT7988 SoC switch

 drivers/net/dsa/mt7530.c | 16 ++++++++++++----
 drivers/net/dsa/mt7530.h |  4 ++++
 2 files changed, 16 insertions(+), 4 deletions(-)
---
base-commit: 4e1ad31ce3205d9400816e08cf14b7c96295d22e
change-id: 20240413-b4-for-net-mt7530-fix-mirroring-to-local-port-and-mt7988-37a582c6697a

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>



