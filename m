Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC05606A8B9
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 16:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pAZC/82+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lB2vt20Q;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lu0tK5xo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C0jscx5DDVxF6lxNWbtWfTXvaQUi2T5SH8k3EmxiaYE=; b=pAZC/82+eAvFrw
	xcCzfSvX8z5E5cKjTYBf0WhDCLArDtcrTbtVO1QIiF3qQ6Ej0URl53DwSDOo4/nZqBV9F3E/u/JUe
	FbQj4OQGo3Lu7hbaespdt/WZB9iRiXabzu/aA5dHFzYqQTHSs25X6wbvHhCyu37MW2grxmyDS93Ff
	btD29482kCgUAL35g4YBPBOtRQzjImQkSxXCzfGHnZf2djmfzPSrDOifq9owy/u/QmavpFHH+aQ8i
	jpecAWjtbZrlIAAZ5ww/SGoSh86CiFnGFTvovKI0K/Z4i/1UBjIKzKOhnmG73+sd51XXTrp1OKrca
	YfTOY3fgIkQPwbM1b78g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfY-00000003Fdl-1C3W;
	Mon, 16 Nov 2026 16:35:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfC-00000003FHS-2736
	for linux-mediatek@bombadil.infradead.org;
	Mon, 16 Nov 2026 16:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=C0jscx5DDVxF6lxNWbtWfTXvaQUi2T5SH8k3EmxiaYE=; b=lB2vt20QP/K+fsaivLf3MFA786
	BwxpwBd1/O8avlq2SNj9GG0OVzP59Kl+ZGa6Aay8x3EIVDWItUCHI3Z0DV1qBj8ihAsSZMwuy1RS+
	uo/8gkdL/WfsvJDm1y+jI5bWBAx4CF7RTcBbcSlRtNgnz87pEThOWm5fJkomTIS6FlbSRAbvEx9HQ
	wrcONBtlysMafBYZY5t/j0N2c/uscqkaFpWYJsDu2TuiF03qx9P75vO/fL6zv9FCv7enDmdAs5V91
	QpPsbkJr7sYdzzIDfNT6XVN+kgmb6wLpm4sya8NzqA/BOQ8usYbKMNAp1F0YrdwSQMqzIskakTxzv
	jls3xv8g==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzf9-0000000E4GK-31tx
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso13652345e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 08:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846874; x=1795451674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C0jscx5DDVxF6lxNWbtWfTXvaQUi2T5SH8k3EmxiaYE=;
        b=Lu0tK5xo3xktrYbYy2+eOmB65nvsYDzTO8/3wwBQ6SWOhCMA99UiM4NKVQzxjz27xF
         gsTdhyYb86xC20o66GjQU/fFn0YtT+8WqxWRHpdeVzRHNNLnIoC79vKx+yzCnuxAxdRQ
         tZW1cALBS/jnBjcIP+LO/cLMVWzrOy5iK6Pk8HkWQSqt+Ab5apgu7EbBbfOh+WEtseS2
         H4gNXisrouCTRWnDB/0dTNDAHwj039PmLuhqwfiWfAdJGSCrWkClxNr8+KQzfst++Bn6
         emZD7fgQWt3Qnd1mdUM0FD5g3y51J0PoJucR7mLLCujjWYLPUZrNaqswkZw196KcTHfo
         iqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846874; x=1795451674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C0jscx5DDVxF6lxNWbtWfTXvaQUi2T5SH8k3EmxiaYE=;
        b=drl/xk+wqOaH1L2mbxaU3alU/TUZqDFzw1WEoD9ztdUOyeofTzUjCw1yZqobTEnfQs
         fT69TZZntTKiqTRBpRNRYnA4x8lsdOIhmUxfg769appgB44aFyx+OvNF76xZmzDfDYm3
         XGll4mbD5v4o5KIjNUcyxLJ5L3v0Idf6oRA++Z56QyOMaBM3q7nUtpGtDeNmce0/+FIK
         0CxXolsi4kQpgKLiWxrn/L3OH+ZKAS7Hi/JWoFt9hwf8F3IWiDW1kE/Kwwd21iHkwj9H
         PjProIUN8flUWjqvT3amg0YWtuPAepwSAAGFPZBwDNcquetQsDml3nFMpDYb8hTM0P1t
         AX+w==
