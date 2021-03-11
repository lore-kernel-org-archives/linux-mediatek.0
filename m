Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D15C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 02:12:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B016664FBF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 02:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B016664FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qnAXh4kiHs+0Xz12EHIt4wC5TI6l4mZ8kdXVs4Aq0ZQ=; b=FEZ1rvyFEtWEr5DKE6r+LgvGd
	hhIeu6YBimtrPHAp23C79H/WzyAvB+Pc56/x94JeP4GxK7jmivQp88XSCL/u7IQvlW8S8bBQc7PhC
	4Q9jys3FUpSuAv6N8u+JC87tEjVr4gAJSu/lN4LmD5V7xlfXl/5wRozezQ/9kCHDJixyUH3iUZ/Tx
	HD3TVa4GZndMQsxoMMcc/fuobepAzTnP0hk1thOrhNXEyKF1k/wvND60gOkgs12EOltP5s3mOrXcH
	Ah7rpey3fXMBZTR6ncx8rZGfrWlMQbLHAte+tTxTqfwNtQ8B6wKbcN67jCVgvfxFk2WfLT/EArPR6
	3N1gu7ZrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKAo3-008ESb-QC; Thu, 11 Mar 2021 02:12:07 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKAnd-008EOO-WC; Thu, 11 Mar 2021 02:11:44 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so8296660pjc.2; 
 Wed, 10 Mar 2021 18:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4eB/nkDB8WywIt0l6dz2tHl2O8kDpGdV2lwOJHNqcUc=;
 b=b4fS6+abyBz8ouSM5tHvmYgX9bb8z6+u9VUhLMiMV9jrTiyC2A4gEf4pIffMxuJhZ7
 xlU9OT2EWfcs9T5AH+7h6LCr6oOqOOReMeVdkgI2YNQmnFSxmzJPrL0l3gIaPYC/X1Cf
 aFCC5yhhkEckVapXl5kPVaH2moliSCMNX8lOSBD2RSsdA6zmp8CnCQAikmxyr7Mmr5VX
 rUij/JW2eOIS5j59Ywgd3jHJl+uYlkKqgguKDnrS/mDQOFXco2QIlW7iJPHpJKDvP7Ib
 TNxh4jFHeCltbWILufmG8SbzXyC3JAyo/jimfC+7wOj/E3AvXXWWUiFE11t68tcjUJ5y
 mllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4eB/nkDB8WywIt0l6dz2tHl2O8kDpGdV2lwOJHNqcUc=;
 b=AFcBnt2yy5HByANBQ4P0SciN7/wzqmx8TobK4ns2neFKNvVAEyqreoB9W/NiaZRnnL
 NLh6ckN+0dREJVaOklvgmqKKBHsgWQ5p49aDhOJTbRQm7wgCpJETeF42qQqg1HtLS1bx
 aBcoQ5mK7N8O7AdVjfG0O8M7GZrKnkmc6UBkBX21A/BHMQS5GHTWSvcNWF+GC2EjxTI2
 0HNggVzia7xiaMvSpOuiIfN2XkGBYaXz1V+oSiwm0UIReMpdwslOhZmPuBjfzxZ3Db2b
 VUL9VDVFfSIUEbGQM1Aguxppx/752oO69N52uuExfRY0fnl92hjaZ+Cc2V0Uce1Z7BZ8
 45ow==
X-Gm-Message-State: AOAM533sHaq15GFcCxTzdofaMu/sLliF4J4i64mAFQFU/vm6jRtNgwB8
 iyYX/nyBjFirWmR5XhQyAeo=
X-Google-Smtp-Source: ABdhPJwpHtrc/BuEVZnFuQctlYwyq5FgZvAVXrzXzQNwkqcADujjyNsApngDaYJlHkujwOA1RmiubQ==
X-Received: by 2002:a17:902:b942:b029:e4:87be:be8c with SMTP id
 h2-20020a170902b942b02900e487bebe8cmr5525396pls.81.1615428700577; 
 Wed, 10 Mar 2021 18:11:40 -0800 (PST)
Received: from z640-arch.lan ([2602:61:738f:1000::678])
 by smtp.gmail.com with ESMTPSA id p190sm672603pga.78.2021.03.10.18.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 18:11:40 -0800 (PST)
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
 v2 3/3] net: dsa: mt7530: disable TRGMII clock at reconfigure
Date: Wed, 10 Mar 2021 18:09:54 -0800
Message-Id: <20210311020954.842341-3-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210311020954.842341-1-ilya.lipnitskiy@gmail.com>
References: <20210311020954.842341-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_021142_493160_7088D08B 
X-CRM114-Status: GOOD (  13.52  )
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

Disable both core and TRGMII Tx clocks prior to reconfiguring.
Previously, only the core clock was disabled, but not TRGMII Tx clock.
So disable both, then configure them, then re-enable both, for
consistency.

Reword the comment about core_write_mmd_indirect for clarity.

Tested on Ubiquiti ER-X running the GMAC and MT7530 in TRGMII mode.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/dsa/mt7530.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 80a35caf920e..7ef5e7c23e05 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -435,15 +435,18 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
 			     TD_DM_DRVP(8) | TD_DM_DRVN(8));
 
-	/* Setup core clock for MT7530 */
-	/* Disable MT7530 core clock */
-	core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
-
-	/* Disable PLL, since phy_device has not yet been created
-	 * provided for phy_[read,write]_mmd_indirect is called, we
-	 * provide our own core_write_mmd_indirect to complete this
-	 * function.
+	/* Since phy_device has not yet been created and
+	 * phy_[read,write]_mmd_indirect is not available, we provide our own
+	 * core_write_mmd_indirect with core_{clear,write,set} wrappers to
+	 * complete this function.
 	 */
+
+	/* Disable MT7530 core and TRGMII Tx clocks */
+	core_clear(priv, CORE_TRGMII_GSW_CLK_CG,
+		   REG_GSWCK_EN | REG_TRGMIICK_EN);
+
+	/* Setup core clock for MT7530 */
+	/* Disable PLL */
 	core_write(priv, CORE_GSWPLL_GRP1, 0);
 
 	/* Set core clock into 500Mhz */
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
