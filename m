Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E33ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Sep 2022 00:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3p2bAZIzEigh2jLU1yoT2nluVGntFmiYadlwtXSbXBM=; b=X8vd3zVgM8w3E0Bq0h8clu2rRh
	28dawPQnz79hLzTEwIrisZ4EYBAvS5LOsSASmVK9K7NrhsABY6RmJDzMvPlRs5JZTdBnWXrn+FJuj
	tcNNXA1SNIErlBvcdLBCBaCBDbMuWniOj6Bb7PBOX8Vg1aHSr4A0HQriUSsi1e4hSXAMr+czoTZCx
	ylS67g3HV2ahcipLHyTGru3tmsnqV8KT0RamHoe3UFCjOUd9XgD8gmKRcFe7iCl3Kfnu7HBMFUVZr
	InOS6YEbjd/HBM2oWBD2YmsnzRoQTH0PbpcYBF9SasbHgcxJmEMJ9bVVdF15viR19JVtno9H9saf6
	pgCJP3Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZLV0-000mSm-J5; Sat, 17 Sep 2022 00:15:58 +0000
Received: from mail.base45.de ([80.241.60.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZLUK-000m6S-Tx; Sat, 17 Sep 2022 00:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3p2bAZIzEigh2jLU1yoT2nluVGntFmiYadlwtXSbXBM=; b=JnQYt7vZy9GtGfhsFqr0IwD3wL
	bJPYkhB6a+m8X0KvUeCEQLrXxCdsbBslimLslHHgu5d6rO7NJcJ+tXFnuo/s7zY6PIEhxhwiGQ2rD
	UOK40lzOF/JWBX0ybbAXK07AJQIhwimNULyr9ZEWG40lyA0l40+hn5ytjoK7el/LhvG8hct26AkiU
	IztVaBOpPEvl2q9kfmFOFQ/zXKO4QwnmmmdkTl6PhD65S+db+3t0pcyG0/7FlHc0a93KUaYQ4clEw
	6Kbo/SA9zLJF41ypO6pBQptzVzUd7F8S/8pRxl5xNZRYTnTUHi8lGSQfqDGctS6wCSUm5pUHylFB6
	3LCmu6qw==;
Received: from p4fd2bf05.dip0.t-ipconnect.de ([79.210.191.5] helo=localhost.localdomain)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oZLNB-000nP7-8H; Sat, 17 Sep 2022 00:07:53 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Landen Chao <landen.chao@mediatek.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] net: mt7531: pll & reset fixes
Date: Sat, 17 Sep 2022 02:07:32 +0200
Message-Id: <20220917000734.520253-1-lynxis@fe80.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_171517_364289_E74F4FC1 
X-CRM114-Status: UNSURE (   6.14  )
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

v1 -> v2:
 - commit message: add Fixes: tag
 - add missing target branch in subject

Alexander Couzens (2):
  net: mt7531: only do PLL once after the reset
  net: mt7531: ensure all MACs are powered down before reset

 drivers/net/dsa/mt7530.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

-- 
2.37.3


