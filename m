Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C16E60A260D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 00:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=41QyJqMT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RgZT1B8Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=; b=41QyJqMTfAmM1L
	mKsQGuMlVOfp+7GugneN6VUQAPYFyMmU9kJT8OfOPBB0Qdes/ZZ0lFGwt2IrKiU5MXNejSWgOuTxU
	TQLg7+3Abq1MtQZrLNlDPp59lj5EmSxcqpl9ymYHSTt2THHPaFd4Zxl6EeKOtUZT5kppKgQup3Xpr
	TmWsKNiFhzse7LS14U76QVe5fLFC4eMKeDCNfD+sSq5hjZ/iKQx2KhnNPV35NkMT1O5EqeK3F5Hr0
	BvsJk6Cn24ZUr16ExhEKdIHmz3jDnQIr5XQajwqvG/Ns+RczfY7gCWE0Ci4kp+onPW8lZaFe60/j0
	qoqhOHWU8INwD2z2am/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDY-0000000BJBo-2ar7;
	Fri, 13 Nov 2026 00:32:36 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDU-0000000BJ7h-29xV
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 00:32:33 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-49a92144733so120696f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 16:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529951; x=1795134751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
        b=RgZT1B8YkOYxbsMJ02M7T+XqZoWX5h+DAP23iXbIdFSH6PAeQTncN8I5ZPjh0Y/xSz
         ZPNsFcIdfxCEFzPcAlhCVulCdFLrBhRlOzj4/4dilyHCfbgwvCKmIP4AjlSUcVEl0J32
         YXRIJbzUbrHj5xZWVyvLKg8aGP/81g3HhnKVgTt/+DPH4eKXj0M6mJKrhiVtoeLFhe1e
         fF9PqCnJo4OernV+0bsH38wgu5melAB28h61QO0i3eV3rw2mCDOr0t4g1SNFxjdM/IqS
         njiNZ2xv2kGkmUWsZSvQbHvrypyjbsGtshQiWTBNuvzIbCDVMW0tYqkFkXa6c67U1I90
         MR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529951; x=1795134751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
        b=Mky8W+QtQbkWzzd5N7B33gY80DQIph/OZd7GGwpl+7oasjHcL3QlDzeBINdNfTe8ek
         TW1MFl1Ba9sXuaXzZfe0RwYSgKDUoYqIM6F0oTTKNVBWkFTyLxqYLS1s9VJx5t/CocHY
         p7VMNRNrC7NbbgfcJpntdKOqxNdRe+THsWFEC91al9FzK094ouuuL4S65voocCRsc9kd
         wxleTfS7Y5Urs3G0HNgS0s6Abr4ox6FBa7tza7fcJDkafW/JPZdONJtBfWzLpo3NAKS6
         TIzHU5DcO++RABY0B0h8/yBU5tGywlC4Xdwy5Ri+o4rYCFXMtHUaEjXm1QpkipWP5ReM
         JjRA==
X-Forwarded-Encrypted: i=1; AL+hErGdg4ho7/DJwiKPaKaGDr6tCjzG559UshXsRZTDXdMsixfCplYwRo8oPd1r2JI9q+DzyTrzc7v4sA5GIfFOzw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+C79N3eONtfh2RENEZiDANkBH1EnPldfDSq5jHRovNa/4LzAtR
	OoCG5w81ZWS7HZ0Nn1yJDauZEpsB8thUqyfyTtaOSvfyeaWlxE54HBfF
X-Gm-Gg: AYBFou0GLFsFMvaa+t/lGH2RSKdFPyesLmn29ts65MPNmDf8UD1jt1Mf+2yrGFxCPj/
	LL4J7lZ0d4AYr+oo1DCbnFppoe97Bf8iKSaivicpWhm73MmMS31nniPvpm7d5O3cnUcA0lEqGzg
	5vWbHPwZ+GS2ei675OewwDfY19yEpboKbQZ6D58z2t7nZo4n9GZjOvZ90x54Zl576ED+J5kYkjk
	87zkQQ8J0IK6ft8bNYPenOySGH0yIOzKLXZzoyX0c7wifkGGTDqLJwn703j0jlRKgjrG9HhxgfW
	B1/6wTc4jvtymcOLx6yBMX9e7ZShEZ88+4xQNYOMTxnkfsrajJhM+//2F3xz1U7aSwl2unDmVv/
	pSkLNV2yLOdDd4VPGK2ecozY4mnAGwOqg48bUk8WQpLOElxQAthQ2L8HIkdj+hdw+U5Hdnf2QbM
	oe3cI3nOagRK62VoiE7vmSzZnZcIQupilg0n8nTv7m5KU0vp2uixm8LDvU9sUd/Dzwe2y4l/Adl
	cZyA+B5wqDGXO6eFbeCemi0ZsxQHY019arREUvmmsahE7OkkMS8kRjb3MytyEY5HYHsAJ+z9i+G
	ltm1qZ5XmLzuJbRD2rPNXR/cJzFV/MPbP7pWE5IdG6kL+vLdgUf3/duPSC79ukSJuPL7buQlkuJ
	PxqJlhvk7ogxuCe69jvolEP7qpmMGPNIIjdeILZUEH0h1yytXxsVTdA==
X-Received: by 2002:a05:6000:402c:b0:491:4e13:fde3 with SMTP id ffacd0b85a97d-49c712ac654mr2019766f8f.13.1794529950823;
        Thu, 12 Nov 2026 16:32:30 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:29 -0800 (PST)
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
Subject: [PATCH net-next v19 02/15] net: phylink: make PCS phylink instance access RCU protected
Date: Fri, 13 Nov 2026 01:31:52 +0100
Message-ID: <20261113003217.197757-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163232_584748_8D7A4C62 
X-CRM114-Status: GOOD (  15.19  )
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

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid memory
can be dereferenced and phylink_link_changed() is called on freed memory.

To address this, make the phylink instance saved in phylink_pcs struct RCU
protected and access it under RCU lock.

Also correctly reset the phylink instance pointer on phylink_destroy() and
syncronyze RCU to catch an execution of phylink_pcs_change().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 5d649903be9e..83620a120f18 100644
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
@@ -1300,10 +1301,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2145,6 +2146,11 @@ void phylink_destroy(struct phylink *pl)
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
@@ -2609,10 +2615,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
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


