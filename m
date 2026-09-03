Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EF7C61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 12:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mnwb6hERpnN0nOzAPeu6lXZdqPLOGboK0OSUAEKDpNw=; b=yN6+m66Eoq3RltYE2znp4xIs5/
	sSIhExBO9Jhy8E//siHbvlcgEr2sNaZba5QSFZ8KhFlsCMfy4wOPWxCHc93XbBzpg0rs+eLLOY3Vz
	kS/w6xOUtRvYXHR8D7lms8cCNBbNqxxP+rrM6g+wbjRG59Y7kHzDRrnNX/WoBRXQGw91AP0oLpuvK
	kQKaVas1gP4udnILyLf8hxB1vS817VsCp788ZITgpFp1OMOTVvCe6EBw7tbkCgCdTKgtrkKdiscQv
	R9hJdyHZ/PpWk9nx0BmAnBChJwBeC4+7qgG5RuIG8/Khy1CVwDQaOwgeYPv3CjdtlKeUl2vpOUo3p
	nv6E2qmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26gY-0000000HJUK-1lsC;
	Thu, 03 Sep 2026 12:36:54 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26gU-0000000HJQg-3Iw0
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 12:36:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-495590dde14so26073235e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Sep 2026 05:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788439009; x=1789043809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mnwb6hERpnN0nOzAPeu6lXZdqPLOGboK0OSUAEKDpNw=;
        b=aL7DzcK0ihNMetHasVmlOd2T3ts7MAnRN12On2s7BiiEF8KcV3Ay3p3v0dEQldJ0RE
         hZmLU3r638PUBmcl7DrO32FG2TCkhMPlcZvZaaZ0eI5hn5j4vJQL4APY5XjGYysmbVR5
         uBk5hjRitX+JFbbWxIq22Fi5bxuhDXE/+qaXOrpjixITIx1q8TYMT6k1JNLCbdxUAn1n
         hUCX7jjTCOEfqVDjCNxpdUmEmv8CKnbbSiGyq/hFFJKiXc0aDAx6fSrqHjUwVa+akjYq
         7FJA2LOflbCcngidp1/wvOdYz7xANiXSagujWe87k66O8cc0+Gq9yPei868j3KMvnBF5
         Hxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439009; x=1789043809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mnwb6hERpnN0nOzAPeu6lXZdqPLOGboK0OSUAEKDpNw=;
        b=o3dQwzklJSztE1f5NdfyPROhIff+/+NW6cBlB7m5Nq+h4ypQJCwc0g8/t3AuBW3paK
         39GphVQK8GLtnbKJsMouPsAyH6s1esVK3DY70Bh1MfdxA+FfpY/qCDz3KckZESog+hoe
         nEIHhP+O4CNqFSUlRcy3rUSp/6jI58pzIlwP3I6JVGqjaDkE5A/CeSFStfFQ9JLm0RWr
         R0fRnAswal4iEZLbbEvPBzY+/3bdNABBY9Nk5MLYYNkQ/fRwNIhkTOxkwFPBeZwxfXcD
         ZtLaJLCNn2b7IVWvXox6EhrRwERDYZmdgCi2V78CgAhgYF72QQn7NzuGo4gWNJBhozgu
         8FsA==
X-Forwarded-Encrypted: i=1; AKwUvBzzynr9yT0ONIN64gVU++XBTqogDfv53i1mtTs8XhRxnCgu2IAiJun2O9/WY7KDY+vDBrGUTyfCurKzm7oocQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nATNbSOOe5dFW7XD6P9CWjyRpU3CVE/nKU5bVF982hUnGTU63r
	dEm7rCFm4G7/ITuHzrsh6k7z77ROVI8akYdTiidTx3Aar9hiXQ3lZkHmRVeXCVn84wI=
X-Gm-Gg: AYBFou38UNO26iIdPg118sQOKoclWv9cXtzf0xXPIQm0jFcnIu5+LiU4Z4MQ+89lFuT
	Q9jhTBK8BZhb0EW90BsDzYWLKLMOAN18HPjSPkhSk6OKUHXAC6+yTgWwdcR7CspZ329aGfUwlUk
	9TiCeprmKLnfIJqkUTK3oGu8H/KM1mQzkj5WusvCPw7GJKOaEk2tg2pw2mEjtGgNBh/k5hHA1Y4
	fCl7aLNglJjXGb5omUyZG1FsQ1h79JcAYCOHbTH9UWv2xf/qUy0iDYx0aIybGanAT7w6br1/hwC
	YzcWU3v08uFoOL0cLuzeX1+Fss8qVtUWiadZ5QuTqDUmjcmmmt0gUafcUMlB1oMz/ZQ3OghdrWn
	Hi6UOMkPoCmtE4vvAbMWEBZPMitijYMpymHOeo3fZBoL1QjPuMYeQAMFAByoG+YvrYEm2bs0jT+
	SGSMvhp8wSPNot683ySo6K4xwAi+bSOoXb5I8mPsfNyObu3is7H1g=
