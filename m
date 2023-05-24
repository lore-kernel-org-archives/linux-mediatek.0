Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A18C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 16:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeYz+UHp1BdAADtFCMDrvi6V+EkmkXCK/AxBNs57v08=; b=kir42CINTB66knbovMPwGBLRUx
	wf64jxGyg3nP+DYsveM5uCuNFJhuxZx0ZDkfcuBdS0qCLcfsGj/ko1I7cl/X4uSgqjX+zhp6V5BgD
	LfUOJ+8ZQRWSWJgB70fZIxFXY2tzLQhubDURrr2cdmq9M1Yb0cEXf5KHPqIlYD/hKGbrtyIcBiaLs
	ivu2Sknlw7pUov92i3SpOyVvX2hkLp2HlEgJQO+hnscfiPXKW6gw1hoqyVK6AsQXsi6WVcVcYeNz0
	i9DeknKnIP9A8SJy8W4asbmU3HSk7qgoTeWgnU9mzAE71UtAqAE2xOnvSTyzAjDgyMDnupG3r8T6S
	Gxbc4IqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1rnf-00E4Qy-1h;
	Wed, 24 May 2023 16:57:23 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1rnc-00E4Nt-11;
	Wed, 24 May 2023 16:57:21 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-96fdc081cb3so179672166b.2;
        Wed, 24 May 2023 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684947425; x=1687539425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XeYz+UHp1BdAADtFCMDrvi6V+EkmkXCK/AxBNs57v08=;
        b=bqFNnLIiRYxhCll0RGSuw2nKMMAguyc/BFGPqqToS/oPPNn8vZrajcbq4p4LjetWfk
         YZCILREk+GagD3q+lKBzKl5XI/X4XqMoYH5Zgcp0JLZ1dcf/ahrk7cVADdhEKrlKFakq
         ANz2m0v5IwLz8BkvyC/yggQ0ETDsN+uchbV+0xymp7q58eh5te2o+CRK4w/hNd+VlKA9
         lJjMvFO4MJVSyA2pEPXDXitBzVKYTYqAtl/WvhM+S0qgUlWqs4LJOLqFVN2E6EnJP9HE
         Uo2nh8Jv81TrUebZ6dWCd3QRua94SVvdTqr0FiAhMy6cnrnC03BoDbvywgMalXYNKsTl
         H1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684947425; x=1687539425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XeYz+UHp1BdAADtFCMDrvi6V+EkmkXCK/AxBNs57v08=;
        b=eSymlFE4LDwhX6UTANuCoObIrDODdItP3oDXJ182s27wVck3HlZd18k4PTf70M5QGl
         WIaJI/U3R0l3ErVOMQ6Vxg/0TkQp+SSRuF6nfGiHvWvjKu6dPcLf1unD+1cNOn24jJgh
         +xz/dx0b3y502BR+pPwz1tiHSRn1YlM/K5DKWmbJJswuhOAdAIRH182Nn/CHPFfgQHwH
         xIoM2LQmmfm2SLX4vBdGZNKViEXSGHtViJfEbGz3lmmmPn3H8xjWKPmjL/xltQp72KWs
         PD429QQ3ISb/J6jo3/ghCubqG+QoG2DyWeZkMmNfgYE2ys/eWkF+12ihBMcojPx/Ll6j
         wmWQ==
X-Gm-Message-State: AC+VfDyVAru51qxZEZuu+IVX4wgJhu4tYqlmGazSVwAZcQRhIiNo2xdb
	cH84/mvDA7r9RHNjGPx+fJw=
X-Google-Smtp-Source: ACHHUZ5CJz5jxB6qbPwCbTc+prI9Nva9PTqbNys2iAAru4n0/lWzK/8PgjqMrqwU3jaEm/ggBXnjGg==
X-Received: by 2002:a17:907:930d:b0:94a:959f:6d58 with SMTP id bu13-20020a170907930d00b0094a959f6d58mr19818491ejc.18.1684947424548;
        Wed, 24 May 2023 09:57:04 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id t19-20020a170906a11300b0097382ed45cbsm1067674ejy.108.2023.05.24.09.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 09:57:04 -0700 (PDT)
Date: Wed, 24 May 2023 19:57:01 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 05/30] net: dsa: mt7530: read XTAL value from
 correct register
Message-ID: <20230524165701.pbrcs4e74juzb4r3@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-6-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-6-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_095720_353406_06620410 
X-CRM114-Status: GOOD (  27.40  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:07PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> On commit 7ef6f6f8d237 ("net: dsa: mt7530: Add MT7621 TRGMII mode support")
> macros for reading the crystal frequency were added under the MT7530_HWTRAP
> register. However, the value given to the xtal variable on
> mt7530_pad_clk_setup() is read from the MT7530_MHWTRAP register instead.
> 
> Although the document MT7621 Giga Switch Programming Guide v0.3 states that
> the value can be read from both registers, use the register where the
> macros were defined under.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

I'm sorry, but I refuse this patch, mainly as a matter of principle -
because that's just not how we do things, and you need to understand why.

The commit title ("read XTAL value from correct register") claims that
the process of reading a field which cannot be changed by software is
any more correct when it is read from HWTRAP rather than MHWTRAP
(modified HWTRAP).

Your justification is that it's confusing to you if two registers have
the same layout, and the driver has a single set of macros to decode the
fields from both. You seem to think it's somehow not correct to decode
fields from the MHWTRAP register using macros which have just HWTRAP in
the name.

While in this very particular case there should be no negative effect
caused by the change (*because* XTAL_FSEL is read-only), your approach
absolutely does not scale to the other situations that you will be faced
with.

If it was any other r/w field from HWTRAP vs MHWTRAP, you would have
needed to get used to that coding pattern (or do something about the
coding pattern itself), and not just decide to change the register to
what you think is correct - which is a *behavior* change and not just
a *coding style* change. You don't change the *behavior* when you don't
like the *coding style* !!! because that's not a punctual fix to your
problem.

I'm sorry that it is like this, but you can't expect the Linux kernel to
be written for the level of understanding of a beginner C programmer.
It's simply too hard for everyone to change, and much easier, and more
beneficial overall, for you to change.

I understand that you're poking sticks at everything in order to become
more familiar with the driver. That's perfectly normal and fine. But not
everything that comes as a result of that is of value for sharing back
to the mainline kernel's mailing lists.

Seriously, please first share these small rewrites with someone more
senior than you, and ask for a preliminary second opinion.

As they say, "on the Internet, nobody knows you're a dog". If reviewers
don't take into account that you're a newbie with C (which is a badge
that you don't carry everywhere - because you don't have to), it's easy
for patches like this (and most of this series) to come across as:
"I have no consideration for the fact that the existing code works, and
the way in which it works, I'm just gonna rewrite all of it according to
my own sensibilities and subjective justifications, and throw baseless
words at it such as: fix this, correct that, when in fact all I'm doing
is make silly changes with no effect to the observable behavior".

Because I know that the above isn't the case, I try to be as polite as
possible expressing my frustration that I am looking at a large volume
of worthless and misguided refactoring.

