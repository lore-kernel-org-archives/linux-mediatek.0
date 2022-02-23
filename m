Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05423C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPkhBl7bre0T5cyLB+/6mQLXtjOdFCEK6lR7o7+S+Ik=; b=wv/YiE32hXy4TG
	qYPpBWJ2h+iFeB8HR0PSSb8WlAW0DWlNEh0UdZW5GMs+wPs7EoQ+T9Ib/9jCXiarOxXBcJn2xP6RW
	JoPo2TQMFhesrnJN1C3O3q4JFMOt+js0WheOg5QUB2O70nHJru38N6ARculk5KwiYOtjl7FNEMH2P
	+NOarIpnBcBvS41dczuJPoD+I+4BBi0SPFEIDndlpgNHTOSouXVYefCxPRonO7HzXy9Ij2VRsaVF/
	jdC1tm1aJu43Zx8H954wUuXI5UMtHo+6PFCUJ80dA/kY+/FoyrrhWd7WTZ74DSj4CH8ofupzP6EhL
	GCZfRmQBeYyPAFWMjyYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMq9l-00Dz8t-3E; Wed, 23 Feb 2022 11:50:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMpvI-00Dtu5-Ln; Wed, 23 Feb 2022 11:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TuMbL1VwQGdOKw/RbWRHMJuT+t+npwDGp+x9ke3hYq4=; b=CmIWXiW83Sv+GbOF35tMrTYgVV
 VnqrCGf0Q8mEzkSdPr7pgHm96GZMoajkRFdv1Vl5ucg4KYeUgJ7xifWPmuFQijg4OyFXg8yOo4lWE
 XWna+Uy93Zx9PkmDqS8kZ93YaMSjcXASl5jGWwnJWNYXnQIXFJP0ZLilOpfvdHcvYzQ1zPebOy56p
 LIEzs8/TlvNoedg++ha1fqkBBwJF6+2ff54OPJi9LJa6hsXJAkws1J8G+CLFElBo2Zy5w315Rj3pj
 822Ij6PCR1i24BpCV8wk2396xhFyLyEOYSMhCBBk7JlC2uiNc7wNWyuRHCcy4/lVPjnicNwxUcJxN
 dkoUznzw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57394 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nMpvE-0002l5-1K; Wed, 23 Feb 2022 11:35:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nMpvD-00AJpQ-Ek; Wed, 23 Feb 2022 11:35:03 +0000
In-Reply-To: <YhYbpNsFROcSe4z+@shell.armlinux.org.uk>
References: <YhYbpNsFROcSe4z+@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next v2 10/10] net: dsa: mt7530: mark as non-legacy
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nMpvD-00AJpQ-Ek@rmk-PC.armlinux.org.uk>
Date: Wed, 23 Feb 2022 11:35:03 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_033508_858453_3C9F442A 
X-CRM114-Status: GOOD (  10.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mt7530 driver does not make use of the speed, duplex, pause or
advertisement in its phylink_mac_config() implementation, so it can be
marked as a non-legacy driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mt7530.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 951381008713..afcd9db9d056 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2892,6 +2892,12 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 				   MAC_10 | MAC_100 | MAC_1000FD;
 
+	/* This driver does not make use of the speed, duplex, pause or the
+	 * advertisement in its mac_config, so it is safe to mark this driver
+	 * as non-legacy.
+	 */
+	config->legacy_pre_march2020 = false;
+
 	priv->info->mac_port_get_caps(ds, port, config);
 }
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
