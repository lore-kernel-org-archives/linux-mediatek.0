Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556D5606A322
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 16:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bq0Gihno;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WO5VQqgB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6Y0McpR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AKfFG/NGdMCuBI9qMp8fQoSx5ZUklEOkyEjVFWQM7P4=; b=bq0GihnoOr5nv9
	o/p7RpOwEBATkJGbTR8LUQT2BLi7/OE8bgk1r15rMH8Yw8BoWSYWO9JeCyBFwnXtA9PlmRvh9gqQT
	4i5GnP8PyF9hH5j+0/fw5hjn5R7kev+hV6HM8K+EBtLXHOZUZQy4/Kz2JqM/Bfl7ZVrRVTagw+Cki
	QOEh0EHX67FhjpjxAEen9PvJ9voxdIntObBamkJZoGUuAurQZCflVaIRsp+EFauFCqqqjM72fCMl6
	qjt54/N33sYR55bk2EuHSbqd1Z2NY2BcN8Sl5ZEYQCugZdOCG/DmgSbGFfh4luSOPEERqAQ7AzYzY
	ezeGMmbq33VEX0Gedybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfi-00000003FqP-44Ce;
	Mon, 16 Nov 2026 16:35:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfJ-00000003FP0-3pFt
	for linux-mediatek@bombadil.infradead.org;
	Mon, 16 Nov 2026 16:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=AKfFG/NGdMCuBI9qMp8fQoSx5ZUklEOkyEjVFWQM7P4=; b=WO5VQqgBEI1tikTALe72Nle+fh
	VsHm1e6KgoycLFoIdrE12He3c//Gr2bN8zNYcvqrSM0D6nB6tDCKGA32uE8Z7h8/XZbOlBcPvedQS
	jbtIgyTatsYJ/Af2510K5cYjfUTClINXAVQMnaqgPhKXpbdniQOFQpHAAOoT4VXGhy6Qjj0d81Vyu
	Qel3bhl9kdAzyLbWQDPQrlxstlNoh4cCyOsppPAcLnpzRGndn4eQDcwfL2W0acK4b7+9wGyoIxyRg
	SdDwIHHOwcD5kjWHKLgoaOfvI1LasakZ6SYKxxTw06QXRQzvT0+XTRPHLzk9eXvQcZZGuicl8Xbcb
	GEX1Smgg==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfH-0000000E4Kp-0Co8
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:44 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4a32576da88so118204f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 08:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846881; x=1795451681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AKfFG/NGdMCuBI9qMp8fQoSx5ZUklEOkyEjVFWQM7P4=;
        b=q6Y0McpRtHI7561OAUtGe5iPrTwIVB+wWBeGvgS7Kw+zV6FbzIqOgwS15nb3Q5zKdJ
         TOFSMg90ZQPRz6A/cdc82bQAsh8X/EdAZ9ep96cvvKYdtvsNKRYlmreu8/o88lVcbL36
         lZj0lWFU2SeXS5ROJL+hCWEp2VpVtJVdJVSQnpLXqKc1nVW8r7c3TQVdNueeHAJ7pHF3
         8l8pyc4mrb9k7dzP+Rawm3i9OsFEIbnZBF+hg50w8ymags8QVlQx9rhrnqlfLQzb6Esw
         gd/tpggaRoRL+EVv+edio15rmagbYeGYCdmmiCy9hskdUWE2igW9YDTsX9Ue6OfXhDww
         QSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846881; x=1795451681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AKfFG/NGdMCuBI9qMp8fQoSx5ZUklEOkyEjVFWQM7P4=;
        b=pofIvqUG+VMgRKtVTxIQAU0+hYbi74q9J57wTOotAGM1dTxIewHq66jAEGcjJqQNS2
         yHbPSEu7pbPdFUqtKkld50ht2S4WCrChtUJ/aasIDGNtqUNIFh3ir8hmUEf8+YFyriQY
         +VjTG9fHsvunwBEeAB3rxXSGVdf/hf7ygFeYAh6fuGlXxu9j1EFkFCtrEUtqN3xq9U85
         BUPhVldNzXDDs22Z1hGMi3p8iG/YQirXDtJ/1rxDTzH5TN5xstbG+il7jzdtMaiswBgM
         f0WTxvbXLbBehcXnUUFzKsj4YbyjquemA8IWAr1OXvpjlGYZ8avDA13n2LopRsO3PsrS
         4GBQ==
