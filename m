Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E060C47073
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jan 2024 19:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObkI4/hpAc5XCYcrKwgY+Xsx/yEYLmlwpmTk1Flaajo=; b=SJtnWN/G3EzbrA
	Ay4OAdusNngtRFJr4u6TzHHN2arcbfYdTXmDvQr6KjCD844uA+I1oRrlWnw79JbeJyHxGu1jrXaQE
	UlLNnFZpkiswEp/btLSHx6pzQ1qnAu2lXB2IXOggO2InQO4u7shSO9QdD0TIqdFe0DDhG6DN/Dfdu
	UskJuZLjTECURM2BBMaXL3ZdPjjX1sDhl/DvP62N508B5V95s3eib4Q+dr76x6dBRCDJkTeVaobvq
	e1dyVtORfJDpugpdmvRFk1pzLFe7bS9/uVndu2wXJEjDeY+G9oRfSqWRqajTkDUF/0CaYrKQvY3zT
	lH97ZFVeR4w2FmpwYhew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMZ1o-003RBs-0q;
	Sun, 07 Jan 2024 19:41:48 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMZ1k-003RAx-0S;
	Sun, 07 Jan 2024 19:41:45 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a28f66dc7ffso382106366b.0;
        Sun, 07 Jan 2024 11:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704656499; x=1705261299; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ObkI4/hpAc5XCYcrKwgY+Xsx/yEYLmlwpmTk1Flaajo=;
        b=Hg4oROew5yLGF4ZA8niU8jzxbA+VO3q82DhMDUCZQMHwlSUgpM4+1Oo2O8puZXwsIY
         bq9qBiIbgnoDGAS/+fby3PeCLAGOdRcJiZlDkWskMPytQdP746rTnfE46O91v0/cRh5L
         R3l0IP0yS16SHMEvn2SQT8JbQejZM8AooVnpU2C4PIgY6IhqzGeD2I/dClwpRs2iybLK
         L5PlgULQiJtyFpsTphIFACBVeWsLGMiOgC+nvgSZLVYICWd7cBz4bfJuhKSq0+xqeQxH
         poy1YsCNDpOj4dpRdvE3etdRs+X0SbEXZ2osw+DPe7fD1E4FJeq8t3v9qDW8afnOy9So
         BJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704656499; x=1705261299;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObkI4/hpAc5XCYcrKwgY+Xsx/yEYLmlwpmTk1Flaajo=;
        b=mU4payxoQMvQ7LTyrqrAcxwvQUxRrfYvkd1b8wZ2Br/YKkHFbLGTaxDJEYf1vBNj6l
         hM5i6D9xi/IJU3wAkMJA3PNypo/5PPjjmewwW/Nwnf2wh5/in309Y+EKAJbwzDPkbCz6
         KJXq/kp1F7j/oJMMMh0/ANcaOdLMzJNVos3Jambd48/qawqdfE8paFdrJl2nPLy5dwcw
         VZTBvvcJbCcF8PRo4AIVA2/MKN/1ocGSW3mPA6mqIBLrDuL9kSXiNb61FQKI2mX6hLw1
         8sBL88gbefcA+Q2whGCkqyVp3DcdAlbO4iYEZxYNOTokynETFEg38dT1rZ97FVap1wsd
         pT8Q==
X-Gm-Message-State: AOJu0YzpnNwo9Fhk81Pi0+t3qyqD6YNWE/RWDwysFyyBrD3yQOkVjaTE
	oqJ9yjYjXNJZWc2aP6CbUBw=
X-Google-Smtp-Source: AGHT+IH31Fk17x8DYiIrH3Q0+tye342WuIdmMYNFJs+1QZp0qAs/AH1bgXtFv1zwhGMSkiK+UDQklA==
X-Received: by 2002:a17:906:27c2:b0:a2a:b797:bde7 with SMTP id k2-20020a17090627c200b00a2ab797bde7mr168993ejc.13.1704656498643;
        Sun, 07 Jan 2024 11:41:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id et9-20020a056402378900b00557884a55efsm1140264edb.9.2024.01.07.11.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jan 2024 11:41:38 -0800 (PST)
Message-ID: <2c13d157-c8da-4cf4-b8a1-668ab34b803f@gmail.com>
Date: Sun, 7 Jan 2024 20:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: phylink: add quirk for disabling
 in-band-status for mediatek pcs at 2500base-x
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20240102074326.1049179-1-ericwouds@gmail.com>
 <ZZQDWzYlxAKl0JxI@shell.armlinux.org.uk>
From: Eric Woudstra <ericwouds@gmail.com>
In-Reply-To: <ZZQDWzYlxAKl0JxI@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_114144_205033_DAB8BF76 
X-CRM114-Status: GOOD (  23.59  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 1/2/24 13:36, Russell King (Oracle) wrote:

> As 6.6 was declared LTS, I think we can now move phylink_pcs_neg_mode()
> into phylink.c, and thus think about what we should do with:

In the other rfc patch Russell King (Oracle) wrote:

> Since Autoneg is clear, phylink_mii_c22_pcs_decode_state() won't
> change state->speed and state->duplex, which should already be
> correctly set.

So the rfc patch now I have changed it to the following. Sure still
not ready for the real patch, but a few steps closer. The rtl8221b
can now be used as optical sfp (even without disabling autoneg in the 
sfp-quirk). Also it can be used with marek's rtl8221b rollball patch,
that changes interface between 2500base-x and sgmii. This is tested
on the BananaPi R3. The speed and duplex get are set from phylink. I'm
not sure what to do with pl->link_config.pause. For now I set it to
MLO_PAUSE_NONE.

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 298dfd6982a5..3f03af290fa3 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1074,6 +1055,108 @@ static void phylink_pcs_an_restart(struct phylink *pl)
 		pl->pcs->ops->pcs_an_restart(pl->pcs);
 }
 
