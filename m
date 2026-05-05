Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFB7FF8855
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 18:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+otCYoEYq8tITJGMUn5AwoyVWpaSds7MSzdEdQ+mkI=; b=ntkA1JC8w0s2bJd05eMqDmoMPr
	vaETJTc0UlzoLlcUeJP8XTUNegaf4BGUu791m0smrd2EPihcrVW4PAAf6GkEtcgnMN5FJEjAdex1I
	4bP14HGVMuNpD3sKroyKzD1L4BBaqj7SK/6cJ3wkHjc+8mYb4QyEuaDAwpExrTwC34M1IWDCgo3Rt
	BhQM5BEiVWnNWbD3ZCgc2hr6lD4Fg/MTMbuewp4wkrBZcF6MSvm7aqSOeO4DHPwv24qtpVk0/DI72
	CDYm14UX9xBc4J6fR8dWXNMkCyW8KhLsH0shFtsO1uK4YDPmnyMmv9Mf498GBvLeosbLV6cW6dKJU
	30iHwFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUi-0000000HAZS-3Vl9;
	Tue, 05 May 2026 18:27:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUf-0000000HARt-0Isq
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 18:27:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so80643275e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 11:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005659; x=1778610459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+otCYoEYq8tITJGMUn5AwoyVWpaSds7MSzdEdQ+mkI=;
        b=J+zFMvgm233ffTbqlhDSmJmTu0CY5XSU0niMCqBmo7Ihy9COlyrGZboNUY1nZVcwjy
         3IXoZoIttqP06BkJn0JE+v3cbGrY4bipWMae6/9eSRPLggX/08OUwo/PpMp+GepcQTVQ
         NCbGtTEOKWtK3+oFhmyOozSZUKduE8zA8Nx27RHWdf5bV1ZBtG55WHcHNbE+tZxMXGC8
         0P4hXyq5AJG64NiSSJmR8rXai3XfmaDm4Ym+6QO9cPJYiHnxIgpPjS2FY0Ze78y6qgof
         KG8wqEf++4Id5jNTSklOqbd03aFxp6ykIsbJXGpuQs6rZ4u0X8R3t4M8liZPZhutYQQu
         yoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005659; x=1778610459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B+otCYoEYq8tITJGMUn5AwoyVWpaSds7MSzdEdQ+mkI=;
        b=LY83ySbcgk39w3OEx9TW4I5A/Hhq92UOxgCpDFgLjbToPLW32gAJr9NxGPi91FV1AM
         z+TF2nROrxPDt9nD+/VqC5rQxREUj0qwiC1MCoIaEEh8rPdozkqzu/sx1m586SWcmXUV
         TRYUAcw3mrgpP+deiWVnyPzKa1VRCvxlKmUhEAhG7VypWhV9NYoedgTW83hOYpL84+R1
         2LqnvIOVE7x41+xjQbUFK6ERBf5RiPTNpUNNYYLSeU20GpfgXWKSHCH2of4ABk4yK/iu
         oaqrUZ18+p56szwMuK5cnbK22AFPsDNnHmXU6eWl8rljWMXaK2HIRYB5xznKX85t5PQZ
         BU8w==
X-Forwarded-Encrypted: i=1; AFNElJ/k7/uC7NO0GcZ6swJbytxhgTtQbiGblttwlsRl01hRk8aLznb7DTJPOSRDNNNQ3S9J6hutAnN8TZ00unVHpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwI9nEZfVq04o/XOf/w3otF7A3jq8r+zHUEq2CxgX6Lw645M3WN
	bTbk+q2nVpoKsswdNBfNNkYeSXAUqwkyJATH6yjt8uK3xxkNaqfdtchT
X-Gm-Gg: AeBDieu/rkg05RtZVUDJsIhVLADgb/ctywaUof2CTkJPVRv3ru/9zFRsNn4UXfo7RDB
	8NBMVShl4/uhmzGGQFzzkHJ8ysAfmogDPHe0l8iRFArusT3vBWvkh6pW8SweXkcwPd3M8lqWE9t
	QhqomxADfAtyUi7Twvn28hhk40bKy/Z0ym7GHFwzy+bEFcc+hqI/vuNWmZX6+m0ThXXuYnluSef
	YfXS300BlCGrqKs3XP6VEUUym2OMMoGIuUnE4MrVixzLw8NfAzHrIK+h0F1bAKTmxYHPkBIyQLm
	f3lzDnadvTc1eH1tw7m16XOgmr8SgvblgEsag4lfSuwb35LUTrHDvny+qP8BVTJFOUtV6gE693m
	ut6YORIIBFNBTNLjPu4ViLrx/ArMnezX3bh3hry4xr4ocPwpmh6u2xh3qf6n3bhZeFADB0HlOJt
	/mlrdDzwcw2PyciYhGnsMxYjemwUgxQOX8vhephwG2ByHp0A3Uv5FpGo6k9y+HPPeqKz8+4mY/Q
	dfk+UM=
X-Received: by 2002:a05:600c:4f53:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48e51f42798mr6028415e9.14.1778005659102;
        Tue, 05 May 2026 11:27:39 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 07/10] net: phylink: add .pcs_link_down PCS OP
Date: Tue,  5 May 2026 20:27:08 +0200
Message-ID: <20260505182713.27644-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112741_134965_17B07EFE 
X-CRM114-Status: GOOD (  13.36  )
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

Permit for PCS driver to define specific operation to torn down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called before .mac_link_down to torn down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 8 ++++++++
 include/linux/phylink.h   | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 4ef31bb4eb05..ef2306840c5b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1036,6 +1036,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1735,6 +1741,8 @@ static void phylink_link_down(struct phylink *pl)
 
 	phylink_deactivate_lpi(pl);
 
+	phylink_pcs_link_down(pl->pcs);
+
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
 	phylink_info(pl, "Link is Down\n");
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index aef4a4fcf6e5..aefdca01b77b 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -523,6 +523,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: torn down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -550,6 +551,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
-- 
2.53.0


