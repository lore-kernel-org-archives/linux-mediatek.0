Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE673C07E95
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 18:24:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F7A9610F7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 18:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F7A9610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V5gOTLP3zjcQw2zLjVp18dGc8R18cfF93VVWaXWykRU=; b=KnaIUnyRZ4E8DK
	CzewnmPxCgyAYmbMcXMd23Id8mFMsK/RfNVQg+Q8EhrBbs5A8fYUBb1B7M0+kneYP0j/j4mNMAsuI
	JPb01nwox6FX6cqGVzu8hvbYlwiCyLsinKM7sCrJdljrGhnhIN13G72LjESUZ91FGzUQUMLRSY2gS
	U0pTPWKtF+VgAkNfSKlvEAosLee4AB5rHG2EagxeuVCRcv02PgEPR3QvHmGmC1YKV05OWcvfFCtjp
	JTFetWXRiyw2CQjy02semzwYBEoLwACh7FQQOyJQCP8ILEM8bldmmCJ5XHQyIq/Mzq0NqgPr6OGo2
	CgfZwt5dDkck6FC7bFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5XwH-00Atz3-NU; Mon, 19 Jul 2021 18:24:25 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Xw5-00AtyH-F2; Mon, 19 Jul 2021 18:24:14 +0000
Received: by mail-ed1-x534.google.com with SMTP id w14so25224528edc.8;
 Mon, 19 Jul 2021 11:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GTDmJR1iOKfFDErDtsKNCTnZp6PtcbXsQw6WcF7pPvg=;
 b=PslpkDnKg2RGc5dTIe6QuEL/PdAGxOH50++K7jvEb9AsGJdQuVgPVF16udXIHkm3Eh
 RJAGJnEk/SiAeWLydlAUKUXo2LaEKYa343WuDHHxcHAm5v5q993uIppkXag01cLPAKn6
 CoA5HEp9yGZ6xiWQMnMRmicUtM8jzTE2sV0Ug5qhEns+rYT29TVonMfMUlofC6l6rQv0
 N8uQhqJQ6+dYfdH2BsCeeL/x9RjaHesC6jJ+Jicl9bafGk2pQcuNN5IFdNFCOFC65n0o
 s8eshhOUrzf1gKVKFlOeZ27hSBcK333DopwqEJDxN1zEjmNE3Yni2v32gC0iREDkEo6n
 dnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GTDmJR1iOKfFDErDtsKNCTnZp6PtcbXsQw6WcF7pPvg=;
 b=DysW2XN7uOJ9jSDwX4/8cSiQVpXrn1CpWkAWmTJ5NnN7Dycuc+4UlQyCVTaAZ788X2
 bbMp1VF/gg8/6mdSqUprMmrLd2zs8f7BcEf+dbWbgGMNi0BPv1JiPz+5Dj74pQqZTyj9
 /HGEPGhu/ExUTyM1HgxEnUWuM3ZNdpGf3zmHcarAn1O9X+lja7DasXU3RJ5MYazCffU9
 YjBP8UMpnnP+pW0D/KN2ruI3Uu3WPMyoxUvudto6MSGY3adSAkStY7xrg7b7KnNNP/OE
 98ejYsXdEWWFaCGyqACPaPuWwGYaYjef0Tl2Gkvvpeq8K6n/Pg6RC74YyLMRd0eCqTXi
 7e3A==
X-Gm-Message-State: AOAM530GpxnyKDtVCbKmJMYFtZSZ1Y2j74KbCTgmzbeeyMmrCqnhqj0O
 raeBxR5WdPO5lEAUQ2n5YYk=
X-Google-Smtp-Source: ABdhPJyBB/iddbcYz2BAUsZkG8o/nGJccjkPG2a5IDIKGpHrQVAsLya06VIBhGkUOwYbpC0eV881ig==
X-Received: by 2002:a05:6402:692:: with SMTP id
 f18mr36595704edy.327.1626719051135; 
 Mon, 19 Jul 2021 11:24:11 -0700 (PDT)
Received: from BLUE.mydomain.example (83-87-52-217.cable.dynamic.v4.ziggo.nl.
 [83.87.52.217])
 by smtp.googlemail.com with ESMTPSA id i10sm8082141edf.12.2021.07.19.11.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 11:24:10 -0700 (PDT)
From: ericwouds@gmail.com
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net] mt7530 mt7530_fdb_write only set ivl bit vid larger than 1
Date: Mon, 19 Jul 2021 20:23:57 +0200
Message-Id: <20210719182359.5262-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_112413_546781_DEBD693F 
X-CRM114-Status: GOOD (  10.02  )
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

From: Eric Woudstra <ericwouds@gmail.com>

Fixes my earlier patch which broke vlan unaware bridges.

The IVL bit now only gets set for vid's larger than 1.

Fixes: 11d8d98cbeef ("mt7530 fix mt7530_fdb_write vid missing ivl bit")
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 drivers/net/dsa/mt7530.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 9e4df35f9..69f21b716 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -366,7 +366,8 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
 	int i;
 
 	reg[1] |= vid & CVID_MASK;
-	reg[1] |= ATA2_IVL;
+	if (vid > 1)
+		reg[1] |= ATA2_IVL;
 	reg[2] |= (aging & AGE_TIMER_MASK) << AGE_TIMER;
 	reg[2] |= (port_mask & PORT_MAP_MASK) << PORT_MAP;
 	/* STATIC_ENT indicate that entry is static wouldn't
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
