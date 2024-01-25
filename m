Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0F0C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 19:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjqvkLmk8VDSM4lbemx7hZHtV6yp8+TOJnRN6X8CIwM=; b=mtgGs2HhvH0M+M3YDTroaN7h9j
	gQUkuHGuEukNEtDgzaU1T0jD4PtBNu7G27xKHgWfOXfk8oHFWbYQWIhilk6OTi/nDfwznx6cgEP36
	WOlfIltiV3A1hcE2/0qgmvygv1HgUfQ7OACMrEdlL93QWHKlbSjyZYu11Zu85HMivZOQm44LwsQVw
	VBN6J87c9ALx5XkwcJ8ZH4p/hNtWDc3J36MboMMK6z8a7KF7RjsQnC5UKFuzMnR8NLDqpcNk8lu1t
	HY3Z8k+DU4Cu72m9vZYicC9XdiZ5UuJyfA3mX3IwxriI7tdTsD4/NXCdPJnGqXhoVlTVrbCm++Rfh
	tXJBTntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5Wp-00000001aWh-0BL8;
	Thu, 25 Jan 2024 19:36:47 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT5VO-00000001ZQ4-2CXP;
	Thu, 25 Jan 2024 19:35:24 +0000
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a2dc7827a97so803320766b.2;
        Thu, 25 Jan 2024 11:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706211316; x=1706816116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjqvkLmk8VDSM4lbemx7hZHtV6yp8+TOJnRN6X8CIwM=;
        b=sd2ltGOdX87fZn3r1hld2ojTa9RQuCUt06Iwo30fnj5c1tY1tgSBMB2cyYjMJ4U1DE
         XTgqKJe6qkCEnJUS8VW6PUrYfnTS1WhUYqRwDg4mTTNMuzp28PABqWs6IwkUwK9tSSQL
         HB6V2XsnltWv8BFWNeR/vWd/bnsAO9X/di2dGDDUp9h9LX6tuTf06hCMp9xm3+edICrV
         9DH8OhjVNM+YVVHpeMBEkTrNd2SZnxWHUnKsGUs9ym/t1pNgAZ/vfaMmC95gMDyfRiCh
         wdV7OlFQFHLzm5jBGP26AgvX/mmqndorxue7dqnVUxA+IwCyDjzgjR//ndAATs+Bkwq0
         NXIQ==
X-Gm-Message-State: AOJu0Yz5gumVUmAWiayrc37d9N6XMh4yG5vp+hP/mG9eSO4QajuMiINC
	0q5fMrXVYJLL/iQGrHWgTcZvqtl4N1LVKDcMy2f45Q9EpsHrMvdj
X-Google-Smtp-Source: AGHT+IGw8OBJoLm4ygn5xm5az2pErjzlXXBBw71Cjl+glIux2aHdlBCQjZUfWm+NYYC6eQUQURnlxA==
X-Received: by 2002:a17:906:f291:b0:a31:4378:288c with SMTP id gu17-20020a170906f29100b00a314378288cmr52427ejb.120.1706211315809;
        Thu, 25 Jan 2024 11:35:15 -0800 (PST)
Received: from localhost (fwdproxy-lla-116.fbsv.net. [2a03:2880:30ff:74::face:b00c])
        by smtp.gmail.com with ESMTPSA id vi2-20020a170907d40200b00a30ed424e18sm1330363ejc.41.2024.01.25.11.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 11:35:15 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
To: kuba@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>
Cc: dsahern@kernel.org,
	weiwan@google.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH net 08/10] net: fill in MODULE_DESCRIPTION()s for PCS drivers
Date: Thu, 25 Jan 2024 11:34:18 -0800
Message-Id: <20240125193420.533604-9-leitao@debian.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240125193420.533604-1-leitao@debian.org>
References: <20240125193420.533604-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_113519_168301_9327475B 
X-CRM114-Status: UNSURE (   8.91  )
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
Add descriptions to the Lynx, XPCS and LynxI PCS drivers.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/pcs/pcs-lynx.c      | 1 +
 drivers/net/pcs/pcs-mtk-lynxi.c | 1 +
 drivers/net/pcs/pcs-xpcs.c      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
index dc3962b2aa6b..853b8c138718 100644
--- a/drivers/net/pcs/pcs-lynx.c
+++ b/drivers/net/pcs/pcs-lynx.c
@@ -398,4 +398,5 @@ void lynx_pcs_destroy(struct phylink_pcs *pcs)
 }
 EXPORT_SYMBOL(lynx_pcs_destroy);
 
+MODULE_DESCRIPTION("NXP Lynx PCS phylink library");
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
index 31f0beba638a..52a7757ee419 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1456,4 +1456,5 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
 }
 EXPORT_SYMBOL_GPL(xpcs_create_mdiodev);
 
+MODULE_DESCRIPTION("Synopsys DesignWare XPCS library");
 MODULE_LICENSE("GPL v2");
-- 
2.39.3


