Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654CCC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 05:56:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3A04619DC
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 05:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3A04619DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IvmqaqOMghUQ6Igl1fWL3euP/J7F9WOeXVgD9bQP124=; b=kw5ZH51cG9aCwKO1Oel8fcR2EA
	oOkLXw0iW51sGcymlxcRMhd2LiT8SFUdfy+HvuiOXqcgLZArXDvNv2td65zFf38KoJtHkCN0ajF0u
	34OL68NLb78EPSnfN0kKHIUYJEW2/dRNt8HGMp+iZcZnIg/CzNq+uHtQrcyAi0jWOUPap3P3yPxyX
	Cf9CILLfw477HixGvqXKOo6uvPApjcA7sF4zszFuS76ZAEZCYbMAbcjHPoPU83j548oSeg9sFr8qZ
	UYoc2ITwCKljMMhTJeA4RFjYnfMQ7ZUXhnQ3M1SCV1dEAyMT9F+Jz9OFzdvv4T9CtvCiSNQKPN0z8
	NOupYWQw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQ1wB-004ltm-Bp; Sat, 27 Mar 2021 05:56:43 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQ1w0-004lse-6E; Sat, 27 Mar 2021 05:56:34 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so6450994pjb.1; 
 Fri, 26 Mar 2021 22:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=212MoIVRmwK8MrQbEae/kGIbB/Uja/t6Mnpd6kWTsUU=;
 b=HbGy5MIdIAKe4cdEy4h9zPL3jYPNEHDEnmVLXXNVZkMGe/AO9bdLYBPicsmc1D6K7b
 TSl+S59c/H0nU/SfV81A+TIaoIgjOqHk+2dcWihriXQKYB4/ZiTzklSU1DEahfZB/xjc
 ERXYt2QndXOT/Gj6bUGMTAiPWG4uUhgbsyebfu9m1UnHEEYgoa2CGlv/Ue3isanBJMlG
 Y01qsuK8z/mfxdc6dh7MnEdVpW7UlQEy94DIiTBClQPIWPVqFZ0WYRDCRGOSlpxTGSZa
 qRVeVTXWW3YY7lkG2MP1+KVMwERh58/+7lwb21fGIvD/ob9SEGbXut3Cn0MnJSlwIgri
 BnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=212MoIVRmwK8MrQbEae/kGIbB/Uja/t6Mnpd6kWTsUU=;
 b=fOolqASk9FEbqh4iSl+8gK71ARY3OVZDIQB0MTRMEM0ZlrE7PaCG5w9aOPfi1q6Rk1
 e0wmYR+0OeR36YhTPAvMSVNwlITlRwzO1ETnnKyQmxQsj4t6gdoxn4Xvdk9A6w292yWB
 7OKZATwme3MAtih9bArCka2Tpe5t3SIlx1SFji66qUhXI2ILmiEDoNm/KYJMZU4uf3jo
 6pp8AT6F4yP3tAiDXYflZuRbrycemgTxesQGtCsNGAeEdogKt2nC+phN8ld8NoeJbuEO
 eTYsAWbnUquLa0HkQLqqPBCIn5B34sgU8AVRMg0GQWHHmJlFcTCTrVGKwMzdsXC3lQY0
 FscQ==
X-Gm-Message-State: AOAM530bxGDe3F8uAoJvxO/2HXbYCrtzy5T39GqI6W54jO24o49azmWB
 V1GniorWz3Efw5XVmJrgFEM=
X-Google-Smtp-Source: ABdhPJxzA9XdjlCSbCP7CyG6gFx1hOmk9q2sUZ/8rk9EuAHbpFGpjIXBzMuVYbvLKRFForn/2YjhaQ==
X-Received: by 2002:a17:90b:307:: with SMTP id
 ay7mr16895037pjb.110.1616824587295; 
 Fri, 26 Mar 2021 22:56:27 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id q25sm10477521pfh.34.2021.03.26.22.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 22:56:27 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next] net: dsa: mt7530: clean up core and TRGMII clock
 setup