X-Forwarded-Encrypted: i=1; AL+hErHNje/l6sSbU+VHe2KPWk8huZgJkfj8xHv9BmZHQhR+yA1Gf/sQndiLfPE/e7YWe97xa+uVO57TcUyJThXQIg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/TEmkkShrm0d+rnvc5y9Dn5IjifS2R8wacpl6yesPQQ+HwdSmF
	JVMMMvzqzkgA1Thj35uALLQwy0A97PtQubwmQEMofvgxIt8x6zYwpJ3V
X-Gm-Gg: AZFdTZfq+AyVyZD5gZpQI+0ZdY/QeQnixpIrYSsMxOSrC9FjOBrHOzPIw25RF2MaXyl
	e87PseLwVom+chi5+oMVD6whsfaZ2fCVsiC0Abte+eke8PAuGx0xJ5QAofiLNKkZkJ9qId75sf5
	sYZCE+i1pVcBObUt0aeSlyeWa4K0QFFYvYGG4s+UOCh9KWFRtOlnNHwXsk58/eSLo7/PJZefjit
	6KDDlTKFzvkV/skS1S6TvEci8/BrgWOA4BXhUDFk1xYvOWZ1pzRawERH38bqvIwvtYD+4EFIYWI
	ZkAtSCOalKDIKEi4pz07opl/KQ7fxh9hri17NfNY2nYGF/M+Rlf9yWbB64R8qKLDbV1YjhOlFL/
	Yv6pFS+J6LFiSK804SKqTif1qGm0tttJ+VtTwLY7eY0XmOVfBb7kSbHBalPIkrY8B21bC8XlUbU
	ZD3DAcA+wk3UggsJeGgNNWRgtmA9+7lU/ewTYOadfb/xtm8kQVPuFy1ghqq062zvhlOv9IkCKwb
	tJM7tfmbYTW4QmKJ9b9pfHWUjzKwJp4L5zXwQgtZ+PFSaREHQ3R1YvVY5SyDbzy9DxnY7x+NuLK
	Xlx8ocMC+bl5zqKq9ZDrQrJVHYGjz2bs46RVVyNn4nsOFLB+hhX/WtdGJYAHPeFIi4SESJEONEi
	0FsJXI7WJCQMef7KFuoulQi+k88V0rzdqsQ==
X-Received: by 2002:a05:6000:4022:b0:491:971a:c568 with SMTP id ffacd0b85a97d-49c712ac9b2mr28115259f8f.10.1794846881237;
        Mon, 16 Nov 2026 08:34:41 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:40 -0800 (PST)
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
Subject: [PATCH net-next v21 09/15] net: phylink: support late PCS provider attach
Date: Mon, 16 Nov 2026 17:33:53 +0100
Message-ID: <20261116163412.551438-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_163443_148876_6501F176 
X-CRM114-Status: GOOD (  31.35  )
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

Add support for late PCS provider attachment to a phylink instance.
Similar to FWNODE_PCS_PROVIDER_DEL, FWNODE_PCS_PROVIDER_ADD is added to
address the case where a PCS provider is added after a phylink instance is
created and started.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
a new PCS provider is added.

If a related PCS is found, then such PCS is added to the phylink
instance PCS list.

Such PCS is then linked to the phylink instance and the supported
interfaces of the phylink instance get refreshed.

If we are in a major_config_failed scenario an interface reconfiguration
is triggered in the next phylink resolve with a new phylink resolve right
after with the new AN mode reevaluated if a new PCS is selected.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     |  22 ++++++++
 drivers/net/phy/phylink.c | 110 ++++++++++++++++++++++++++++++--------
 include/linux/pcs/pcs.h   |  31 +++++++++++
 3 files changed, 141 insertions(+), 22 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index f234a4635417..0a4853b756fb 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -69,6 +69,10 @@ fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	mutex_unlock(&fwnode_pcs_mutex);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     pp);
+
 	pr_debug("Added pcs provider from %pfwf\n", fwnode);
 
 	return pp;
