Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A76C98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 20:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpDxu+FSADcYkY7OEJ6DHltLDpB0SvAaV3ZviPXPtHQ=; b=vsmoULXTwYIMIQcoynnCW3aifj
	VZrk/rDdz6wRiiyw1C10ZtS5gUaMdny/SJCUkBbi/Uc2CjR6yTCCl3IX/BbIjUyJvDOQmZhAo7TnE
	zw8uQ3nrhqjXJd8wQ/7INuDgEKYtQeJGjDz+PwtLSKEmM4WW/iJkbVZGhYW5qhv4LXSL/J+pOZEN9
	bbWZOa1u6/g28Wve15Ne+y8f2z73mmG1laHAUrWvGCXD2XIbLsHbkcJbbz5ODyQLWY1sgFhWIEPJP
	dcvkC9zhkL1675bDRXa8S4y5vgetUqfh0yjJfbWRO2gLyjkE/bY7mW3OWjjFJ2dn+4uSu1Yb/1O7y
	uMOsrbYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvUC-0000000Gp9X-3O9v;
	Sun, 27 Sep 2026 20:28:37 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAvU9-0000000Gp8X-2a4O
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 20:28:35 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffed768deso4474825e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540911; x=1791145711; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZpDxu+FSADcYkY7OEJ6DHltLDpB0SvAaV3ZviPXPtHQ=;
        b=cCqrNprCTBnqCWuLMHr3dPX8L23iqta/+r0n6eHnfBAGnm4EKHGY3BvjUgXEVV242m
         +GWdVVvjwyJY6FuJfptavHlhepj4bEvj89YyWIksHawaDizLXCk8qrgqyuqsqwSjXbj8
         c5pEjCvBjzSOrEKgL8U5vqJbB79I9W7+Gsu1rfiVf/pUQMVAjSgaKn3VZHO4vq99isU/
         yTNdU5Q5aH/QJG6pCof/LXQBxRl9EGGuKNOExm/KBz0EYUs6p1UI5eVQnmF8wkPHRFnX
         O/Gz0T8vefxJulSHJM334MA8PJtu1E20UPImRBztOsWiAQq+b3Aa4lge5a0a8WqdZ8Du
         fnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540911; x=1791145711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpDxu+FSADcYkY7OEJ6DHltLDpB0SvAaV3ZviPXPtHQ=;
        b=EjbjfQr6XIQufw8WDNArA6xZNIorgKAn7E+7OigmaDA+xK7SGPLKyNzmo5nrov1Ilp
         ZwFg8CY5kGE2bdFhBbc0uhUCSIdasnFVMbvoZ72cXHN5fVJNE2OQGYBAOM4hZ9QJK0Ml
         h1t7DHHYoFqCTX+yR5uczBRT0DwFbn4062ehiHWPgATeRI++DNxoWajcXN97w9wWiUOe
         Ybk/IAyj3UETezyT/1KAa9Jjrpf/pX5JEl/S09rxV4DDsVkoEasT3i7aKvyco9je/j3c
         OYvfalV3ARDfWY2HWY9BKHU82LHK+iVH/dD0dbeZkZFQHxmArBnQlbrNzFk8eZWipvPV
         zuZg==
X-Forwarded-Encrypted: i=1; AKwUvBwqIJPusyb7ZZOFS9LBCo3xXvZRSuVEthAUsyieFbxaqNdqbgvnrU3D4g+5IH00bon15/gjYW2nZT8NhzUGbg==@lists.infradead.org
X-Gm-Message-State: AFuF++lreJV9VF5ar6B1wrvuKu+/9HM06RdxJ/lJjv5QduVChaI28WMO
	eVJFZi7fbrsb1Pqvocz83GChLE/w2nCG7EUqbX4UKoQz2ZLntlo/w7bX
