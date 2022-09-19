Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3B9C54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wyupJayZSIFm4y9yPMluAd5MbviJpk1Su8GT/MLhOjk=; b=IWhaiRKW8fq2Jp8V0VK+V31XPE
	YPJ0sHN+9jOgkuEBH688iVZyPtWdrjV2k9DO0cCQ7H49OtvmdmVTnDWFAMxt43iC1yGUxgAZyXx+N
	d6lo/hMMGJ69DGOtVUURmQtL5xxdJO1Q1G2FYnraEYp2Lp7Cf4pW0/9xpq6LicFvhp2KhJlOFFlul
	ChXGc0Kh83/6T0pPO99OZobmao1yJRyiriTtfd4F7l/TbWQVnwaiJgLSxzElsZfNGDTeOwmtEJJaU
	cTdEEG28SQgXIoHqqs9SlEuBaKmw8cuw/1A2X/9mDYAqvL+11SpYBfv+vyo/pxyXP9g/CpE5MpH6L
	AxV6EvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCQo-00AJa5-Bx; Mon, 19 Sep 2022 08:47:10 +0000
Received: from mail.base45.de ([80.241.60.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCQK-00AIyN-HI; Mon, 19 Sep 2022 08:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wyupJayZSIFm4y9yPMluAd5MbviJpk1Su8GT/MLhOjk=; b=tzfQxWbqUmiJCTkn6p5176GEvQ
	Nr6iSRPO7XqqBoc37yt3n2c+COIOanKNp8KNtjNY+RguFlz0Wsy9QxyYFIKZqIE9Oxh1eY0kmRJYx
	/JsBRFyUcGpPsBDIYiCwkqm8BRd3ETaTlz1G3hCxFRxaxCF7oawUnvoiXw2E2ZKAXoU+lfOMRDxix
	jk9K3Qx2pruXgvmesvP0GU8Lo8Hl6aHL4KBsjqHXs5KZqtKIEB1PaaN4Y2in7gGCPbRaY0tZL0tnl
	gOTd3gam97FlNbNM0VVv75owScUUoaMFORiruwkKmUKeRBGiVSGO2Ff1EnF7FjoqVzb97WmF72S2a
	e3Erp5ig==;
Received: from dynamic-089-204-138-189.89.204.138.pool.telefonica.de ([89.204.138.189] helo=localhost.localdomain)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oaCHH-0015f0-Lm; Mon, 19 Sep 2022 08:37:19 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Alexander Couzens <lynxis@fe80.eu>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/5] net: mediatek: sgmii stability
Date: Mon, 19 Sep 2022 10:37:07 +0200
Message-Id: <20220919083713.730512-1-lynxis@fe80.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_014641_493212_DB43C156 
X-CRM114-Status: UNSURE (   7.00  )
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
 - add & improve comments on unexpected hw behaviour
 - add patch refactor power cycling into mtk_pcs_config()

Alexander Couzens (5):
  net: mediatek: sgmii: fix powering up the SGMII phy
  net: mediatek: sgmii: ensure the SGMII PHY is powered down on
    configuration
  net: mediatek: sgmii: mtk_pcs_setup_mode_an: don't rely on register
    defaults
  net: mediatek: sgmii: set the speed according to the phy interface in
    AN
  net: mediatek: sgmii: refactor power cycling into mtk_pcs_config()

 drivers/net/ethernet/mediatek/mtk_sgmii.c | 41 ++++++++++++++++-------
 1 file changed, 28 insertions(+), 13 deletions(-)

-- 
2.37.3


