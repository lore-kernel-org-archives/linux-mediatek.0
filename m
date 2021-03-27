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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E542AC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 06:08:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DE0D619D3
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 06:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DE0D619D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ffnWV7mtqSXsxjAHDS94tT5l3+1y1U6o7ec4sRSkbT8=; b=b9K1WC7GTuJJleKmH3i07FOLq
	1LAqTuoOPZ7rNJVoW7rg7pL+iIcvc0xFzTjW8pR/d6q2cKRxlK6pbpJmFrydn+butrTTpgrgOt8Ku
	OxIQaTWnVcV4K75hQXghjquMn2HvNelc/IiEb+r5R+1FPk+Dvdh/bF6tWBjbAht3KbTevU79tyAuK
	eU/u27XsOFh+pG+R2snDpvpx5XnrABHGbTWgRu/6Qf/cgRF3F8/Hh6y4WBWRex2n5eyJHks/l7gAZ
	rBB5AnzVil4LWQGu1RDux8ffd1xYudPVMgxb6u0vLl8ay544T2+WL4rRRv0r8AVGsFbu5FNn3gSHT
	xUOtnnwOA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQ27G-004mwf-6o; Sat, 27 Mar 2021 06:08:10 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQ276-004mw1-Em; Sat, 27 Mar 2021 06:08:02 +0000
Received: by mail-pg1-x535.google.com with SMTP id 32so6030943pgm.1;
 Fri, 26 Mar 2021 23:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWHAq67WtUfBkQ1gKa/GLNLXtx3wsfXb42bm9Q2dUIw=;
 b=iGuCDDCCSLzOJZLkvL8FKN4srNRaWpeJyzWh7IENO1Xsp+p/LRBaduih39M/eI9w9D
 jFZMX9TC3yRplCoXiF0SQP9k2SPPViJisj5t8zuald885Ud4leRTx7GB/D40EHN7K8Ya
 T/ArbEyPE+FwqKOT4/zlmwY4VnJeQLUR7mpW15VM3zShCYKUQVzjVtJTyu7rcuhMYD7n
 oHbpwW+pPXq8efGfd9lgwx7V0ZrUYW9U1WsJiyLWy9l+AFK48CGACPcsl7StAcv0zMpl
 7qTxYBeO6R4Tnq4wmDhe/Fj/2Tm2HTrlOTtqnjr3Hmk3mK3HxEK4wpyKfV7ia+sDqL2f
 SDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWHAq67WtUfBkQ1gKa/GLNLXtx3wsfXb42bm9Q2dUIw=;
 b=GmLfzZoS+33lW97vBvLKjoX+axEGhX0orITRQAUuF83+NqV8RBitOqM60oBbxrvQWI
 8RI6vak4sUfqZp2yPGfLKvohO1vVTvFaLMGpxRECwwqTiCVCGwlUhyZwKYpmyQj33ma0
 R2rWlRiUGqillpKV+2SIgBwmx7/j54d3FbrS7/XT1P+4T2WA86TZ35BoFFr0/4/XMmAf
 Zjd5ab/FHJAQEvgUsoccei4JV3xAkP4iqUxf7Xv4l3MljcL9As42qreGBc3gJMfVVEXL
 9Haz/tUrzne0cGJZKNWr1QCFQ+cxwCfc7JLpG99D/1+gX7gDXbpgExLun1LbYizAkhtE
 XUEA==
X-Gm-Message-State: AOAM530/Gvm6qL1s0PQgI7S/TVvqivHzW4Fpu5vJmzLevtR5YvDTeScZ
 fqso+GReU9QTYse7fBKNSVo=
X-Google-Smtp-Source: ABdhPJzS/Xl8JjciKMul/Yyn/G/TvKxIhsFlJU+pjB6636PT98PdIqvft5Tgm9PrUsIMyu69HChUtQ==
X-Received: by 2002:a63:525c:: with SMTP id s28mr15118967pgl.317.1616825274706; 
 Fri, 26 Mar 2021 23:07:54 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id e131sm11531843pfh.176.2021.03.26.23.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 23:07:54 -0700 (PDT)
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
Subject: [PATCH net-next,
 v2] net: dsa: mt7530: clean up core and TRGMII clock setup
Date: Fri, 26 Mar 2021 23:07:52 -0700
Message-Id: <20210327060752.474627-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210327055543.473099-1-ilya.lipnitskiy@gmail.com>
References: <20210327055543.473099-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_060800_617517_837C9C0B 
X-CRM114-Status: GOOD (  16.60  )
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
  core_read_mmd_indirect where it belongs.

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
index c442a5885fca..2bd1bab71497 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -67,6 +67,11 @@ static const struct mt7530_mib_desc mt7530_mib[] = {
 	MIB_DESC(1, 0xb8, "RxArlDrop"),
 };
 
+/* Since phy_device has not yet been created and
+ * phy_{read,write}_mmd_indirect is not available, we provide our own
+ * core_{read,write}_mmd_indirect with core_{clear,write,set} wrappers
+ * to complete this function.
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
