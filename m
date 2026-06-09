Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF3BCD8CBF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 15:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCE+R9wA56VqH4pDqL6DakPzOTQgXi/PURE5D91YIjM=; b=H66yFk1lop65E025jfo9ESbvsE
	Z1aFSZWuLm+iYg6Uhz0cnVq9NrCz0/r4T9rm/YX5ymwyLIxOXvdZkaAdJ9TzCdGFQ+ibt/eT2HWJ5
	MttaKjsK8/hKtHwoWvkNCBEEyEmQYmPNfBh4fie0VnFShwMPi6nfX78OipmH/qd5qQtxXLwYbH1Z9
	+qok6e08EoDwW34glYHd87smjhRnKFBkp2uYI2cOeuUOLB5hN7OOLhvX78aNE2numO9zNC1whr8ik
	6lFUXaFv1ItSyfG5MQPOjcIthh6kG2DM71P6GBkANYsowHlUwuTkEpmEakbQpHanMTMJqFsseVfn1
	wdsn9zCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy9A-00000005snU-0Rhg;
	Tue, 09 Jun 2026 15:13:44 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8x-00000005sXm-0WgN
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 15:13:32 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-beb2a97cc9aso916299366b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018009; x=1781622809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCE+R9wA56VqH4pDqL6DakPzOTQgXi/PURE5D91YIjM=;
        b=r4/BtJwP01eI9smFJ5gczxgN6DskFehhvu283tqMe9vWDOiZpSaAImMgrxE1luyH52
         MQGgDmwSju9jccA84UO0/QHZCssoYi3OtWvWSWd3ZH2cla9EiEsEtOoQgLPZ/3TKbtpe
         fNrCYgT0lAWou6b6Ein1bMOQDD6Ez/O3pY9qtQ0R2yK7Fr3oU8n7HY4Y5zWeutMZ0UKt
         regxmkjdDRS6W/rvAIqvQTZ7860jyrHTzwnlD4zVZywlUDleNrkqIOMnu2b0xdzzf+9P
         gKjU2CcJ/IfKHmANrUxOxcDTaS/2MA3F/qInv39xefZkv93TlauQfOgGArVQxAnS7BbA
         kXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018009; x=1781622809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rCE+R9wA56VqH4pDqL6DakPzOTQgXi/PURE5D91YIjM=;
        b=MSB3Y0q/gNlW0TnU2olksR9IUxhurRebMgWEqWPbaO8Qy2qAbdnaU7KlK552BOXKC1
         A531zXLcAhSJ23A3Nlr0PIddLEs8PPHaZ6tuS9RENPvPYoSDJwt6VdKWsMdmom0tzIpb
         +AKHlbe0bwUKjDV532ucu1CUCSPHMJnxJ5Tu7qnurGa6iKx4LXnuBMfQZKsCNbhH/eAJ
         gb+1I1Lq/vsIJQXjLXvD8KHLQhltYvP4NpP0e1VVD1Znmf86oPR0rk0RAZLO3OjHJP3+
         pEcOiC9cp9j6BFLzv9FCUlITDBUvfmNRbS82ZlECMBGp+CKzRXjjyNNqmoaoNPH9WE/I
         BEJA==
X-Forwarded-Encrypted: i=1; AFNElJ8sodOXtb0/4DUwcPBX+q3qO8H89TLP5wIVaFU0UI5W0ecafAUa3Rvye/ls3spqbtGw+2FpHK6P8tIhbalYeA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjh+HeqJXn/NsxCIwmyrQU3cMvZWkbwJu7cITi8fuGJfEeeG0i
	Fj+bm8YJxaEDUXKAoVQsRcj7JN7P1PwYLtZNAt0aoIuC0uquYFI5OnrT
X-Gm-Gg: Acq92OEwHxpg7ze6A/1hIUwNgea2NDWQJlUlJPHXs5d/NLbKJC2GdVtRUx2OT9at6P7
	MRrv4VDUMaT/lPS4tWQ0KqcIZ5HUxx1AI7U4n2J6J7PntBB4QSfDtV8t7Hj44x0Hb1LBCNQy6Rj
	upLv9L3nJEwRLvz08qYlZdfgIyFJ52DWLb10lor1OE2c14qA3sV8MBfO9Q0/uE1wXr1zm9ciEdT
	NaEeEKWiHtxoBTaH3k363UUurxFMcmOEOImYB+rkxX8CinkRQtWjYs36xfsm0RzmRHgBVxWTb3d
	+3cBRGnrBQaeuDILquQMHvgYZK3KvsuUkxeSToG1GfJp4ITeUE6bOjhNwVKglHVcJ2lDIdmnmfA
	Hy3NhyFXT3cru7C6nEuns7kvPbIC8i6NPOR4YKuxLo/J+n7DoxecQdRqO9+ElcA6iNyHk7pCddM
	V1LR9sVJk2iiMKbTwmQiA2yD1I6z0u6cXl
X-Received: by 2002:a17:906:cc55:b0:baa:1d9:66ff with SMTP id a640c23a62f3a-bf9373dad65mr128724266b.20.1781018009295;
        Tue, 09 Jun 2026 08:13:29 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Tue,  9 Jun 2026 17:12:05 +0200
Message-ID: <20260609151212.29469-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_081331_274388_703EB0B9 
X-CRM114-Status: GOOD (  13.33  )
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

Permit for PCS driver to define specific operation to torn down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called before .mac_link_down to torn down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 8 ++++++++
 include/linux/phylink.h   | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 65b67c33e12f..38428b375eca 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1036,6 +1036,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1735,6 +1741,8 @@ static void phylink_link_down(struct phylink *pl)
 
 	phylink_deactivate_lpi(pl);
 
+	phylink_pcs_link_down(pl->pcs);
+
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
 	phylink_info(pl, "Link is Down\n");
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index b65f91c78d8c..79a1496fa519 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: torn down link between MAC and PCS.
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
-- 
2.53.0


