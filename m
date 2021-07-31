Return-Path: <SRS0=E1wD=MX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F46C4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 13:27:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02AD86101C
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 13:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02AD86101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:CC:To:Date:From:Subject:
	MIME-Version:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDo4XccxisZFEiDotBOXXzV19CPw3v05LZ7gi0pLPXU=; b=tRecwq1tHfd5ru
	UWYX8lc/H+3IpB8o26QhABltqQZ08tB7OBQsvjgu2LE8v27IzlVaLXH19kTkR6W03vY3W1sjqYd/c
	NNisuWOGxsK5NwBUuYkAqTc9mTfwxRYtRs0QjjgjF4azeqkA2fnBzy23/XXu5Y+6d/db+/Qm1gLiT
	8Rt3/sJeu89FFmLTBPYOilRTt/N4W41irlSOJaOMP/Tj5CwTaGG6biBFpL2P3hWYYJWNE2WJEQeyN
	/RdtKVLUPPY73DthfR0DBvrHyIZSaQgQZ9tUkv7s2bz++FgJJgnsYx4agdjG4SPrp+EIk0cLuMmHn
	/+FSYJf0w3iB3f21Os+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9p1P-00BgpB-8v; Sat, 31 Jul 2021 13:27:23 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9p1B-00Bgny-EE; Sat, 31 Jul 2021 13:27:11 +0000
Received: by mail-ed1-x531.google.com with SMTP id y12so17533422edo.6;
 Sat, 31 Jul 2021 06:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=in-reply-to:references:thread-topic:user-agent:mime-version
 :content-transfer-encoding:subject:from:date:to:cc:message-id;
 bh=xl09+cxouK/J8oQbWqVsZd+JkQVF+Hr4QFi7eK3edzg=;
 b=nQgLQpxWPfiFCI3TlKKidWTFMQj5R2bx5WVEcdYTDRAIO5H7Ki22zu4sGPWAHI0246
 aEm1k5BLdaoYUAN6ifFPowXWMiJzJH2wC12SKbmsD6h2g1rpquOy2ntEsMjD9RAwbBHC
 65yy2xHFzo3hj4jHF8On0YcLlRbnUsA0c9CAkk4xedWzFBXnypui1qTU6mVC1V8CkUhw
 B9Xa3g6aPyMxgfmAqZWiswEARMM8yfW6Ro+wMDLpkZ/S6BKk6RMTz2k84R47VsB8tW5A
 Gk4VfrKIButSiEBtsVBM9IsDlPrE2IlARmuURy2pYI3SjoYXYhKZbOkSRyD8ObMfxBEe
 3HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:in-reply-to:references:thread-topic:user-agent
 :mime-version:content-transfer-encoding:subject:from:date:to:cc
 :message-id;
 bh=xl09+cxouK/J8oQbWqVsZd+JkQVF+Hr4QFi7eK3edzg=;
 b=bFuK5wY4HC2HgLLTB3mW61Q0lJlDofOgepiAUSikZiggRbu2vYTfl0QDobzNnNraoP
 145Pcp65RjLxjtwThpCxwzrsbDy5ezqsQyH2QUC+Xj3w9pPbYTOK5HliF1YsSYqyA6ir
 eGsdcvjGGoUgzGFyDj8OOJHvFS9ywqlBgGeTr415FomAww/tIpsp3NIRMeEdBrLe+ihV
 VndkNLo4Q1NIb69Byw9+/0cDCfgqsYQLLM+BVYjdSiEWB437a+kBNVk+P0LPge/+z0vR
 Xd+EBQxxJRyMbwZptQMqKZUGe37cmJsRTSSp03kjum0grS6P/rAnxIPPhg24zKsARKRr
 w/qA==
X-Gm-Message-State: AOAM531bI05JdhqZoy7mt2pMCKOE5Vl/Blpiyl9WfX9y7V6z8GfrT/vW
 JzVVsNK+eamCGH5zx74+tbM=
X-Google-Smtp-Source: ABdhPJzlw31pNS40a/9JFPmy1rPxcNXk5ZQGBfrczjR6U3W2TJEh4j5Csva/YdpkPS3o00SAyEjjWA==
X-Received: by 2002:a05:6402:c01:: with SMTP id
 co1mr9067625edb.287.1627738027162; 
 Sat, 31 Jul 2021 06:27:07 -0700 (PDT)
