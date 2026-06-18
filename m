Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2782DCD98ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBpoQAlaT8nFCgwnSUFeme66HFsPGdI0rDUBeKbrcl8=; b=Gz2pUFk3K6LZ1l5wdvUexpaAE+
	AJYsFgOiT3LETvPEXVsZpgMykgVw0GPnC+w/rKUhWt06taBnOgStoSSPp6T8YEMzkw+IQ8llyTQ++
	lOq+3/1zb4gDOh2EqkLUV8p36YcZVR43VS+9u2X1lbInNsCKKmq8oFDW2PThu2kwubujtCMPRzNCP
	OJw3tdK4/JJ1c2HqBw/yhrCpahKSNF3PYVajsxmBX7MQAGNa9qZQf8KhzIX+LetMFxHabsCpweIBr
	Joafc07Iu6HgwiejQGIrn1f491XiirwXvq7p9qLqvxaRx0co7ssR+DbwFa6eRfyzQUJjMOPR0Fqb9
	VMmtHaMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCKS-00000001In6-1ZDu;
	Thu, 18 Jun 2026 12:58:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCKF-00000001IVH-0bDN
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 12:58:32 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49222b6e871so7993095e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2026 05:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787509; x=1782392309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBpoQAlaT8nFCgwnSUFeme66HFsPGdI0rDUBeKbrcl8=;
        b=gukV8D3DU05CnC2Xee9rTk6exPBvRfH6LYuNnVSW3PnIqkBPmFVIF1tsu/OUJRk1J5
         DNEql8GPWfZA0euZfMfTkBiahG0fovTJxoMsNk+4lVi2Y1/NqTkvtWcWPfzNOPAHf7r+
         DMl8caYJE6s1mrISc85uQOULE6VnDXhsSMov1JGUOGy5hlMSuQQ43jC8xaTklGPEiV8m
         og4e/G1XcY3W6yOU369ATAnmhlnjAyAV3wXfWJZ6tmNLxlnPMSZXUs2Fk5aTEM3l/sag
         oGfN3srAbSzlh46TaN3vvBxKMsSOOwZKeg5g4al+ulTtGWRoHP4dCsLOsTQwm+SYwSYV
         Jn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787509; x=1782392309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBpoQAlaT8nFCgwnSUFeme66HFsPGdI0rDUBeKbrcl8=;
        b=EsVW6kwFA0Yh01Wm0jjQrHZyaxA9hprlUAg/IrB8WE4gNyZV6TQBkq9n9op9A3HqFW
         RBP+8Ww6oHEOSjYgbbwGtpfIdQn0csCPetZgSTEMX706U3Y/sPOK/+malZbVX1nUFBrc
         C0n2ooJ4l+IgZaTltbfxWG3LmDr9Y9WggjINrPF/L5WUDko3eDTsFdRQeSNjiWNR0Q01
         5sI8sw6Y8DPmBS8Ny0wy/Wy/vfjeFJeWRXyC2Or2U+vgU1ISz65YcJMclu3HB7Pte+4U
         ovpAUulHRIcFMWzSxNITFWxDheoYoiIG90lOHHmRbK0ectl9keI52YAP8nmwR+aYKNVR
         4yBw==
X-Forwarded-Encrypted: i=1; AFNElJ/EfdEZScbILXpfcW8tbc+ul2QE5VPtknFMgmv4XYFynfWvviRg0knhVU1OOiFRoWapfUm5jYwoB/ZMF13Z+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdWFbmLAad9BCKIJjA/GSXpwR2U6IRCfloqqmkSbAJgLqVlrss
	t5zGA2hycPIQgeUym32ct3W4gW/MM+m5ywFwSCTwYu1W+yxpdOu9sk7n
X-Gm-Gg: AfdE7cmTXNa453oztQsAt6fq9xPE5yvT6EHQzEKvzxHUSanDJZuyQiaRy5IcvLfjQ/e
	saYnLJZ1Cm4o1uz13DF3CbUCn6AgdtTov5o9flG/A3DsbW15KxtCXtEhAvovb8kXinBSoMFDtC4
	qB/qwgys/NzF7bpRLr9R/UPUSyMByfrZdxYij2IQmGnt1g/fRNvzwPTQmeLtCVVoWvkfDeyqAHj
	dW4RHJf4ryyNdTWfd8KSy1XfDqGlk64jKT9/3y3q19gMBUvFv/znXvA7ony89pvNFrLUFucjMiD
	GyrnumRiiCqUdIGEkf4SxH9irD5JGKJIgI4L/5sbVAZSISawfGYgcasv2Q+x+YCAZXm9dHgyGSl
	ucYEqtfUjgWLem0amBKjaorPqNCoTl/DBLha2bhEYt2IcgyHBLHeBlWDBV1TWKrrCKNhZm8TBNz
	NHM+Q+na38hatmU09sHsT54fbDmSAF/9GXsoyMtYRIckOENJguxdAm19Z8wCJfEg==
X-Received: by 2002:a05:600c:3148:b0:490:b5d0:598e with SMTP id 5b1f17b1804b1-4923412f0e7mr127508315e9.21.1781787509280;
        Thu, 18 Jun 2026 05:58:29 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 18 Jun 2026 14:57:17 +0200
Message-ID: <20260618125752.1223-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_055831_209605_30804792 
X-CRM114-Status: GOOD (  14.27  )
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
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b9a212bd1206..b2b1d57dacd2 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1038,6 +1038,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1739,6 +1745,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 15e6b1a39dfe..ecf4c384fd31 100644
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
+ * pcs_link_up() - tear down link between MAC and PCS
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


