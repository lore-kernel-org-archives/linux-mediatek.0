Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3A8D15D98
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvZACKQE5A63kgrvXCHxaARVoSrgC3Hgpn7T6LENiug=; b=bqQRkFm1wC36wQo/Q4ze2rZUka
	CtrsfEFd17us67nftFkXXECRxaSVV54QvMuuBR9XmxpCaU9NsoeYqpT5aDRkhRNOTiyaiR8EO651/
	J21J0NAWu2sZn+HoaZyK0mIAHMqCqFdHAur7mbsFn+kC+ErL0za6AvO2zdceywHR0GMjzeO/P0aJJ
	QJTF37xAJoPB0J8aVXwHj0U18pN+Aemf/uCrMHmVJe8svyIMvyOWFaBmrWD+fcf/N1zZPZ9HtojP6
	elSD1C+PPlVXPVcRvQKTmISHbOFdnsr56Qt4msEPe9p0hwtiIlWxGaOkPqn1A9yCM4mVnTXyuwXEk
	IlOPSq0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tEs-00000007au2-1cPF;
	Mon, 21 Oct 2024 14:18:30 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2snN-00000007Ue7-25dk;
	Mon, 21 Oct 2024 13:50:06 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9a03951195so42094166b.0;
        Mon, 21 Oct 2024 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729518604; x=1730123404; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xvZACKQE5A63kgrvXCHxaARVoSrgC3Hgpn7T6LENiug=;
        b=StdmgYeCgck5PgS4iAwQMvad4Dq9kJ3ahwEi85UMhg1orTatmC258ImVMm60OFeRw4
         EqDoXdziAx190VP+ENsQxWGxD1GvZeDiGSMiVlNITjVhJtoxbSw/juPQXHO8SvdvMxbk
         xROLUmOyOhIv0qTTrMVlLOvQgkF7sVxHNDRlVmNH/Zh9Y3h0S3oiLpxoM3w34k+bOI9b
         ajsaJpZGyL46wXKNNi/S5v/EaZbTm/MKUmkp1P0yVDgG0R2kXIHov6pTIr3GiKTSidEI
         YOXfKWUtNSgRoBxsnVr6ZpoglXLip/KYkdUC16zRKAb19/jJivOaMwYkK7XrtoNwnsqE
         JQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729518604; x=1730123404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvZACKQE5A63kgrvXCHxaARVoSrgC3Hgpn7T6LENiug=;
        b=xF2OZcKvhen5ksBax5SRLyshXoU+rUAPYcmLMNAFTtJGd6q1Mu7AAEP6AFuRy/zgiz
         kYi0rBbmj7xwEqmBU+MR4M/DZe0HLfXllzZK96vwvsX+rxk/DrndQisDLYz/20Mp1MT8
         CNxwQ0jKHvkvcAMxpFbhULxuN2YzmAiRCFpeRHk4Aayo6SdQeNNF/NDM2Mo4CpKUyayd
         8kzq1Q6r+9IIaaBSWM+zomGT0W9Q0y/2x4nw/wnP3lsf9ayYN8MD88D6e/cyBHAVNMjS
         XP77zGeDDfwDHI9o6lPhpUpGTtiPuQ/eGnn25RVTBiUj3OcstvKwdiZKxenUTjm/Xd4E
         fYnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUCxZHMQPVEDoqnLw9A+oVzBBnR+MJulRBq9++vCsVvT2u/NN+NnDSJpEWr3a3TW96MLe9Uq7kOULFPE4fyLxl@lists.infradead.org, AJvYcCVuS5N/Y2VadzvtfB/p77p4aVPkCfB+xS24pBnbwuqg6znDi/3OeT/QVr5Zr5hosmpJ5odLvyuCnqdRok2xUdM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzK1rz6V95fqpV0eI9P3EREOF5ZgwAQGnY5CXqu2f9uhautOkX9
	q45oK5pxZ28l6qNaML8vFsQ5YKDBkS8ZfQsIYFU22TB86NWV72QW
X-Google-Smtp-Source: AGHT+IFkvdi1xXb440X3ZM1lEN+rP4lRDSyWGbbS/gXXJfBpY4FWgfR+FUuyyXY5eiShRJa3bmU8Tg==
X-Received: by 2002:a17:906:7951:b0:a9a:6700:1ee5 with SMTP id a640c23a62f3a-a9a69a7b2efmr420841666b.5.1729518603659;
        Mon, 21 Oct 2024 06:50:03 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9137060fsm205673366b.103.2024.10.21.06.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 06:50:03 -0700 (PDT)
Date: Mon, 21 Oct 2024 16:50:00 +0300
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
Message-ID: <20241021135000.ygele6x64xvfzntl@skbuf>
References: <20241021130209.15660-1-ansuelsmth@gmail.com>
 <20241021133605.yavvlsgp2yikeep4@skbuf>
 <67165992.df0a0220.170dc.b117@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67165992.df0a0220.170dc.b117@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_065005_734992_A3557BBE 
X-CRM114-Status: GOOD (  19.32  )
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

On Mon, Oct 21, 2024 at 03:39:26PM +0200, Christian Marangi wrote:
> On Mon, Oct 21, 2024 at 04:36:05PM +0300, Vladimir Oltean wrote:
> > On Mon, Oct 21, 2024 at 03:01:55PM +0200, Christian Marangi wrote:
> > > It's conceptually similar to mediatek switch but register and bits
> > > are different.
> > 
> > Is it impractical to use struct regmap_field to abstract those
> > differences away and reuse the mt7530 driver's control flow? What is the
> > relationship between the Airoha and Mediatek IP anyway? The mt7530
> > maintainers should also be consulted w.r.t. whether code sharing is in
> > the common interest (I copied them).
> 
> Some logic are similar for ATU or VLAN handling but then they added bits
> in the middle of the register and moved some in other place.
> 
> Happy of being contradicted but from what I checked adapting the mtk
> code would introduce lots of condition and wrapper and I feel it would
> be actually worse than keeping the 2 codebase alone.
> 
> Would love some help by mt7530 to catch some very common case.

As long as the control flow is reasonably similar, the REG_FIELD() macro
is able to deal with register fields which have moved from one place to
another between hardware variants.

