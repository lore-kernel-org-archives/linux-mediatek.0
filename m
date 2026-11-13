Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2890F60A6F51
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 00:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gW2Wb6yT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfjG0dYj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=; b=gW2Wb6yTwBBztP
	JJbWjHibwXxmrsiaXitucL2eX8k79PPjCCUoZxYPFOKjXRkgkNzrlH/hoRy63lFQzT59HRVCAqqqP
	f75DE5QmIKoAmFhiOPKyhlfEuKGjmNCalAvAAtshCqqyyc2HAJl6pMOLpEiPFxUryrWg3CYk9qi0p
	nF5LgNQpJtXqvGIAN8SY37VSJX/GpbXaUKWePrXW8ZHw+IS3wGYGYp2owPqBmgLL1QRLJV6D1CEMJ
	XVj106OrIsxuGNJA2hQSIGZ5uXMrRVvbV17z1KCnCF8PjjjG5t0H/H6bOGnXQ6oAncnq4YMbmyz5t
	WBsVPeXeHDe3/h/q4JbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDp-0000000BJS0-3civ;
	Fri, 13 Nov 2026 00:32:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDe-0000000BJGO-2Nmj
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 00:32:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so5552135e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 16:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529961; x=1795134761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=XfjG0dYjNREavsJLvAyXofIHF0fKtah7lHY7fIN31A4EeC3LMTiYo0HlMGRtlEuH4w
         ChQwvzaaUoj4+FD1MrGwb2dLd9/uQYgkhnRJ1DS7F/4meks63BGFGboX5ZtHXOWGCqQ7
         6lxijE7vsGTeyZ+CEBtA7OZoBKV7JYewU+65vdNEwjZMyMo0F3SqM1j23fpOih3m0ycL
         MBAnMJQgJsfbuuzPHSmsbpD/U1bIiE3hC3lCKtoiJMP1D/DkjVrr19B8RU8dIHq1JTI4
         v94Zp8DblVMsv8dqMztau2RSItD8KEHkPWhLXQdl69ho8RK2YUYIH+MxiCC0XhjkKixi
         0BnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529961; x=1795134761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=HUlflAvlYXARJUvvnKSHEKF8B5Crex5AhUFUhm6+DrxfTP4pg1BZuHj/uTJ7Tzh7Tu
         u9WjTHJdXtUtOq53ZVrJ8MWULzXFYZjlQgLJLL/R8uTbpGsb9sFaaQHOHRNvhS6Z8UaC
         SKJ7DhG5phnqf3SAPDF7Ou5hjUvhMJW3k2HhwgM0G+CWcwowj19TPss2nOkoidD9ENBS
         KZNA4eg9SOA3Ur2JrVpihi2HyjxgDswi4VY3w13tF3R0+W4X9/hQhkaP/KZYuRnTYXBJ
         5JbiTjLJchHiVySii3FXx0aLhP2f2Oths0NG70tiGQf4G8u5l8leGRqExzRzZ6ixs0Bb
         hVwQ==
X-Forwarded-Encrypted: i=1; AL+hErGf+YOHgISL9P+n6v0KoeRHpno83D5SzvT1xNOkuBCGouqVWAOFVronSUuw9QQfJCABu8Gnr27DaIb1Qn+GVQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+YnSyx3h6hu+DFPD3JvJma1cj6VhngNZGGvwm6Xk0tpHotuMNU
	x7G7Jh/bocD/N4uo5O5uaqEnEva7bRvwPCxGoOKauUbhWLr2CBT9ZTcC
X-Gm-Gg: AYBFou0P7W4V9ckexNvtdOFL0SccgFHDK6jK8u8aemYJDvb99MwwQaEfEzaKIijiOsr
	yhW2E4SPLwuLWjQcfC4oR3ntldly2LyYwwNMu6S1hXTDLcFZo8B8uPtfhLDdhoWCsyTXMhWxEMK
	oxzP7YSyby66KyPpHKy0kWHb7GlXO/kChEjZQN2SIZN/PvkO9IAWK4oSVc64BdVqrc02GzytEhq
	a1coNHWpEhutYpsBMALp/9O+uEuAoLwDQbCoBhPtf8gUS5NxpG61vnMRIWO+L7N6mEo6AWTMGPM
	Ae6XNqkaSLI63PPyRpbOUnX82IpuVxGb2FT/cZV50uWIAQXyDheLQWPUBRwcrs9iUxeYfbPx5s9
	X4Yyt+8AmUvBaQkIeh02LvcBNq3gCnbNKyLt+qHu0Yo4w4c1Y/BFCMErgeGqyjTD8X3vHx59lbd
	28qZvtETpB3neqc6ugum42caNgegyoxv3nrYBaULZMta+JYucp6vOIgWs+mNugOInaU/xNnaTo3
	FOuneext4TfRH++XQDHpVPh0F4rR7VMzrGK5IcZ93VkC7dwLOSb5guATQnTC7wbNRUUWzs0NfGi
	pYVsZafZSn/9J0As93g6IaQ31i/tuzvoBY4DA0NGivM+CLwuPtA2Id9/4w4IbevUp9kPDTR62+f
	6CNYaru2K2R/eoYB/2cM4xfDuwVvktVSXP6tYra0OafarSpigPBSvhVQ=
X-Received: by 2002:a05:600c:c167:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4bb55a92fa1mr18062495e9.20.1794529960557;
        Thu, 12 Nov 2026 16:32:40 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:39 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v19 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri, 13 Nov 2026 01:31:55 +0100
Message-ID: <20261113003217.197757-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163242_652178_A3B6742D 
X-CRM114-Status: GOOD (  13.42  )
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 64b00d324988..e2e0b313fd61 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -47,6 +47,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2185,6 +2186,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2272,6 +2274,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2311,6 +2314,8 @@ void phylink_destroy(struct phylink *pl)
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0