X-Forwarded-Encrypted: i=1; AL+hErEGwyZULRzIHWWBLfDEAUtdlTNNBbJhBFr+Z3ZmIL791MG040D1QKlmXZPCej2o+dfmVRlsHI+DBhf3QIhpxA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8g2D31Cc5y6ppR74zu3KYxx/I4BLP/QSAH24EBWOKDo4Mtz1VY
	KLDlhkp+JP36PQtsAoQd5Y79tqeKftENNEoOOro2oujKtr9E9VKLTlBL
X-Gm-Gg: AZFdTZeqeTv5my5x4Zkfzk8qhWQ/PZ910i5i3G/+EDsih0R+KTHk+VsH8twCn5ZEj6e
	0xbTvm4sCDeOSFZHHVAd+gkKgyWMVmSnapf5lBl9LH40bm8WdsCHiRcOaDhoz66/0d5WTXDv+EU
	6EWqr6SXFg/BGghEyTk0rFQyqFB5HocWs+Sm4AoDxi/FnENOlIlH6DU7CE//acW+M3E04zYpkWd
	haXKlhEJJ5y6xLUnTjaNxTPoZx80NIoA3ORNlgapJLggHMKSW3bABGGbF8hBEjG8u/Tig9dKJtu
	ZGSJqsP8pj9zjaOhO9I0GraLyuBytbSsbtnO8qFvA4QVdXAu0FTpaTOc6enUGTMKVi4UXrwVdnv
	ZG7rPjNWTWggeA38vNBOlhmFtGi2p617Zl/g9G+MVBIjdN7zxKjpZSTOCCFQ+GGJ3tUg5duBDeD
	XWFntsnZyem1im2Bw0uAACY19op/6xW2YayUsPpM1ehWNDDYsXVMMzTd+YacoXl0XY7D/EVsFam
	6iCEN8ffJhAxKti9xbeF3osLUR0OymhFVqT21qsa9BmyDMMmWL1iwqXSA+deCRie8uj1uZ36gcS
	0ljErc73driKCEmlh9liclw/zie92n/UIT4CHP4qXu14JgLGTrmfwoBl/cj2PQPxCcyiRcwlHxT
	zQPv1+LfrKS3T75Lr2dFoIxdCYMNBOgOtkw==
X-Received: by 2002:a05:6000:4204:b0:4a3:522:244b with SMTP id ffacd0b85a97d-4a305222665mr1439000f8f.11.1794846873561;
        Mon, 16 Nov 2026 08:34:33 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:33 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 06/15] net: phylink: make phylink_validate state locked
Date: Mon, 16 Nov 2026 17:33:49 +0100
Message-ID: <20261116163412.551438-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_163435_702605_668AB4C8 
X-CRM114-Status: GOOD (  23.90  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In preparation for support for PCS release/late attach, rework the
phylink_validate functions to be locked under the state mutex.

With the introduction of a notifier that can be called concurrently while a
phylink_create is called or an interface mode validation is being run, on
recalculating the supported interface and capabilities, an inconsistency
can be introduced with 2 validation run at the same time.

To handle this, make the phylink_validate lock under the phylink state
mutex, add lockless variant for phylink_validate_mask and phylink_validate
and add lockdep check to make sure the mutex is held in the inner
validate functions.

Function that already run phylink_validate under state mutex, are updated
to use the lockless variant.

Special care was needed for phy_get_rate_matching that required a lockless
variant. This is introduced by adding an internal phy header.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phy-internal.h | 22 ++++++++++++
 drivers/net/phy/phy.c          | 11 +++---
 drivers/net/phy/phylink.c      | 62 ++++++++++++++++++++++++++++------
 3 files changed, 79 insertions(+), 16 deletions(-)
 create mode 100644 drivers/net/phy/phy-internal.h

diff --git a/drivers/net/phy/phy-internal.h b/drivers/net/phy/phy-internal.h
new file mode 100644
index 000000000000..56d87495e1f0
--- /dev/null
+++ b/drivers/net/phy/phy-internal.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __PHY_INTERNAL_H
+#define __PHY_INTERNAL_H
+
+#include <linux/lockdep.h>
+#include <linux/phy.h>
+
+static inline int __phy_get_rate_matching(struct phy_device *phydev,
+					  phy_interface_t iface)
+{
+	int ret = RATE_MATCH_NONE;
+
+	lockdep_assert_held(&phydev->lock);
+
+	if (phydev->drv->get_rate_matching)
+		return phydev->drv->get_rate_matching(phydev, iface);
+
+	return ret;
+}
+
+#endif /* __PHY_INTERNAL_H */
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index fce9bc7be330..e305bbff16ad 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -38,6 +38,7 @@
 
 #include "phylib-internal.h"
 #include "phy-caps.h"
+#include "phy-internal.h"
 
 #define PHY_STATE_TIME	HZ
 
@@ -146,13 +147,11 @@ EXPORT_SYMBOL(phy_print_status);
 int phy_get_rate_matching(struct phy_device *phydev,
 			  phy_interface_t iface)
 {
-	int ret = RATE_MATCH_NONE;
+	int ret;
 
-	if (phydev->drv->get_rate_matching) {
-		mutex_lock(&phydev->lock);
-		ret = phydev->drv->get_rate_matching(phydev, iface);
-		mutex_unlock(&phydev->lock);
-	}
+	mutex_lock(&phydev->lock);
+	ret = __phy_get_rate_matching(phydev, iface);
+	mutex_unlock(&phydev->lock);
 
 	return ret;
 }
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 091c3a79c120..88280866c19a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -9,6 +9,7 @@
 #include <linux/ethtool.h>
 #include <linux/export.h>
 #include <linux/gpio/consumer.h>
+#include <linux/lockdep.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
@@ -24,6 +25,7 @@
 #include <linux/workqueue.h>
 
 #include "phy-caps.h"
+#include "phy-internal.h"
 #include "sfp.h"
 #include "swphy.h"
 
@@ -550,6 +552,8 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 	unsigned long capabilities;
 	int ret;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	/* Get the PCS for this interface mode */
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
@@ -628,13 +632,15 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_supported);
 	struct phylink_link_state tmp_state;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	linkmode_copy(tmp_supported, supported);
 
 	tmp_state = *state;
 	tmp_state.interface = interface;
 
 	if (phy)
