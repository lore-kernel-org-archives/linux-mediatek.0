Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3EAC54FDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2026 10:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyaO/jLnPM53YSkqIOaOcGO+dZK6Ewb3QeITvgnsvkk=; b=Sij4kEOgxuQuPtEie8SN6wAA2+
	S2rHbRCK8O59NkhF68+xoJvDdDhoD23QnAiZrXU1hQvhLoaKyft3VYQBH761dRqSiJaBRk0hcODfm
	Lvf+Nzzmib9DUD1zmPuOptGl0xHT/RSfanNxuVlRhr+MqPUGuCF+rKvS2z8CHxqwocvhjYqQzeBr3
	KFmWxNw79rJl46npZUffkeCfVKvxjr//vGnkrhO0W1t3WNA6nCxFTYF0QuGjSJJiBVjPK3JQ7omMK
	nHucpqjJl7y0p58Sd9TjU1jMpDhTwbvZjWsTWbxWFlmOsd1m/w75UVfUQl9vv5SwykSxnaM1OuCA7
	n6+/YUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNx4-0000000ABk6-06qx;
	Thu, 30 Jul 2026 10:25:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNwl-0000000ABT0-0xsI
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Jul 2026 10:25:04 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49802c418b5so2762875e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2026 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407101; x=1786011901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HyaO/jLnPM53YSkqIOaOcGO+dZK6Ewb3QeITvgnsvkk=;
        b=p8d7PmaCU9piiIZqs0g9hgnm2ODLA4LGlFJtxzpglPrRoFtEcW6jFRyO3w+RYXASss
         05UIvRmZgiudaeIxrrmaw70vsZEfr8LnHncOUaTjyR4BXZUAWYhzUiAu08N+2I7SfWq9
         MC14O/I+bFmil2B46U2tAw8FhwZvDsO9OTLJb+P4oDVkA0Qgg4j/hXLJj2qanJW9HRKz
         juLqM3LBrw/zy1XY1WJDOT250x+CBwWnaQq5eBJ9nxqEgQDsmm8Gbxf6tmw7xEH8lq0Q
         pu5D4iwjY3Nm2q9tHRtPp1uw8207pY3gpkWaVsqViHsA1xbcxiJYxR3wm2OBz269BH9F
         4eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407101; x=1786011901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HyaO/jLnPM53YSkqIOaOcGO+dZK6Ewb3QeITvgnsvkk=;
        b=VYhwXXOxsb/lsuycYUEcIz5TbNc6viu2qnYD30dhiM+A24BZzq3Udj5WhmhOD94vhi
         UEKQoq/GLmqwmbKFvquCHk8yDCi8o+dvscxsJcFcWDEQr0hk3q6d1QyeFpMwia0Ba4qi
         OgpT4BHPcXsNVTJtjg5nXCbZKPv1poCAWk8ix6p9sqsoDoVj/Gj5P3LzhZMID/GFWhM8
         sCU5wD+ta7yjZ9coR4GhVUwIHMQpDMuvFQjjkvCQrz6ODg4G+qhwfk2NIVZu3010XI8Z
         IPSj9Osp75n2D4jF3OxF9K1vmziiqLB+U32WQTIjyNzpK5stdPnukZ+XdhV/JIxP4UhJ
         1Dyg==
X-Forwarded-Encrypted: i=1; AHgh+RpkNTCTy84/zgdRs6/2tBTOztZ4GzmP7WugOZloAEU3NiAE30rqVM9ZJQm9aELqPEVjzCcWyWnOy66AwvwUIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrtw5a/btUpukTH6GR1LqZwKaoNsgItOWZD0rplinkpf3isBeg
	Z8TiZIHIRoPevJjRP/5xOHIxqKMeCAySntfKGimQlvIJoQDfoIhkOI8f2Dqwng==
X-Gm-Gg: AR+sD11wvIeA1r9i0Y9UVHL9UV8LPZcjMZG7mSTGTe3Oi5pD6i5ok7uVh1H1vcaZQV8
	t17dZgTHvHaIZS8hdE9U0hMkHY6LhNP9T98iwX4OimhF/N5JC7PlE6JH3b5+GcbxAEGsHBxRXvP
	Rlj+TZL9FLAlWsivcsCZir1q1ZNnfHWn2xr2dhNsVNSLZH8eysO/csRMPk72B2mpz71COX3m8Sy
	CylOBhLFktJQMwQCbFpitOoSr+7Rv3HPhO9204MzA3MHsoy+gV8EHv02gYETWhmDuA0yMXggDOT
	GiEa9wKK4sCaEYwiKMLlwSukom52E6fP1fpKGmMCXLbFxNxcOcQ/OzcXlRMIN8QycFM7yUU4wbu
	166NuygjY8eZ80ukWhG4EJLV8/hlsdYIHpHsNsEz1PrymM5hpe4NmjUyhs2E90VWpYJAKEGea71
	Y/mWiagBxcL7rvaUcmIfrE29xQcc6c8kJ3BBaN37KeIPHsAWDRGmnpPO5MkCE9tmQIdL0kcvGeN
	c8sgo0xRg1DuZi7XiAe88Ppm8WdpKdFbsCoRFLo2VDrpJj4ZFQnFg==
X-Received: by 2002:a05:600c:41c3:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-49800e7b178mr13191645e9.15.1785407101144;
        Thu, 30 Jul 2026 03:25:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:25:00 -0700 (PDT)
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
Subject: [PATCH net-next v10 03/11] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Thu, 30 Jul 2026 12:24:14 +0200
Message-ID: <20260730102444.1967900-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_032503_526952_C0407E84 
X-CRM114-Status: GOOD (  21.96  )
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
 drivers/net/phy/phylink.c | 60 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a5e2d342a92e..562e09d1838b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,9 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_link_down(struct phylink *pl);
+static void phylink_pcs_poll_stop(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -917,6 +920,63 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
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
+	struct phylink_pcs *pl_pcs;
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
+		pl->old_link_state = false;
+		phylink_pcs_poll_stop(pl);
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
+	list_for_each_entry(pl_pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pl_pcs->supported_interfaces);
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


