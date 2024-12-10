Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF61BE7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4Gug0yZHJ7/4tL9/AB4gLC4PdFqXx2MGKoxDny63/Y=; b=JYCrZMsvnHhGqZG+wtjhkqnOB3
	KqvTPVAh7BhxsiTZ27Op1Jedb3P+QxEEOl2UCQrYW1IiLTd0ihvmQ9iDNoUZknZeGolbLbkcgO2XZ
	xE8sH3PtxY7q6MHXxMcn7GnnesfOqbiOz7MyVUde0pLzs5u6fH3XElejgxuD9GVZIsOO4VX4VYaN1
	ZIfcz34sO3ygAzBxvdX2zWfzTNiOkq7bzLNMJbxQqQpi3aGGWRTufYTZvvltj8TsafOADXPxjF+md
	NtkRlXKRx1lEcUniXktNvyYs7e9FH4jP2V25mPNZBC/HYqLajGmVfCmWfe1BRnCI3ZiK/PERlGngd
	dTKVEqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Jm-0000000Bmbf-0GJO;
	Tue, 10 Dec 2024 14:34:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL14J-0000000Bip1-1wnp;
	Tue, 10 Dec 2024 14:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w4Gug0yZHJ7/4tL9/AB4gLC4PdFqXx2MGKoxDny63/Y=; b=YSAfXk5qKDIfwmAXk12sv+Ppvr
	5rtupGvOTYtWzTs9JRNmrA1CoMOMsSYB621by2WX3SxJqZAhycCbRFa9kAyePPdZrKcbwCv1FU1l5
	zKPPc45mA9KghxXGQwNoAwAX+KyLJHfl6700rEG7uNuyI3wsGA0mxzsEO+sxpusgFrmpuAQV+3/Qo
	FaDRL0QKWpsWGjnXDRSeiFUHv69srKutm2gWbPXCaAxSc5s++dJ1ZYBoTbpcpl/6A/qkOwGxzih7b
	D1e+Ze8Jex/RQsZPA1gxd9kElFCSyp8PMFBKjIygUgZYTnG6GIwrsaxHVIMTJhNffk64/73QLxR6v
	HogjcfUQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39220 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tL14B-0002T9-0y;
	Tue, 10 Dec 2024 14:18:23 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tL149-006cZJ-JJ; Tue, 10 Dec 2024 14:18:21 +0000
In-Reply-To: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
References: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Ar__n__ __NAL" <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH net-next 3/9] net: dsa: provide implementation of
 .support_eee()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tL149-006cZJ-JJ@rmk-PC.armlinux.org.uk>
Date: Tue, 10 Dec 2024 14:18:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061831_497619_A0A33C0B 
X-CRM114-Status: UNSURE (   9.62  )
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

Provide a trivial implementation for the .support_eee() method which
switch drivers can use to simply indicate that they support EEE on
all their user ports.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/net/dsa.h |  1 +
 net/dsa/port.c    | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index aaa75bbaa0ea..4aeedb296d67 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -1384,5 +1384,6 @@ static inline bool dsa_user_dev_check(const struct net_device *dev)
 
 netdev_tx_t dsa_enqueue_skb(struct sk_buff *skb, struct net_device *dev);
 void dsa_port_phylink_mac_change(struct dsa_switch *ds, int port, bool up);
+bool dsa_supports_eee(struct dsa_switch *ds, int port);
 
 #endif
diff --git a/net/dsa/port.c b/net/dsa/port.c
index ee0aaec4c8e0..5c9d1798e830 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -1575,6 +1575,22 @@ void dsa_port_set_tag_protocol(struct dsa_port *cpu_dp,
 	cpu_dp->tag_ops = tag_ops;
 }
 
+/* dsa_supports_eee - indicate that EEE is supported
+ * @ds: pointer to &struct dsa_switch
+ * @port: port index
+ *
+ * A default implementation for the .support_eee() DSA operations member,
+ * which drivers can use to indicate that they support EEE on all of their
+ * user ports.
+ *
+ * Returns: true
+ */
+bool dsa_supports_eee(struct dsa_switch *ds, int port)
+{
+	return true;
+}
+EXPORT_SYMBOL_GPL(dsa_supports_eee);
+
 static void dsa_port_phylink_mac_config(struct phylink_config *config,
 					unsigned int mode,
 					const struct phylink_link_state *state)
-- 
2.30.2


