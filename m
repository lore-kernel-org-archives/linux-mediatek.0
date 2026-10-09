Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B25CA601F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 18:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fwLKA/eSPxGgl5NTsOgBm1tSgbZmfE7FnoEd9FlDQc=; b=abrN9+ndjWLAmJCuoalVcdPRW+
	ZCuZQkPk6uKh3cU3TRBEROKqhw35qkSnShiEqWrFOCc09wevt/mS6+Yo/bnYudfxLdU9w0Kz1KXwH
	0/BuhIfH4NjLGl/HeR1QHKLshUj3QTqY3rS1NRR9954d9yvoiS/6nQ/FaLhwOOjRR+wefDWPFBsuP
	MwVlTZ0gCXw8diAgchDXwJFAyfod+AWwja1f6YRTuBdK8f83DW4IjFZtxKDRMcQYT7vFLadt3qQIV
	atefhTNfrxL4pgF9TdrXLQaL7kywTSjUUH58q8IBitfL63tracMAteIyQv6BqSe5+/+WaYzxCOu3D
	fjUlK2WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLT-00000006xzq-3lTW;
	Fri, 09 Oct 2026 18:29:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLM-00000006xnO-46qt
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 18:29:22 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48dc202a60eso34481f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 11:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570559; x=1792175359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3fwLKA/eSPxGgl5NTsOgBm1tSgbZmfE7FnoEd9FlDQc=;
        b=UGBuW9zpT2PBpLX+ivXzsBc4qOpTO75XzDtm/vYnv2DlbbDJgqwY6N8ZHmv7A8gKs9
         D0Q8cS90O6euwRd0uHwpmsXDWSwiv254EmEB1jKUtaXk91+mpAHlKgNKtCqDg+kDaFN/
         YKnvbJrjqfwPjTPJ2/vpGIyOLSfF/qno2K8SYuEqrB9JeQYi4CWxO8IvaoMLtDdHXTe2
         r3ZlMa17SnWRijp64DUVtNMDYnZ76U8IpBI1z37JXX6JIFwAVefzkhOcQ+SbPD2uDClt
         A8AMk6CFOhRK3Ddt9rdcsTOeQG5V2kCHmcK4+FJ2seVKy2sNrzjC70h7QFH+SxeGVr1i
         e45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570559; x=1792175359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3fwLKA/eSPxGgl5NTsOgBm1tSgbZmfE7FnoEd9FlDQc=;
        b=R4fv7sCBLUmjQ2sUS4zw8rX2mstgfripnkeke2jO+t5H68wQsMjuC5xeoTtVeThvae
         cdadcuKoUC0o22fCG84O9BkAqTGjgPg4DZSVfqu6UI/mwHD3205ODGOGbXNPLAILzta9
         xx/oUDRWIJuKhTHYof+0APcvMQgHgWb0x28EmcyzBA0MDpxS5bnO5usxDAwetGqGc32U
         wewLrruaIgqnDrCRfd27759PJ/C8ws9L5+oeW0SeooQAtoqD4SjJdNpwtS9lI5LjQuYZ
         9YiuxTz2ae1B36K3lxrjHwDKGxdA62EDVUbBgPnggpM8VSRWWcGlYvPUMAuRJoM7B1gD
         t0qQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8Fdjusp9hJ76RRwuH+4rr2fO4AmL7Ri2s/+P3qB94varucqpDKOJVY6b91u2Tak2kVQYM/R+QT3E/3ONoQg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJJeHFhZV1Iu3ewuc5w0s1qw4t2yKwRMttdXOtUr56Hkp1hKEEd
	oMryRD8rg4MMJGVd8lC9voPyHB10IgxQSLWIKSJ7/ELSv4+wHmgqINnP
X-Gm-Gg: AYBFou0cx5yWtWox5Yg8TR41x58GLyw5YzbEdDyYOpHpR9YNJytCw2I5MxOhNgbHIgh
	ipIQ1nwv12bfjNKVyxVjpj6Fl7zIiky/n9BLYhdV0B5B08fZEUEtoPGcOWpf85Hjx+wrhAaR2DB
	dUeZ87muoFxnItGjYoE6YLewHJvgSJmGpEFr1j4326l1rXy3wC4bYpWX9CqzahJxNgLUV1XeMm1
	nAAa4DPj5mNtM7P10UfnxkfjV19yk/ATQ4zjUtAUL1eVtKV1HeWTgRgnBPftb4KoDkD/Y5q40Ez
	c5T4J1Def/ZPUVZP9f8Ty38H6ATW9NPLD+IJzANk9oKkJWgg4bChJF4TVBtv+Qpm6+G5h3VV0nl
	8BmzFcGgFy5J0Ty/qeK3Djl2FD8QCCDaW6s6ekD4lOic5qjVIOkREZU46hJLhF4S1BjxqzLQ/bW
	gYzhSLWukk24lxu0bP7PvSkPnmNAinu4BZYHMzS0uODoDxm+JHkfQlKWTMqQxH1fri1B68Bbpeu
	SbE3a3axPVTPzafJfu5ySVVeA1mOquW6KvCcJ/JfFfECOjJBirH+hCNuhfPPeNGnMvUBCNRl5K8
	EazchSnO+/k5Ifk7jyde8wGJ5pTN
X-Received: by 2002:a05:6000:4112:b0:48c:7ac7:e59d with SMTP id ffacd0b85a97d-48dbaaefaf5mr4958397f8f.34.1791570559085;
        Fri, 09 Oct 2026 11:29:19 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:17 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Fri,  9 Oct 2026 20:28:05 +0200
Message-ID: <20261009182836.50631-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112921_075740_10930E6F 
X-CRM114-Status: GOOD (  14.22  )
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
index 59283564f72e..28dad1393b69 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -989,6 +989,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1701,6 +1707,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index f06eb8b6f94a..f03c1dc0a4a1 100644
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
2.55.0


