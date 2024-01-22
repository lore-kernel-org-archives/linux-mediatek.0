Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B074C47DDB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 05:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4gun5dJ+4YpqmMCJN6kIWdpOM3G0HNPQmRhd11flTo4=; b=4PF2mqXxazWY62z/gWqA59c+CI
	9s6OIV4t6YyeM445eT1cHm6Tm3VSpy/QnWotRSycd4zM9napNWKAzcXjaVC1J+8oOw6WPk7joq0yQ
	4R7x0O5llaXDt+L0rzZ1nU8aYFvcEl2lMUaEWd9ylxaZOgybH1W3GgoUP1KjNtRuju2WeT+oN5nIQ
	pgqGiWTMBGGoCb2flnzRmqcoVczx4OzfVYOzXrIdlrAz2gKcwtdGl6aqV+zKdaeek9/aVA3caxGr9
	ruRZZJI+C+ZGxGscul/RyL83FGM+0LdgfbJg2Bz3jDHvk09f1iPAIrYx7jbDcRaUEFluImJBkEoPB
	s1qBEzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRmyh-00Abbf-01;
	Mon, 22 Jan 2024 05:36:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRmyW-00AbXE-32;
	Mon, 22 Jan 2024 05:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CD7D9B80AAD;
	Mon, 22 Jan 2024 05:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BFAFC433C7;
	Mon, 22 Jan 2024 05:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705901758;
	bh=eTYY+evS04ACta4sLOnbAMToYxY7CybRXgNbJ7leYNw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HH1z9tR0lCmBiqTf07IYzAJQaRQ2FfT2cKclURFfnTWkLZ48Necmv0EqMoayXsOSs
	 //JFund+TwDlk27lLa+M2vvpkqhHFH2MXtwF3o7kY3iNJVtWdRHdWA5gKba3WfD2RX
	 +zCivtZ/RgPt/W/FXBHenNaM1FTBDDMOuDVodVaBGw9J87QxQz4sYnluasGheZn4uU
	 Dva/RahkmWBi9oX/ioW6J4xXsvrkbDcOvwEbZUA2o2VvicbBZ7HhNJ7tPj6nMhROri
	 0BPbEzW5wHed9qr8yesghs/M/IJFiVDHIP0g1wjRJ+nr9fahXNlmTJPnd5fsQNokl5
	 UfSZtZsbeWJFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10834C4725D;
	Mon, 22 Jan 2024 05:35:58 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Subject: [PATCH net-next v3 0/7] MT7530 DSA Subdriver Improvements Act I
Date: Mon, 22 Jan 2024 08:35:51 +0300
Message-Id: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALf+rWUC/3WNQQ7CIBREr2JYS8P/0NK68h7GRa2/lsRCA0hqm
 t5dZOPK3Uwmb97GAnlDgZ0OG/OUTDDO5iKPBzZMvX0QN/fcGQpUAhD46Dy3FC2tkc9R11JwMy/
 eJZrJxsCBN0rJWnXjTeua5Z/F02jW4riwjPIvy655mUyIzr+LPEHZs0cCQAsoUdQVNk0LXT7tv
 bFD9bL981xiVw1uLicJfyCiFtmudAVCYwf/wX3fP64TAoj8AAAA
To: Daniel Golle <daniel@makrotopia.org>, 
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705901755; l=3455;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=eTYY+evS04ACta4sLOnbAMToYxY7CybRXgNbJ7leYNw=;
 b=17GHcU05i+tBO3+FtLXH7FLTko8AoULh6yvzNTCWphY/pvp9Fd6q9hsjeqHR1Xz5bHD0JlxG4
 uXo5JR8k6j/ACr1ZhmojnGwA0y3n98w8mFm4JqMkj0vIDy3/Oyl1KbC
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_213601_263295_715850F1 
X-CRM114-Status: GOOD (  13.58  )
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

This patch series simplifies the MT7530 DSA subdriver and improves the
logic of the support for MT7530, MT7531, and the switch on the MT7988 SoC.

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
Changes in v3:
- Update the patches with the latest received trailers.
- Patch 1
  - Declare the longest variable assignment first.
  - Improve the patch log and the comment on the code.
  - Don't do type cast for __ffs. Implicit type promotion takes place.
- Patch 4
  - Put more relevant information on the comments on the code.
  - Follow the 'commit <12+ chars of sha1> ("<title line>")' style on the
    patch log to satisfy checkpatch errors.
- Patch 6
  - Change the patch log to explain the change better.
- Link to v2: https://lore.kernel.org/r/20231227044347.107291-1-arinc.unal@arinc9.com

Changes in v2:
- Shorten the patch series, include only 7 patches.
- Add the reviewed-by tags given.
- Patch 1
  - Change variable ordering of mt753x_conduit_state_change().
  - Define the mask variable and store BIT(cpu_dp->index) on it.
  - Disable CPU_EN if priv->active_cpu_ports is 0.
- Patch 5
  - On the patch log, take the irrelevant information about the
    mt7530_setup_port5() call from mt7530_setup() out.
- Patch 6
  - Change the patch log to reflect correct information.
- Link to v1: https://lore.kernel.org/r/20231118123205.266819-1-arinc.unal@arinc9.com

---
Arınç ÜNAL (7):
      net: dsa: mt7530: always trap frames to active CPU port on MT7530
      net: dsa: mt7530: use p5_interface_select as data type for p5_intf_sel
      net: dsa: mt7530: store port 5 SGMII capability of MT7531
      net: dsa: mt7530: improve comments regarding switch ports
      net: dsa: mt7530: improve code path for setting up port 5
      net: dsa: mt7530: do not set priv->p5_interface on mt7530_setup_port5()
      net: dsa: mt7530: do not run mt7530_setup_port5() if port 5 is disabled

 drivers/net/dsa/mt7530-mdio.c |   7 +--
 drivers/net/dsa/mt7530.c      | 135 +++++++++++++++++++++++-------------------
 drivers/net/dsa/mt7530.h      |  16 +++--
 3 files changed, 87 insertions(+), 71 deletions(-)
---
base-commit: 736b5545d39ca59d4332a60e56cc8a1a5e264a8e
change-id: 20240121-for-netnext-mt7530-improvements-1-6443549fb775

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>


