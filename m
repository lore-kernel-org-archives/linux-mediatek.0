Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AB560A380F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CDiWLSbC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FhqxO0Yg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=; b=CDiWLSbC4LWWdJ
	NtlZZ4p6tHRSnuchKTjpqYYCdDpwb4NdZS4EI40T3L6NBQ3yWUrr8dvooBx42rRaCs6OmZxaOLTkQ
	YBbxpY0tFGHpCxb1Pax9ck8q7YfjJbiH76YbmsTs2nL1mC+9608wiI80NDT2/VfVrnKMXoLEYkOJv
	EtAlucc86tthvRsOTb7Rk9pMjMtxR5YoarosHNs1At/8A8YAus6044cp40D975txG7Cny2RvffDqd
	U68Y1F5xUt71b5YEMunsakXmxeRvAvhfr4nmnkG9as20HCnYw/T9Maqh97uyQPb95tpwpkOBOv1t9
	0B863SQU+zaRDLDKYbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfJ-00000003FPs-3iuY;
	Mon, 16 Nov 2026 16:34:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzf7-00000003FBL-22bV
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso13651935e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 08:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846872; x=1795451672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=FhqxO0Yg09H8CnpHh7zJjKLXSiSoz4R8gYxvkoITji8XHENoBhGxmztvjmJ/i6l/ry
         YDLuwQY9c1gUgjsmmCi6DRA70VeLJlrNCj+yn8SVPPy6thJcLC+A20P4yHH8agIOip/u
         yS+yoh5GW6AgT38na2ShB0M8KlkflVhBPB94jFw+v7wm18CuRtkH3dq4d5WDoQz50rjR
         FaFnJO0vgRIqX6a3NwJmeP7WWggkpvhs7Z65JGY2vjJeLCTrKabdItxa1JMFJ8EyC/CX
         08On8lVoEhw5XHLiKI+jDVUxeq5h1WEhI1GAJzZs4NlDoXDEgPNnEanKmekLMBd0YiDS
         8Qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846872; x=1795451672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=oKkW9zMHH+Bu74rbbdrJlDy/t6BPWuigL4wS7cGlsjkOp84Ij/QAv7AnE6BAInlL9l
         IQuht9Q3t/hFSowyYkfPzWIKdvl0nzkWvE/M/0s8W0ZlnWmymEzwp0sYmiZwjSm249yq
         t7HdYzE7wlejaJEpGT7CUN1yjLJ3lQ4mI26D6TUfZ2aZpvVFUUavjHsHoxFZiPX81WAn
         p6XVPth+xIIM22oHUfSG9RBkEMIFElsA+X32jdOKeXJh5JqSWYXKXZ/oJUU9Rd7lemyQ
         J5u7fQwWQH1gP6CRLzV0RGga/iVgD24QvKi63MWY/e3ANM99OoXVV92vSHxGZ11WVTOG
         +f+A==
X-Forwarded-Encrypted: i=1; AL+hErGzUgHoJFB4GQjoaVDYPt7BAI5TAkYrC6fMQTI8CDxQZZRO1wnEYdIo3RTOCnjzOLVKYQG3rRSF7Gg2ngl2bQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Q/DrXG26voIkCr7fCU9yI8+TLp5w8BRv74+P/swLoGGyahNOb
	g2NiAxVs8SrKdLo50lvQrEYNKyi8m/TuewwcL0CnLXvq2tCLiLDzZSxZ
X-Gm-Gg: AYBFou1vM84GZ6ORR1FiRGWxCrn8rDEAXxk/y15BMfBmMC5vEXoCmSWv5lr+Lx0sHsm
	GPHSh9qjKG9pQTnznyI9z8+pbKAK3iKWG9XFs1XE5SSmWdqzF1WHYu8Fnq+jlnUOqem4IObXzXS
	nkFTPA2p16ogaMSCdFqEJRYZWjWw7aiBHOCJge1XDkHJBzeFcv+Xje8Xiy61pPYgSBYVp69x7Io
	csWc4T/o9tHWUvuKZWPDGO2kcpiN2C//LdROew1X8ikmhzyBoUU8muZWC8szRl6vAh/yWY8o3T4
	bvTCi8Qg5eeAB+r0u5pQyz6cshOUG5tbDDhdptfs5xhkNyQK2sDq5MHUfrdLPc7UaGQXqxoD9e3
	SNPqZNbcAUzmu1mPsdSS6ou7Y8CAYC2dGDDndSifmaPNPBH5/5CznluhmnEg+wz/W8/rY7IwKKu
	Y8xyBKDxDdZN4L/NSm7GkTmhh1rw9X0saCjkv+KbjRQRFXoXiRyNhO3LghVZi3iFL0qFc3dOCpU
	SZCXeE9ePqSyQJoSg7uWdKRQlNA80NWe3htQfuHnf/YMfvr0JROIpWwwQzVHMyPwcFSpYznkwAQ
	3I5FU8hC0VqdwIuZRmh7TkkRaKi31lfhxfEIXdBjvXQRHuxgifjRP+fxwvfCx7rGi1YUkRQ6+tU
	NfPWJsLNWcNT4In0jIAy6FmfkEGUK1iCGD4P19kOUMnJyjnCaCd6Jp/M=
X-Received: by 2002:a05:600c:1913:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb55ab021bmr249777075e9.30.1794846871585;
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Mon, 16 Nov 2026 17:33:48 +0100
Message-ID: <20261116163412.551438-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_083433_542009_64BB6F48 
X-CRM114-Status: GOOD (  13.44  )
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
index e8ba906cfba6..091c3a79c120 100644
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