X-Gm-Gg: AYBFou2ODQSTt2W6DtxYTyekPp7bk42FQd7SMQodEdw+vFT8lh6LFaasqpqfPgCSmCh
	ssFgXGr6k0sVzKseeFxHwLH+okDRwXtv1gXRsabK8gPTBUqT5LBD3k+8N03iId8+lN4MJKV+XQV
	9/X7AYpfqCGDuTvGDpeX4VvwNVMkekfijWMEjsBKbLFwl1g/laHhhDFIXunuYMddjQogSkT+MSM
	QSykRO1BAhDNNNuo2qmboTCfdal581CaRU8xTdWsWYanLApmjU0XFtDuhoHXH4sPGeZpuXe4KrZ
	Nm9dv7bcqjfyhvnM7eX7ebV4bxeyylOey65o7bXqllFhisiPNrKOCcfmHQVLL6+X19jmDoNQrWV
	N4U/3xpoUI2n+mRvnL9RQVL/+U93dskVeHlh8mS5I/wtYsAt1jql6jX/wif5gv9S3i3QN1e/osp
	cz0rsj2eAheROTAyVMt3Yl/1s4lftWkjTyXYFOsnUc7e0VSfJjcqIhj923Yj/XdT8NwlHGX1GgA
	/9chGHRUva67foz0/mFGh5zxlxQ55fv74xMx3fNOY2Cg1w=
X-Received: by 2002:a05:600c:1f83:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fe66c8087mr198495325e9.3.1790540911202;
        Sun, 27 Sep 2026 13:28:31 -0700 (PDT)
Received: from Ansuel-XPS. (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00571744csm17037495e9.13.2026.09.27.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:28:30 -0700 (PDT)
Message-ID: <6ab97c6e.f5ac67e6.37e70.11e5@mx.google.com>
X-Google-Original-Message-ID: <arl8aT34M7MBL89n@Ansuel-XPS.>
Date: Sun, 27 Sep 2026 22:28:25 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v23 8/9] net: dsa: mt7530: generalize and move
 common function to lib module
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-9-ansuelsmth@gmail.com>
 <cd200dee-1bde-4cc2-a296-c93d704cb906@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd200dee-1bde-4cc2-a296-c93d704cb906@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_132833_673160_952F16C4 
X-CRM114-Status: GOOD (  23.98  )
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

On Sun, Sep 27, 2026 at 09:02:09PM +0200, Andrew Lunn wrote:
> On Fri, Sep 25, 2026 at 08:24:30PM +0200, Christian Marangi wrote:
> > In preparation of support of DSA Switch from Airoha, create a mt7530
> > library module and move there all the common function.
> > 
> > Function are generalized to use the reg_field regmap API but still apply
> > the same exact logic. Every function is renamed to mt7530_lib prefix to
> > better identify it.
> > 
> > Minimum modification are needed to the register header and common enum and
> > macro are moved to the mt7530 library header to permit reuse.
> > 
> > A library struct is introduced with everything required for the common
> > functions.
> > 
> > The generalization and the introduction of reg_field regmap API have the
> > side effect of permitting to clean the mirror functions that required
> > special handling for MT7530 and MT7531 based switch that had different
> > registers. This is done by declaring a common MT7530 reg_field and a
> > specific one in the Switch match table.
> > 
> > No behaviour change is expected by this change as it's just a code move and
> > reimplementation.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/dsa/Kconfig       |    4 +
> >  drivers/net/dsa/Makefile      |    1 +
> >  drivers/net/dsa/mt7530-lib.c  | 1128 +++++++++++++++++++++++++++
> >  drivers/net/dsa/mt7530-lib.h  |  391 ++++++++++
> >  drivers/net/dsa/mt7530-mdio.c |    4 +
> >  drivers/net/dsa/mt7530-mmio.c |    4 +
> >  drivers/net/dsa/mt7530.c      | 1368 ++++++++-------------------------
> >  drivers/net/dsa/mt7530.h      |  256 ++----
> 
> The number of mt* file keep going up. Is it time to move it into a
> subdirectory?

The problem as always is that mediatek directory will also contain airoha
stuff...

> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>

I would like to fix some trivial things pointed out by sashiko. Can I apply
those and keep the review tag? For this patch for example it's just the
typo for the multicast MIB.

For the other patch is also very trivial stuff. 

-- 
	Ansuel

