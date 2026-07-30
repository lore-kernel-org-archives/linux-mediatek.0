Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82106C54FD2
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2026 10:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXt/uOqbphj4V91HISks6B4J5Xr/iPtpqYGyXndRE6o=; b=3ugj3lpsycKKDjP/Xp/9MwrVqp
	ynqLfBVScvYR+A11grwTiIAmCIyNeCaaURuMJ6/b6musAq42Lo78rPhxhNxTMhZowWkxfdD4sap0t
	L+ktz1vZkrsjDuqolvVCSnB++SK2GuzixqKKiI5GXfp52zfpnsSaK8hddG3F3sZXPhGN4KnxN3RqN
	qbtHHsE7zIbMSNcLtTMEYqsPdKxDdV3qVJ8fu4jWBhOCWDtkMDppM53gPUm2Rx+eCteXfkAkIgk1F
	CaPYteY6T/ZUaYYjUwOCdLCIwNijdDphT9Z5zW+YFNCsr6Q3jDSshPO8b2MWaNYlMTgFXyh1iJzNf
	4eOENDTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNxk-0000000ACFD-2A6n;
	Thu, 30 Jul 2026 10:26:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNwx-0000000ABeI-0Sa3
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Jul 2026 10:25:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-495437bb891so4948255e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2026 03:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407113; x=1786011913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lXt/uOqbphj4V91HISks6B4J5Xr/iPtpqYGyXndRE6o=;
        b=s30lEpjhDm/owbwYIztVCWYuFKc6wguuCsLaNBug3Rhxbhy4IklIMj0/1GDx+M1qLR
         tEWKVVJBjWv7hgbYY27cyNPyNUVWqrP5ZtxFjKyik7ONRy6dnPprLijKqxQqW9ioCnCE
         OGMB2lBf9F1D7foRpjG44rcOp/ZNj7llW1fXwdJXyLzkLyFQvcVzZFOwhHhYQ0XJlv8r
         cYzSwS30J5Fx4PZp9rla/qsBHRu6utwp9iYH55d56MK9dLVnEU5ZtjzNjPJjByNsuIla
         lRFsNhPEe83D/2WLPvr1z7T5Ba1rMPzHem6Qiprr0Oy63trgwM+duzUXjuvguIaBjZ6p
         DLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407113; x=1786011913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lXt/uOqbphj4V91HISks6B4J5Xr/iPtpqYGyXndRE6o=;
        b=hS7zoCMr2HPY+dWHXE+eywbJ0NqBXObOCqX5rg8mAiZNX6Fu8o0RG54NiGtPUBP6tI
         8v1Dd0ekcHStoNgH/dGfnYuU409x437sKjSFoZHq+nOysXFg3T/fanol/hx3SeOarp8w
         bJ+Z6GHzBtriMtDHo+hE/7ybBNDihJ6rKucjsAzA1/orqswAFy7WKaPItOX48YwdP3Xq
         HxkIxmSrdlKfVzT7SKPfzJ44FIJr1KMvJHHj5QF2V7kFwAr5BQNETdhwlA+r4hSUW4oj
         fertFphhsRDr55wyZRdP98K19NgeNdEs50wvMzW93VsiH+Gh5M61yPHrYqMm3Zn4Tpu2
         ki8A==
X-Forwarded-Encrypted: i=1; AHgh+RqIV/OrDfjWSSoEVqtyh28XiDpzYPWCCBj8Ozd1VDWoVTdBkioyRGYbuJe4T9tR5YT/d319SRxzwccusG6QVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu/IyoAxlECoVBhEN6Vbf56AnmJLf8TSOc2/TkwqTBuKYLvKTn
	U31gQb8FzrYlFbPBOAzSEkRw83w5ojKR4gKuyEC+U8Pr6qaVIViAfD30
X-Gm-Gg: AR+sD13ZBLIK/CIThvvnrXImPGUdYEcAoqrTui6K0SCRk4fwRRCk65BLTEo9HE/4Uxc
	Qff1VWCRTul4DjESMdKaU7GRuzXkkagv1YT69Obv3hiya/TWLsRuw70fn08NCK9QqryzHua86gK
	8/bgySn6ZmZDvqTdAJ6mDvnG1G/nSrvCpnNwuuyAj/Ty8r2ScGVIEet0/8Xa4fuYf+Y2WdO3LiB
	4qO1IOWArNX9SNAgW9swwJV6qgZ1L8vJnsGp8tuel5267yKM9LWrnb2pt44IT40mRHBPTqTllGy
	jBrdeIono45su6nxD/6bD7l6IsEBUjBfgpJxHhbmomFygiLRGz4sYDIGEV+W/jW+Oo6rxewPGsM
	vYU6+RqpLn727ZLIjiXWhsiXgRTruYSPCOCGuO2opQLpOgGqKe+W4mkVARz2dfZR4omZ1+Xq+oF
	m47ZFHnsJPYkYE63yzjjByfFx30mkKt9mQInmU66XPPHgly8biih0+zSOvooC4W41Pa3C3Xil+/
	VEPoNAkCBaErmDa7htOPFfoO7M4erZLzJSCE7C6EACJkKB+sOmwxg==
X-Received: by 2002:a05:600c:45d5:b0:495:6022:5a23 with SMTP id 5b1f17b1804b1-49801f2b8c2mr20936175e9.19.1785407112977;
        Thu, 30 Jul 2026 03:25:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:25:12 -0700 (PDT)
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
Subject: [PATCH net-next v10 08/11] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 30 Jul 2026 12:24:19 +0200
Message-ID: <20260730102444.1967900-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_032515_202264_91212027 
X-CRM114-Status: GOOD (  14.24  )
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
index d38820543ae4..f45bdb8c3647 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1041,6 +1041,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1742,6 +1748,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 15e6b1a39dfe..4af8598b819a 100644
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


