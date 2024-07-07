Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FE8C30653
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jul 2024 05:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8pSTgdZnyG0WLlJB7fRFIXGVRIVCBFFXYFkuJxWni6Y=; b=iSiF5wyGyBFu5Bl+BtymGr5eqh
	zSeY7PfajHXpVIzv57Qn9aCdhVE4hw5c4LoGmwysw/YHEunPrpKPBas6CBQ0f4+M83s6khKNK5DNs
	avv2blF7fDTdpQ7uyIN//NBFg9zihzRQ+UBvs1S6UlCDplvtgkjJxPj9/z2n6Mt891gPTcIVkOYY+
	YJGDgjk/YMOxmyvRrq+ryQe0lwRUWTzN/TMGNECcOoONbIwbeeBHlVRHrY/aey3QQTH3AgUxOvj3c
	btO1VYrcukm6t6pdfDqf6CVWWuQJ/gdPee/mGDco3VbUTE1VQo1Eh7vjHp55PMWCPBvVdHzI4omv/
	+fAtx+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQKkc-00000001Nau-3Hto;
	Sun, 07 Jul 2024 05:47:54 +0000
Received: from smtp-15.smtpout.orange.fr ([80.12.242.15] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQKkM-00000001NXh-3zLm
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Jul 2024 05:47:40 +0000
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id QKkEsyOxChEtDQKkEs8JGj; Sun, 07 Jul 2024 07:47:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720331253;
	bh=8pSTgdZnyG0WLlJB7fRFIXGVRIVCBFFXYFkuJxWni6Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=lIOVhAW+drTQMVfkDzgXljERlaxfwUOHWEUbsUAQdlUAg4+Ox8JCoD6OD6WNqHu9v
	 F1k0nngx4C99rcgu3tGXM4m7qLPFua7HGlCqCfNBTkF+euLbbtuCl9t6IFlT/qrJo3
	 b7pUGDfSn8rrhadTEwd6umJlYgJupUXhrukZ1NuvKpLyRkvMwxdGFc5c9N/Fi5BRxi
	 44cFKv7OZGUs3Z3qfvnIcf2pGdbmOai/4FJ9m8LNw1PQwcbz4TLKqKq6AosD8ruEwO
	 3erHBv4gG/2l3A7518DvuS9TCnnJIj1//yon6mFbRlXJe8YlXaNir/OSR6vnu4Wx6z
	 Kvot4pAGhQ5zQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 07 Jul 2024 07:47:33 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	fchiby@baylibre.com,
	fparent@baylibre.com,
	s.hauer@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 0/3] soc: mediatek: pwrap: Constify some data and other improvements
Date: Sun,  7 Jul 2024 07:47:19 +0200
Message-ID: <cover.1720331018.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_224739_149596_8C03197B 
X-CRM114-Status: UNSURE (   7.71  )
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

This series is motivated by patch 1. The 2 other patches are some
additionnal goodies spotted while looking at the code.

Patch 1 constifies struct pmic_wrapper_type to move some data to a
read-only section, in order to increase safety.

Patch 2 does the same for some int arrays. This helps move about 7 ko of
data to a read-only section. Not that bad!

Patch 3 simplifies code related to clk management. It also fixes an
issue if the driver is unloaded.

Christophe JAILLET (3):
  soc: mediatek: pwrap: Constify struct pmic_wrapper_type
  soc: mediatek: pwrap: Constify some struct int[]
  soc: mediatek: pwrap: Use devm_clk_bulk_get_all_enable()

 drivers/soc/mediatek/mtk-pmic-wrap.c | 118 +++++++--------------------
 1 file changed, 30 insertions(+), 88 deletions(-)

-- 
2.45.2


