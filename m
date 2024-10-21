Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40BCD15D96
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ejbPkgmBzrbdcIDBY7U2DR3YaP99NE2v5gBEHCZrjA=; b=Fv9MGVna5rONyNBbG9/WqZBoOS
	dia4g4OJaWYyOLtLYsNvDEiJWBBYU1//PFw8Pr98AiZqPIWW6X7icxENJ4/0Su153SGDvkrmdpUDD
	yTsf8P3nYrxdbNSMaxAZ1tde2yvkRvbDbv/Pw16xGfLV/9DcKNtBFO0d5SVAeaDmvgvszgFa8vW5l
	JnW5WnCg2I8koXScfy1ZTql1+N1n9cafiuGOa9ik5ITQ0soUVVKQFkVt58h4xqvpG0jsbRvK6iFal
	NX+89kKwH1iDg2dtVf4FyiZuUcdya+WTr64F0aTdklYn2owwr1//X50G/5MfH6I7TT2XkJL2S7jdP
	gapiAppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2swr-00000007WbC-3akk;
	Mon, 21 Oct 2024 13:59:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sa0-00000007RGy-1zui;
	Mon, 21 Oct 2024 13:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7ejbPkgmBzrbdcIDBY7U2DR3YaP99NE2v5gBEHCZrjA=; b=m5YhHO9cNYYEE0tyV7IN1zRCgb
	tR7HaLOb4aYm0+UlazT95gT3y6zhbFrw3Pb/loaOXgfq83bRe3gwWm548r+eugkaZF56JVVRyxp5i
	1gMh0JGS7BLw2LUPAND8TVuCrr08xLGAuDrshAMpGghxcettbCsdTqebGQSBDID+zLcdGVSJ4OE+8
	U3SPwZchUeBX6vUA3V4e3VxFieIaZGirFXeYJNBkHeN0pjtJkIag9OyZSRzarZT/M6mwNyMTlZrZy
	gCGe6aN3U4sitD3zI52VIc/40c/kz4DORLQXV7H5boXZMx7ERJofJucZjzSAa6wixIeSCGX79dHFq
	7ER++Caw==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sZx-00000007xb6-1buD;
	Mon, 21 Oct 2024 13:36:15 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a9a03951195so41894166b.0;
        Mon, 21 Oct 2024 06:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729517770; x=1730122570; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ejbPkgmBzrbdcIDBY7U2DR3YaP99NE2v5gBEHCZrjA=;
        b=nRHzsLj0Ah+mhi9KBzsqib6x1p67WiF4NYsyGejRmgPuanvGahRHGeKRLkvB/F4f4J
         nKtJCtQF+x/dOgxUDLvvT6P+rkLb2boQt1L2BkjQI+t2TQobhxpoIwNzP3L2NnAz2nfq
         CEExdwDbqwZkwfdDInvQ9C4iGLJzjyu4I5wY5ZBjdv1NO9R/S2OapayT4EEWdlKSuzw0
         PvpuqCNl15TSD2M0Nq/vktMrTMSXTIhl0OQng+izXSZYxIRiz03WO55S6vOJn6morvw5
         f9b3u1tbb7lnEopy7qrQSMGmthbwnZsrL/8uantumZVjJhHCjwif9dvnSWXba55TkUxU
         G8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729517770; x=1730122570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ejbPkgmBzrbdcIDBY7U2DR3YaP99NE2v5gBEHCZrjA=;
        b=JNo8vhdZugdVdjBALeYWU1s8kxdaQt2UBtI9trOE0t3F4uz1vEFD1hSf9NMXplph0P
         VyuQX9xWksRgKeywScEhaqiT6ZNofYeWGnWaHSoJHjYWHzaq54oE1VqtBWj6tS5/RjGD
         ORbJgugme4xDYq2cx563KJ/Je6OgfaNQb42TPYqJA/t3jUjbQunoJMZlLGCRxzs0kG+2
         JOP/2SHV32TjQF+Kl2G/7TUV1KGQvFkOBPSTLbeevwNEASP5fHKl+z+uarD7AxUDTLiY
         9qBf6JURhO6qo7WFxawhzWUXpnzOJgNgNoXg7VOY5zhlG/D8VDwv7pfY7BwuizgMFuBB
         bfXw==
X-Forwarded-Encrypted: i=1; AJvYcCU3rbhqQ77xCjyCGlGkudZiOBFrE2kCBvBDKRArPLIO15Mh0dbc6zxR9FDWVTBCMTZuA++nKB3YeFgASzk9Xzdd@lists.infradead.org, AJvYcCUGJYehAw0zXur6r81lxVh41CtFGZbJgUGrm0JXjADxG2qj6/JX0xS26iKSUg7NX9RVswLnjXWhTL1pfl1SQB0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWmCE4vvfIy3KdKrUXgzg9qWjSCOOGLewn034dlbM5He6n8G1E
	sz4EAPff/lr5WXCFIxwWFOYlZ60f02f3nTllAVj/8zDRc4QmdJuT
X-Google-Smtp-Source: AGHT+IGNYJBaRpTS/ccI6Q7hA9PHsmRJtd+/a127r5kJAH8ZNrCayA8KVxqY86ZKxcGODMA4JgMC/g==
X-Received: by 2002:a17:907:2d89:b0:a9a:2afc:e4dc with SMTP id a640c23a62f3a-a9a69c9b851mr468402266b.11.1729517769359;
        Mon, 21 Oct 2024 06:36:09 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912edfd0sm206007266b.67.2024.10.21.06.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 06:36:08 -0700 (PDT)
Date: Mon, 21 Oct 2024 16:36:05 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next RFC PATCH 0/4] net: dsa: Add Airoha AN8855 support
Message-ID: <20241021133605.yavvlsgp2yikeep4@skbuf>
References: <20241021130209.15660-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021130209.15660-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_143613_628894_7A848224 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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

On Mon, Oct 21, 2024 at 03:01:55PM +0200, Christian Marangi wrote:
> It's conceptually similar to mediatek switch but register and bits
> are different.

Is it impractical to use struct regmap_field to abstract those
differences away and reuse the mt7530 driver's control flow? What is the
relationship between the Airoha and Mediatek IP anyway? The mt7530
maintainers should also be consulted w.r.t. whether code sharing is in
the common interest (I copied them).

