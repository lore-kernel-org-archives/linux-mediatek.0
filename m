Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCF2C48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 11:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YuMZPOiLqPSHPOyFd7TsfXNDIhs6IlmTQ0jy9Lqghfw=; b=ZgFzmb9jhCzps6ZXdf4t4sxVVg
	Wfyu02YQKJ1FUT8FkPH3nTkZ+hMDWw2qsrNTDWbPPTRKOwtdqVIiwVNO8IQPq4jfylcKZ49AOibRZ
	bawuWwfuGQmnZnBMIYe4gULQp62ARirrl75nh90kuRMWLfbeIjmca2n1nSuZv/6ylNzU1fLNgT+kY
	nXSQw1e6kS9jDJB7za8qHg3ZAP1IaWnkhjYZ6JGaRKKQ9p+WkLU3hXebjO6MN9mJHEQx9IR6NeSv9
	N2vsOws1NRu/c5lKlFnmzyRu8Y1B1Ou5hjEn0dV8BgAACgS/JHMv9qvK8SRo4VfONmPcwM1RVeYSk
	Ryrjjyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raw2Z-000000024Rp-3aPo;
	Fri, 16 Feb 2024 11:05:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raw2L-000000024Gn-2Epx;
	Fri, 16 Feb 2024 11:05:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65D9B61F53;
	Fri, 16 Feb 2024 11:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04F5FC433F1;
	Fri, 16 Feb 2024 11:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708081544;
	bh=1FS8ZPPLPybCi3YVj/4MOwJosG7TrEfNHZ4uB1ISjOk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Sy3FVV9FYcbOcXef0kjnLwBdIcSiYvFwqAdFaWTYl95fM+cMeXLb7C6z+UA3dxSlf
	 gxn+Y3wQkt681mBqoAuiziaeDLPZWbQ5FYDXlkHQXAEXkfITD+AwpSLdK5ugt1wzZx
	 o0FdOGlN13Y6ov18nWokMnzkPFsG/tZKbbKxX4qBKCpZj4JCcvzYZRKZRDDOcTqdR2
	 DRui6kFvqCNzFOdH7HswRL6ReWLTEp4Fss3Cttdq6ep5Zd3k3APTsVaFSZYcnIm5DB
	 fWSgsJuS092yBJOEsWbOm2+pHnPpTPaDYWgLdzugnwuZP2O0iHZgge6Xj7ZmZVTZwo
	 YAG1hlap6YAxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D267FC48260;
	Fri, 16 Feb 2024 11:05:43 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Subject: [PATCH net-next v2 0/8] MT7530 DSA Subdriver Improvements Act III
Date: Fri, 16 Feb 2024 14:05:28 +0300
Message-Id: <20240216-for-netnext-mt7530-improvements-3-v2-0-094cae3ff23b@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHhBz2UC/42NQQ6DIBBFr2Jm3WkANWpXvUfjgsBQWQAGCLEx3
 r2UE3T58vL/OyFRtJTg0Z0Qqdhkg68gbh2oTfo3odWVQTAxMN5zNCGip+zpyOjyNPYMrdtjKOT
 I54Q9ylmqYdGDmZSA+rNHMvZojRfUKf62sFaz2ZRD/LR44c23jmDzH53CkaGeFFdGj0wo+ZTRe
 rXcVXCwXtf1BUYpan/dAAAA
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com, 
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708081540; l=2534;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=1FS8ZPPLPybCi3YVj/4MOwJosG7TrEfNHZ4uB1ISjOk=;
 b=4YDBIR62fslTZb8yk0gux/BhP0YkemDBzqxqJr4mpU0FNWNGZw9VDzR7jHpWd4cmtwufLDsHb
 QLrKPdaGchfAzq7A0QN6KKwoE16uM87Qn8Xnzy1OW4EH4H2up+5HIvx
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_030545_696907_669E7A12 
X-CRM114-Status: UNSURE (   8.37  )
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

Hello!

This is the third patch series with the goal of simplifying the MT7530 DSA
subdriver and improving support for MT7530, MT7531, and the switch on the
MT7988 SoC.

I have done a simple ping test to confirm basic communication on all switch
ports on MCM and standalone MT7530, and MT7531 switch with this patch
series applied.

MT7621 Unielec, MCM MT7530:

rgmii-only-gmac0-mt7621-unielec-u7621-06-16m.dtb
gmac0-and-gmac1-mt7621-unielec-u7621-06-16m.dtb

tftpboot 0x80008000 mips-uzImage.bin; tftpboot 0x83000000 mips-rootfs.cpio.uboot; tftpboot 0x83f00000 $dtb; bootm 0x80008000 0x83000000 0x83f00000

MT7622 Bananapi, MT7531:

gmac0-and-gmac1-mt7622-bananapi-bpi-r64.dtb

tftpboot 0x40000000 arm64-Image; tftpboot 0x45000000 arm64-rootfs.cpio.uboot; tftpboot 0x4a000000 $dtb; booti 0x40000000 0x45000000 0x4a000000

MT7623 Bananapi, standalone MT7530:

rgmii-only-gmac0-mt7623n-bananapi-bpi-r2.dtb
gmac0-and-gmac1-mt7623n-bananapi-bpi-r2.dtb

tftpboot 0x80008000 arm-zImage; tftpboot 0x83000000 arm-rootfs.cpio.uboot; tftpboot 0x83f00000 $dtb; bootz 0x80008000 0x83000000 0x83f00000

This patch series is the continuation of the patch series linked below.

https://lore.kernel.org/r/20230522121532.86610-1-arinc.unal@arinc9.com

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
Changes in v2:
- Patch 8
  - Use a single mt7530_rmw() instead of two mt7530_clear() and
    mt7530_set() commands.
- Link to v1: https://lore.kernel.org/r/20240208-for-netnext-mt7530-improvements-3-v1-0-d7c1cfd502ca@arinc9.com

---
Arınç ÜNAL (8):
      net: dsa: mt7530: remove .mac_port_config for MT7988 and make it optional
      net: dsa: mt7530: set interrupt register only for MT7530
      net: dsa: mt7530: do not use SW_PHY_RST to reset MT7531 switch
      net: dsa: mt7530: get rid of useless error returns on phylink code path
      net: dsa: mt7530: get rid of priv->info->cpu_port_config()
      net: dsa: mt7530: get rid of mt753x_mac_config()
      net: dsa: mt7530: put initialising PCS devices code back to original order
      net: dsa: mt7530: simplify link operations and force link down on all ports

 drivers/net/dsa/mt7530.c | 259 ++++++++---------------------------------------
 drivers/net/dsa/mt7530.h |  19 +---
 2 files changed, 47 insertions(+), 231 deletions(-)
---
base-commit: b6b614558ed5b2ca50edacc0f2fbf5f52158c86c
change-id: 20240131-for-netnext-mt7530-improvements-3-a8ac49d4f7c2

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>


