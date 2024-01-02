Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365FCC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 07:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mM3PDqFdCZw+zdDJaYo5Q6NaL9KNCZtFGDckEZSKOng=; b=m/5dwKQ/MxRExYYtoLRdRazpK0
	lGRQV6FFHrTMwYWVfhCnTx72MV8+MpeONc4WLLwT/62XzUoCsOqv9Ar7FYrf85zrOIwUcHUfjoVzI
	IVdHdaSlzB86Aq/xMWQqqN/UeU8E5XziNnOpxqhXnsbmhK1b2Uxwe7TfXZVMK0qeVgZao2B1rsfri
	O+IqacPVQPZeC+PTjkCjmjyZ3HdFf3OLNAoFNxLuEBFKioRqBR6aTqfVHHlA9s8nTXA6khBq9Iepv
	pf64LAf/9F2DniO91kLPdioiDPlT6X2TNwApNki/bb0HSTLObCKjDTpk3B+EHvEcxh+rIguDrkoFE
	OHpWuQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKZRF-007GkV-0o;
	Tue, 02 Jan 2024 07:43:49 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKZRB-007Gjh-1d;
	Tue, 02 Jan 2024 07:43:46 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50e7b9cca2fso6276847e87.3;
        Mon, 01 Jan 2024 23:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704181423; x=1704786223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mM3PDqFdCZw+zdDJaYo5Q6NaL9KNCZtFGDckEZSKOng=;
        b=jmt0KF7OuAw34K+fpF/JbQ7MPxyA70X2Pb/DeH7P/xYhSubp69UPxjxQK0xaPelKEv
         LDZe3+6IAvzGaN3Bymju6nL40gcDzI3hYFasWxvHENm81SBBtr5zsgWibniMl6HRxHNX
         cJWtiNREdKhvXZTeSWvkZm13Tvj3LvHM1kCsKYIxFJCfqSUXmVIkMnSKm9wjx77mNotE
         5K3SvjwSB182cffaJ6TtnJtssAsD3E7jRrswkxgDYHJfNJWCTM3py5YPXzVlMSgFX9fe
         Kzy1vEY/EAXCZizqH93x91Iv4RCKOdP4/hzETsePgG9ngq4eE+nGjcqsmM/qmrjXCRjt
         aUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704181423; x=1704786223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mM3PDqFdCZw+zdDJaYo5Q6NaL9KNCZtFGDckEZSKOng=;
        b=bWY0xaXjjW1aKeDuKgREjEStKkdxRzX3J7m9wIShbO3pjaofOSfRf/kO6Kj+J1pQgp
         Da/qjf9waD0jocmPYcY0lhq0QwPMepbWLlwaikxzJzcK46gJJFJkhSyjv63YiUeCg/yW
         hriebcBNtG6m+/1mF29R1vspUlX2TyMMeN/tbHLot3+FrMmsLQqOmDbJWY0pd54eeE1B
         8PMNmpJ6IJJ7zReQ2Y5FzrA79GGE4liLrMBhyKd07j2rmjNvslpcwD5ec8ClE33XBT3z
         238edWGTgNicGKjgLVxCasui4g9zTgGBQPqzNuZYNvLkpfeOtBFL6yElNgmcsdvBVvuz
         OUBQ==
X-Gm-Message-State: AOJu0YxR5aeC1K9RXatqy8fB1XNeVQ7B9hVLKDwQDGw9FitbrQ/FU0wg
	33wgCYsNHr3s2ozuUqnqHqI=
X-Google-Smtp-Source: AGHT+IFPtfc//kD/XoMFYOLGF/DLaFInPnIJKxvQEy0hvSCHjbtHIQ8SDlaKUR5cxnPPR9uEALzwig==
X-Received: by 2002:a05:6512:3d9e:b0:50e:7042:468d with SMTP id k30-20020a0565123d9e00b0050e7042468dmr7464991lfv.36.1704181422779;
        Mon, 01 Jan 2024 23:43:42 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id u23-20020aa7d0d7000000b005533a9934b6sm15574325edo.54.2024.01.01.23.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 23:43:42 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Frank Wunderlich <frank-w@public-files.de>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH RFC net-next] net: phylink: add quirk for disabling in-band-status for mediatek pcs at 2500base-x
