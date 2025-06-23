Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6442BC77B7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jun 2025 15:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m6QFCiWa5Zy6iUa6OtPjlcTMOCRib9xDreqjyCmWWOc=; b=y+y2B79F7Y2g1WETy2ahp0RdPg
	ipua2o5GBm9rrJ84Nf/c1016BZNglKLn74TeCdGX30PL5XQxyC1lN6dlfxZUoyBpYQTbK5xZgkj1D
	oEF7s7jH7q3DSQF4PEa0SzvmrkJjdu1VSK0aICbYAHzKmOWIP1M9c43JPlsgMQ1TWaqJT/rsFybHd
	w3CqKcz1RDyBneojMhVicCxKnVaXjR6kEagRjIe+icmSvVohjt0scOaO8QrwZK413oqYMwVjK5H17
	2hqY4VZHwGDTEAWd6NQ114FLD3zx/EXuUju1jDns+wUqFiUplkyEg0eZu6ZDW5/MUinJ7IVXuUo0c
	XwOy73Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTizP-00000003D9C-1jeY;
	Mon, 23 Jun 2025 15:21:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTftP-00000002bV4-41Cx;
	Mon, 23 Jun 2025 12:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680198;
	bh=3nnjzdKDL/XFZioXMgbkMzk/XvnybYXfQac1elnYKk0=;
	h=From:To:Cc:Subject:Date:From;
	b=k6RSQSAOKKvHMpOXyLsoGT1dnJCjdRQDwxSGY61BzZUTS3VjCE9JIOoTBFekGL6yc
	 ++vTE/zycKImJfVDxqPfw5ryZW6DihXBZz1oW+mu1EIZWwWlSOJWM0ZgUzTAssA2yo
	 KnlkSFu9hrXjLSIYOIDxwLxfNNuU8dlzcV5ZyJJxBf6OTrUAI/VfqdEGLxSiDLV74v
	 Da/0QpbaaUlsfVjDRq52ei26DLRVx/+AMQ1Wn8s0Qbk5JP0joqszyp2GuAYy1WszFe
	 qJgdZ41doiknFjDhDbe565XiGgN4b5VfbyOsTIJbOOALl5jY1cbcrf2Bnwx7PrODJw
	 wCKNzizFDh2NQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE7BB17E090E;
	Mon, 23 Jun 2025 14:03:17 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] MediaTek TPHY Cleanups
Date: Mon, 23 Jun 2025 14:03:13 +0200
Message-ID: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050320_147092_25BB3655 
X-CRM114-Status: UNSURE (   4.71  )
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

While doing my usual round of cleanups, I've found some room for
improvement in the MediaTek T-PHY driver. This series performs some
cleanups on that.

AngeloGioacchino Del Regno (2):
  phy: mediatek: tphy: Clarify and add kerneldoc to mtk_phy_pdata
  phy: mediatek: tphy: Cleanup and document slew calibration

 drivers/phy/mediatek/phy-mtk-tphy.c | 65 ++++++++++++++++-------------
 1 file changed, 37 insertions(+), 28 deletions(-)

-- 
2.49.0


