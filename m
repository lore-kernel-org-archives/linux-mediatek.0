Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCB2C5AC67
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6xfzqPrssPk1eiQCa0fxb1om8jeBEn9170ILCiYQUo=; b=u8qepmUJ9c3D4BhVLJTD5id50J
	1RWnqWBP006lv6t12N4Qq62bDlmjcDP5EcX4ml7urRXv9y5Ojike0bAu2hOGBTZyihVhuvjXGGyqO
	Ciy1oJTEvx4v7+ZwyMKJuPh04HSWgexkvaSBkjDa4RBOOQXLDkk9zC2hmkay6lH5f0iDb308FEMbN
	9pG3BjG6LXhOeTi808HJi3x6hI+34p+6XdRoRmyL2zLC8kR9U4p906XoVIn4wa5Qg1dMrNDMKhhgE
	8xYTCXnPln2KBu9I1rrFsNBoUsvK00Gzz/HNACXj0NWy0alq+RvoxUhQkUW9N9OuEePQPF+vj0HHQ
	ezPms2/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQuv-000000009YW-2ATt;
	Thu, 13 Aug 2026 08:36:01 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQut-000000009US-10c9
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 08:36:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4980dc26022so4191685e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Aug 2026 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610158; x=1787214958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/6xfzqPrssPk1eiQCa0fxb1om8jeBEn9170ILCiYQUo=;
        b=TZR4LHxiVnPI7WZqPKyMdETEHRpcJxY4egeAj3OM7I1kaEfaV2ZJEWKCbMTVS3ajjt
         7rXJZTrP07hBkUauH7t6Z1YgL/y1qDjF3OiwYMejl9Daj0oMvpB+CNs+hkXquNKtX3Vw
         7fKyIIoA/tGQUbtFxiDkDYUO70gAFuvw6w+qUcNSVDvxED0IcRXcxrQVaENDIGqwEmU8
         MxrshtMx2Kl03YBd6ntrUZOStY6nZQv2pFfNIRLLEEk9ikuR1MOiUxQ1N7w6kTsvokyX
         4RIDnx6mzomdlzYoz1PIKVkgAUmJX8d2CL4XKnFg64EySl/laYZhPmqdvmEsVXbYgn3+
         JGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610158; x=1787214958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/6xfzqPrssPk1eiQCa0fxb1om8jeBEn9170ILCiYQUo=;
        b=GCaCdkFX35Dj+7EgKvsc/+uEnJipOi0sBCahxollQr06GTWgdI0heo55SFizVnGlVX
         OxS7WkkgaqW/8jpqxYQzRRHlYWmfFZBBZxxkfJsfs9F5L40FxoSlwTXYsLgit30DlAb3
         f7Xdl0U1WC3fRIbWnvDsfMAzTNQh5pyKxA5jQliznIiWQUW1Ue5174RYNGt0GC5+glY5
         SXAzJQLJY/J1vz8Hyln+3uJzosnKsf21kVAV6T1z1UYdppKELN1YebEX4hLg9g4xi+45
         yjhMvZGnekVmka7O+JsG0yntGzFLOTrYKJFjzjOuGyJ/2spxj4cqCEzdKtWt1JOPjiab
         Epug==
X-Forwarded-Encrypted: i=1; AHgh+RoYsii7DIkLqFRzrM+zCE4o7y1zibSOhX0qDDEdlovAXH76Z+ON8aCbDxMLchuuyqr3zR26QX8LCHGyqBZFeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyV2MRTk3v9okMn8WC/u5qoPU8plmWegBcoDmSPXEFUwEQxqdSn
	ZU0Y0n0zY/TwOmICykzO1pxYWwPuNt2Dg2lED0bgp2tKgo/i9WAaalLk
X-Gm-Gg: AR+sD123biMJUwuEmfbsSseIgT/xY2zGF41EdikQ9U0GdC7AW+CUQhi7Y4S7nAWy9q3
	ROOHLEhwIO2bAuPpTeQHXpa/Sc7P8yKdBdvn0L093RZtOm2BT20ov2nucrowooERZ0vuhaBA7t+
	3VB9yhftEzBmEXNyVJvbhxGWrdCJZaVJbAvSIgs90gEzuwWIBxws2aI5FHl//I660Xv8obO1/Xh
	RgQRgoPy7kyTM1C2NnwtKuYFCvFvkWypDpY04b2b1aFNOejpMpTImqc4r/3lYcp7fYTSuC06Ou6
	7wk/bLaZDSvOEnB3FeMUipnb8qeAwf31XgbkiB0gplwLcYQgUMwbaQhDfXURXfZGr0b1+L15y2M
	LUU9BhqhULkeWbo/unenYqQOriMQ8RMcdPE8V5n32X+mdKIgXpqy8sKHjcFmycRdaWDonWhgu7y
	3scKWpM/U/6fsRXdIKQOiD93Q8IxKWTf26X4WWc9OwXCs3DNSOwOuBQ9D1ARE+6iO/0ZOUBmIpL
	9LPnKe3ROcP9V+O4vlYJRnMbwOQuSh6m2wrIZhqTyKcbU1k
X-Received: by 2002:a05:600c:3553:b0:499:7ce1:d8a2 with SMTP id 5b1f17b1804b1-499821d1379mr41303605e9.8.1786610157531;
        Thu, 13 Aug 2026 01:35:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:35:57 -0700 (PDT)
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
Subject: [PATCH v14 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Thu, 13 Aug 2026 10:35:09 +0200
Message-ID: <20260813083536.970196-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_013559_349945_9276655F 
X-CRM114-Status: GOOD (  13.78  )
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 6204e3bba16d..82eae20daed0 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -1993,6 +1994,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2077,6 +2079,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2107,6 +2110,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.53.0