Date: Tue,  2 Jan 2024 08:43:26 +0100
Message-ID: <20240102074326.1049179-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_234345_562291_12ABB54A 
X-CRM114-Status: GOOD (  20.63  )
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

In follow up to: net: pcs: pcs-mtk-lynxi: use 2500Base-X without AN

MediaTek LynxI PCS, 2500Base-X will only work without inband status due to
hardware limitation.

I understand this patch probably will not get approved as it is now, but
perhaps with some pointers in the correct direction to follow, I can change
it so it could be. It does however get the result that the rtl8221b on a
sfp module functions correctly, with and without (as optical sfp) the phy
attached and without using a quirk/ethtool to disable auto-negotiation.

Introduce bool phylink_major_no_inband(pl,interface), a function similar to
bool phylink_phy_no_inband(phy). An option could be to use a function like
bool pcs->ops->supports_inband(interface), where if the function-pointer is
null, it means it is supported for all. This instead of using
of_device_is_compatible() inside the phylink_major_no_inband() function.

Code added to phylink_major_config():

When there is no PHY attached, pl->pcs_neg_mode is set to
PHYLINK_PCS_NEG_INBAND_DISABLED.

When there is a PHY attached, pl->cur_link_an_mode is set to MLO_AN_PHY.
To have the pcs function correctly with the rtl8221b, we need to do the
following to the in-band-status:

We need to disable it when interface of the pcs is set to 2500base-x,
but need it enable it when switched to sgmii.

So we get:

[...] mtk_soc_eth ... eth1: phy link up sgmii/1Gbps/Full/none/rx/tx
[...] mtk_soc_eth ... eth1: phylink_mac_config: mode=inband/sgmii/none
                                adv=00,00000000,00000000,00000000 pause=03

[...] mtk_soc_eth ... eth1: phy link up 2500base-x/2.5Gbps/Full/none/rx/tx
[...] mtk_soc_eth ... eth1: phylink_mac_config: mode=phy/2500base-x/none
                                adv=00,00000000,00008000,0000606f pause=03

Changes to be committed:
	modified:   drivers/net/phy/phylink.c

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 drivers/net/phy/phylink.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 298dfd6982a5..6e443eb8ee46 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1074,6 +1074,22 @@ static void phylink_pcs_an_restart(struct phylink *pl)
 		pl->pcs->ops->pcs_an_restart(pl->pcs);
 }
 
+static bool phylink_major_no_inband(struct phylink *pl, phy_interface_t interface)
+{
+	struct device_node *node = pl->config->dev->of_node;
+
+	if (!node)
+		return false;
+
+	if (!of_device_is_compatible(node, "mediatek,eth-mac"))
+		return false;
+
+	if (interface != PHY_INTERFACE_MODE_2500BASEX)
+		return false;
+
+	return true;
+}
+
 static void phylink_major_config(struct phylink *pl, bool restart,
 				  const struct phylink_link_state *state)
 {
@@ -1085,10 +1101,22 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 
 	phylink_dbg(pl, "major config %s\n", phy_modes(state->interface));
 
+	if (phylink_major_no_inband(pl, state->interface) && (!!pl->phydev)) {
+		if (pl->cur_link_an_mode == MLO_AN_INBAND)
+			pl->cur_link_an_mode = MLO_AN_PHY;
+		else
+			/* restore mode if it was changed before */
+			pl->cur_link_an_mode = pl->cfg_link_an_mode;
+	}
+
 	pl->pcs_neg_mode = phylink_pcs_neg_mode(pl->cur_link_an_mode,
 						state->interface,
 						state->advertising);
 
+	if (phylink_major_no_inband(pl, state->interface) && !pl->phydev &&
+	    pl->pcs_neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
+		pl->pcs_neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED;
+
 	if (pl->using_mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
 		if (IS_ERR(pcs)) {
@@ -1218,6 +1246,9 @@ static void phylink_mac_pcs_get_state(struct phylink *pl,
 				      struct phylink_link_state *state)
 {
 	linkmode_copy(state->advertising, pl->link_config.advertising);
+	if (pl->pcs_neg_mode == PHYLINK_PCS_NEG_INBAND_DISABLED)
+		linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
+				   state->advertising);
 	linkmode_zero(state->lp_advertising);
 	state->interface = pl->link_config.interface;
 	state->rate_matching = pl->link_config.rate_matching;
-- 
2.42.1


