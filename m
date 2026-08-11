Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5629C5CFC1
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 09:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=; b=BIKWoR08UUlvUdsMFQaD1BFVpF
	PTjzSUJ74a7tXFyoFiZ1xej0y8dtp1/yZuU9L/r+7EgEDRdY3sfCRAV6Nh6I/f2fkr8MBw3F+rzUO
	G73MiFHM5oPsyVdkGw0pfIrWpSdgdFchSQyfz0DWaLVU/+AsFI1lt46UoM2/8/cIOWjy8ewKxaOBK
	E6PInvi5MzetdMkVCbslwGVpGZWBW0Yyjhk6xFAkTxPYKV3tZR9yPmYF5BrZRYlI+C+ai7rU8xICZ
	xduDrqyU3kWv68DMynLXkMvSbw0kF2lYzA408bDFgVdZLuKT+TfQzRLvsQ/GhdldY5OL58Zf2tlSW
	9nunMu3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtinP-0000000DjJo-17p4;
	Tue, 11 Aug 2026 09:29:19 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtinF-0000000Dj98-3oYp
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 09:29:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso294919f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440548; x=1787045348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=dXXgRPdgbWoOP03BellrIJ8LJCpPGRtzuK/WRtOMOovfCHyfPkKRa7j5hFIy6iBLmX
         1cGGZ+46nYJgOcM5XEGwmEx/+8iYNo44VSYO4WT00j7/p1kk5SNPiwzzjabzVmGA48EF
         p0DWwjjM3eI8T7lC8aigQfctjozJooiz+5Yj+2GRppsjC4BVLsi9H55e+/Jd5auw8/tK
         uJ7/mvflC0yJKxtuAYxsUxywobc7FY0l6jF31HqU+2uOM7JwCzTRLuHDDKYW0xZFE5ic
         /ECWVUP5dGOa7mFTKqiZGgZpiB6DB1M5Ov8WMlrQqjSr7l0y/wU3p3WmonAjfohgch1p
         S+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440548; x=1787045348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=l5smZkvpKlIpT4fANUpFaQBiLx2hwoi2F7xNJBknd7eX7PIq07lYvE06zvHehg2T8K
         VhGhbuTUoqA/ul9kTlHUPn5Wew7qAfB0pOlxSqh7AGW5mTVo+JOeJkZWW+6oNLFI97Ve
         Bvhmy/lTc1q0GcITHuSrmTWyPQaPdoHAAd2iJygb6U5eQEkGmcXtPfzIpLQsFMXJRjiR
         sQI+KE4G8B0VkkF+vHkBhvw/vE7HYKVgfQFyvkGwPscP66GGuybJATkWWyG1Yxy+ozDO
         LT3ppwIN3dqBqqyfB0qbpKUl/ecnkieHBMdokHPPJOM9Uh3nkxNqqkAVso67YjvU6Ufm
         h++A==
X-Forwarded-Encrypted: i=1; AHgh+RpH7LRRwCu3WhJCr5N415Hv4vcyCRqnrM5Jvlui2UOVUoo9a6yd/IZwCftem8d2//sCRlueGzrcG2H24qNGAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGfEOVL6GQViKI/+xBbBmZrYGeinBRQdL9XAUEYvkcCF1cfD8U
	i0lm2HeiPWEP93NDyUBEHYavOpG0MAGiUWgBZHadKuHCNBk7R++LcfGm
X-Gm-Gg: AR+sD11lNuKgiqxrutcX3F/eayZsf6fTYV34hGUYcdx1o/Vn5VslnVH5J37W3J3Raof
	TKDEi3W1heSG690qxjI2kPiwaVUdgZpo1gPWDuLMemAHOl8uCpBqVOK+CAaVBHD1tutsmWNWLe/
	qgzOx6SQa7KbX1YrKXDANxvZhpSU1hRqE3oULajPYnx+qzsTiUSM+v92wxhui3ySK3AAxLyMjYs
	ceSe8MTAn5WeocgffPs7mDbYdPxXbiD8Hntbn5VEKNZpkWZP40tqDS/Yrl5Lo3lI+fpuOg/Xyw7
	yKtqEStZSZpKZqSktYKS5owu/0SHtFW0On0kOt/QV1kTkx67QYKcuUj0A7lLqI+nQ7v6w/+qT2o
	guCj/rHGUXDTL9P/EWr22IrzO92ktU+Dy9mzORn9lEgYnH6PSPyx7sGYxWMEJKH5E8AF0Zp3sBj
	0pg6RWbXXK00QtTKKysoZ3cd5E//+C1/NRHj1uI+fLj8MHGtR8gEwD1dYkY7SS+iXr25IKSFeg6
	P/znuv4yORAK+ueDAQ1JiY/D0RAv4qg+n340H3yBFLPlhMjag==
X-Received: by 2002:a05:600c:4695:b0:499:726a:117c with SMTP id 5b1f17b1804b1-49978494f70mr24088285e9.19.1786440547839;
        Tue, 11 Aug 2026 02:29:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:07 -0700 (PDT)
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
Subject: [PATCH net-next v13 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue, 11 Aug 2026 11:28:29 +0200
Message-ID: <20260811092843.673837-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_022910_063783_896D03FD 
X-CRM114-Status: GOOD (  13.90  )
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
index b69050f22717..b9a5cd123775 100644
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