Date: Fri, 26 Mar 2021 22:55:43 -0700
Message-Id: <20210327055543.473099-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_055632_496868_0FD88C4A 
X-CRM114-Status: GOOD (  15.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Three minor changes:

- When disabling PLL, there is no need to call core_write_mmd_indirect
  directly, use the core_write wrapper instead like the rest of the code
  in the function does. This change helps with consistency and
  readability. Move the comment to the definition of
  core_write_mmd_indirect where it belongs.

- Disable both core and TRGMII Tx clocks prior to reconfiguring.
  Previously, only the core clock was disabled, but not TRGMII Tx clock.
  So disable both, then configure them, then re-enable both, for
  consistency.

- The core clock enable bit (REG_GSWCK_EN) is written redundantly three
  times. Simplify the code and only write the register only once at the
  end of clock reconfiguration to enable both core and TRGMII Tx clocks.

Tested on Ubiquiti ER-X running the GMAC0 and MT7530 in TRGMII mode.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/dsa/mt7530.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c442a5885fca..d779f40d46d9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -67,6 +67,11 @@ static const struct mt7530_mib_desc mt7530_mib[] = {
 	MIB_DESC(1, 0xb8, "RxArlDrop"),
 };
 
+/* Since phy_device has not yet been created and
+ * phy_[read,write]_mmd_indirect is not available, we provide our own
+ * core_write_mmd_indirect with core_{clear,write,set} wrappers to
+ * complete this function.
+ */
 static int
 core_read_mmd_indirect(struct mt7530_priv *priv, int prtad, int devad)
 {
@@ -435,19 +440,13 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
 			     TD_DM_DRVP(8) | TD_DM_DRVN(8));
 
-	/* Setup core clock for MT7530 */
-	/* Disable MT7530 core clock */
-	core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
+	/* Disable MT7530 core and TRGMII Tx clocks */
+	core_clear(priv, CORE_TRGMII_GSW_CLK_CG,
+		   REG_GSWCK_EN | REG_TRGMIICK_EN);
 
-	/* Disable PLL, since phy_device has not yet been created
-	 * provided for phy_[read,write]_mmd_indirect is called, we
-	 * provide our own core_write_mmd_indirect to complete this
-	 * function.
-	 */
-	core_write_mmd_indirect(priv,
-				CORE_GSWPLL_GRP1,
-				MDIO_MMD_VEND2,
-				0);
+	/* Setup core clock for MT7530 */
+	/* Disable PLL */
+	core_write(priv, CORE_GSWPLL_GRP1, 0);
 
 	/* Set core clock into 500Mhz */
 	core_write(priv, CORE_GSWPLL_GRP2,
@@ -460,11 +459,7 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 		   RG_GSWPLL_POSDIV_200M(2) |
 		   RG_GSWPLL_FBKDIV_200M(32));
 
-	/* Enable MT7530 core clock */
-	core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
-
 	/* Setup the MT7530 TRGMII Tx Clock */
-	core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
 	core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));
 	core_write(priv, CORE_PLL_GROUP6, RG_LCDDS_PCW_NCPO0(0));
 	core_write(priv, CORE_PLL_GROUP10, RG_LCDDS_SSC_DELTA(ssc_delta));
@@ -478,6 +473,8 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	core_write(priv, CORE_PLL_GROUP7,
 		   RG_LCDDS_PCW_NCPO_CHG | RG_LCCDS_C(3) |
 		   RG_LCDDS_PWDB | RG_LCDDS_ISO_EN);
+
+	/* Enable MT7530 core and TRGMII Tx clocks */
 	core_set(priv, CORE_TRGMII_GSW_CLK_CG,
 		 REG_GSWCK_EN | REG_TRGMIICK_EN);
 
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
