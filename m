Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E52606A881
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T71Daiej;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z8uXQTWc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=; b=T71Daiej1o+HWJ
	EEwurDOa6eicJt0xfGCSTSEuQaJ3I3jvJ4s6uGNdobdjqzTq7+IfeLn1t/1wKnT7Fl+68Wlg/mQ5o
	aXVpK+reli+LePph8J+rbyldRPko0oM269jIc9HbYYO7+UoH5jST/SWcn9KOUedaSJkrMKWKaJW2H
	K9/wz8u88yeXIVL0D4PVi7t1iLr+J8lNQsw3D0cAIkM3FLK2N3f+SKULsZdTkFExPv9TS9NJrPWU4
	BiRoqIyTgCImuPuVNJ6I4yj0/Yi+ez3uv6wiu5oyuCk0fnyJJsJIn+TaTGeQ6rDvC3CoQ5IQmXv6P
	pthXMFZ0mmyeOAZLurIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFx-0000000FnZ6-3ajD;
	Sat, 14 Nov 2026 10:45:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFj-0000000Fn1m-3YlL
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Nov 2026 10:45:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so25789825e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 14 Nov 2026 02:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653098; x=1795257898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
        b=z8uXQTWcA2Rv8lyqraHQFv/ILW2d8UVsQXs13bjzpZOIL7XxJdlFqEtQa8YzqS5WP/
         S/U8zb8E7nuiU0mmydxytq/akeWRGIXOs5uLAKjX/1DRFPAz4Qv9y2KgEKmcmYo4afLM
         8JcU6gJhmZV7zyROI2A8J2rk30FdItFnt1eVhD6eiWmbUqFA/SzO6wqibNtry9uCwBkt
         r1c9hyI5BLb1nEwRgGQZaMvtkDhb/HMiLFT+jVzNGJLUUBCibNuBT0/4A05krUa/10cB
         431e99tDfGEnDAl6dWaALmMSjZvZnX+D2+0b+y+q5uW2OXAcSeEXzp6Nh1MZ1bYr/Alx
         5CmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653098; x=1795257898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
        b=qxOtRomGv7RzFNmyw0YE62PXhMXDZ1/ywX8RDYFHMdJ3p5LtbRpuM3qbhgSvHRXj3E
         wUC/mjKPdZNMpcHUROMm/qCHQo/fN5u/95JlC8mdSwOaQI0zr43phc+nBCuNRDLm9xJy
         R4QBRyPJ2yq0nZ6uEcRclGRiastzIdoFl3ZKQEuAsiuXFneXNB8i4Tj5GIv+IiuwcIC6
         mIvPLCjYV2ubP7i2q49Hd7zGof4n9jZ8vHkQ5hc3UCsMkkXu4pwX23w7noBYxv1IqzO+
         B4S6MxF0eJ/x5tXTisaIF0H77rUU6d61p+SsiGP4/t3zcUEX9XxyzsRana4DtvmjNjUT
         vMaw==
X-Forwarded-Encrypted: i=1; AL+hErEar7+ASFtjs8QaF/rYpoYTwYDMT2sWQ1h3aCM3A6xQhu/9ZBTO/nKvBY6gC7JotOPCLn9mx/Ncum/31RovQQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+muI4UdfmXsuHtHBCj1QcQVGX+CfxzWy5drJdjmXO+pzTBdFMX
	0/1s3WfT8coMFoX9/78qUGuzKer6Nz650yQLEuzOk0WXe9vo/wgmw2ch
X-Gm-Gg: AYBFou1LT/AdTnVF2XUvFFQnX2/KOVxXG7uHNczBYmXx04s2s3lmD6lNtZeD3GK9kVS
	eFzcIuWhZ9bWjMz/uDHwa1nqYBLyfvgxbczQBTEoj7UuMGFd7KloH3UXkwLMYKBunP+up0Rtz9N
	uP83R7Pvj17ptN0l6mxz8Oa5xfgfpJHGVHNam/5y7cZ6ETt2NVj2o/MAcxsVTaQxG7uLcSsVLEE
	H+uM1wbv1sXAYrgVN584WJ4Df8QhrL6jwnzmg+yaKXZHQ0k9/D7cj9/R2CClMSCw/w3+A2r/u4y
	Fu96Ij4OixpnaGyw3FhBxPL81bp421j489o7m4BVEpMsVkCdp6xjIiA2zqCJzTXQlIHt8ytgEtN
	VVbgQiU9M7S4iqZiHXSEQnJhLOt15rbK6zwWBZp5GwjVu8hk3eMvZ6+mh/3tGI51F7/q+XxLQ+d
	pmx+T6PyVzheXsBjdVGiBB+yVKU+KsN+vDZoeCmNSnhRL74i3h54BGPYHvU1AfTC0dfHbECCitQ
	kGabq3om465xsas2gKjqQ8Hl7XiNNgjqucV9q+xx6/tgpXUq+MEVgO03R9um5ASlZEtP7Cxtbb1
	aSKQcp0OWRrOD9QSOphcSCwKm7MNgtSSUjDCQzjq9Iiq3ZcSyDecNBLo1cz+qfLOHC3XAwrxARr
	SLzivRLSeEnqVFGUrY4lIp2Z07kAhrEaDCQ==
X-Received: by 2002:a05:600c:34d0:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4bb559f3737mr101333915e9.4.1794653098050;
        Sat, 14 Nov 2026 02:44:58 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:57 -0800 (PST)
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
Subject: [PATCH net-next v20 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Sat, 14 Nov 2026 11:43:51 +0100
Message-ID: <20261114104426.235620-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_024459_925597_34AA0957 
X-CRM114-Status: GOOD (  13.74  )
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
index 2bf7a1ecebd6..11f03f985c2d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1044,6 +1044,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1756,6 +1762,9 @@ static void phylink_link_down(struct phylink *pl)
 
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


