Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DE3C982CF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 23:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Co9+GXWgL7GOlvIeLE0GKxOjauA5YSOFLNwGRGVNoM=; b=V1mYc2dbqrCsfe+vCDtgljUAT5
	3L6CTm6UF0zLgvFlZl9byynR+7Yn/i4F919J2MaTY+mxhjgdRC62esC2e7EFUey7JVbE83qytoT0O
	eBjUJ4wDRZxVDOb/zOq+wYx2+tRko7jUNLBQ6aXbyQ7CklKVNzaEQqGhOhHCeGDVdK/1phbqttuHu
	t6e09BYH+sGXV0qpwDgM7bxo+QbU1FDG+wWWSpFaXsXXQ2fuTH4sUOQdzUeZNe7S3TKzHKeSLaD9Q
	Qg+0XwcRtUfwPZWHQikOX4ELf/ocoiX43NSDawPWBf01H0UKCiNmAk8nwZbb/g6q3COYYsWJzVSjv
	XMZaWbeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQW-0000000AGTk-1AJS;
	Wed, 16 Sep 2026 23:52:32 +0000
Received: from mail-wr2-x1a.google.com ([2a00:1450:4864:30::1a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQO-0000000AGLP-2PzG
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 23:52:25 +0000
Received: by mail-wr2-x1a.google.com with SMTP id ffacd0b85a97d-482f6350f88so165932f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 16:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602743; x=1790207543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4Co9+GXWgL7GOlvIeLE0GKxOjauA5YSOFLNwGRGVNoM=;
        b=DJu359wknUdGOQTldlTxn74J8tBNRX2Qr4PwQOVsQ3C73a8tepDM0W4MGK+GQgpLUX
         bMDrPh2b4uNe8qMLzvfG/w/JOo05RCDSv2eZkDFFEJuCmMQ3sCLwuVhUrceHDBA8csr3
         GUgvauu5p1cvwXfcxaS6rUeWntTV3SYDohob/IMmqgn/WWoyDa/weH6nDUByFjyq5//r
         FdYm5myQrzY5L4NExbwunYjlZc40AaN+BirzAniSOpcFUU792d10ZMkCDhWLpisBjt0f
         ioX4lVHNRZwN5qptECIqZNN3mbrijnJBFYKR7PI4/oB434Ks9tqfwGdWnm2uQ9RTsv4K
         jKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602743; x=1790207543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Co9+GXWgL7GOlvIeLE0GKxOjauA5YSOFLNwGRGVNoM=;
        b=cL5vtN287BD5Y0/uTRg8yXW0UdEgJ2soIpxLTGj0Zt87lpYlGj+hS5hNs6R+IG1vwv
         ENQFA50+Mzj25conP8OrQx3fGTzZGjD1ftByoWFNfA2g0zhJrGOmVVwCIz2mJDrLOdz5
         ZBcBp/F+VBlMVXMwV7SX6Rg7ZqYOgeycoLB4PK6YPjGmkdnYmhi3595Ir1U1Q2MHm+UK
         aOf+Sg/U2UOo1EcS/8nVFKW7HB6KPM9QNk0YkV8mA0DSxJXZsj6B2vbPrtgycVpLBgzS
         utzqQ160P0cj4z2l5dWDqH0+wX1LK6UNT1tK+ArSiHTWbFNEA6nN7M94MiHxrez2ZrRc
         ZJiQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9iHs1JwkXMIi40FK2F82moAEk75HlAdK66qv6sjSpP/t5thux2mDlFPsVH9xhsyIQfSFU6mNRyAUrC0Id7g==@lists.infradead.org
X-Gm-Message-State: AFuF++kk8AWUiORNj3lMTNhUbKxG/wfR2ZglA8wq4eWaZ3Y8QEQU9Tg8
	lB7alKQD4LhSv2ju9B8Y8RdNbtjeBTTTxd6c971LfdT19/nLpXQh7TiB
X-Gm-Gg: AYBFou2A83WyXRzMpJR3oYFwwKDN5gSZ2ZewURRQDCikwT0mGqSCUA4XlVUTaohFzQH
	+5ixleqfGz3yzNXK5wIGDxBdzkt9wxCsGpkbo9HXGb4qobbHS4rjROS7BK+0ARNic/d2g5Laa8n
	lKjinrOgYtMuEDAGJNUDgCDRxTLj1l+SFIfVJT1qlgAyHYc9rhfftqgdI7AIT/2MQVcOLOV+2ko
	0p4kQ0dSa3PvLCp1TfzG4+1NtRPiLVb6XnqrDUaagQUc7wn4EgUhI90y748OnsTrI+ZF9Dk2ert
	x0qeX550k7idJMynwJxBsg9X7/Nda58lyipl7H6xD7zBmovt8XdMrkQ7nqm6kCS4CnqsN6XGebc
	qj/F+G2twXltLDpQsxfFQhWeRCVeB/fgTdaekZeI3JW8+RtsHGxJRTsyPOW4XhWCIYip3kfrR5l
	/22+HTIaAITQqkKGlktMrwerEFS3lm3DMV4IZ6k30Ys+OVlQlYmc3wb4ZgIIiCslt+zsZ/PQiaV
	cSNNXZR7WLIXoLFfMadORuO4Nm+IcduJcyLun3WpWqM6vHf3rOdWp6nsqsV5A4=
X-Received: by 2002:a05:6000:2304:b0:487:84:96d7 with SMTP id ffacd0b85a97d-4870d2718ecmr5744113f8f.53.1789602742429;
        Wed, 16 Sep 2026 16:52:22 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:22 -0700 (PDT)
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
Subject: [PATCH net-next v16 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Thu, 17 Sep 2026 01:51:30 +0200
Message-ID: <20260916235200.20712-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_165224_640892_5C5CC096 
X-CRM114-Status: GOOD (  13.80  )
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
index 417d2f1e54b7..473d15789128 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2115,6 +2116,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2199,6 +2201,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2229,6 +2232,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0


