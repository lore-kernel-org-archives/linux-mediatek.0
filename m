Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671DDCD8CAA
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 15:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWYk8ZymB6kHUZKwCJ/zVXargC+wN9U6CkBM8YYghXU=; b=1wvPMXR7aB/y7/hHlo/yonmN7N
	8xp72v89if7BHngxJq16VOX25N4DoAbSs3HzlvzbyibJ6PkrKy2f7Lqte9Zt3vgWVuMxlDc1grUuO
	VKptJ8yUQACJ1EX8UImCPeBXjyDWBBBCY/w8qhsUl9BnSV/5bQXfWByf8CcqeUYSrZRID9ZKhvSV2
	xh1U5PA9btr3fCk9Rpj/ptNCa3iC10BqnNDHOtiXkuytH2EAPOB+JpD6n6FBmhL35nJWGxAkzGJRE
	bvslobiEA/X1vHO5QB5DWHzPKFi0bQak2YtNn4iC5XODueFzwg/t+EcdFsDGxLWyhpvXhvAH74wiD
	ZdLTSPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8h-00000005sCu-0g98;
	Tue, 09 Jun 2026 15:13:15 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8e-00000005s9n-0rgz
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 15:13:13 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-68d232ed3f9so9435396a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2026 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017990; x=1781622790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWYk8ZymB6kHUZKwCJ/zVXargC+wN9U6CkBM8YYghXU=;
        b=OAg4kfz9TlBVFI7Is5peiVzjSkwq9b7w4T4q5Z4W/bmLEF7MVwjy230eKps7wuhp9M
         kayUIYUe66zNQyqpBXHcQvcMPPZT4+FWdJZ/CZlOnJKKpzeoFkgYxMXJxuoZK3pln26/
         c/BnE6HR44xWhb9/uxY0R8hOY4OYiqN0FAdpfmLQYAnB7B88s/AbmI1u9bteeWBfnxuM
         ix/Xmx7QO/krFrlGno6CnH4APvB0G+FIGllDM/GzjgpdlKMtW4TBOpRIDRxrzbXrkFXz
         rR3OS/xXiQ22bSSdOnmxwBLsGrlSI2QmbnW8n3G7/xng/iZz0/8sA+TbJDLOqZS26xAL
         LD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017990; x=1781622790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jWYk8ZymB6kHUZKwCJ/zVXargC+wN9U6CkBM8YYghXU=;
        b=KRZAcvn34TVRLL7pJ0vnVXgYPmVV6O8DtY4NInTd4FwDCuzx5Tx/TU9w3IyakcVEMh
         HM+CC/M8rhRXR3D4yuZbNthU6sCm+gg8/xJfZUQCA0dyNT/V4IMivh9eXiCn//6+hQ6e
         DZzXGSivtUJE0QyURv18MoaS2fzzh4lDxKPijhh8mvxkv1ADwMbQvSl/Ve/Uri5MT+Yj
         +dngs9gxDfAPQWhMna9T2LNFzywuqTQFxv5Fe/euhO9fbQkhwBR6rYnkWf2iczay1dgU
         cuZdYl2LAkBW98GVhjfyeWazztBv1n/LcE7/hC8olojFHSw/swaljUEjkgOjEt48UNu3
         Wffw==
X-Forwarded-Encrypted: i=1; AFNElJ/NhBN9+r4IElDDewoNPH54NqjXSLJAjRGF7rwOdh/lwkkx4m1teliOACtLDoHyvZLMvstsYQed5AzQOeAE1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTbwER0y7VLzkCmT73WfWmG8aOGCoOSZiA7LEv36gMjOIP6FVR
	VlsWRAXL9/bVONhpfGlvsv9DFOOW983vZJBGNzlt7L9kHGXm0zVSmypW
X-Gm-Gg: Acq92OFcNlF0RB8GhKQme0d7kM/CwzWoXLLv6rdUQV/T9MbDzyvHYbiV4Fg5fy9V/uP
	dFf+qmCq2vl/YdePntKCqWWOlJrDnxR6/Hrt64aiNIeOgj4UfwiwWalRAiyhdp44QL+inwoAn7W
	vc0/2cOiyBLtkFVoK8mjRnGjGoxC3WZ1NGvEN+3vKlU9X5ba8se2xgxwnh6rAnnd9qeH4NOBbgR
	iMcUy6WpPPL1DwF9FV8Z8DmeKhn56m2FoEiFG9+IjFJNDn6iIwKOuljBYMGmMIelu7Cv9YX/JtY
	YMyS+kYo8LVTSKOZk4K8wb9T913Gba2bRjlU5ekePv7dAxxWSJMKnHttCF47gAjgGDhVD4WLJnw
	D0e2SrjF6Q8gudpLl/w39a7+YXSysRQXSNDj4nUXYxuajb6/mp3aR0aLmphFnYOfsiUidQKVprj
	vG5uPBO7IJ2DvLHgnxhzUEWaqyYD1Oiong
X-Received: by 2002:a17:907:989:b0:bed:25a6:1c89 with SMTP id a640c23a62f3a-bf373407e0amr1077762866b.25.1781017990067;
        Tue, 09 Jun 2026 08:13:10 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:09 -0700 (PDT)
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
Subject: [PATCH net-next v6 03/12] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Tue,  9 Jun 2026 17:11:59 +0200
Message-ID: <20260609151212.29469-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_081312_675828_AE0FA1A6 
X-CRM114-Status: GOOD (  20.48  )
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
the interface (even if it didn't change) is also added.
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 49 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 4d6ffda0cdd6..b45bee927300 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -923,6 +923,55 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
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
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	/* Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case,
+	 * force phylink resolve to reconfigure the interface
+	 * mode and set the phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		mutex_lock(&pl->state_mutex);
+
+		pl->force_major_config = true;
+		pl->pcs = NULL;
+
+		mutex_unlock(&pl->state_mutex);
+	}
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
index 3387d308c4ad..b65f91c78d8c 100644
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


