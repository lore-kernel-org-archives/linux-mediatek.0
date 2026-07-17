Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05A9C4450F
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 06:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G19VSnYnZsX2bhJ6fGMWN3T5ZdGh6Kgv7ZnCXAAQInk=; b=VOfVGuC/1DCFxLodwvJeA8jN9K
	kXuE/k7Uu8iEN5ja6AmFDjiWEPRru7frLFx173w4gnFIKozCgGUvht0hKrHnOSInwNjxCJ7y/sE55
	p+YjpUkbZ2Vzogug4NuNRakjfKluyXbePVeOrwd/t5kvtlkZYWL29GNW0GcmxGY80WEu9tRQv/bNk
	+6Biy+sPOJYns+DRYEIS54mOisrxSsv01oq7tE7JRSAe3UwlFLmDNn7IikhF9Fvvy3zcCG5cd1Ee9
	Cjw1jfu5aroJOufANcO3ErU4J0ptEIlzbOiou+C710eMdHPHTvI9NM0m0gZtRij1iWtEpBGwtkPUk
	SSwr2uHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTk-00000001JdP-2XnI;
	Fri, 17 Jul 2026 06:55:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTb-00000001JSK-2Ney
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 06:55:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so202665e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 23:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271314; x=1784876114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G19VSnYnZsX2bhJ6fGMWN3T5ZdGh6Kgv7ZnCXAAQInk=;
        b=RTjc7t39/mdEu0BoShGY8m7l/ALc9iP5d/uUQa7WEPD2VYA+njIjdrDfmcNbqTIyet
         Pv35S4JtIe6N/cPZHZbSjd+omOKC2Q6C/8I9y6ZcGOz5LQrJpnNya0Kn2nXeSOCBWMpc
         SvgkJLPBzjhj0UjY/67njKAYFXxjc8PUSWx7DSB7/0K1/1QxkQePUsYfoSlmfHR9i5Wo
         1y+wQnncZH0GDmOXL39CIuzOOvjW4VZVUpBCGAxTueRNSvgSPEUapaMsSs9efVA9tV//
         2pmX+tJVAA7QOyIshjw+0McCpM/HhNrRWwgP09imqfSs3FXifvJKO4qp/iWNWkCshOhA
         Jmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271314; x=1784876114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G19VSnYnZsX2bhJ6fGMWN3T5ZdGh6Kgv7ZnCXAAQInk=;
        b=WsZc08m1cYRhdXdlEW5GF7GtorokENk84u8ur5Jv42Jl2VOaYFPWYJF3CfMT6nzeCJ
         0cBpC8WfCw1GZOysSMaTUTmRBQxxtgkmt2TMWj6cW1FDNfERnIn9VkCLwmv+N9aSF9zT
         fSzgJGioYxv3jimJIKqO6ni15ujP6FzPIyfnOQMW4VgP5QtUpRlToQmzZMecOzHvkD9E
         uo6jXD9+XLwK9vzShka4FCF5NszvQVeB13hKkpX7g3E/cWwitKNrFbJbmQjc7A+jBvRA
         rMDEt4XWPxOhLyiJoDtZpuBmFVqODQQvG+2pQEAZu4QSsv9pskeSLe2u3cfDZQr6B5im
         C3kg==
X-Forwarded-Encrypted: i=1; AHgh+RpknZ/2P5Xw6Vb5inmbHX/1yzKKr8MzVkyzH399VvuOve204ebewvY9jlH4mc2GiGK2YbUhAawf4eyUReYQTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwGXSMMISDhzpxkP8SreRqMHjTwI5Utgo0l0HBqMb0Qnig1NNE
	8pfQlZk2I55lKBOKdd0BlDmKOGS2TEcPe2xCJe88TGrdFh574q55frnJ
X-Gm-Gg: AfdE7cmxTK5HnL8wfBCtdO+w/BS9ComiDbywmSISR8eCnQL1t8U+YDbLZXunlt3PucC
	TfeLHK+PA75z+yyxxju1Zt0NeAm1WqcDnXt+WodyJ40WLGBrafQ0JdmyOa3GuGff9ARGpdTJ3xq
	Ucqj2gS9J4b4X7hRG5WpPynOPzZ4sfRu+ATZsAJzHjlPZVJGQiuf69Es4SjjLXzelHAOdubrEKW
	BJXcPsbvAIYKVBCObfS2ZKIvQa9ncjyhDExmvP/11Hu0AOrYyvGctVPd9DXjgKCzmT4JHRp4TSf
	/7InudCxkuYeIvNp4Er7lm1qJFt3Ngrcr8y6jWOEwAnmNl7G8ikpj1+k/gSdB9qZYjAd99DYzU3
	Pp5ilcgvl9khWUWjdcBYqF6ffjHYUZB0nwKjeZje1zHd6mkq2sd+t6risPa4NcAtKVWMOEGKEe2
	Kfojhw4gKf8d5GtYgBy+Lay7z4zOFLCJYqphPDEPEOlexowf78CcKQS/cFGlMaZLDoq3H0XvzIW
	tTd5ZDg
X-Received: by 2002:a05:600c:5253:b0:495:473b:f439 with SMTP id 5b1f17b1804b1-4954a3ec6b6mr11503595e9.3.1784271313573;
        Thu, 16 Jul 2026 23:55:13 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:13 -0700 (PDT)
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
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 03/12] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Fri, 17 Jul 2026 08:54:03 +0200
Message-ID: <20260717065448.1498335-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235515_630616_34AB64F7 
X-CRM114-Status: GOOD (  21.37  )
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

Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

On calling phylink_release_pcs(), the PCS will be removed from the
phylink internal PCS list and the phylink supported_interfaces value is
reparsed with the remaining PCS interfaces.

Also a phylink resolve is triggered to handle the PCS removal.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change).
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 56 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 58 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index d96941d4c523..986e0c1e3d67 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_link_down(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -917,6 +919,60 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
 	}
 }
 
+/**
+ * phylink_release_pcs - Removes a PCS from the phylink PCS available list
+ * @pcs: a pointer to the phylink_pcs struct to be released
+ *
+ * This function release a PCS from the phylink PCS available list if
+ * actually in use. It also refreshes the supported interfaces of the
+ * phylink instance by copying the supported interfaces from the phylink
+ * conf and merging the supported interfaces of the remaining available PCS
+ * in the list and trigger a resolve.
+ */
+void phylink_release_pcs(struct phylink_pcs *pcs)
+{
+	struct phylink *pl;
+
+	ASSERT_RTNL();
+
+	pl = pcs->phylink;
+	if (!pl)
+		return;
+
+	mutex_lock(&pl->state_mutex);
+
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	/*
+	 * Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case, tear down
+	 * the link, force phylink resolve to reconfigure the
+	 * interface mode, disable the current PCS and set the
+	 * phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		phylink_link_down(pl);
+		phylink_pcs_disable(pl->pcs);
+
+		pl->force_major_config = true;
+		pl->pcs = NULL;
+	}
+
+	mutex_unlock(&pl->state_mutex);
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	phylink_run_resolve(pl);
+}
+EXPORT_SYMBOL_GPL(phylink_release_pcs);
+
 static unsigned int phylink_pcs_inband_caps(struct phylink_pcs *pcs,
 				    phy_interface_t interface)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index ca9dfc142388..15e6b1a39dfe 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -751,6 +751,8 @@ void phylink_disconnect_phy(struct phylink *);
 int phylink_set_fixed_link(struct phylink *,
 			   const struct phylink_link_state *);
 
+void phylink_release_pcs(struct phylink_pcs *pcs);
+
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
-- 
2.53.0


