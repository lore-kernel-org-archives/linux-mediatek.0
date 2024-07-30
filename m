Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72201C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 07:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wGwdKAjImIXASit/mAmbUhDlNFKej1STAbay87C6U3c=; b=BgR4Ncc5+opHu/vnkpyzK9DOnf
	W92Sg3b2i+vcAdQ/+7y/CCJvQKaR3SaX5pGKWnOLCLBO/sG1UkCYRUrCO4SdXoUR+r8Xo92NjVRPG
	XwbWqRsa79T1rXfDs8uetjGKIqhfncISs60ovoOpgn931c2ikfjkQTcUwU0H1mM/VyzA/P8uDYapo
	6Gc+1eBBqu1iil1Hb8LR7MxJQ5JZ44G3WsMtecdNx9P6h89y9wOgIpjfd1mYz79kqDtlK2yI46OLs
	304BVI70NoUysC4GVmNXNNnYuvIGXY9hO4pZzbGX5KYbze8l0RB9Tj7CQQoG6FnyGr/aIg2Ps1dLF
	kWcel7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhZc-0000000E521-3luO;
	Tue, 30 Jul 2024 07:47:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhZA-0000000E4uA-2g5R;
	Tue, 30 Jul 2024 07:46:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2D7261DA4;
	Tue, 30 Jul 2024 07:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB59C4AF09;
	Tue, 30 Jul 2024 07:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722325599;
	bh=nDicdgSbC0TQTXrWxg5z3pQYKzM9enTJkO+htwH+xSs=;
	h=From:To:Cc:Subject:Date:From;
	b=L1aqt+UN3W87SncD+wV6yppB8O62mdYsv7JoPokK1hdmOhgkKbu2+lykxCgGlctLj
	 wSKJ0pDCbnp5jC/2hdBsRKWbzJ0H5pXEN1LVuzbApLcxwfMb38fOclMZ93Xirh4coC
	 3FqdjVLXItkikL3A7MdpjAF7W5aIFBhgAI+vvAZI9oj0GOvhQbGRVhZgZ+FG/SvUgp
	 J9/wjRUBUndz2l05+5uSkQdTKhJnqKjpgm/Pft+GHvlOVLNSuaoBfmoh4yVd228sHv
	 flKt3le4C1Yj7UOdmkznbjfUTFMlPGgjwPWJiuk6zObVmlXNuE1jFLH9ZvP5H8yQ2V
	 dzKM1Vrk5EZ9w==
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
Subject: [PATCH net-next 0/2] Add support for EN7581 to mt7530 driver
Date: Tue, 30 Jul 2024 09:46:31 +0200
Message-ID: <cover.1722325265.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_004640_993239_C4E49BA8 
X-CRM114-Status: UNSURE (   6.65  )
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

Lorenzo Bianconi (2):
  dt-bindings: net: dsa: mediatek,mt7530: Add airoha,en7581-switch
  net: dsa: mt7530: Add EN7581 support

 .../bindings/net/dsa/mediatek,mt7530.yaml     |  9 ++++-
 drivers/net/dsa/mt7530-mmio.c                 |  1 +
 drivers/net/dsa/mt7530.c                      | 38 +++++++++++++++++--
 drivers/net/dsa/mt7530.h                      | 16 +++++---
 4 files changed, 54 insertions(+), 10 deletions(-)

-- 
2.45.2


