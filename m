Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5B0C2BA19
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 11:04:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC4C206F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 11:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ut6X01vb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="bfzLdk4E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC4C206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wbU+rVzSKwWlzQAslP+Qsn3HExjBmI5/63xfT57oIQA=; b=Ut6X01vb/px7P0
	7BbZHmM74Wo0JuCSWQIRV3nqdJ+6ym1Pp0wID2sAA6auZ85Qvt7krKooSQDu9blYB5KGIoGtozbjA
	Aa9wT0ldtcQVD3TFZ/uXu/Wz4KX+W5x1XSBRdeLcFWLJly+jBmB5x9pl7LxQb7Bua8JvwY5Fnh59K
	G73OWki0OGtFIfIOJEhFgg6chkj9j4+EiRN7jS8ma4WC1XL3NodQDji+gOu4PFzACas23ikTDuqlm
	dywUNoGNQyJ3ql+m/wgClZH9h3wu0n4c2cmUmcHxuiq8stGMtE6bYYyOzPwuxpyCtaIhGxcDW8QSv
	lRlVD514KLSX0fsjJ3wQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLPY7-0005Od-0f; Mon, 06 Apr 2020 11:04:15 +0000
Received: from forward104p.mail.yandex.net ([77.88.28.107])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLPXy-0005Ge-87; Mon, 06 Apr 2020 11:04:08 +0000
Received: from mxback2g.mail.yandex.net (mxback2g.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:163])
 by forward104p.mail.yandex.net (Yandex) with ESMTP id 2D1A14B01769;
 Mon,  6 Apr 2020 14:03:58 +0300 (MSK)
Received: from iva6-add863d6e49c.qloud-c.yandex.net
 (iva6-add863d6e49c.qloud-c.yandex.net [2a02:6b8:c0c:7ea0:0:640:add8:63d6])
 by mxback2g.mail.yandex.net (mxback/Yandex) with ESMTP id 1lkKD5Qv5k-3taCEc9W; 
 Mon, 06 Apr 2020 14:03:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1586171038; bh=MVbOdw9l4QGn3nnIO9erS76GIdiX/YjUcUkIYMD5UTg=;
 h=Subject:To:From:Cc:Date:Message-Id;
 b=bfzLdk4ExqJTfeP8CqC6jDSZSy5lO661rPA2yyCDjnZMShwp+rNaeaquL/r9csELL
 3/vZ+zcrswugGBBiwKe5pdRTro0gPsZXB/qI0dTKtOmpbsKUiL4SbE9VwRqmIC4wCe
 InbKcGer7B9aKeu93ZNjH2gDvGbj0RNlUX1bH0nA=
