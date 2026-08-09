Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40502C5AD55
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 20:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VB96Ldc2jz3Kca5DqAJVE1SCjhA8uLTE3bNlY0xHhzc=; b=nsmRz1TVaEVqJfVLNksclSkSP1
	7NHUca6g4CdtN0QOiZ+k54QRNqOpP8RE8Od4hh4bbwnc83wZfdLXVEL8x73fF/r136VisO4dwlslD
	Bh13YGyHTukBTo41TzWag84tFFcMakwjbTczopiQIa3goCnDupyE3NBcg0yBiayhAr5qa1yoXb69H
	X3aiBIjS4C3kwsN6mKWbqToLc+s4EqzgSinJfwCed5L/VoY2ZOKe6QrGZMuON/A1RYTLMgwMyFT2o
	fwcwSQVdnJJ22N8+V7yzMdrgjiSPiWY/kcbe2H196E4euHPGbdMYcWgCtiEeyx00jOFbG00GUOggL
	elhyopNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABY-0000000AgPf-1WL7;
	Sun, 09 Aug 2026 20:31:56 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABT-0000000AgDk-0ZkI
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 20:31:52 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4955de8797cso7114165e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 13:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307509; x=1786912309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VB96Ldc2jz3Kca5DqAJVE1SCjhA8uLTE3bNlY0xHhzc=;
        b=WttS58vZVfkggbMy3sEnDcRF0jhySb1VddLh22VfbXDugvwJiM18OsO+Yjmt+qXYNi
         Zizgg5oE7y/Vv6bIlYktttr9MqT+tan35DbAgfgev/FM7oYtyQ0dArPvKXHpSJtWE6sb
         2hOx/WUyBTofrgNz3kfFhN/z/VqX+PfnkhConlQu3QYJQHPRWhE0MTKTSZwyzDwjwGhs
         7gh5Jjfejscts5LFGw2qNrZys8WwLrgs6LhV74NUaKQRt9IfX2nlgfeRCDFDO7ILVFqK
         POS+im+ijWBD5it6Bn+Zd2GcpFV+SP0kZufUTd8oH0797bUbL3ZNuSONM+0D5X1BUJJB
         Xfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307509; x=1786912309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VB96Ldc2jz3Kca5DqAJVE1SCjhA8uLTE3bNlY0xHhzc=;
        b=D+UmGy5cYZM4XnF1RlTo2DY9fjWIFKHp8dCdF4dkmi/FZywivDMHx/rayGW6OfjaWP
         RQDkOVnrsT+ffzT/tsixxnj1HKpAiBT8oMWVIGQKfE8df/4Wigy4nuVkJkUKJhuEHlhh
         NII7TIyjhBBO8UOxzIxC9AS8d1hYrD98Bm5hVieIPvLa3hhJwlEQqCpIrfVunKHGCO54
         KfdiRGcXjFcNRZ9Zc6kAOZHGH8RTKjpvD0ABKWya0p3CYcEbG1lO19HWbVmdBnA6iM0D
         v83041knShiWzcQhpYNJZZEnKQGxqGBr8JLFcrTuCkRPXOi1MFFPIK0bl/CABxR7zGf0
         4l4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrq4we1NpHtnBYCV6Anc7fUwIbrgw9FHo5MldmdIiT+y8IXP74GFbbB12VBJzFWvkVF1BGGvTJg7SazRsAthQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbUfKCZLWyp5jQf3of1LDeLUfgFjsXtM7VEsBw2SkEPNLgkvro
	+MrATzPnTX2HCEhfpcSWxjENxF850Lo2CDFO038KibodXAyWXun6/AL0
X-Gm-Gg: AR+sD130tqCHVpJOR7keO9CzKodbWyZkiIQFat3W4F/rBMAqXVuL6DTNFtillwiyWpu
	GTP0cpJ1+SGEFYyD4j1nzcMpwv7PTy9g7y7CgDN9ThdKxTb38FaEiH7Ojgp7C3irRWFh/szqPI8
	oZZj2VTMfV5HcrqX42QgdRz3fzBJRpmqzjdjOl2mD85BED4G9CO2QTQa3qvFuqHcW3ozDZKPKby
	bsVdaJJz5JtlFBF4luaikwxl5ZCqhR78LQPTUDWXUcI9YAo/UMp8fQFrywKR80mBPLFiOr87oZu
	6MEWaZ6jo0kSpqyhPJH4KE78uPbAuEnbprX6Jq9mGy10D/oYpD019Kt18yBTtbsr90DRNByZ2x0
	Sq6n8PKgCSZs6BvhdQAi2niNdZn6/3Un7lFyHNIXQX0smVn60jLiyqTIgwC3h/qzlBxP5R7Xsb1
	r0BgjY/iw60pzizGqDogwTqOO/sodSwL4s0Jo7XDSWXsl6IYitetgaBvFBD83HdVNiWlUQm+Zy3
	e5cyUdch1P42uMpTk0T3MTzpLtdLVaU7v1JJG193TgEC0yF
X-Received: by 2002:a05:600c:470a:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4995e0df176mr198258835e9.13.1786307509452;
        Sun, 09 Aug 2026 13:31:49 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
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
Subject: [PATCH net-next v12 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Sun,  9 Aug 2026 22:31:06 +0200
Message-ID: <20260809203116.640271-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_133151_244764_C54C2F3A 
X-CRM114-Status: GOOD (  14.51  )
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 191c902d4008..d64fde37eb2d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -982,6 +982,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1687,6 +1693,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index ca9dfc142388..ea554c0d41f8 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_down() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.53.0


