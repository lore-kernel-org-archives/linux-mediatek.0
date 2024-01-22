Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E008BC47DD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 18:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpxnwueBq4GNEX/wpNVnMayvbC9rT4Nzqh1oycVmTeU=; b=tw9XOOA9UJ6TD7YRsS6hwUaiWn
	rhrF3KfNqA7jLObh76RBAxtqIrfEo9tPCkLVukvHNHR/va3cFaXE6Q+LLy6vvxsfz25vofKQ1i+zM
	6Hv3BOYUG/9KGSZ1oUZFBVqu8hC7tt2dJEJBtV/f/aNcfSqdIX21BzuFHST1UjoDKB0wWKFJDdK18
	vdP4ibj0CxFjegcRvkv0tHLbYJOfyhnQOxw7zGhw5m1ZsB7DK+HnUcQay58EH4PqNklh+Hwv1Y3V7
	j1CwM/k52Be+jd5AyEh4sjtWM5X25nxOo/39nmQ9J5duSsSEdeKOXTgcfXPoG0zpMU/xj3kWXBFuz
	vufamxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRzJK-00DaZz-2F;
	Mon, 22 Jan 2024 18:46:18 +0000
Received: from mail-lf1-f51.google.com ([209.85.167.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRzJH-00DaXo-0J;
	Mon, 22 Jan 2024 18:46:16 +0000
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50f11e3ba3aso4948608e87.1;
        Mon, 22 Jan 2024 10:46:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705949172; x=1706553972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VpxnwueBq4GNEX/wpNVnMayvbC9rT4Nzqh1oycVmTeU=;
        b=CwtDkSGkdCs7ibx/hHqO7OKf4jAPrTCddWDa5KIvPnytXrtJExh9NeUA1thay7dFdF
         UtZxwTt9N1hvTqpL2ARahRc6mpAOwF2SqCx1jtvdazWs5mrC04fRXxc5cYzCCBB1YJzX
         ZgzmJ3vcO+vekv7fPg4R0TxYtmc0EYXQ6fAeOCnh4cENYj0p2/KcyUn3L4f+ZKG/y3yc
         k7L6Qvb+jeQ5rkfn/i1cJlq22avBsFzaMpT3IBA6l4D+X93Tkjdr+HGstCUa1TdguBjw
         QMbkSDDehg3+5MONjDdO7ZxatrksvfXBQM7mQQpF/slIlwAW7Sv/dAYrZm2lU4A3FB+x
         wuig==
X-Gm-Message-State: AOJu0YwMyTsyzlzZDghgqSZoGB1otUCc5eDLPp888Pbcdp/Sw5XfVZAC
	9els0fH0owXsPG72mUNnlgDbKK3rd1d1tNv8qgUbG2gDbanB6xlG
X-Google-Smtp-Source: AGHT+IFzyQpUAh/B3tFlqvgxnHIp0mSQ2ZOjy0kaRngrxG4UCaG0U5PVBPhvqrnmhorc77PgzQlbWg==
X-Received: by 2002:a05:6512:1082:b0:50e:c845:5be6 with SMTP id j2-20020a056512108200b0050ec8455be6mr2283475lfg.107.1705949172021;
        Mon, 22 Jan 2024 10:46:12 -0800 (PST)
Received: from localhost (fwdproxy-lla-003.fbsv.net. [2a03:2880:30ff:3::face:b00c])
        by smtp.gmail.com with ESMTPSA id w14-20020a170907270e00b00a2b2c1a1b45sm13629218ejk.162.2024.01.22.10.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 10:46:11 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
To: kuba@kernel.org,
	davem@davemloft.net,
	abeni@redhat.com,
	edumazet@google.com,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>
Cc: dsahern@kernel.org,
	weiwan@google.com,
	netdev@vger.kernel.org (open list:LYNX PCS MODULE),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH net-next 03/22] net: fill in MODULE_DESCRIPTION()s for PCS Layer
Date: Mon, 22 Jan 2024 10:45:24 -0800
Message-Id: <20240122184543.2501493-4-leitao@debian.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240122184543.2501493-1-leitao@debian.org>
References: <20240122184543.2501493-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_104615_132225_611BEA5F 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
Add descriptions to the LynxI PCS MediaTek's SoC.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/pcs/pcs-lynx.c      | 1 +
 drivers/net/pcs/pcs-mtk-lynxi.c | 1 +
 drivers/net/pcs/pcs-xpcs.c      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
index dc3962b2aa6b..d51d09beaab3 100644
--- a/drivers/net/pcs/pcs-lynx.c
+++ b/drivers/net/pcs/pcs-lynx.c
@@ -398,4 +398,5 @@ void lynx_pcs_destroy(struct phylink_pcs *pcs)
 }
 EXPORT_SYMBOL(lynx_pcs_destroy);
 
+MODULE_DESCRIPTION("MediaTek SGMII library for Lynx PCS");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index 8501dd365279..4f63abe638c4 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -303,4 +303,5 @@ void mtk_pcs_lynxi_destroy(struct phylink_pcs *pcs)
 }
 EXPORT_SYMBOL(mtk_pcs_lynxi_destroy);
 
+MODULE_DESCRIPTION("MediaTek SGMII library for LynxI");
 MODULE_LICENSE("GPL");
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 31f0beba638a..9c020dd3c766 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1456,4 +1456,5 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
 }
 EXPORT_SYMBOL_GPL(xpcs_create_mdiodev);
 
+MODULE_DESCRIPTION("Synopsys DesignWare XPCS helpers");
 MODULE_LICENSE("GPL v2");
-- 
2.39.3


