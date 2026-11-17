Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48728606A8A7
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=st704olO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SpM4FCzI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=; b=st704olOBKez++
	tJjW6aOPQNoeBabYZv7XKtI/ycUjJh1NbBdqRvupz0o3l+Zo4lUnUCN8iUzd4yW8ygGZMlfKwhYON
	XNFPJpVTYRIZcn+I6Kovku4rsRsiEfZ0Fixpq1hY3xRq33rr5/B1/6pYCYnNO/80Vm76w5WirHQ6y
	zmSIZlMgU80t3GAW7gHX/TjQGhpGpNBWZ5THJkNCnuLMk+ZBrMSUh2xarrm6F88SshJg12hDzKjkR
	24ZzT53hF8SHW6IyK965Aq79ZnnIlhHK18fufc0ixGDnyJVUCuirnWwRCsI7Y2xX4snwpebypDhZx
	VBovqzkMpNlqw0qJPG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIUE-00000005fTA-3IzU;
	Tue, 17 Nov 2026 12:40:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTITr-00000005f28-3VeK
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 12:40:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so14938935e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 04:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919210; x=1795524010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=SpM4FCzIghrR47norOn7F+PiGZ3A8UXbasTDQiStwpsUW3mCkI4YcWMgFXqsIXdyjB
         6OYIVLiO/IXS9mrhBPSQlJI+IKOykyZ0f0+Ujz/H/6IYL9wRm0qus7UuIqG2gVUpn5G7
         e0uVcrWZTyncD8QdPN1ehGSiDFGSeq7zVPsgwwrdPM5wP3BE2s07Ir8D1gpLRe2bkFqH
         hVb+7dNnsCCb5mnFoU7oQYOJU3FE9YDd/A96EPlqv983wFxkBbL1LFBgHuvNgLYUE3nD
         JRsfx1U7+UR1VFI4AoHoBLT7K6ChR8JJv7OA3S/aaQaymE7dImp2tV3tsAYDkaKLzWwc
         FIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919210; x=1795524010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=vt7+jbM4UOJHUTzLWD2RkLlXea1uojZZB2sy5kBXYUTS7gRglmIokmJ/YLgkzMN3/U
         jH/e4f70zoLpb5LoVo7QMsx6289dGc0CCZ62veLqsZgwguV+pS/wk7r50xlRKSi2A7oo
         Jpf+DFwSZMc4ritN6MezwnBzdYMgPmI1qCDGyrfk1427oeAZ2ZvyIg2HSu4B+QVgSPlc
         abM+PSsEN20+d2Gx9lw0OVTMpHAahSOjuscWzYPu30+8cXC7t/dha7j/fiA5SiZ/HbJ4
         tnjbxT80bzC1QsFXkCEcZftym4qIHD+OtYg9DKD0kLNtLsLHqS/NSlLIhZULezQ36LjC
         zRBw==
X-Forwarded-Encrypted: i=1; AL+hErE+3aIJXukqXmfa3EhF5TNYGiiP/2JCndnwDnGB9b2kGZo86kdhHwmR13sUfBur3dko3yDGBiFi19LGyEp5GA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+jk4ia+LUx7lTGOUAC7x/gaz/q5DB9iDBCzJUFSmU45uImTCcR
	q4GTNrDJ0S9vantG1zuda4w0xMzSh37UrXhpcWLeMEtEh/ZRX4FT5SqN
X-Gm-Gg: AYBFou3zscG73ibdseNmEtgkGc/dNKwsnb7NyweRlBsa5/0M0/03rlu7dwt1m7Ot/fw
	Qp+pJBXCfRR3VYoqcKEYd+s4i3FlAhV2x13vXUmYMmT+B1r8MUNbdYq9zrWebh3mKb7EY9I2pil
	ymgWSSQKwzJZjhzHbDXhott+YWkPGBw0z0Go7N2M/E6M16L9D5mqhMg9kHeMYRLfcxLoI9TfuzE
	NmQoqCXGLqA7fkMsnfv/HzpLkLjxtOQ+jKDsnaPDsxpZhtvOikZUJMU1GjIQL25gFJWkLVRINH/
	JqnfF+Otys3I8DCGoI9DL0oizyAl6fZZD9iw677t9QDBLTe4h48OjGbg00AuSrmtYR7x3H6UOn4
	QwiiWTuSY5kUpgQD2weAcPmhh6JSJ5RBq1kQBssYwD3CRov/zVgBc06xhKkbjZXNhAIn+h01M0R
	KDDLfyC05OrrajEZXcRagtJat48wrM2rkTAxYRxpa+Z2KejHsBqILG+IvvyQai5JiQ9SAoaVu15
	twCAdLl4LXYxwnVRuYaFnD8RbpiYqp1eDLA7Wl235GafrqJkPri/2htim+kWHdtcg8nQiKHqXoT
	hb1ZGYfdtkjdyX+GOs/vtW5QOzhASX9TsgV/6wzs5nLij5I6wNPUOEfpq5UWc2bw5N7bqDvymc+
	kUITGKCRzSf9wQAz81uCUcT6yHWZ32R3Ddg==
X-Received: by 2002:a05:600c:474f:b0:4bb:76d6:1f5d with SMTP id 5b1f17b1804b1-4bb76d61fb0mr87328795e9.2.1794919209827;
        Tue, 17 Nov 2026 04:40:09 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:09 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 01/15] net: phylink: make PCS phylink instance access RCU protected
Date: Tue, 17 Nov 2026 13:39:41 +0100
Message-ID: <20261117123956.11981-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_044013_278225_405B59A1 
X-CRM114-Status: GOOD (  16.09  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In the context of phylink_pcs_change(), phylink instance is dereferenced
from the pcs pointer present in the phylink_pcs struct.

There is currently a fragility where this pcs pointer is never set NULL in
phylink_destroy() and would reference invalid memory after phylink instance
is freed.

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid
memory can be dereferenced and phylink_link_changed() is called on freed
memory.

To address this, make the phylink instance saved in phylink_pcs struct RCU
protected and access it under RCU lock.

Also correctly reset the phylink instance pointer on phylink_destroy() and
syncronyze RCU to catch an execution of phylink_pcs_change().

Fixes: 24699cc1ff3e ("net: phylink: add support for PCS link change notifications")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..d9d0ace2042e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -17,6 +17,7 @@
 #include <linux/phy_link_topology.h>
 #include <linux/phy_port.h>
 #include <linux/phylink.h>
+#include <linux/rcupdate.h>
 #include <linux/rtnetlink.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -1295,10 +1296,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pl->pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2137,6 +2138,11 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	if (pl->pcs) {
+		rcu_assign_pointer(pl->pcs->phylink, NULL);
+		synchronize_rcu();
+	}
+
 	cancel_work_sync(&pl->resolve);
 	kfree(pl);
 }
@@ -2601,10 +2607,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
  */
 void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 {
-	struct phylink *pl = pcs->phylink;
+	struct phylink *pl;
+
+	rcu_read_lock();
 
+	pl = rcu_dereference(pcs->phylink);
 	if (pl)
 		phylink_link_changed(pl, up, "pcs");
+
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 3a88a69882a6..4a0dc6fa8010 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -494,7 +494,7 @@ struct phylink_pcs_ops;
 struct phylink_pcs {
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
-	struct phylink *phylink;
+	struct phylink __rcu *phylink;
 	bool poll;
 	bool rxc_always_on;
 };
-- 
2.55.0


