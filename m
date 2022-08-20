Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DBCC25B08
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 22:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pFonu2+lyt11nAqs0JC7/r1UiLi62A30gEOaW5uexqQ=; b=4W9ZZFXECBBySQ2zXDhB4ov2/e
	DJdKVVBvckMTW7+7AcpGiYPJvfIJTG2f2E5QtXTpOdDuljxQOu6RG+khh5J4EiKUKrjBQ3TPv5N/I
	lR+7zK+J5vZxqqmtBVBnJBuR7/nUM53n4ggVOm8UyyHZrfKp0+JIzdQ8qUXUtlgJ88foHFxf2aKEg
	/zzXGpoz7TYpfCYY3K3jo/4tiy0DdcgKShHI7Zx1Bfgn+p0fMIODRDLqrNbkCAxQT51L21CinlKEx
	Zwd7lJVW/9Te3QjDF3B1IB9kl1FPQplnLTn8GSZUOeNQGD3LPSjn+Dptwfcb278HpQg50rrvlxYF5
	NmRwuMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPXEX-00D3aR-6N; Sat, 20 Aug 2022 22:46:25 +0000
Received: from mail.base45.de ([2001:67c:2050:320::77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPXET-00D3Uc-JV
	for linux-mediatek@lists.infradead.org; Sat, 20 Aug 2022 22:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pFonu2+lyt11nAqs0JC7/r1UiLi62A30gEOaW5uexqQ=; b=a0O0grs72eKVIeOH7cGcs0m6J/
	alQ0bRsmg/rpD6yDbdNXZmd1/uWpAhUFoQ1V45N0XKO4hptMrRfJqVuPYQ0YfQ3BhJXXPPXceYR34
	Qy/OsSVMvaAJPoifh4u46vFjwAX4vO4l3JNNAcHJReINVNM75MrYUGBZWGF+48NdFomcg/SKQ4Q8K
	SRdV/MmDNlhF5lGXwq4bUxyou4zrbYE5t8koViEqrY9t8SMgRVIw2KPSThLGp77F9edumEqRDnBQ7
	XVDl8t54PRsr4E4rL7clp+s4Mkn5YVJNigScqtKJPZAf6vHbmOVOgsEvJxR6xVoagB8qnbOh+xOLA
	lYWPK/Pg==;
Received: from [2a02:2454:9869:1a:9eb6:54ff:0:fa5] (helo=cerator.lan)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oPXE4-00G2sh-OA; Sat, 20 Aug 2022 22:45:56 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Alexander Couzens <lynxis@fe80.eu>
Subject: [PATCH 0/4] net: mediatek: sgmii: add support to change interface parameter while running
Date: Sun, 21 Aug 2022 00:45:34 +0200
Message-Id: <20220820224538.59489-1-lynxis@fe80.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_154622_179612_CC66130B 
X-CRM114-Status: UNSURE (   6.71  )
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

When connecting the SGMII interface to a 2.5gbit ethernet phy (e.g. rtl8221
or a SFP slot) the SGMII interface need to change the SGMII connection
parameters (speed, autoneg, duplex, ..) while running to match the phy speed.

Alexander Couzens (4):
  net: mediatek: sgmii: fix powering up the SGMII phy
  net: mediatek: sgmii: ensure the SGMII PHY is powered down on
    configuration
  net: mediatek: sgmii: mtk_pcs_setup_mode_an: don't rely on register
    defaults
  net: mediatek: sgmii: set the speed according to the phy interface in
    AN

 drivers/net/ethernet/mediatek/mtk_sgmii.c | 40 ++++++++++++++++-------
 1 file changed, 29 insertions(+), 11 deletions(-)

-- 
2.35.1


