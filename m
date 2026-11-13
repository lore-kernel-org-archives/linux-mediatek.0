Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A176070088
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 00:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CSmboU4M;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k8/rMiou
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=; b=CSmboU4MTr+zXH
	zSdBkrGOoUBO94F8ezWLB7v2xyw7yrlp6iw09PW6HEUKUlFI6jQALiQLe/FfbOQZMNyISE3N14Y6p
	ETIDFDdTbNzpNS2kfeEl6wnCDwVoURHmWkK2Lp85n7hiv3xy6JUez9wDntNskL1/ITl7VjhaFDCkF
	/TF+MwVD34Pp49LQACGQ7vrzf+uU/3yY4Gj//stS3qRhpOeHMq1zX23876mCrP6OBvOlTIQB2hdwr
	dfVdc67g3+H3Zws4Q9KGF4XqO7j9zF0hqa0FF1C7gAaNCrOp2TSFnVR3DEAZWVIncN9edCyR6Dgsd
	3bSUYcH3dPz/rYxPljyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfE9-0000000BJvO-0DvO;
	Fri, 13 Nov 2026 00:33:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDx-0000000BJe5-41Rn
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 00:33:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-490d59c3edaso190519f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 16:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529980; x=1795134780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=;
        b=k8/rMiou4QZXXp7Se6+mpse5XZltT7qiXu92XTAtgzXU2wS0iQTjV9aMECpdzTIl7q
         EHR2odh9xfl3DSehhVt1VzvwTOscftygRkCH211IkGlGS86wMBzMvHTNoZ2bnTjd9nUF
         GxEmovQTcisZfnLjvQi7LbNZd2OWELLBz2pVR6hjwK3zekgpU27Egz4k7bPUsbvIU+Np
         ZfMYYI6W41lXLw+OzG/ZykMkC8LNCLJ2TBL/KFKv7Q7TE6nhMk1lxVtlu01sHoJkwduc
         DVLNqPPxP4SsdSZ7ds0PCPDz1VJ+F1BcN18jjV7oQYakJyoFB096ar7vjGoPaSBigbmj
         1m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529980; x=1795134780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=;
        b=hZTzW6Bk+A4SIb6Mqz7q1gAyZxteU3xe6VSuSAPJZFikB6VMDlJw4a5Qh5GXRGWPBD
         3NoX3PyB/OsYZiZ7pbTtePmZPaYJVigZPbxjvXNDBNqaDbkDK+Mzest2Xqb+vHU/z8wq
         9lik5E61J9Zjovw56lTDyeIE/XbENqV17fBFT1su+Q1Wenk3IhBIpsr/KkkErtqGuKml
         821t8TesxeFJOs2QgC6T+6O4AInlLzpR7A6sqq7fad7wyVrsFPopIlykYt65aVSi1K7w
         yqP4WPoRVH80gEymN4aY/otk6acj71pKCCYLpCHjUxgeOxIHDC/xKrVel6ywEgZqe1vU
         7QNQ==
X-Forwarded-Encrypted: i=1; AL+hErHki0FMQ48rOopoud4Z2i7UUOOFMXfEXNCCdmluPqg9Xm//gItWrIoPt9rVcNZ4+5jl16gO0rTgxIFeJZ4tkA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/EQzP7AkUZP79GbEEsOf/466KW5xcHvltKxBSaTyRX3B6GEDkt
	UgD6B1p1NoM67r+/y1TaaGmpYnJZDfcpq0vdIbO/dyjW7ByGxHxiBVC+
X-Gm-Gg: AYBFou2FVB9xmpGP5/OIEDnISbPuuyiVt6Zz35vzBnlImLvahHOoCmIXeNg6Qn/zNfJ
	amQsQdR6sVWRYZx1ee6f+8E3iIZskWzNlk7SOvVW5txmLcYOqfqpx+rNTxBvfAzuUhV/mz0IXpn
	1+qHxk2K+vZIokwdH4bTBHX71D1IISgFARjUscmWAadCW6OZwcFEl+7hWo1n3JosasMsLX27c5C
	2fhIl6bsKD0W67nmS47cJW7brvlCdDcwi7ASz0hcad0L+Py9gdJttc7cIo+0TttpfK+iH0Qd5+j
	/nITb0tjCkx52ndCOse6qvoedNMxLew4jGWoLTxZm0m+1aeEN8JydJXCaNIWS+vbfTtdHzL6iFH
	FZEv1viL7o3tudPzcqd0PN6iV6Ivliyr3g03PE1qAa4k9FS+5oH91q/zhlZw29I/fdELcwZloSB
	MFD4G6+XF5c/cno2m5D8fPvjQTsyLVf3bK/x01b9QByDzAdoE5PhCZH4SOEtBPbg3OnVsrWNMwD
	9eH6J8OhTTwLepMdJE+o9Bzyyz5o7L4qRFylUFMqMNCMdPZls0/m6IR3SvtuykzHdyyibbjJ2GS
	1QcOlNfiDEKSbfMk2rqQ+Z5S4tv03vX0LI1sWwwDRME3G3MngNq1xGW6M4k50hluV/kAOZFsldL
	e+j0MOXcAGrrDuZheAtC0ym3+UyFV8CxqfThaPvDSoWzjreMz+CMg+A==
X-Received: by 2002:a5d:4531:0:b0:491:eb12:e133 with SMTP id ffacd0b85a97d-49c6fc9db4emr1471691f8f.11.1794529980179;
        Thu, 12 Nov 2026 16:33:00 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:59 -0800 (PST)
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
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v19 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Fri, 13 Nov 2026 01:32:02 +0100
Message-ID: <20261113003217.197757-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163303_687097_75D2A0E3 
X-CRM114-Status: GOOD (  14.05  )
X-Spam-Score: -2.1 (--)
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
index 7f91cf3eb951..4f1e494beb8d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1050,6 +1050,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1762,6 +1768,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 418e8bec311d..e8c3f693336a 100644
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
2.55.0