-		tmp_state.rate_matching = phy_get_rate_matching(phy, interface);
+		tmp_state.rate_matching = __phy_get_rate_matching(phy, interface);
 
 	if (!phylink_validate_mac_and_pcs(pl, tmp_supported, &tmp_state)) {
 		phylink_dbg(pl, " interface %u (%s) rate match %s supports %*pbl\n",
@@ -648,15 +654,17 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	}
 }
 
-static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
-				 unsigned long *supported,
-				 struct phylink_link_state *state,
-				 const unsigned long *interfaces)
+static int __phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				   unsigned long *supported,
+				   struct phylink_link_state *state,
+				   const unsigned long *interfaces)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_adv) = { 0, };
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_s) = { 0, };
 	int interface;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	for_each_set_bit(interface, interfaces, PHY_INTERFACE_MODE_MAX)
 		phylink_validate_one(pl, phy, supported, state, interface,
 				     all_s, all_adv);
@@ -667,14 +675,36 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 	return phylink_is_empty_linkmode(supported) ? -EINVAL : 0;
 }
 
-static int phylink_validate(struct phylink *pl, unsigned long *supported,
-			    struct phylink_link_state *state)
+static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				 unsigned long *supported,
+				 struct phylink_link_state *state,
+				 const unsigned long *interfaces)
+{
+	int ret;
+
+	if (phy)
+		mutex_lock(&phy->lock);
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate_mask(pl, phy, supported, state, interfaces);
+	mutex_unlock(&pl->state_mutex);
+
+	if (phy)
+		mutex_unlock(&phy->lock);
+
+	return ret;
+}
+
+static int __phylink_validate(struct phylink *pl, unsigned long *supported,
+			      struct phylink_link_state *state)
 {
 	const unsigned long *interfaces = pl->supported_interfaces;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	if (state->interface == PHY_INTERFACE_MODE_NA)
-		return phylink_validate_mask(pl, NULL, supported, state,
-					     interfaces);
+		return __phylink_validate_mask(pl, NULL, supported, state,
+					       interfaces);
 
 	if (!test_bit(state->interface, interfaces))
 		return -EINVAL;
@@ -682,6 +712,18 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return phylink_validate_mac_and_pcs(pl, supported, state);
 }
 
+static int phylink_validate(struct phylink *pl, unsigned long *supported,
+			    struct phylink_link_state *state)
+{
+	int ret;
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate(pl, supported, state);
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -2117,7 +2159,7 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	else if (pl->sfp_bus)
 		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
 
-	phylink_validate(pl, pl->supported, config);
+	__phylink_validate(pl, pl->supported, config);
 
 	pause_state = config->pause;
 
-- 
2.55.0