Received: from [192.168.1.158] (83-87-52-217.cable.dynamic.v4.ziggo.nl.
 [83.87.52.217])
 by smtp.gmail.com with ESMTPSA id l16sm1701766eje.67.2021.07.31.06.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Jul 2021 06:27:06 -0700 (PDT)
In-Reply-To: <20210727132015.835651-5-sashal@kernel.org>
References: <20210727132015.835651-1-sashal@kernel.org>
 <20210727132015.835651-5-sashal@kernel.org>
X-Referenced-Uid: 5707
Thread-Topic: [PATCH AUTOSEL 4.19 5/6] mt7530 fix mt7530_fdb_write vid missing
 ivl bit
X-Blue-Identity: !l=240&o=43&fo=2660&pl=166&po=0&qs=PREFIX&f=HTML&m=!%3ANzRiZDk5M2QtNTJhNy00MTE4LThlNmYtYTk2ZDg2NDQzNGU0%3ASU5CT1g%3D%3ANTcwNw%3D%3D%3AANSWERED&p=164&q=SHOW
X-Is-Generated-Message-Id: true
User-Agent: Android
MIME-Version: 1.0
X-Local-Message-Id: <e1508978-8f0e-40a6-baa8-3d3bc4c82811@gmail.com>
Subject: Re: [PATCH AUTOSEL 4.19 5/6] mt7530 fix mt7530_fdb_write vid missing
 ivl bit
From: Eric Woudstra <ericwouds@gmail.com>
Date: Sat, 31 Jul 2021 15:27:04 +0200
To: Sasha Levin <sashal@kernel.org>
CC: linux-kernel@vger.kernel.org,stable@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,linux-mediatek@lists.infradead.org
Message-ID: <e1508978-8f0e-40a6-baa8-3d3bc4c82811@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210731_062709_545428_A918700A 
X-CRM114-Status: GOOD (  13.55  )
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


A few days after this patch, I send in another as it needs a fix. If you apply this patch, please also apply the other: set ivl bit only for vid larger than 1.

On Jul 27, 2021, 3:20 PM, at 3:20 PM, Sasha Levin <sashal@kernel.org> wrote:
>From: Eric Woudstra <ericwouds@gmail.com>
>
>[ Upstream commit 11d8d98cbeef1496469b268d79938b05524731e8 ]
>
>According to reference guides mt7530 (mt7620) and mt7531:
>
>NOTE: When IVL is reset, MAC[47:0] and FID[2:0] will be used to
>read/write the address table. When IVL is set, MAC[47:0] and CVID[11:0]
>will be used to read/write the address table.
>
>Since the function only fills in CVID and no FID, we need to set the
>IVL bit. The existing code does not set it.
>
>This is a fix for the issue I dropped here earlier:
>
>http://lists.infradead.org/pipermail/linux-mediatek/2021-June/025697.html
>
>With this patch, it is now possible to delete the 'self' fdb entry
>manually. However, wifi roaming still has the same issue, the entry
>does not get deleted automatically. Wifi roaming also needs a fix
>somewhere else to function correctly in combination with vlan.
>
>Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
>Signed-off-by: David S. Miller <davem@davemloft.net>
>Signed-off-by: Sasha Levin <sashal@kernel.org>
>---
> drivers/net/dsa/mt7530.c | 1 +
> drivers/net/dsa/mt7530.h | 1 +
> 2 files changed, 2 insertions(+)
>
>diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>index 6335c4ea0957..96dbc51caf48 100644
>--- a/drivers/net/dsa/mt7530.c
>+++ b/drivers/net/dsa/mt7530.c
>@@ -414,6 +414,7 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
> 	int i;
> 
> 	reg[1] |= vid & CVID_MASK;
>+	reg[1] |= ATA2_IVL;
> 	reg[2] |= (aging & AGE_TIMER_MASK) << AGE_TIMER;
> 	reg[2] |= (port_mask & PORT_MAP_MASK) << PORT_MAP;
> 	/* STATIC_ENT indicate that entry is static wouldn't
>diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
>index 101d309ee445..72f53e6bc145 100644
>--- a/drivers/net/dsa/mt7530.h
>+++ b/drivers/net/dsa/mt7530.h
>@@ -43,6 +43,7 @@
> #define  STATIC_EMP			0
> #define  STATIC_ENT			3
> #define MT7530_ATA2			0x78
>+#define  ATA2_IVL			BIT(15)
> 
> /* Register for address table write data */
> #define MT7530_ATWD			0x7c
>-- 
>2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
