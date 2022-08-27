Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0C0ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Aug 2022 11:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0SALmFe5UUDO2sMgc/eKbghw5hdGE+8iWKl8yE88NzA=; b=qpglGr00U5SGTLHLnOKwEMQYlX
	nnNgK7kdyCihYRbCxXprGKhkltEh9fD2IWW4CkxrzDblgI2EWmoE+xKD5CP7aJzPyPtfaA2Cbtiq4
	VY5TXWh9DP+6eFtecrJQ4bDV+pHrh2GYnmzTsIeWwJq0uoEtj97tg6IEAwLxIaZEfsjFjIkWG+Kr6
	WQmi+cvb4FCFP7+VzdQ6lZhx4AGEdeed7etn/MIRlwL7d/rj99KLhuk85n6rfjQaKbREs+hbTpcji
	TXE0tEyhe+aPC2sWkDRU2V+RZpWmF0B3LGarcnccCOrenu7zLhLLWmrAxJ25NHg+bDokyf8kjVtSM
	QByinFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRuCM-008zKt-45; Sat, 27 Aug 2022 11:41:58 +0000
Received: from smtp-29.smtpout.orange.fr ([80.12.242.29] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRuCI-008z7o-9X
	for linux-mediatek@lists.infradead.org; Sat, 27 Aug 2022 11:41:56 +0000
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id RuC4oJLK7XFXxRuC4oYr06; Sat, 27 Aug 2022 13:41:45 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 27 Aug 2022 13:41:45 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: broonie@kernel.org,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	blogic@openwrt.org
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/4] spi: mt7621: Fix an erroneous message + clean-ups
Date: Sat, 27 Aug 2022 13:41:39 +0200
Message-Id: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_044154_506576_334D7EA3 
X-CRM114-Status: UNSURE (   5.48  )
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

Patch 1 fixes an issue about an error code that is erroneously logged.

Patch 2-4 are just clean-ups spotted while fixing it.

Additional comments are added below --- in patches 2 and 3.

Christophe JAILLET (4):
  spi: mt7621: Fix an error message in mt7621_spi_probe()
  spi: mt7621: Use the devm_clk_get_enabled() helper to simplify error
    handling
  spi: mt7621: Use devm_spi_register_controller()
  spi: mt7621: Remove 'clk' from 'struct mt7621_spi'

 drivers/spi/spi-mt7621.c | 42 ++++++----------------------------------
 1 file changed, 6 insertions(+), 36 deletions(-)

-- 
2.34.1


