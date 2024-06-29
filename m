Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B276DC27C4F
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jun 2024 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JpucOAbumbHAvBNa/G5y6qwvaXXu9oGDOGj7Rt8h4IU=; b=2/dLe/BnxSSjWlmn/+peHpweFU
	Ee8hl745ycITMGfJhxoxUt1atApdfVpMbzP9jBKKO7dOxKiSposwH2CKsYeQTpmJRNz15sSv7gpSE
	D8aRhMQpM19mq9XrKX5+9eiPFzU7AurBmARZ3jt5RCYxONMusWtk+9x3WpnE5SAiuGycw+WRXePBY
	adUWmuhiNJA3sYgzWe3YtBnOnevdckNEex8AAGo8lYawYeXLV2e1ROilBS/KNAoYYXYQRXQNJLity
	hxco7Swef3lr+y0g/kld8aQQIMcIQ3EB63mlwi1FgGjlJkyCrpsvEo2UbmTgTooqbOPGu9bX2d4D5
	eDc8d7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNUFQ-0000000GApe-2FUR;
	Sat, 29 Jun 2024 09:19:56 +0000
Received: from smtp-14.smtpout.orange.fr ([80.12.242.14] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNUFE-0000000GAkn-0c6B
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Jun 2024 09:19:47 +0000
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id NUF6sgiHDa7etNUF6s5cmT; Sat, 29 Jun 2024 11:19:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1719652778;
	bh=JpucOAbumbHAvBNa/G5y6qwvaXXu9oGDOGj7Rt8h4IU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=JsLkESlhxnCH4AOpFKKtHgC4mDBa19akQInXPCbNnj95NJ8Wci32l/R3/SEs0/nlI
	 OiLuG0aA+55ZKQODcJZw4mqFJ9UnFpn4FvUpHyvFup7F9nWnju5/znFUMaIJzTS7w6
	 s28pwX0JmYGUtr+W+tKGS0QRMKKKqDTyexKkAMd6i1In1HWPt+/cbwZMX4ESMeWeq+
	 hPDwdNa37H4UxaefqvbA1rNT29/LrJOwdvj0YVlTq6KzGTny2nszRyAsH5ZnI8rS8B
	 3xzgGHvDpWMFyDWtafT+lKtwLka6Lw3t6q52x64dw/CgArFoc35nz5pA5My2fjiQgM
	 pULIr6daqPvnw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Jun 2024 11:19:38 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	fparent@baylibre.com,
	fchiby@baylibre.com,
	s.hauer@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/4] soc: mediatek: pwrap: Constify some data and other improvements
Date: Sat, 29 Jun 2024 11:19:29 +0200
Message-ID: <cover.1719652155.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_021944_638271_84B33FE0 
X-CRM114-Status: UNSURE (   7.80  )
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

This series is motivated by patch 1. The 3 other patches are some
additionnal goodies spotted while looking at the code.

Patch 1 constifies struct pmic_wrapper_type to move some data to a
read-only section, in order to increase safety.

Patch 2 does the same for some int arrays. This helps move about 7 ko of
data to a read-only section. Not that bad!

Patch 3 simplifies code related to clk management. It also fixes an
issue if the driver is unloaded.

Patch 4 is just a clean-up of some messages.

Christophe JAILLET (4):
  soc: mediatek: pwrap: Constify struct pmic_wrapper_type
  soc: mediatek: pwrap: Constify some struct int[]
  soc: mediatek: pwrap: Use devm_clk_get_[optional_]enabled()
  soc: mediatek: pwrap: Simplify some error messages

 drivers/soc/mediatek/mtk-pmic-wrap.c | 125 +++++++++------------------
 1 file changed, 43 insertions(+), 82 deletions(-)

-- 
2.45.2


