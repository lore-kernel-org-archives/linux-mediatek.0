Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA5FC4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Apr 2024 22:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yMBeHM19BnA+YuvN+wgF4gPoDweTNSX4VuW/tsbwvNs=; b=uHROGsVH2UIZT6OTyYvzyBbanN
	YWTNlYncnLG3OkGwtI9KbyYWig5I+BAn5qlwE1V9BnxR1M7tyxCR6yfIE/YZYw1FGn7c9oDBMpcLy
	TaY7J4wDX2/zDCTQtSZ02Zkpw47bvw0oHBkBCCKB8Bu2L74qnvf/IF7CSrdbgNRxTdOOjUeL8I3Sd
	BH8Tfqc67Tb8aQJXqkZWvKlFylEkBgKAEDKzxuM+rlFTlQTpFQrLRhu1NHtRoXxnTDckS38SceBNc
	aAGXysG8tK+s7UIN3wOh6zyWvZYJZEgqxf/vpBH/ywAMDWwYQsEPgFCHTPvtxaT4F/AFlcEz0mTCH
	lGt+bcrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvlYU-000000043P5-3lEN;
	Sat, 13 Apr 2024 22:09:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvlYR-000000043NV-2ggB;
	Sat, 13 Apr 2024 22:09:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CABF06033C;
	Sat, 13 Apr 2024 22:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28F7CC113CD;
	Sat, 13 Apr 2024 22:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713046138;
	bh=w3Fko/vEfLXqrM24t7NMSuNjon9r3RjbL4inMywtDFQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FpWYHUnNRQT99CFyyL7pHxRGSIhE9qOCjMnV3/WcpPtRWXj0tqIEz504f44xOp5l4
	 beYoDmMEX48jV4xAWbU+4B5Aeg209YY62SebL/OviS+JJUQ51N1mK/GvbSqYmcwI7a
	 TDVOG7RtCnvQSnMHoCuZBO20TALQMUBzoOjPLGQtNQCROifkTAlTXn2H5f8Nf9FduP
	 YNTUgb3GGKz/zcTTrmXwP48rItCxKZgnWFFOYwlqCopR7JBC6raUaNnns2FZluHcyr
	 4OSQVVBN41A7BCHe7wivJ3y8FXA01Maa9/xnObYWqttjxcGOYgpKLUUyIcmWxgXT+d
	 M2Fcx/qbBQjcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2EBC4345F;
	Sat, 13 Apr 2024 22:08:58 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Subject: [PATCH net-next 0/2] Read PHY address of switch from device tree
 on MT7530 DSA subdriver
Date: Sun, 14 Apr 2024 01:08:18 +0300
Message-Id: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v1-0-b08936df2770@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFICG2YC/x3NSwqDMBRG4a3IHfcHq/FBt1IcRHNTL9QkJKEo4
 t6bdngm3zkpcRRO9KhOivyRJN6VuN8qWlbtXgwxpampG1W3jcKsYH2E4+x4z9jy0LU1wnpAGxN
 ho99gMrQzSLKFt9gDi48MHxJ6pYa+G0eeWVNZhMhW9v/+SYXEz6Tpur5OGlHzmAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713046128; l=902;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=w3Fko/vEfLXqrM24t7NMSuNjon9r3RjbL4inMywtDFQ=;
 b=QWDZGIXGNPR9Klrs9q8VfkYcp1RGyM6dDStUMGu1gEScLx5wWklQHOY10a4ufb7F0DVBI5nh5
 ONGSyTrDFb0AASNbPK2u2Ll4uN6j+y0kBW7Lvy9+SipHmplA1de/veF
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt
 with auth_id=115
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_150859_792111_D6598AD2 
X-CRM114-Status: UNSURE (   7.27  )
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



