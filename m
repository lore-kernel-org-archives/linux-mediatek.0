Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F23C98318
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 23:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=; b=j8DR8R9cEPhXUl8R/5Iue4M1Tk
	MtC1jGrEv7fg6D38OWa7nsyT6C/iIdXrbrFScQ0VZvR/DyKkukaFh3tyhIIx7v3pFqQofBoGf7d3t
	pt6DpYnZZ2CUVZTrfpA4Uu3Yk9NURuLCVCToT7MGqKPn3hcfSYRBGebQ3crfjYaDd2sPKMw+ULyGz
	wYvo6a1YFt7ROlnj4OMzyD7kuAZC4Wu/kuVOeoPHW1RxoQMs1IUC+Rvws2Iuv6wRzaLUlufwLDGNt
	z6nczKoo/1mApmBOcEkeCxgm0VM5DEQ/iy1yO8xR4Un+KzSTzcoZg+vpnlMdIvP4+Qh3eT9tHZgbu
	XdatkLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sSk-0000000CLYL-30Ds;
	Thu, 24 Sep 2026 23:02:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sSg-0000000CLRz-0ktM
	for linux-mediatek@bombadil.infradead.org;
	Thu, 24 Sep 2026 23:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=; b=G/fBMVs3FasBKukhT9ilyaTmkk
	H7BDGMO7QegkXU/JgDW5ywKmgzPeefKw9151Ta9583tdhBgOTVR5XDgHXMVPzpQkDzt01L0esR8Zz
	UKyX9BflTT4QSgJyhICgeVViqZdcwNBkrUeYe8gF2dT3lhjBu2Mx6Crk0X/1yX53m8U9VT7v/J5AN
	+X/o7TunNO/4Lk7fGM7hZrxyKTFTa+BEK+ifXNqV8HT1pdWmBM/JMoU5vwltpDSCbkPd4DWb3DhRb
	vRHQJRl8/lxrvKz7At4yCkvwjdVQliM1jk9dE/HlQ8d8q5Z8QV9sXkYcRFzGh1RmJUezoMBugnaf0
	5uuRNVlg==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9sSb-0000000GUPE-0qkc
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Sep 2026 23:02:38 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so1932075e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 16:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290956; x=1790895756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=IIkWJhGGsUUg8mSpBexImFcHFK5z0NuxqAGFDqPzutHH/oMzQLmzlQYwtdSXCxKpH0
         4QJo5ahwa05BoIz7mUwa0dBUjp9afsbQxTQ7K6pe18t8BgiOkYoNYeqYK5jPZ0RT1mab
         7lb55awiNHp463+N3opnKiTGksIXma+O/rNBeMRcm0LWEf8+CyCkY3UrpxjpAAi2mzlA
         6vl2jalsouDl84cZ7gxDRVMWz4bOl6/fWbBFXJEYTec1JjyJyJGjDw2GaQ5ZCJ2+vBqS
         7J+REuWm6s+GN5eUkUl2/PNfIZW1re3oMHr/DGkwraVurA142wmwR2YZuSXHu36cLwdB
         ErCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290956; x=1790895756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=TUSeKLFKDrX/nFF7ZVSzwfkx1JmhHt/ozfbUPlRsloi3+zYlwAc0q1uXkS0npQ7nd/
         zQ748AnGo+XN0zjOSKZtaYxTymfvAEzEsFfLFdFwZ5MlhkIR43PJGJAMZFZkQLpsMm5L
         NlFligvGY6mVsCROSpUbizbW9STYWtfek4RImYeSlW5jyeQOyUMIQXWeLtXw34/icJQg
         Qlu5ckprZQsMAYrcnKKcTYJAxi2q/bglorRJLf4bBxtKbJFWzjx0d0cCtuCTQcAEoGDT
         dOpPsEJ/BwBYivoOGD+Dw9X8+C7ebfjd+AeDkH5VWA5QVs5ys6dgMcGcMe+ZMHznF2W5
         sCKQ==
X-Forwarded-Encrypted: i=1; AKwUvBytT3aw6iPmSfLj3VIw8oVPDP3K4Nl2L6/A7wVELfZBAXEUrA4Ez3hlPbE47B1lCbTy3635FEENiCnrabpxSg==@lists.infradead.org
X-Gm-Message-State: AFuF++n5P8Espi6YrMRK6hJvchu8CKr6RKnIrqPs/78Rs0Dtxv9eunFa
	KbLvwxRuQsv4bPHa5CYkDxR/748pDdVo/dab8mmB2j4cMUlJa7Tl8KSr
X-Gm-Gg: AYBFou3wbjUIutUS/nhKFF/Z8OVRy23dre688NbVyiy66xmCjYL6oSe64miCs561+no
	iImt4IfSMsXHp+dUSuKyE7zrwZn08WWY2VRKo5WQ6c8keVowbYhTkkdLIJBuMLriFkOvwNV0dNn
	3J16Mo0F6sNJLQITKm7UnYlqwnpEXARvgrHbQCsAzunKp5lnZNzEINr+bzV2leq/6oNGAQ+a8iM
	Tqky4na2maE8moYy7B3QQ7aPN75yKHarXywqw9qECnPfCwZjNXC8m5/m0ZCxUQEY0pXwHORzoCy
	uB7mu5Ii6J+oEd6PDvMfOZeFe0sDqNbIJrCxI5IUmSglJ/WrxwPVjOpfc5W7Me/7+KoVr4DgGwW
	pAe+C/cLvIYLLEQ8ShBtHbkCmVV2KUze9OUqWbsqiSnTpOzBwCARPIr8qyKWxb778Qpgo2TysZj
	3iLnV7tCsTplw6DIsMJ5Rn50TRV1g3qTQ+fs+T/XfCDnAHF9/FkqziMZTjvJjeS4BoG/IsVo7RW
	sFyvKXVwJBxYwnSryDDBvN8b+t2Hz/prX0drFIE+nhJjHtxUHUnLGxax+v1pBIz
X-Received: by 2002:a05:600d:486:20b0:49f:e8bf:221a with SMTP id 5b1f17b1804b1-49fe8bf24fbmr42002985e9.22.1790290955933;
        Thu, 24 Sep 2026 16:02:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:35 -0700 (PDT)
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
Subject: [PATCH net-next v17 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri, 25 Sep 2026 01:01:45 +0200
Message-ID: <20260924230211.11519-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924230211.11519-1-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_000237_409606_1110BB0F 
X-CRM114-Status: GOOD (  14.03  )
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
index 1156e6c61a08..9441afe372c3 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2115,6 +2116,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2199,6 +2201,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2229,6 +2232,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0


