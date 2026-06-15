Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D1ECD98E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 12:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nO+Qv6/pUZm+9zWLiB9BZPBet5FYSX8BuSSJgUbckJA=; b=tRy9heOCPw+k4vNYtymEUOHJyv
	HlS7JvqBjBFCtihX6deWEj7piqYpXCQd0Uh5TAATGgYsj7HUsEsCIBcpMoOyXH/6rhY2zgDIm/TWu
	IFMkqM2CLkbt52vnFj+3vQA3bgDss/f0MwOxPzfg212PeFmzv2bXk0TdyGFz0HniO+U9bIBe4xdsB
	U+f+nUOeW7NeZjwk4cy44rNGD65LuFWleZKieIOntHTx2DlHCMXokDVK8e3ToFhxEBdPitpz04Kqh
	NGbnmQhz4BEAkIqp7vxBEFX4a2cH0UPuGoYzt68q9kOZAy8JESEIP9rdsrTLnO47uG6bz0ooU2yRz
	ixjDgs8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6T7-0000000EBqS-0b8A;
	Mon, 15 Jun 2026 12:31:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Sq-0000000EBY9-2vBa
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 12:30:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490c1915793so29038645e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526651; x=1782131451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nO+Qv6/pUZm+9zWLiB9BZPBet5FYSX8BuSSJgUbckJA=;
        b=cQmCC2W2CyqwbQFGcLs2jougsWrnsjWWB0ZkwIfCzCEJNb9SBLyJCo3OOnyuc0R0rQ
         sqbciFSkkRK372rsed/z/rj019HhFnJm5H6K1ajbUx4oyW9docR/jv6Aep8zd20Abwqd
         x60LDMOntlVUy6e9qsPA3DlKJGkc4Be2gGA/+S9REJGHa8GRfoXMSojJERfjrGgkFCrL
         17AKth2/kfuvKIauwxbI7L4iPK1ZKwYFWBnWtty5CHQET5z4zYbApa1nWROjjk45VHWA
         AjwiKOOU14uVcOA9WstNMvC16UQtHTyV5MufWdUOHAgWfrE9JxzYQuN1fEq9G/+4E0BG
         as0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526651; x=1782131451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nO+Qv6/pUZm+9zWLiB9BZPBet5FYSX8BuSSJgUbckJA=;
        b=XA9rU7yJmG6nb3rTkTlr7ijkPLTBJltEws6p/7fYT6uOC8AugjbiDzIpuZuVJS2a3r
         flMA/1RbLhb7Jgs39utWPimaeN93Q6UMgNcxtbGi1XKjZDSVJAzFhG/Kc3/oXCSvG/MC
         BZa2R41SCCDrQ/42n66YwssQM6ADykzSLBrBjNQof9SX7spigzAseKytQ34GYASLVO1E
         V9ifvM2HUtX1GdWOW3Rqu41XNOIW0VWoP5/XlSw7teYlj+MAP7m5C55+DnOabD3aa3uh
         txqgseSOlkBJ73+SJXxMlMSDsK1r9cB2jFh3BK1bIbaZPLoorko/Rmku+xXCKUORrs23
         12Qg==
X-Forwarded-Encrypted: i=1; AFNElJ8FPHGGjrT6OKj5lsmcZV3zRIDGNukqTV4eYMLYxr/G4pmfxCj25AffaZMg1KR6fOGuMbo2fS46TYOmvUb38g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI7xb6CV/RP7lf9+QqniB9bKbRsndFp5Ji2km3/n8V5LJyYCrJ
	FP8aGlHrs9/7HE0Rw8R9POfmLUpUANKah9b8bhjgJFoPHr8+Asxr8sne
X-Gm-Gg: Acq92OHr8mXxYl5IB/4SMqZFBPBAqI8sYiVR9cvUgPeN6rbGSH0nedZqcA9yyu5vMNX
	9AXTOSVYV7K4zBYoAYC1K9ianx6LFHoSxcAS5Fgij7kQ0wgpGP0TUIwEQtB8gU4zlok9oeWiwR1
	uIIQRE8M1k2ioLnwRPFXBkYEcjlwPTIB5UJrMD3Nbx56bihvOPPg+i6qfBGY5QEiFsmPVj70bLs
	d9FOO2B9d4sNh2LV725FI/OQ/Pz+CaLLqeD5j/I/jMoR8xZ906eXJdWbGZIgiy7tjE45bI8kwme
	x2vasJHbapO0InPqxmyES9FzLedN8IvQOGB/hjCjKb8dDCQbLe3hwkKz6G7JfuqrWbIv5riZC7J
	W77w7KArPlSOhQKI/zP6eOuDMysWBzcRroIRlfH01BhHlVJ9VVLffekDn/dX6BRIfK1F3Kx5qui
	F7rMI9okXTu+4fjld6cQ8Xzv54CpXtkPqBgHKnEA+NVEKJ5hjc3N95OAM=
X-Received: by 2002:a05:600c:4f83:b0:492:2c87:3d34 with SMTP id 5b1f17b1804b1-4922c874027mr31192735e9.15.1781526650826;
        Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
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
Subject: [PATCH net-next v7 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Mon, 15 Jun 2026 14:29:45 +0200
Message-ID: <20260615122950.22281-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053053_013499_D9A52DE5 
X-CRM114-Status: GOOD (  13.32  )
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
---
 drivers/net/phy/phylink.c | 9 +++++++++
 include/linux/phylink.h   | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0734c98498a9..1bedac517d21 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1035,6 +1035,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1736,6 +1742,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 15e6b1a39dfe..eb6c6ca34147 100644
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
-- 
2.53.0


