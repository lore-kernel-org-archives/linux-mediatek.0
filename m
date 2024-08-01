Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF093C49EA1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 07:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kXOXSbmIHL1MTNjuA4k+v44MM2DH7Ay+UHWKUBdQDu4=; b=fNTOcyBzTeBEB2CrzlAF+5Kwxw
	aQl0rMACQ9XiPvwQ5ImccjO3z+PEHwaFVUNvuP4yuhTTQt2oq7z7HV4s9sobvD/myqcCbSs9TK6iK
	Qv+n8JwFeyZG4PIRUUIEStWekxgnTZmmRSu8WdrPb4XlwDq1VfRjfkY2x7M57aBODZItZGIVKocpJ
	JN0vcabHqupAha0WMMVrzDOxgSe6wiSC7fZ9RV4NoFtVFaqFOirEDou74WrjDZ1uLtIIO7zwL2TIm
	zMXq4JI6Tys8c63u4hdEulb+YTIzBLi9ewAbV7Uedjfq4pYeQSTvDjv8eLcmw9uT3oUN3bdwvPUyG
	PvFueLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQMK-00000004C95-4AiM;
	Thu, 01 Aug 2024 07:36:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQLn-00000004BvM-3LQe;
	Thu, 01 Aug 2024 07:35:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB54F62799;
	Thu,  1 Aug 2024 07:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E86C4AF0C;
	Thu,  1 Aug 2024 07:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722497750;
	bh=hmwI99xOs957wahotfiYm89IpJoEa6sHrmucbJj3bao=;
	h=From:To:Cc:Subject:Date:From;
	b=P7ikYXovUv0Gabizyy89I2S4Zy74Ob0bxM+1z26KGLh2UyoSHHfWdTC/eNzxZeyJf
	 d2L7r6/V2wRmuGy19NUWm/O80O5vAGB+ig7aWJK0jAZYuF1noLUfHpqs4zQ7B0zmDu
	 Sfv2X+FRgiODaqO9cIRIUra3jNGM+UtwkcMhgK+GpPVTcEVljp7q+ajrqUe2an//Jv
	 9InFimQK4nig32lNRW494dAAbjNOGC/mFxT08j875BeqoDYxLXeuWElhoJ+Ws8xLDW
	 W/RtroltWeYJpQ7bRIsZf26kJw2a9WXc2eKw/b/MTWkl4VxlAQqXjxfpnUceXpQHKQ
	 PFAXkCbgOeHqg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: arinc.unal@arinc9.com,
	daniel@makrotopia.org,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	andrew@lunn.ch,
	f.fainelli@gmail.com,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 net-next 0/2] Add support for EN7581 to mt7530 driver
Date: Thu,  1 Aug 2024 09:35:10 +0200
Message-ID: <cover.1722496682.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_003551_926417_F32F42A8 
X-CRM114-Status: UNSURE (   7.85  )
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

Add EN7581 support to MT7530 DSA driver.

Changes since v1:
- get rid of mac_port_config callback for EN7581
- introduce en7581_mac_port_get_caps callback
- introduce MT753X_FORCE_MODE(id) macro
- fix compatible property in mt7530.yaml

Lorenzo Bianconi (2):
  dt-bindings: net: dsa: mediatek,mt7530: Add airoha,en7581-switch
  net: dsa: mt7530: Add EN7581 support

 .../bindings/net/dsa/mediatek,mt7530.yaml     |  8 ++-
 drivers/net/dsa/mt7530-mmio.c                 |  1 +
 drivers/net/dsa/mt7530.c                      | 49 ++++++++++++++++---
 drivers/net/dsa/mt7530.h                      | 20 ++++++--
 4 files changed, 66 insertions(+), 12 deletions(-)

-- 
2.45.2


