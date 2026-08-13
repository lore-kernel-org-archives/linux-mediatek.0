Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761BBC5CFEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 08:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2Ryhc7tn9LqwHTaax5YZtF5C+ZMbKW52Z/rvi3GeNM=; b=sR4GUlA7lrc2xHFn4LG8WsDatX
	Be8eMgS42sHuQRp7/hmSE2zIpjcE0Dg8JArvOqjcHl6sLMFPqnIbr8XlNw9ooo6ESofA3tcptwJaj
	83ILpPSXosLwaToF8C78/3PM6MUQ0PAwyFk70h5WPvvFYsqn1mrHZ/I3qZk3Hw9HfLlrIS9n251D8
	2EYHa9Q0gzjganZQeREcag5OLj8yCI/I39V+3vfNqWUBPIxrEYxSntlywBtjynqBbfDevFoLBZubZ
	j6MnYKCx/LKFkYemfg6JoHNe6v/WnTQTHehZhC123Lo14kLgOBsOddT9mhM7clHx70ruWeNnIjSqf
	8utPUZWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQv6-000000009pA-2GR0;
	Thu, 13 Aug 2026 08:36:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQv3-000000009gN-43TV
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 08:36:11 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4813ea321cdso432400f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Aug 2026 01:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610168; x=1787214968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e2Ryhc7tn9LqwHTaax5YZtF5C+ZMbKW52Z/rvi3GeNM=;
        b=VByrt6o+XibgWmMVgGOJRe7VaiZUuYG/ahYj9VTtmmQioRELiEzg8cspWJEufoz4EK
         5czGwJ2JEvxOmz/uWQSaK8GLmgLIsgwDExHahTJYm8uEMT4GFUoCH7Cre9p77Zfro2PR
         KnSUxrNb3xRzg0p4j0sYdMrR3Dn8Yg7gTKq8OsLAyfYViC7eLvW1Ie8DTK5r+NXmreTJ
         o6rE8NwphNni6FZKGDW7yEEDsQa0rzHnXN7VBjBalgMBcLocxqKZtrW4HnE7RMrqtRHr
         fHdGfwZNKzze9fCh0SStjlIcdtDoWxkIb1yKQwxmGg7p8Ey8X3amfWnAEVwtsB3F58sV
         jI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610168; x=1787214968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e2Ryhc7tn9LqwHTaax5YZtF5C+ZMbKW52Z/rvi3GeNM=;
        b=jHWXr4GuaanuIAH+yq9O3HFlDtP15as4GhodNalm941fon5IzxMQkpEeipVxUo750H
         2IIaC0HvNXCd51l72ZgNqc0EtFb/3zcKOCYkzJs9QxjRf6M+lSUel84wtWoVWxAychjx
         zbTaqQM4KwE1Qu1TrZvjr7KQIK/CP4Szx+Ud3OGnBB1UgJmEXdbTFHYVPrFKy4YPQf6D
         qakpzP6Xgd4iwtA9NV3KYZUV8ShRM6gW0e+v33nLOUnWD8j2bKdc4oQcScALvNl0fSvj
         GmU2H2oBxsSDXSUPdeq7LGuGLuXEUZkPJ+14N8y6bbMef6uzt71EhoZYQleRa3dhsvyN
         Pr/A==
X-Forwarded-Encrypted: i=1; AHgh+RpteM/BFnCpTu+Tq34uTrv8SX8G7I3DVtv4CnxSR34I4Cj+SghmbTmhEWvLyrc0iviyHW9+6DeX8N/yH2s0ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yws2d6T1GPdm2e0i7mhP7Y0o4SYzzl1WpU46k3FT0AtjkY+FIXT
	kOges3oRe0iOODljFITr7PNtR/xD0lAXo+97D9qYvWn/iCcJBOApsaPR
X-Gm-Gg: AR+sD11Gmn6piwc9ELUFQBxsLDqULcj4ZixDxwUxh+Q/CWdN5VRWvNKhubq4HwClA21
	zPeCVW2ZoLPuqWSSFWL3KsLOQyv/7x+evuqSEt5nSrfDDNRKepiDINi4F3uQpKfHgzJYzzvjbOj
	RV8BKTSU/vHRW18P1n1gn3HAXn9a4do1t57CMw23NUF5BysHbV5pfyDPRWhEd70PBNz4R56W/OZ
	An4d3HxUStTg8FpTv485ujapeabyRqB0o5s0WTzAdzf59KJyX1s8g+JB/6DCUMeXi99JqRuw/8v
	iAmJjKLihlsZ+B6Qevz1z5EKu6gRElvTpcjf+/zm3YQCtxpuWIRBzIrf9oczzWVEp5xw5yHMwcU
	fNrxp4LDNSCql0hdAOceh9dRicc5aYFn6jBT2GgCpE2/K1slsAAvlYw8yKtu8t+htg8vTyeRtrx
	dGavOR5kj+1DLqOWvgDFYndHVxwAzyRSbDvlkTR0AoxYn7JpyKi3EODjENX1eaFKn8/5LSrEmDi
	mBQVD0+iKPaZ1cSKkM+TCiE9s9V8+WVaKgOsdYIJbuEjpDN
X-Received: by 2002:a05:600c:4584:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-499821baebamr37440205e9.0.1786610167928;
        Thu, 13 Aug 2026 01:36:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:36:07 -0700 (PDT)
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
Subject: [PATCH v14 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 13 Aug 2026 10:35:14 +0200
Message-ID: <20260813083536.970196-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_013610_058950_8815025C 
X-CRM114-Status: GOOD (  14.20  )
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
index ba3efdb0a194..34dbe89328b1 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -990,6 +990,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
index ca9dfc142388..ea554c0d41f8 100644
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
2.53.0


