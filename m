Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4642C5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAXATgTkufRgDBElO/+VP5qlX2m9wHSj0la+spoaFT0=; b=zC8PmGYiVHWhNviRutbUUWGQgn
	SiuCN2XccXOsMQvur7pFTwt2CzRXjRmYomGQELVKWfn3EazqkBPdWuCw0PBO+BlBsY4SPogpHTxdS
	LIv1jHkg6iG3QV4bFsLyD0fssYJgKV3fqK46nYNdjiPGPvALbHs+iitpZfBqtcv+SYG/lcj24/vua
	Hq6DcMStZR6P6Eu/wq2DwEPf3W5RyoY2990TigXEt+DUGTqao6COLWK4FoMbzPTLJ4/xrdVwlW8/r
	SmqQud764XNSYhAXzQ5+3gggrbKP7j0X9vbz94OAzB6G8eBHhMpsOEpvA5aBtoGWNxo3aNtHM49GV
	xC/D1F1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKOa-0000000867F-3zqQ;
	Fri, 07 Aug 2026 13:13:56 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKOC-000000085gP-1dp1
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 13:13:40 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49558ce01afso24293725e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 06:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108410; x=1786713210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DAXATgTkufRgDBElO/+VP5qlX2m9wHSj0la+spoaFT0=;
        b=PSwF1nj7gfjefEiJCRLjMWz8QJmE3M+ckCT3/qpxDgpPL4R5/wlWoLw0pwY0fo/AA1
         EBqm/WMANnX7Y91v0Qae+kESTcje9wcd6wjWg6FFG6s51i8rQlPrjBtAJ4/ipS+B3eXt
         XMhg7wd1Kc9uAmrOZy/p1a4jdSLqjEyM1B3yhI0t5+EC3dq5k+yJxX6DTSOl82WcEb2b
         BUdSIRGyy/gWkwHK08JVHNz/3mV4xssGqz1wQeNGmpPTLN59IVzT1ZT1d3C7fKLnnLeU
         +m72EMkZ88AUWwh8wkfucKNRK0gJPG3w0BO9eMS5kOHA3eidsevcvJ27ktOvbJGVnELM
         D5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108410; x=1786713210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DAXATgTkufRgDBElO/+VP5qlX2m9wHSj0la+spoaFT0=;
        b=dHoWjHXszXMTNP6cdZlJTItwn0icNqFTZJFVoMiXCedFvPNN9fd2s6NGtj8apyoYgD
         N7A+LlLVgQNoHFimabLLhpc16SKmO02YARWVzrg4pZblQ+FR6wqyZwGHcSqJRfpeJhSJ
         4QbKHv8vDQQ9UfgrQKzzJQ7T/UhblyxRCAuLi8/ngJknumy25vX0ud7AY7dV6rSuoyu5
         sxWHNPMOpS/rCFPAS7TesR+LNFUDLh67SnhIZxl3D1btnftOVaJXcsFQlAYSmgsAKxdX
         tISIMuWGGkUr+7WIJ01bYEAUMKXbP2B11EAkYbrisFY+vhAdnHJrWOZVOhiUJ8Ujn8LD
         Q7Ww==
X-Forwarded-Encrypted: i=1; AHgh+Ro5i+YSJcUHIY4WmwljvudvxJJ4BJ3ZHv6A6QMj6crUZbLzY3bG8Po7OBqabEwQIvrAEeQ4dfPwoM5ph7vJXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLQT9YN1g3M6i0rjWFhZO45OR7vfO9YBKbEySKASaQipQZdp3K
	gPQz5bJBjIXTUCPtpaF5spnpN+0GlOWonDxg8QAfEvUckd+LVfiHLIOG
X-Gm-Gg: AR+sD1322uJ7ehCprwlv1rKxW3o8z3iS/6mg9teqZ2IGmZ7S9V13zMdZHcoSmtZ3D3q
	vfhK99peloeCMKHwGx0CR+Y+5dMls/iFOXRurH0VhDdiBmmGEC6B8q+TDLPmnVtfksHVBrC5CNS
	gK/EqKApxkhguZO4fAyS2az9z9xR3EkkfM/CJdiG+QS/ryiqJyiNUy6HTlo23LcPBX3oFjmhcIt
	zdVk9ZUoip3yZDavFUI5TFhjvrLrFkgGCM3VqA9Tz+qDBGF5Gni0+qdUmS7HE6VVHQEkzsCDL6x
	orPfzTK28evRSNWtGJdyqOtDZYU8NWldQuVDPc74Wtw8m6JXNB3JoKM4Mh/irdpMgCFu/9E2GNt
	bdbnL2KdYUcaHhBoUZrhSjx1JCjQ3iRL4sYd2Aq8hnq0viQPIob4LZ5OJi/mwfpuyrAmqXYqjrZ
	poW/za3jg5J+sZEdofWPDaBfyNio4Q67yZY+BGu15ZDZiSXknkqaUlowJ8mXRqQCkwsJM65QC/L
	Pg7fr/6Uo9XT8oaMr2LAza+pCAEqSip+ysfQndfU4yHsJU7MZSnhA==
X-Received: by 2002:a05:600c:19cd:b0:498:519:e660 with SMTP id 5b1f17b1804b1-4994e72f7b6mr296830145e9.4.1786108410336;
        Fri, 07 Aug 2026 06:13:30 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:29 -0700 (PDT)
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
Subject: [PATCH net-next v11 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Fri,  7 Aug 2026 15:12:51 +0200
Message-ID: <20260807131301.192060-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_061333_711808_C42F3973 
X-CRM114-Status: GOOD (  13.92  )
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
index 69d4f6675db0..2e8d11573e3a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -982,6 +982,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1683,6 +1689,9 @@ static void phylink_link_down(struct phylink *pl)
 
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


