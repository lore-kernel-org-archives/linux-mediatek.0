Return-Path: <SRS0=gblj=LH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208D8C48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 11:59:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 926A461205
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 11:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 926A461205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=reto-schneider.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JfIJ7F1a3unimfNgzb7wBCZ/W7DLLyehW5Pr0ZJl8LM=; b=LdSA+cJ+hdlsxC
	oQI4fzO6dHXGh7rfws7AFsDBpP9BgsDhxJKJR9Owlhh//PHmHAoqxzcwlVscu9i6ZUJXrDzQ//H5b
	EKKzAK9hG8e1u5+H9MtbJy78byx8VQOvjz8C0v78FUhmLhxK0juIKQyu4YfggPCwa1GnY61dyVzM6
	Tg0kHFMyNTBHor9aG0IbL/rSJUgw9lmC8J4RQfOHdJE6Wk73+jBFq3YS+tmhSNhs6esaRdXc8uXHQ
	fWNuWp21rVaId5DBd5ahal7i44Bz58k0Zqkqf895+ayM6a1IqQEqSOgpJPIamfajCrf3V2QP1KeE5
	A+R3ZWNgdMUITiYZtTWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsOlP-00ANnl-JV; Sun, 13 Jun 2021 11:58:51 +0000
Received: from mxout013.mail.hostpoint.ch ([2a00:d70:0:e::313])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsOlM-00ANmP-57; Sun, 13 Jun 2021 11:58:49 +0000
Received: from [10.0.2.44] (helo=asmtp014.mail.hostpoint.ch)
 by mxout013.mail.hostpoint.ch with esmtp (Exim 4.94.2 (FreeBSD))
 (envelope-from <code@reto-schneider.ch>)
 id 1lsOlG-000MXX-HL; Sun, 13 Jun 2021 13:58:42 +0200
Received: from [2a02:168:6182:1:d747:8127:5b7a:4266]
 (helo=eleanor.home.reto-schneider.ch)
 by asmtp014.mail.hostpoint.ch with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2 (FreeBSD)) (envelope-from <code@reto-schneider.ch>)
 id 1lsOlG-0008UX-FR; Sun, 13 Jun 2021 13:58:42 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
From: Reto Schneider <code@reto-schneider.ch>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Cc: Stefan Roese <sr@denx.de>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>,
 Jakub Kicinski <kuba@kernel.org>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] net: ethernet: mtk_eth_soc: Support custom ifname
Date: Sun, 13 Jun 2021 13:58:19 +0200
Message-Id: <20210613115820.1525478-2-code@reto-schneider.ch>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210613115820.1525478-1-code@reto-schneider.ch>
References: <20210613115820.1525478-1-code@reto-schneider.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_045848_220398_938D8B11 
X-CRM114-Status: GOOD (  10.26  )
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

From: Reto Schneider <reto.schneider@husqvarnagroup.com>

Name the MAC interface name according to the label property. If the
property is missing, the default name (ethX) gets used.

Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>

---

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 64adfd24e134..8bb09801918f 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2948,6 +2948,7 @@ static const struct net_device_ops mtk_netdev_ops = {
 static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 {
 	const __be32 *_id = of_get_property(np, "reg", NULL);
+	const char *const name = of_get_property(np, "label", NULL);
 	phy_interface_t phy_mode;
 	struct phylink *phylink;
 	struct mtk_mac *mac;
@@ -3020,6 +3021,9 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 
 	mac->phylink = phylink;
 
+	if (name)
+		strncpy(eth->netdev[id]->name, name, IFNAMSIZ);
+
 	SET_NETDEV_DEV(eth->netdev[id], eth->dev);
 	eth->netdev[id]->watchdog_timeo = 5 * HZ;
 	eth->netdev[id]->netdev_ops = &mtk_netdev_ops;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