Authentication-Results: mxback2g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by iva6-add863d6e49c.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 2f6WU2NpeW-3r287sqM; Mon, 06 Apr 2020 14:03:55 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Alexander Lobakin <bloodyreaper@yandex.ru>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH resend net-next] net: dsa: add GRO support via gro_cells
Date: Mon,  6 Apr 2020 14:03:18 +0300
Message-Id: <20200406110318.33738-1-bloodyreaper@yandex.ru>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_040406_785136_AA372DA7 
X-CRM114-Status: GOOD (  16.56  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Alexander Lobakin <bloodyreaper@yandex.ru>, Hauke Mehrtens <hauke@hauke-m.de>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Vivien Didelot <vivien.didelot@gmail.com>, linux-kernel@vger.kernel.org,
 Mao Wenan <maowenan@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

gro_cells lib is used by different encapsulating netdevices, such as
geneve, macsec, vxlan etc. to speed up decapsulated traffic processing.
CPU tag is a sort of "encapsulation", and we can use the same mechs to
greatly improve overall DSA performance.
skbs are passed to the GRO layer after removing CPU tags, so we don't
need any new packet offload types as it was firstly proposed by me in
the first GRO-over-DSA variant [1].

The size of struct gro_cells is sizeof(void *), so hot struct
dsa_slave_priv becomes only 4/8 bytes bigger, and all critical fields
remain in one 32-byte cacheline.
The other positive side effect is that drivers for network devices
that can be shipped as CPU ports of DSA-driven switches can now use
napi_gro_frags() to pass skbs to kernel. Packets built that way are
completely non-linear and are likely being dropped without GRO.

This was tested on to-be-mainlined-soon Ethernet driver that uses
napi_gro_frags(), and the overall performance was on par with the
variant from [1], sometimes even better due to minimal overhead.
net.core.gro_normal_batch tuning may help to push it to the limit
on particular setups and platforms.

[1] https://lore.kernel.org/netdev/20191230143028.27313-1-alobakin@dlink.ru/

Signed-off-by: Alexander Lobakin <bloodyreaper@yandex.ru>
---
 net/dsa/Kconfig    |  1 +
 net/dsa/dsa.c      |  2 +-
 net/dsa/dsa_priv.h |  3 +++
 net/dsa/slave.c    | 10 +++++++++-
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index 92663dcb3aa2..739613070d07 100644
--- a/net/dsa/Kconfig
+++ b/net/dsa/Kconfig
@@ -9,6 +9,7 @@ menuconfig NET_DSA
 	tristate "Distributed Switch Architecture"
 	depends on HAVE_NET_DSA
 	depends on BRIDGE || BRIDGE=n
+	select GRO_CELLS
 	select NET_SWITCHDEV
 	select PHYLINK
 	select NET_DEVLINK
diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index ee2610c4d46a..0384a911779e 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -234,7 +234,7 @@ static int dsa_switch_rcv(struct sk_buff *skb, struct net_device *dev,
 	if (dsa_skb_defer_rx_timestamp(p, skb))
 		return 0;
 
-	netif_receive_skb(skb);
+	gro_cells_receive(&p->gcells, skb);
 
 	return 0;
 }
diff --git a/net/dsa/dsa_priv.h b/net/dsa/dsa_priv.h
index 904cc7c9b882..6d9a1ef65fa0 100644
--- a/net/dsa/dsa_priv.h
+++ b/net/dsa/dsa_priv.h
@@ -11,6 +11,7 @@
 #include <linux/netdevice.h>
 #include <linux/netpoll.h>
 #include <net/dsa.h>
+#include <net/gro_cells.h>
 
 enum {
 	DSA_NOTIFIER_AGEING_TIME,
@@ -77,6 +78,8 @@ struct dsa_slave_priv {
 
 	struct pcpu_sw_netstats	*stats64;
 
+	struct gro_cells	gcells;
+
 	/* DSA port data, such as switch, port index, etc. */
 	struct dsa_port		*dp;
 
diff --git a/net/dsa/slave.c b/net/dsa/slave.c
index 5390ff541658..36c7491e8e5f 100644
--- a/net/dsa/slave.c
+++ b/net/dsa/slave.c
@@ -1762,6 +1762,11 @@ int dsa_slave_create(struct dsa_port *port)
 		free_netdev(slave_dev);
 		return -ENOMEM;
 	}
+
+	ret = gro_cells_init(&p->gcells, slave_dev);
+	if (ret)
+		goto out_free;
+
 	p->dp = port;
 	INIT_LIST_HEAD(&p->mall_tc_list);
 	p->xmit = cpu_dp->tag_ops->xmit;
@@ -1781,7 +1786,7 @@ int dsa_slave_create(struct dsa_port *port)
 	ret = dsa_slave_phy_setup(slave_dev);
 	if (ret) {
 		netdev_err(master, "error %d setting up slave phy\n", ret);
-		goto out_free;
+		goto out_gcells;
 	}
 
 	dsa_slave_notify(slave_dev, DSA_PORT_REGISTER);
@@ -1800,6 +1805,8 @@ int dsa_slave_create(struct dsa_port *port)
 	phylink_disconnect_phy(p->dp->pl);
 	rtnl_unlock();
 	phylink_destroy(p->dp->pl);
+out_gcells:
+	gro_cells_destroy(&p->gcells);
 out_free:
 	free_percpu(p->stats64);
 	free_netdev(slave_dev);
@@ -1820,6 +1827,7 @@ void dsa_slave_destroy(struct net_device *slave_dev)
 	dsa_slave_notify(slave_dev, DSA_PORT_UNREGISTER);
 	unregister_netdev(slave_dev);
 	phylink_destroy(dp->pl);
+	gro_cells_destroy(&p->gcells);
 	free_percpu(p->stats64);
 	free_netdev(slave_dev);
 }
-- 
2.26.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