+/* This function needs to be changed, not using compatible */
+static bool phylink_basex_no_inband(struct phylink *pl)
+{
+	struct device_node *node = pl->config->dev->of_node;
+
+	if (!node)
+		return false;
+
+	if (!of_device_is_compatible(node, "mediatek,eth-mac"))
+		return false;
+
+	return true;
+}
+
+static void phylink_pcs_neg_mode(struct phylink *pl,
+				 phy_interface_t interface,
+				 const unsigned long *advertising){
+	if ((!!pl->phydev) && phylink_basex_no_inband(pl)) {
+		switch (interface) {
+		case PHY_INTERFACE_MODE_1000BASEX:
+		case PHY_INTERFACE_MODE_2500BASEX:
+			if (pl->cur_link_an_mode == MLO_AN_INBAND)
+				pl->cur_link_an_mode = MLO_AN_PHY;
+			break;
+		default:
+			/* restore mode if it was changed before */
+			if ((pl->cur_link_an_mode == MLO_AN_PHY) &&
+			    (pl->cfg_link_an_mode == MLO_AN_INBAND))
+				pl->cur_link_an_mode = pl->cfg_link_an_mode;
+		}
+	}
+
+	switch (interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_QSGMII:
+	case PHY_INTERFACE_MODE_QUSGMII:
+	case PHY_INTERFACE_MODE_USXGMII:
+		/* These protocols are designed for use with a PHY which
+		 * communicates its negotiation result back to the MAC via
+		 * inband communication. Note: there exist PHYs that run
+		 * with SGMII but do not send the inband data.
+		 */
+		if (!phylink_autoneg_inband(pl->cur_link_an_mode))
+			pl->pcs_neg_mode = PHYLINK_PCS_NEG_OUTBAND;
+		else
+			pl->pcs_neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
+		break;
+
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		/* 1000base-X is designed for use media-side for Fibre
+		 * connections, and thus the Autoneg bit needs to be
+		 * taken into account. We also do this for 2500base-X
+		 * as well, but drivers may not support this, so may
+		 * need to override this.
+		 */
+		if (!phylink_autoneg_inband(pl->cur_link_an_mode))
+			pl->pcs_neg_mode = PHYLINK_PCS_NEG_OUTBAND;
+		else if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
+					   advertising) &&
+					   !phylink_basex_no_inband(pl))
+				pl->pcs_neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
+		else {
+			pl->pcs_neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED;
+			linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
+					   pl->link_config.advertising);
+			pl->link_config.speed = (interface ==
+			                         PHY_INTERFACE_MODE_1000BASEX) ?
+			                         SPEED_1000 : SPEED_2500;
+			pl->link_config.duplex = DUPLEX_FULL;
+			pl->link_config.pause = MLO_PAUSE_NONE; /* ????? */
+
+		}
+		break;
+
+	default:
+		pl->pcs_neg_mode = PHYLINK_PCS_NEG_NONE;
+		break;
+	}
+
+	return;
+}
+
 static void phylink_major_config(struct phylink *pl, bool restart,
 				  const struct phylink_link_state *state)
 {
@@ -1085,9 +1187,7 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 
 	phylink_dbg(pl, "major config %s\n", phy_modes(state->interface));
 
-	pl->pcs_neg_mode = phylink_pcs_neg_mode(pl->cur_link_an_mode,
-						state->interface,
-						state->advertising);
+	phylink_pcs_neg_mode(pl, state->interface, state->advertising);
 
 	if (pl->using_mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
@@ -1191,9 +1291,9 @@ static int phylink_change_inband_advert(struct phylink *pl)
 		    pl->link_config.pause);
 
 	/* Recompute the PCS neg mode */
-	pl->pcs_neg_mode = phylink_pcs_neg_mode(pl->cur_link_an_mode,
-					pl->link_config.interface,
-					pl->link_config.advertising);
+	phylink_pcs_neg_mode(pl, pl->link_config.interface,
+			    pl->link_config.advertising);
+
 
 	neg_mode = pl->cur_link_an_mode;
 	if (pl->pcs->neg_mode)
@@ -1222,7 +1322,8 @@ static void phylink_mac_pcs_get_state(struct phylink *pl,
 	state->interface = pl->link_config.interface;
 	state->rate_matching = pl->link_config.rate_matching;
 	if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
-			      state->advertising)) {
+			      state->advertising) &&
+			      (pl->pcs_neg_mode != PHYLINK_PCS_NEG_INBAND_DISABLED)) {
 		state->speed = SPEED_UNKNOWN;
 		state->duplex = DUPLEX_UNKNOWN;
 		state->pause = MLO_PAUSE_NONE;