@@ -201,6 +205,24 @@ struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+						 const struct fwnode_handle *fwnode,
+						 int index)
+{
+	struct fwnode_reference_args pcsspec;
+	struct phylink_pcs *pcs;
+	int ret;
+
+	ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pcs = __fwnode_pcs_get_from_pcsspec_provider(&pcsspec, provider);
+	fwnode_handle_put(pcsspec.fwnode);
+	return pcs;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_get_from_provider);
+
 bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
 				 const struct fwnode_handle *fwnode,
 				 struct phylink_pcs *pl_pcs)
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 094a15f3dbcd..8768d8220a13 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -112,6 +112,7 @@ struct phylink {
 
 	struct sfp_bus *sfp_bus;
 	bool sfp_may_have_phy;
+	DECLARE_PHY_INTERFACE_MASK(sfp_module_interfaces);
 	DECLARE_PHY_INTERFACE_MASK(sfp_interfaces);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
 	u8 sfp_port;
@@ -2140,6 +2141,35 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static bool phylink_add_pcs(struct phylink *pl, struct phylink_pcs *pcs)
+{
+	struct phylink_pcs *tmp;
+
+	/*
+	 * Make sure state mutex is locked to protect concurrent
+	 * access to phylink instance PCS list from
+	 * initial fill_available_pcs and late PCS attach
+	 */
+	lockdep_assert_held(&pl->state_mutex);
+
+	/* Make sure PCS is not already in the list */
+	list_for_each_entry(tmp, &pl->pcs_list, list)
+		if (tmp == pcs)
+			return false;
+
+	if (WARN(rcu_access_pointer(pcs->phylink),
+		 "%s: PCS already attached to a phylink instance\n",
+		 __func__))
+		return false;
+
+	list_add_tail(&pcs->list, &pl->pcs_list);
+
+	/* Link PCS to phylink */
+	rcu_assign_pointer(pcs->phylink, pl);
+
+	return true;
+}
+
 static int phylink_fill_available_pcs(struct phylink *pl,
 				      struct phylink_config *config)
 {
@@ -2172,12 +2202,7 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 		if (!pcs)
 			continue;
 
-		if (WARN(rcu_access_pointer(pcs->phylink),
-			 "%s: PCS already attached to a phylink instance\n",
-			 __func__))
-			continue;
-
-		list_add_tail(&pcs->list, &pl->pcs_list);
+		phylink_add_pcs(pl, pcs);
 	}
 
 out:
@@ -2358,11 +2383,24 @@ static void phylink_update_capabilities(struct phylink *pl,
 		goto exit;
 	}
 
-	/* Revalidate the SFP module modes against every available interface. */
+	/* Revalidate SFP modes against interfaces currently supported by the
+	 * MAC and PCS. Keep the module's interface list intact so a later PCS
+	 * addition can make an interface usable again.
+	 */
 	if (pl->sfp_bus && !pl->phydev && config->interface &&
-	    !phy_interface_empty(pl->sfp_interfaces)) {
+	    !phy_interface_empty(pl->sfp_module_interfaces)) {
 		__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 
+		phy_interface_and(pl->sfp_interfaces,
+				  pl->sfp_module_interfaces,
+				  pl->supported_interfaces);
+		if (phy_interface_empty(pl->sfp_interfaces)) {
+			linkmode_zero(pl->supported);
+			linkmode_zero(pl->advertising);
+			linkmode_zero(config->advertising);
+			goto exit;
+		}
+
 		linkmode_copy(supported, pl->sfp_support);
 		linkmode_copy(config->advertising, pl->sfp_support);
 		if (!__phylink_validate_mask(pl, NULL, supported, config,
@@ -2494,6 +2532,7 @@ static int pcs_provider_notify(struct notifier_block *self,
 	struct phylink_pcs *pcs, *tmp;
 	struct phy_device *phydev;
 	bool resolve = false;
+	int count, i;
 
 	rtnl_lock();
 	mutex_lock(&pl->phydev_mutex);
@@ -2506,16 +2545,44 @@ static int pcs_provider_notify(struct notifier_block *self,
 	if (pl->pcs_state == PCS_STATE_DETACHING)
 		goto exit;
 
-	/*
-	 * Loop all the PCS for phylink instance and check if
-	 * this notification is relevant for some of them.
-	 */
-	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
-		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
-			continue;
+	switch (val) {
+	case FWNODE_PCS_PROVIDER_ADD:
+		count = fwnode_phylink_pcs_count(pl->fwnode);
+		for (i = 0; i < count; i++) {
+			pcs = fwnode_pcs_get_from_provider(pp, pl->fwnode, i);
+			if (IS_ERR_OR_NULL(pcs))
+				continue;
+
+			/* Trigger a resolve only if a PCS is actually added */
+			if (phylink_add_pcs(pl, pcs))
+				resolve = true;
+		}
+
+		/*
+		 * Force an interface reconfig if major config failed.
+		 * Configure link_failed to retrigger a resolve a
+		 * second time to reevaluate AN mode with the new
+		 * PCS if selected.
+		 */
+		if (resolve && pl->major_config_failed) {
+			pl->force_major_config = true;
+			pl->link_failed = true;
+		}
+
+		break;
+	case FWNODE_PCS_PROVIDER_DEL:
+		/*
+		 * Loop all the PCS for phylink instance and check if
+		 * this notification is relevant for some of them.
+		 */
+		list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+			if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
+				continue;
 
-		phylink_del_pcs(pl, pcs);
-		resolve = true;
+			phylink_del_pcs(pl, pcs);
+			resolve = true;
+		}
+		break;
 	}
 
 	/* Exit early if nothing has changed */
@@ -2681,10 +2748,6 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	mutex_lock(&pl->state_mutex);
 
-	/* Link available PCS to phylink */
-	list_for_each_entry(pcs, &pl->pcs_list, list)
-		rcu_assign_pointer(pcs->phylink, pl);
-
 	phy_interface_copy(pl->supported_interfaces,
 			   pl->config->supported_interfaces);
 
@@ -4424,6 +4487,7 @@ static int phylink_sfp_config_phy(struct phylink *pl, struct phy_device *phy)
 
 	/* We're not using pl->sfp_interfaces, so clear it. */
 	phy_interface_zero(pl->sfp_interfaces);
+	phy_interface_zero(pl->sfp_module_interfaces);
 	linkmode_copy(support, phy->supported);
 
 	memset(&config, 0, sizeof(config));
@@ -4485,7 +4549,7 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 	 * the SFP module.
 	 */
 	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
-			  pl->sfp_interfaces);
+			  pl->sfp_module_interfaces);
 	if (phy_interface_empty(pl->sfp_interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
 		return -EINVAL;
@@ -4556,6 +4620,7 @@ static int phylink_sfp_module_insert(void *upstream,
 	ASSERT_RTNL();
 
 	caps = sfp_get_module_caps(pl->sfp_bus);
+	phy_interface_copy(pl->sfp_module_interfaces, caps->interfaces);
 	phy_interface_copy(pl->sfp_interfaces, caps->interfaces);
 	linkmode_copy(pl->sfp_support, caps->link_modes);
 	pl->sfp_may_have_phy = caps->may_have_phy;
@@ -4573,6 +4638,7 @@ static void phylink_sfp_module_remove(void *upstream)
 	struct phylink *pl = upstream;
 
 	phy_interface_zero(pl->sfp_interfaces);
+	phy_interface_zero(pl->sfp_module_interfaces);
 }
 
 static int phylink_add_sfp_mod_port(struct phylink *pl)
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index 83e0a2ad4b09..a6fe9f71174a 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -5,6 +5,7 @@
 #include <linux/phylink.h>
 
 enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_ADD,
 	FWNODE_PCS_PROVIDER_DEL,
 };
 
@@ -50,6 +51,28 @@ int unregister_fwnode_pcs_notifier(struct notifier_block *nb);
 struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 				   unsigned int index);
 
+/**
+ * fwnode_pcs_get_from_provider() - Retrieve a PCS from a specific provider
+ * @provider: PCS provider to use
+ * @fwnode: firmware node
+ * @index: index fwnode PCS handle in firmware node
+ *
+ * Get a PCS from the firmware node at index specifically provided by
+ * passed PCS provider.
+ *
+ * Unlike fwnode_pcs_get(), this function does not search the global list of
+ * PCS providers. The caller must provide the provider responsible for the
+ * referenced PCS.
+ *
+ * Returns: a pointer to the phylink_pcs, NULL or a negative error pointer. Can
+ * return -EINVAL if the PCS provider firmware node doesn't match the referenced
+ * firmware node or a negative error pointer (or NULL) from the PCS provider
+ * xlate function for the relevant firmware node and PCS handle index.
+ */
+struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+						 const struct fwnode_handle *fwnode,
+						 int index);
+
 /**
  * fwnode_pcs_matches_provider() - Check whether a PCS belongs to a provider
  * @provider: PCS provider to check
@@ -120,6 +143,14 @@ static inline struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwn
 	return ERR_PTR(-ENOENT);
 }
 
+static inline struct phylink_pcs *
+fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+			     const struct fwnode_handle *fwnode,
+			     int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 static inline bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
 					       const struct fwnode_handle *fwnode,
 					       struct phylink_pcs *pl_pcs)
-- 
2.55.0


