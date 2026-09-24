Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF4DC98326
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 23:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRQDcfp704v7y9W9giZQnIbIP3wKdXktBztj3wl4XLo=; b=eciFnYvOeLUkwqpl4yzduMYIcN
	I9s/5q8LPYXbBwh14gcs3rBT8h/BUGIpfr9Tr9d113mKUdqE/cFXJzSWv3P9tMc61mmzVXs3rzAFK
	tspgOe2/VXlCSz2i43xgx5ewOu8Dxs8EptTnzRekg2ktd+W0kxgGav/40C3z/CRhDWW4ri1CjD107
	NIx2Th7jowrn362z9LLQyvB0eexxjlfPl6LN2qQ2bxrUwa8jrTPvkgQEE7wVHOyotull9NoqDVikE
	jFhEgzA69hMFYa5dPBLoZicwd2PWFvrk4yl65qQjbdYNVcuBvq3oU5l9h+O4J253r4g2gVxm20+PG
	9XvIC4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sSw-0000000CLp7-0AJi;
	Thu, 24 Sep 2026 23:02:58 +0000
Received: from mail-wm2-f13.google.com ([74.125.225.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sSp-0000000CLbD-0t9J
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Sep 2026 23:02:52 +0000
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso1619885e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 16:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290969; x=1790895769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TRQDcfp704v7y9W9giZQnIbIP3wKdXktBztj3wl4XLo=;
        b=RzrsK8VZrbElQ9jclx0UYDxvtJxNhO6zmcJr4+koHaObuYQNR1AKTzy4OI+3u2ARcf
         ZA1U81/1AjPCKL2vwpvsDTC/sH6LKZTHTsrEKt/vz+IB3pgDX0lnicVl5VI8OBfYwsUB
         BMo3aVSIzthx41IajZ/rEzinBAFynCydMIaYnIEAxqqX+c4ezzTsMOpAOAqrXhQJ60na
         L1uk4NT1AQejeWqZnmPe+L7pyClECLoGZDTkbbdWme5MhHIXyhvQdgTeWKYgsLxN+kAk
         yt0B+QmoYruzXZ3diFSElINeVT98mfmvOnRry9W8ZZx60D+MZP4kHagd91Gj0nq18Mfi
         L6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290969; x=1790895769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TRQDcfp704v7y9W9giZQnIbIP3wKdXktBztj3wl4XLo=;
        b=G3F2Qjz8k7nYkMacQOZ9AwOytynvF403W7KGsoLM41L7f5TdkJwhzXrJkCUrS7rJJ+
         UOpdTovJgAOAat9VX0EgTE0Qpqni0J0mbqTkF+wwOKonLoYlPN2SNn1l8OyxO7iwrsoM
         84UfHhYgVtpDkgQ6goavn+jMd+ecl9wEbJJbjb/XBbQS64G2S3FTEWh/hiKc1hPvgXbf
         eHpRHyzTF8vGghUOennewUy2oSo8SpLdVH+qMXiuDTxhosOJxCy7iyme/lexOe/FaBGE
         tkJtbtf3bUa/xn/zdSAqREBKJSVmR3CxZgOvLSzYsOQiIauJ0PDVMss0aBWcosJzrnBA
         FFKA==
X-Forwarded-Encrypted: i=1; AKwUvBwC6pqBbRiFMA3JpXtVzQSv37s8S6TGn1A4p0oZVNWDrYo6f5+VUlhjhrhqZ3qearssFf4k9Q2O7U48/PMlAw==@lists.infradead.org
X-Gm-Message-State: AFuF++ngMzbVAV5VCKoo/xed0w2Kk6J8WK6BQ8/9hfJFfOSlj5ODm79O
	RuYYq2SGwxzOSAwTfibO6o5Ms5kFE22fIaSt0mw6V+j/0lYODL+Pjtot
X-Gm-Gg: AYBFou3ghixVNI6Yjv/MYrNZZg1eKABdbjZuZhxLhi/AYfLv6zi3WA58lVLv1Sae/K9
	0NGP9ZKAvwQ79zTPYRE2/lKPGv3bglaHkVTekZpoB+5LqatUrdyzevMCjAl+RO6APmRxDn0ZhNj
	Jk+Z0A28L2NKQ8FjWCbVfLWmpd2pWqrvkutYIgQiV4VSDQAPJDmf/KidXXDV4kf599tnmDfJTPp
	Q3L0iipQsnZBB3YiBZNMHCr4O63MVNdiVvh2Qkjht/wzJ9i6UJ1qBYch4n44T0KzLTDkdkjg1iv
	Li+c41xlddXs+ajQUXjPng7G2e2d0IA1U2YNFgWwmi4KnGu0bZSdfOln/qzCrHCyq+zxcq0HdRD
	TZAR5V6oicphyDs2iNTRdRJCJ2/T/QjkBk0mLFa72cxxJGe6NPQMpxTyoxTpHS/w+YZtYmWy/iF
	p37tv9CvpcdeKKwuuQqc9ePvQ6qRbteCW+08M7ZRh3cBi4Qyl741TBcMY12hGKDsrzPNiWWYwoD
	fW6pkFFRo+VzV1mGhivpTJiytzt36nCt4/gk9avQYcjR8nDJklOSDrH/spRPSq6
X-Received: by 2002:a05:600c:4f4f:b0:49e:69f8:e846 with SMTP id 5b1f17b1804b1-49fe66cbb70mr75087625e9.9.1790290968884;
        Thu, 24 Sep 2026 16:02:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:48 -0700 (PDT)
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
Subject: [PATCH net-next v17 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Fri, 25 Sep 2026 01:01:50 +0200
Message-ID: <20260924230211.11519-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924230211.11519-1-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_160251_279135_CB8530AC 
X-CRM114-Status: GOOD (  14.50  )
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
index b87655a09df8..fab55e6ed507 100644
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


