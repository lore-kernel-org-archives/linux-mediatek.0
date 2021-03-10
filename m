Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58E2C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 21:22:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D3B64FE2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 21:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41D3B64FE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DNYjQ+jnxDTaexqfI9SDcwqrekEgzMDf/rSrGX82vSo=; b=JE68rYGG5NXoVkGbHtWmV+CkNx
	3A1valXZdFruF+eZSo3JTPtEKuHt+q0TxoCk7SxPWv3yhDv7g44tFSlZ98sPz988qG++MMEJMV8Ak
	vVEZckI9xNVJKUrto6xq7B1LAWdBjPe4XPGACsPV0C6zW2ztFchWkNI4zCSSATzoR4lh3LMfg3PPs
	XDdH+hrCNAW7HbKv4/HUeB1kZ8+0nmHcA6ckZob2VlAw6xp7MUlTDTM8nienwAIcW5Iedo6603ooy
	go9hLJDt9D5Wg2A2Uctkj9H719XenLoPQVMnPD7Op1NNZFZloGraHtiQYqrCaC1e8xUo+zW8b+K4L
	Noz9Royg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK6HU-007miQ-0Z; Wed, 10 Mar 2021 21:22:12 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK69z-007kRE-6n; Wed, 10 Mar 2021 21:14:34 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so7944663pjh.1; 
 Wed, 10 Mar 2021 13:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4FsyvPll9hketVRRLkgN32e9nK5xbA0yUQ+/xWtjN5A=;
 b=sS6imgOph8gR00hEK59z03oQEPnKC5OOit9DuHc9a9zW2bnRVXnbj4Sw2fC032b0w1
 Z40vFIAbd7Yg2JVUAlD0lsjjiKM5UyAS4EBh/3RAhonPZdbdzZcrXYiidJo2DkgJX2nL
 iiny/jjkthqyHfBbwuEkA44ykbHmGoMM97WzSzveom1U4u9koOGpnryhADOT/I6WTQ3u
 IH6mSU5vuAWSxYl6cCvbPWu2QDBsWEaMnM1KP2S0K5uk6gp0ZG/JBh1LXBnnibnqDEA2
 6H7ZYyd/lbb+asSbJAIYAIMIALiWGYV8PnZXdwrX/iXVy5Khvx/t581cLa1Preoz7UaU
 M6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4FsyvPll9hketVRRLkgN32e9nK5xbA0yUQ+/xWtjN5A=;
 b=D9Vh0P4VKvkSjpz91SJtmzuhowtK00eGI9ypdo4AQVoIdf65tgpNF07cBdW8pwz9w7
 yppoLumY753pyLfDOVtfDOqu/JaqcGTd1GkvPGfQYUgG9nDI/y7cwEwxREu27JwUTu+Y
 JLMETulgiFyOFhN7kfSIrQbbwkzNfLYRXPFL4PwP7nmYdeljJn1hbgj55mudhg5+u6Rg
 yfsjPIZSeR09AkUhMteggLM+znpi4Qhl/2Yy7kOm7wO7gwlQYGbi2OvJWF+BNMByQ1FC
 JTdIYje5ibqBNB8zWYxxW4qBEx5UJQthwZW3gKQknvGUoX78egF7LmdnFCM2Mz7UzhTC
 dDNg==
X-Gm-Message-State: AOAM530eaE4kM+9HxHIjJCcOTp7l64iH+EtTx7rtZ9LT6d34vjtQJVTU
 NA4EXRaZ1kri0I5j0r8H+X0=
X-Google-Smtp-Source: ABdhPJw4sfCLQailZ4/acL2LUKzPF+3TwjE25+ZJKEaff5COFkOBbZnQseKx/45xHgF0zVbL/vIMLA==
X-Received: by 2002:a17:90b:3890:: with SMTP id
 mu16mr5447946pjb.9.1615410865096; 
 Wed, 10 Mar 2021 13:14:25 -0800 (PST)
Received: from ilya-fury.lan ([2602:61:738f:1000::b87])
 by smtp.gmail.com with ESMTPSA id 35sm412090pgr.14.2021.03.10.13.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 13:14:24 -0800 (PST)
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
Subject: [PATCH 1/3] net: dsa: mt7530: remove redundant clock enables
Date: Wed, 10 Mar 2021 13:14:18 -0800
Message-Id: <20210310211420.649985-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_211428_502687_EFF062D7 
X-CRM114-Status: GOOD (  11.09  )
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

In RGMII mode, the REG_GSWCK_EN bit of CORE_TRGMII_GSW_CLK_CG gets
set three times in a row. In TRGMII mode, two times. Simplify the code
and only set it once for both modes.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/dsa/mt7530.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index f06f5fa2f898..e785f80f966b 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -461,12 +461,9 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 			   RG_GSWPLL_POSDIV_200M(2) |
 			   RG_GSWPLL_FBKDIV_200M(32));
 
-		/* Enable MT7530 core clock */
-		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
 	}
 
 	/* Setup the MT7530 TRGMII Tx Clock */
-	core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_GSWCK_EN);
 	core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));
 	core_write(priv, CORE_PLL_GROUP6, RG_LCDDS_PCW_NCPO0(0));
 	core_write(priv, CORE_PLL_GROUP10, RG_LCDDS_SSC_DELTA(ssc_delta));
@@ -480,6 +477,8 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	core_write(priv, CORE_PLL_GROUP7,
 		   RG_LCDDS_PCW_NCPO_CHG | RG_LCCDS_C(3) |
 		   RG_LCDDS_PWDB | RG_LCDDS_ISO_EN);
+
+	/* Enable MT7530 core and TRGMII Tx clocks */
 	core_set(priv, CORE_TRGMII_GSW_CLK_CG,
 		 REG_GSWCK_EN | REG_TRGMIICK_EN);
 
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