X-Received: by 2002:a05:600c:3b11:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49ce5843baemr202157645e9.13.1788439008740;
        Thu, 03 Sep 2026 05:36:48 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72d2asm12828927f8f.8.2026.09.03.05.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:36:48 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	nbd@nbd.name,
	lorenzo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: linux@armlinux.org.uk,
	dqfext@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v5 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Thu,  3 Sep 2026 12:36:43 +0000
Message-ID: <20260903123644.23800-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903123644.23800-1-f@lex.la>
References: <20260903123644.23800-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_053650_850741_7566FA9F 
X-CRM114-Status: GOOD (  17.46  )
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

phylink_create() decides once and for all that a MAC supports managed
EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
lpi_interfaces. mt753x_phylink_get_caps() leaves lpi_interfaces empty.

So ever since the conversion to phylink managed EEE, ethtool has
answered "Not supported" on every mt753x port, and phy_disable_eee()
has locked userspace out of turning EEE on. That undoes what
commit 06dfcd4098cf ("net: dsa: mt7530: fix enabling EEE on MT7531
switch on all boards") arranged: EEE off by default, but reachable
with ethtool.

Leave the speeds above 1 Gbps out of both bitmaps. PMCR folds
SPEED_2500 and SPEED_10000 onto PMCR_FORCE_SPEED_1000, so
PMCR_FORCE_EEE1G would govern LPI on such a link, and that is
unvalidated rather than known unsupported: MediaTek's SDK driver sets
the EEE force bits for 100 Mbps and 1 Gbps only, and the unit of the
wakeup timers is undocumented with the port clock at 2.5 times the
rate.

LPI stays off until userspace enables it, but the EEE advertisement of
a PHY that advertises it out of reset comes back, since phylink stops
force-clearing it.

Fixes: 9cf21773f535 ("net: dsa: mt7530: convert to phylink managed EEE")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Ports that support neither 100 Mbps nor 1 Gbps are skipped because on
MT7988, EN7581 and AN7583 port 6 is 10 Gbps only and shares
PHY_INTERFACE_MODE_INTERNAL with the user ports, so the interface mask
alone cannot tell them apart. MT7531's internal PHYs keep the
advertisement mt7531_setup() zeroed and EN7528 keeps both bitmaps
empty, so EEE stays fully off there.

Two pre-existing things this patch makes live, neither addressed here:

- The unit of LPI_THRESH is still unspecified, as the comment above
  lpi_timer_default says. Before the phylink conversion
  mt753x_set_mac_eee() wrote tx_lpi_timer into the field directly, so
  the raw unit has always been what ethtool showed on these ports.

- mt753x_phylink_mac_enable_tx_lpi() sets the PMCR force-EEE bits
  without checking the resolved speed or interface, relying entirely on
  phylink never calling it above 1 Gbps. A check there would make the
  driver robust independently of lpi_interfaces being right.

v2, with the full argument for leaving the higher speeds out:
https://lore.kernel.org/netdev/20260824024117.46154-2-f@lex.la/

v4: lpi_capabilities is mac_capabilities masked to the two speeds
instead of both asserted. Every port that reaches the guard today has
both speeds, so nothing changes; it only stops the bitmap from claiming
a speed a port cannot link at.

v5: comments cut to one line (Maxime Chevallier); no code change.

 drivers/net/dsa/mt7530.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2b7be091c056..3e61eb3c2b1e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3172,23 +3172,31 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 
 	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
 
+	priv->info->mac_port_get_caps(ds, port, config);
+
 	/* The EN7528 GPHYs report EEE capability, but negotiating EEE with
 	 * common link partners (e.g. Realtek GbE NICs) results in an unstable
 	 * link with dropped frames. Leave the LPI capabilities empty so that
 	 * phylink disables EEE on these PHYs and refuses to enable it from
 	 * userspace.
 	 */
-	if (priv->id != ID_EN7528) {
+	if (priv->id != ID_EN7528 &&
+	    config->mac_capabilities & (MAC_100FD | MAC_1000FD)) {
 		u32 eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
 
-		config->lpi_capabilities = MAC_100FD | MAC_1000FD | MAC_2500FD;
+		/* LPI above 1 Gbps is not supported */
+		config->lpi_capabilities = config->mac_capabilities &
+					   (MAC_100FD | MAC_1000FD);
+		phy_interface_copy(config->lpi_interfaces,
+				   config->supported_interfaces);
+		__clear_bit(PHY_INTERFACE_MODE_2500BASEX,
+			    config->lpi_interfaces);
+
 		/* tx_lpi_timer should be in microseconds. The time units for
 		 * LPI threshold are unspecified.
 		 */
 		config->lpi_timer_default = FIELD_GET(LPI_THRESH_MASK, eeecr);
 	}
-
-	priv->info->mac_port_get_caps(ds, port, config);
 }
 
 static int mt753x_pcs_validate(struct phylink_pcs *pcs,
-- 
2.53.0


