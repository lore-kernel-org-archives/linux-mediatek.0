Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7993EC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 12:40:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF7261026
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 12:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EF7261026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+6TdoHT7Iglz08/ItBuLclHRolBxSk1Zud6nBEZDRVc=; b=navxllDUp7cjMPrcYux+J109m
	ObDvpiPv+vZt/ayeWBDq0YGuKpN4drwQscW6ILXdMBCo913d9oVyr2xbFeBts/ra/CXAlN9wYtknY
	yZDQWK7QxvWxyDpSDEMng/6p8WgDKDheqY2JQHWLme7NQZVxetBAAu7+174fH4PDZ0BkGbl48WoyE
	CG0RqMfedb52o5sGmGa3ib6lFIWiJPLM4vHNd19q5cLlVDGh3fqCM0+Q40+X9YENhKGLTpCf2tfvD
	Vrqg6KfAf5NGB6WupOLUo2tDpxsAlYGBTSaunoJyHXB/BHJpglRu2xKxjlBwEduOnK3YtpAryFtaw
	6FtXGvDFQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUTx0-0081YK-0Q; Thu, 08 Apr 2021 12:39:58 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUTww-0081Wf-6Q
 for linux-mediatek@lists.infradead.org; Thu, 08 Apr 2021 12:39:55 +0000
Received: by mail-pg1-x52c.google.com with SMTP id l76so1319916pga.6
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Apr 2021 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VzV7lyQln0XA1JCgSeiUWDox5dSI+LspNrlFJBEvVLU=;
 b=QIWyO0KBwbb5dGIuEFslPQ/f53R82wAXpF7mjSFJR3GGw+u2+NKsqHi1jTpyAmpEkO
 FgRBI8rx08Gqu0SK1G7LMVN7SE2S02IptIAI3MM77KjYfhGVz4i5oKQ8YZ6sf8njcoPS
 IuUBTp4eg1/e0iIrFWpQ1oDnuwJm/krfqAqjlbodf9VbkLxKaPTM68PYtfYNVogTOZrB
 eGdGuDZ9+XA150W4RqNg0DhhTnQwMMNL9nzm1wG+9VPH81sGM5qYKwBEeYrcxyf6ZtiH
 ijK/gkBu893mLqTVPRnXrhgP8rJ7oQGnG/v1isisnlJ3mXVS0vgwMdHRMnuZNvpPwOuz
 ZrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VzV7lyQln0XA1JCgSeiUWDox5dSI+LspNrlFJBEvVLU=;
 b=mduhAOYfDdDy+q/trFLs1b9+B/Ha8O4xYxpONr2VgZ4wL799q56pO/nneEkIoZF/HQ
 z6TVJi/QvgLlJGSq+DWn8I0Q47Tdef/yCUPPbVj47Aqs2th/X1PWjyxznGMdMka863N3
 B0R20qNUPieTv3PPdATCrN1KSluaBOuSZv9O5XrNK64njHicRFa38qa/IubJzWuJcDc8
 YsPCtoSPG/OTtYWLigy1YfvcxdliRNNyNfaZQQmjbbX3DwILifHGwgm/HZ8gBT5Z3TED
 aQYN2Xvgl6gBGziP324mYqDH94kcUp0O30tpEi2Yxx6ByTYAVgce/4KethnZEfKY2hSi
 FZMw==
X-Gm-Message-State: AOAM530nif3hkiqcVaFFKAaoyRRelY7N8JQeK7entsxQyZWF4O0HEFZY
 UV/3CHVijANAQOSConrhMB0=
X-Google-Smtp-Source: ABdhPJyp9VaFPFEAmeGKoQRHaTt2iO4zA2XvAzS+8Y/ejS0RpUBAyI51ofexpaE0Z60Yve2L8YNZeQ==
X-Received: by 2002:a63:d449:: with SMTP id i9mr7609621pgj.227.1617885592981; 
 Thu, 08 Apr 2021 05:39:52 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id e65sm25831311pfe.9.2021.04.08.05.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 05:39:52 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: [RFC v3 net-next 3/4] dt-bindings: net: dsa: add MT7530 interrupt
 controller binding
Date: Thu,  8 Apr 2021 20:39:18 +0800
Message-Id: <20210408123919.2528516-4-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408123919.2528516-1-dqfext@gmail.com>
References: <20210408123919.2528516-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_133954_412577_A645F34F 
X-CRM114-Status: GOOD (  11.20  )
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

Add device tree binding to support MT7530 interrupt controller.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
RFC v2 -> RFC v3:
- No changes.

 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index de04626a8e9d..26b34888eb62 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -81,6 +81,11 @@ Optional properties:
 - gpio-controller: Boolean; if defined, MT7530's LED controller will run on
 	GPIO mode.
 - #gpio-cells: Must be 2 if gpio-controller is defined.
+- interrupt-controller: Boolean; Enables the internal interrupt controller.
+
+If interrupt-controller is defined, the following property is required.
+
+- interrupts: Parent interrupt for the interrupt controller.
 
 See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
 required, optional properties and how the integrated switch subnodes must
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
