Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFC3C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 05:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XNiwvYR0sbKZZynRPIUFLzn9Wcb2cw2TWYiLCwpV8zQ=; b=GdewVQqnEeQ/l8Ma/llye/07Vj
	dv50sxkC0kF8wuWvmkeR06nC+xE035q+Q0HMP3gRpU5DPBeCkChFvoMQFRzxeBTbHmbva73vzLCtR
	qjVVmZ5ZLpcwiMr4P8FJPfIT2Gru2wfpv4eDeWXODNw4RltzeIXryc9C3lI3EWk3kjlWJKZ2SbDq1
	nl1K1ylTyOg+2qVXwpnyme/GTLdEBvGZMLWQ0Uw8EayMj2UxH6dvWTdb/nvIiYkyBorqZ5tEU+ksx
	wf0qrv114pBsG/hmS8hUqt5HnXKJ2nFS4qYJ3XNjNkSA2xmHxF4GWWVx8ddhjBzT+UNiv/3tQDvvf
	5DjksxkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSVe8-001ZS9-24;
	Wed, 24 Jan 2024 05:17:56 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSVe5-001ZPq-0F;
	Wed, 24 Jan 2024 05:17:54 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rSVdj-00010p-1D;
	Wed, 24 Jan 2024 05:17:32 +0000
Date: Wed, 24 Jan 2024 05:17:25 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: John Crispin <john@phrozen.org>
Subject: [PATCH net] net: dsa: mt7530: fix 10M/100M speed on MT7988 switch
Message-ID: <a5b04dfa8256d8302f402545a51ac4c626fdba25.1706071272.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_211753_110753_9A330A01 
X-CRM114-Status: GOOD (  10.29  )
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

Setup PMCR port register for actual speed and duplex on internally
connected PHYs of the MT7988 built-in switch. This fixes links with
speeds other than 1000M.

Fixes: ("110c18bfed414 net: dsa: mt7530: introduce driver for MT7988 built-in switch")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index f8ecc354630b0..fbd52ff7cbd6e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2843,8 +2843,7 @@ static void mt753x_phylink_mac_link_up(struct dsa_switch *ds, int port,
 	/* MT753x MAC works in 1G full duplex mode for all up-clocked
 	 * variants.
 	 */
-	if (interface == PHY_INTERFACE_MODE_INTERNAL ||
-	    interface == PHY_INTERFACE_MODE_TRGMII ||
+	if (interface == PHY_INTERFACE_MODE_TRGMII ||
 	    (phy_interface_mode_is_8023z(interface))) {
 		speed = SPEED_1000;
 		duplex = DUPLEX_FULL;
-- 
2.43.0


