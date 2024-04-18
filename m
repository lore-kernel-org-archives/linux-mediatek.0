Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372CCC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 05:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gEvZTTTctgvFnsZIK2TgCQqVE9mVgwGfAwdtDHpdJLs=; b=QuYXCmmB6HclHryyjINaAFyueL
	jSV+BiKWdgXUAKYRVawjpFIg/PK7ZB7KLEqETF/nwJZB/NBtizn6BUjRK1OfjswN4bbS8wTdI0+xh
	0PvmfSBnI4uOoR0cIGU1BtwFnowm1tJIZDYg2nf8TLT6ejAFphEj+/sjhvZWW5I0+a62Wey0BcMAQ
	hJzUwtuK9mffX316n/P/4QtFQG9esuOziKylWEUfKg2a+FtWy9Kewmy+kK7dsgRuQEiNUc65hBEk9
	aQL+MsUNCsT3mYVsp+aELSE4PlDI6L7SuHHkyLj1jDqjCQvBCCB7gVaRSHAdYNpqGATo4yIgiJznM
	Ok9uSWvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxKRJ-0000000101B-1e2q;
	Thu, 18 Apr 2024 05:36:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxKRE-00000000zzV-3IQF;
	Thu, 18 Apr 2024 05:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 409C26175E;
	Thu, 18 Apr 2024 05:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF003C113CC;
	Thu, 18 Apr 2024 05:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713418558;
	bh=SzDN9toTqBr0GiH5AKRvQI5qpmgWxF0RN8hrv7mhvnE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aWMO8GEpSYEvFWa6UnkaL+dUHq692Z4FzRMZ3rPt4em1I6dZKYie6DhoidCUlpCAU
	 6jz46yOLcc9GH+oN6eHdOTo7j7FBO4AAF5dlEu099jnOdLmm8g1ikSdPmpXRNBPVdj
	 xU9zXOgBo7hEV4CDEv8W35YNJyi0WLKxK8gK/sdL02mYHC3jRCZ+t3TltvNtrNei+2
	 xr89mZc6/slLU1g0Dq4hMIuxmfxd4CR1atw/t6RAPjAtkrcTY7OFGHeFoZ2aRKshoI
	 i/M40wtE/kwbjCA3hnEIXU0EnEzoYNwnu9f/KitX6OIWeCD268FqDszVXjX3ph9KRT
	 vqS5nDKHEf5pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA33BC4345F;
	Thu, 18 Apr 2024 05:35:58 +0000 (UTC)
From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL_via_B4_Relay?= <devnull+arinc.unal.arinc9.com@kernel.org>
Subject: [PATCH net-next v3 0/2] Read PHY address of switch from device
 tree on MT7530 DSA subdriver
Date: Thu, 18 Apr 2024 08:35:29 +0300
Message-Id: <20240418-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v3-0-3b5fb249b004@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACGxIGYC/63OwW7DIBAE0F+JOHcrDATsnPofVQ4YlhqpBmtBV
 qzI/x7Kref2OBpp3jxZQYpY2O3yZIR7LDGnFuTbhbnFpi+E6FtmggvFpVAwKwiZIGFN+KiwVnO
 VHLblAOs9QaC8gq9gk4cS1+07hgNcJoS8FdBKGX0dR5zRskZshCE+Ov/J2iT8bLJ7a5ZYaqaj/
 9qH3vcLavjjhX0ADjMfJ6l9EMbwD0sxuend5bXLu/hPTTRtsEarySkvZ/1LO8/zBZ9kUQ+BAQA
 A
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
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713418557; l=1603;
 i=arinc.unal@arinc9.com; s=arinc9-Xeront; h=from:subject:message-id;
 bh=SzDN9toTqBr0GiH5AKRvQI5qpmgWxF0RN8hrv7mhvnE=;
 b=oYU7F2zcwRLKpqjIwaaYIv+FBg9Jih3CavG5flzWyPS1k6apLTqz0Y1UOsntLB/8cVvMOAasm
 iE3qA9yTmSxAtZ+Nw8KeF+4mwHYGT/qJAS+1Ao0ErK4w62bFF3IXT6t
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=z49tLn29CyiL4uwBTrqH9HO1Wu3sZIuRp4DaLZvtP9M=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-Xeront
 with auth_id=137
X-Original-From: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_223600_937979_0154DB2F 
X-CRM114-Status: UNSURE (   9.42  )
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
Changes in v3:
- Patch 1
  - Whilst compiling, GCC suggests parentheses around '+' in operand of
    '&'. Address that on the MT753X_CTRL_PHY_ADDR macro.
  - Instead of storing the PHY address in the mt7530_priv structure, store
    the MDIO device pointer as suggested by Florian.
- Link to v2: https://lore.kernel.org/r/20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-0-1a7649c4d3b6@arinc9.com

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
 drivers/net/dsa/mt7530.c      | 127 +++++++++++++++++++-----------------------
 drivers/net/dsa/mt7530.h      |   4 +-
 3 files changed, 75 insertions(+), 84 deletions(-)
---
base-commit: 2bd99aef1b19e6da09eff692bc0a09d61d785782
change-id: 20240324-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-64476588ebea

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>



