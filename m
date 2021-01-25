Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92542C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 04:44:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CE3122CA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 04:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CE3122CA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B3+7WUEYbyb6aft7JYnbHudidtyEScHrFcetY5/qriM=; b=GL16+2keSEN6l5a27gcMozGRL
	d6oQNIeWgf01uH3A+Keeltqygj1pBPKbM0i1B6Xu7kwRu1BX+DM8a1X/fh3M6De0HdOB78L1hjtsr
	VKizb1ew8EED2vvlW2FjWCGBjJyq7+zo+HRu525OqhuZ9dtoRd04FzOENq1aLp9SHrNH2Vr+sKy2/
	gq1JYqr7SQ4aCmCfpQ1ZsUDV4CdouuNo0D3cB5DOaRxhwlSp157XUA4muOsjMoWnOsdKxd278drKZ
	51Y7aecDH1iwSEsTLrquCiW2jgvYwj9wp1r5h06FsFyxq+I1p3fJFU7NW9ylo9e+gPrjmGYmxmcFQ
	0S39zGd1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3tjC-0003L6-VF; Mon, 25 Jan 2021 04:43:50 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3tj8-0003KL-Ov; Mon, 25 Jan 2021 04:43:47 +0000
Received: by mail-pf1-x436.google.com with SMTP id u67so7705684pfb.3;
 Sun, 24 Jan 2021 20:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T9bTASvod5sbvVwttrc2+CYFICW79RJZhXF8w04wT70=;
 b=YCSjHPhPCUPD8tm7Dj9UBzRUCwjeZAiEG4V4XzUYSWKamjwHrWf0cIComjYQaDAL0d
 4jYpBLKcAeb3yfxNeadJZjiQLq5JOfqZXO+p8J7suMLTsHAbCjRCzM2Jvc9M8duKQK/P
 N0uZY2iP2gcRh47De2AnBtNlScdKOM3dhMCrUlgLTBjfAxgP/agf/oT9aztb/u/EbBMp
 +0/WxaK6gSXmrPnqO5Rmy47k//TdJswKxJZVE/MrTtGDCBZFDyQVBi6xM1D4BXqr29WW
 EgwXCibdCzvDFgMG+2QCR4la+rci4DEsSOTqWW4oqEOazt8aO/8BEhCzuXnB9E9iub0F
 Q/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T9bTASvod5sbvVwttrc2+CYFICW79RJZhXF8w04wT70=;
 b=GoQ2KwQXQF6pjQjCGngnIRBF6B2hgNUwEwTPpexmVoPpsWJmKLZgQ2YFV0BMlgMJib
 fTiMLveFdBx6LKRWbeRbvs6SG//kYec6yTV6hUkrKa/CttBHZhXubfvntnUEaUP2gKwS
 mc68ZZzld2XAFc1E0H1LC7Xg2vk3Mf8EIicigmb1iPwV4r1kvPN4pNb5Rbw7PiML5w+B
 aZpHEycl+nQEbt2uTPskb6CT+0bMS8a4oPG4tvQ1JXPX5MJHAfECHMl+Oc8a/BPbhQ3/
 +w75FsArCCeUqP+iHTxUfo9uNm6F13vhJKtBMiSaGtVeh7ZSFnwWXkOi0eGVfHkwAatS
 IRzA==
X-Gm-Message-State: AOAM5309gdLerMlLV35IIAD7Q2cpKSvswrvmFiZzAvSl017dPWjCMyfZ
 vYTqHSFBdDmWLlP4HFGv6mQ=
X-Google-Smtp-Source: ABdhPJywH2N84xQzNs09L43C4nXwNMfHq/UIzjBrV0gVRmurMCVufNe79/5MllBZPqqzOht3KbM+yw==
X-Received: by 2002:a63:4f01:: with SMTP id d1mr129857pgb.279.1611549825010;
 Sun, 24 Jan 2021 20:43:45 -0800 (PST)
Received: from container-ubuntu.lan ([171.211.26.203])
 by smtp.gmail.com with ESMTPSA id h4sm11913369pfo.187.2021.01.24.20.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 20:43:44 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] dt-bindings: net: dsa: add MT7530 GPIO
 controller binding
Date: Mon, 25 Jan 2021 12:43:21 +0800
Message-Id: <20210125044322.6280-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125044322.6280-1-dqfext@gmail.com>
References: <20210125044322.6280-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_234346_814150_D12C4DE6 
X-CRM114-Status: GOOD (  11.34  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add device tree binding to support MT7530 GPIO controller.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
Changes v1 -> v2:
	No changes.

 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index 560369efad6c..de04626a8e9d 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -76,6 +76,12 @@ phy-mode must be set, see also example 2 below!
  * mt7621: phy-mode = "rgmii-txid";
  * mt7623: phy-mode = "rgmii";
 
+Optional properties:
+
+- gpio-controller: Boolean; if defined, MT7530's LED controller will run on
+	GPIO mode.
+- #gpio-cells: Must be 2 if gpio-controller is defined.
+
 See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
 required, optional properties and how the integrated switch subnodes must
 be specified.
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
