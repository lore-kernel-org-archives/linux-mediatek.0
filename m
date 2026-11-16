Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49792606A32C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 16:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2iKiMxTI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4FQ6w3M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=; b=2iKiMxTIAzW4U1
	DtFze7xhjH/gvSccuqmvwiO9V+3yKjBeiDskOR8qcCcaDWG/fTssbDN5v/5MZ6coTHRqexQWsT2C3
	Mutu9bn+Tc/OJ4Kz7hUJO5YSlcr1To16kHK+QJG0zyP04jum/En3XwbSGC5C7c+mD8Fw6292DCMvH
	kRROQm6aClgYK3AvhBEVANLJZIm+4FKHst7F7plZQZm+DSgvNcZMafkbg7Qye3mlvZP2LP5BnJp/Y
	NHeR040gkvBxSMXRhJitBhNc9qS351jrl/G8+JWMdIrNKTjrZ2N1WD8odXVXMFFLW6fvHaK1/vBCo
	3i7oYJpUSR3wsL/JMQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfm-00000003FxG-3MrH;
	Mon, 16 Nov 2026 16:35:14 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfN-00000003FTZ-11P8
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a210470b49so30393635e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846887; x=1795451687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=C4FQ6w3MyE3ryxPjfAM0Ko2DcSRd777+2Q0HJg1Wko324T8q+yLXQuKIWvW5Cn8si9
         Q8pjtVX5AeLqtRR5Tmpm+fMEqUy1gNUUHJC8yumyY9wsFRSIx6x60i4yUI4ObySbznU5
         PnEYlP+1sz82QIh9hyO5XENHe/JQ/MrC0xzPE84ovVavMvDP9s/muntpmrY0Dv6x3OXF
         k+OxpnXynIlIKTzW83b8OPq3GMCVAy9SzQJeTRZZ4LjiYUzwTC+R0nC33xY34o7/i8Rf
         QjlxPfPiy84gGBW77FinU5+BQeMrNUgV0cSn8eSCWineglWP6clKVMKAI54LCA3hdLs8
         NbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846887; x=1795451687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=SvRkqswwim9obhk2CuwuDAhi0F0vsdjIj2A4ScrqIwfIJH80TzxuboSe00I80qvr5q
         SAdBFW7bZTAt/AeHszs3K9koZkevogAut9auOZxUn98X7VQhDbz4SjNcqKHDZbLc43jJ
         pi4oRfMuKwW1LA7A+NtNPJ5Vt8CYDpXOHk7OJOKzG0nVG7JkhaTV24vZaYxNlY4aaEhP
         xpTtj3mIbSvUrRpa+py3wjs13EuVWX+LajACdpH9vJz/r/O3m+r0Ef925n1/VsYuiRWk
         9ExfPpSIkgpAYFTOf1q7MMdfvPhGVi0k2L+hNocJx2/66+Mj6+e56C1DoYq8nUHKEqj9
         eHJA==
X-Forwarded-Encrypted: i=1; AL+hErEj8vwloAJLr2BaPxD+ZLrApKjbAFoSzxJM7NtMerttLpgOoBiEGJoF2hjMLJN6ikJ5JeRLwpof6qcfgT/ZAA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8crXWCuAoi82wIDv3/49IeU+ghjmi8Zv0nmH6UBnddZ7w6Yass
	b8X8In9cadJsrcRSUtBU+RwYTwshcz2fDcDceEwQI1b4vji4+BLJ/4gh
X-Gm-Gg: AYBFou3EKtJu1gABOGJYSb29NfPSr1iDJ2Bx1+odAzQB/fG0nc76Cy1TUu/vZ/P7z/D
	yYyfz7M2DgKUGIkZ4p4RRpsSxj0YDS4NItSRLIfxKn2dQtvGWGFA8Wtwrw5+tjvRO7rJFxoKMWd
	2yDvZ2ntpddF2L+hIcHFzr8NC3CeR7JRoPJGNEh1PwHjYwB9OtRELJ99S8ei8gbD0PFBtdT0bok
	la42fdntTFZTLZmhzirsbxmod7rTlE2iois89ZzK5CtePX5BNlz9Al9DhGb69utQHASSByxJLeF
	sZTQd/usScXQN57z3RyHweHh79Kp0NK45ZeQzM8Jz3S6Lp9LWgAlZchK56tDamQNJnmSO+1pdhF
	GkD1AxEYBUZUJkPRv9mXkqkC2mux1WNNR7iNP3gbRSzVOYxgU6Qm291VkwohhPsjfczYOi2N99J
	A5xLyPtjGLUL5g1vSwG0D8tcTKY8DTtPN8NfHkjtHp7b1sy+JX2RlOcchfFlVYQABUst5Si47t8
	tel37I8FNv6ee+H6nv519HCknkERaQb1G09N0NZj0sRDMKqQFFWmGQ0+9rSU3oj1UTu6ErhLj/y
	7EgDCaxenqdlkA0nWXungfUlPH8H0TpRZswEtqTDe9sACdXp63XNg2nazYqZozKb01vcn4BYlM+
	ElCqZO3gPwWfD5vukEPQ4Txy68NngPVzotA==
X-Received: by 2002:a05:600c:354a:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4bb55abaedcmr236465685e9.25.1794846887115;
        Mon, 16 Nov 2026 08:34:47 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:46 -0800 (PST)
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
Subject: [PATCH net-next v21 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Mon, 16 Nov 2026 17:33:56 +0100
Message-ID: <20261116163412.551438-14-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_083449_313597_852DC32E 
X-CRM114-Status: GOOD (  14.12  )
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
index 8768d8220a13..bf1c5188131f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1142,6 +1142,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1854,6 +1860,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 418e8bec311d..e8c3f693336a 100644
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


