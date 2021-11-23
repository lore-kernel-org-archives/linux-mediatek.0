Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1617C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0ByuR5rhCRsoT2mOsbAnqP5pdSjzbSWrEd2TDw4nzo=; b=q0GACUD0NJXpa+
	EhzeGVVUYuNp23JG6XXLSPOUC4lDL2gX62YiqIWH7AlnvFECdm+9WQt2saRrQMG7JQ0uWsX1pjqZw
	9QpqWjzqvJO9C7C3yr1FwnA2dxhN9zCyAMJVjcsvUl5LkNkcCQHKRp+q2iwdc8jgp9vbwV53mJjPl
	zSz7ROx9qfNRMO213xa94z0k82xRKGP6tYyb43Awx1K44roqygqTf7pT4/HTszRMBwwJ5BvONhaoR
	VuyQD4EPav0hb7YMwrV8DjDzik8mfKFHi+tnIM5/O+vjtzGLiga5XkvDVzhgF4ILIr+NTpJqvpq+D
	FkMu9jLUrlpRfPNZ3V2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpSe3-001cB0-J4; Tue, 23 Nov 2021 10:03:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpSd6-001aoP-JR; Tue, 23 Nov 2021 10:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fTcvLpPz/LI1BZa+3R5EayZc6ONehYohUJqWm4x8FEc=; b=fMwWV7P6zDvruLM/U/VTSCMKe5
 8HRTNuJolzo5qpf89sdHgskdaGGxqQqy8Sz5VlDvjsRi/iATHQO6VJWkZxYW9YSkiVisHrYnRmbV2
 qVAwjHtxpneXvU4CEH8ljxlVq8x+Vl31vV3G4qqpVxLQ7jAr73oil6nSQMhcUoJstAQzcIXkcyKS7
 ML+ggqTKYQhkjxBKqVaRwS6vYxI9cuEBv+zAu2qi9MNcslTnoD2wbib7Q86lOCbNC1rIOIq5fdJWL
 Kxwc+4KGfbVXw0k7lvv/enxL53hDPKMWI8t+EYqDOCVxKfvb78z5O31L9cwacJyaCHHR2gYxmekoS
 QZQIRgeA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36036 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mpSb6-0007hi-0r; Tue, 23 Nov 2021 10:00:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mpSb5-00BXoV-IG; Tue, 23 Nov 2021 10:00:19 +0000
In-Reply-To: <YZy59OTNCpKoPZT/@shell.armlinux.org.uk>
References: <YZy59OTNCpKoPZT/@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>,
 John Crispin <john@phrozen.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: [PATCH RFC net-next 2/8] net: phylink: add legacy_pre_march2020
 indicator
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mpSb5-00BXoV-IG@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Nov 2021 10:00:19 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_020224_672117_30C96064 
X-CRM114-Status: GOOD (  11.59  )
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

Add a boolean to phylink_config to indicate whether a driver has not
been updated for the changes in commit 7cceb599d15d ("net: phylink:
avoid mac_config calls"), and thus are reliant on the old behaviour.

We were keying this behaviour on the presence of a PCS, but this
becomes an unreliable indicator when making PCS optional. Hence, we
use a flag instead.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/phylink.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 01224235df0f..d005b8e36048 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -84,6 +84,8 @@ enum phylink_op_type {
  * struct phylink_config - PHYLINK configuration structure
  * @dev: a pointer to a struct device associated with the MAC
  * @type: operation type of PHYLINK instance
+ * @legacy_pre_march2020: driver has not been updated for March 2020 updates
+ *	(See commit 7cceb599d15d ("net: phylink: avoid mac_config calls")
  * @pcs_poll: MAC PCS cannot provide link change interrupt
  * @poll_fixed_state: if true, starts link_poll,
  *		      if MAC link is at %MLO_AN_FIXED mode.
@@ -97,6 +99,7 @@ enum phylink_op_type {
 struct phylink_config {
 	struct device *dev;
 	enum phylink_op_type type;
+	bool legacy_pre_march2020;
 	bool pcs_poll;
 	bool poll_fixed_state;
 	bool ovr_an_inband;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
