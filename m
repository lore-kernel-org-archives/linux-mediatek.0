Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA05C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 13:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT/KiN/GVyh9un3dWdPg6LQ82j/4nY+K0qSJUuMUUpI=; b=esU6XIwGw2F+pOOYmQEX5pY+aC
	VsOgD9KijqHYSpfcqBttJeM/a0hZUyc9PzeCEkQv4M7U8msoSH5P2HP2MC0w/nvicbhsCX26cNr/u
	NB4nCE8T9CWjIvHq5QbpwNOKMPPHoQJLWvR+qqoCP8tQTDR7Hz4vf60lIKIM0kU67UMHSSVt2afNL
	4GVn1FQZ2eHwyLSUJwhFJCBoDWaQpIhkgotQqknbGdYmzhCvs001Q1UvAfdu/CeLDQgEgl+jyLTX2
	rvbg/Ks6LULg3eJGOpkXlOFHA3mulmTBoiHPpxpV3FtpQINybUvbGvnUDDXAq6SSzhWI7EbcVuke9
	Y9Csv2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2B4M-00Gjjv-1c;
	Thu, 25 May 2023 13:31:54 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2B4J-00Gjhx-0V;
	Thu, 25 May 2023 13:31:52 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-510ede0f20aso3813982a12.3;
        Thu, 25 May 2023 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685021507; x=1687613507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gT/KiN/GVyh9un3dWdPg6LQ82j/4nY+K0qSJUuMUUpI=;
        b=DAXSVG8SP+PMkUmaPR9OniX53jxwwXdb/BjZYjLC7skxBg3hQIIQaaiqIs8n2P/xDN
         GJvgkHnDCGcmOGhm4hp7gdrbPrhn4iX1WcJLn0fyAWXLH6G50D3PVGHsJx1Gi3KVGGGN
         4itEM9tUXxIW5KbUxDrUK/4Sq/kesrylVJ/OMA6IVGSZc6dmmyC1VxPu/xYEAx00AiYX
         rB33rgHAhoN4cDfBJv6hElYqLV3RQ2vB2+Z7jFaw25+18hUOUyP1e336IVLI5450L1RX
         MvXSC65Z8MdJKWX6ZnqPhXUuaEj4BlsA2KGWywHa2FRFOA1cVtUS6SiWAaCWz6X0xut6
         kXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685021507; x=1687613507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gT/KiN/GVyh9un3dWdPg6LQ82j/4nY+K0qSJUuMUUpI=;
        b=Q075eSrizybEkeJ60xdcW1U9NT23X9xF5Juxrac9XWMDrqcxocxnwFkZXfrljwsQUY
         V2lkcKiG83SqtBwohkg98Atz/ln1fRdEus62t7Q+/AZa+K1BJkA7hchKpXqo43dM1SR9
         Fl8jDGbS2v2hxSOLWq5c7hB5r0n7aHTI6PjWKijyudn3u4e1nmdq/IKqH0KZQIdneltq
         WRV4+5TnxtnmchpCu0/xi7ljcOi6iqmod5Dz3FJ/hhTdFPoD0PPyHK524SgwSilcbRAb
         AOA8GgRo0/vizNF+BXzhA4Q7NYcCz8NhMrE2Sfg3X5sfL7zppXE3HYZfB9VeN41tO+Kb
         Ygzw==
X-Gm-Message-State: AC+VfDxG7QJgqnBCmRlodW7lx0Wne1pwurRrNURFew5FQHIbEdn5I4v2
	Xp43NljoHB+UBlkaZXj0Qf0=
X-Google-Smtp-Source: ACHHUZ7C1fLtYhn8fZGe3ehLd1Xq/uazQq9TEEOCoBMvdYjTG9644jyrZ3G60lSa+jZQQSKib5XpTw==
X-Received: by 2002:a05:6402:204d:b0:510:ec67:22d2 with SMTP id bc13-20020a056402204d00b00510ec6722d2mr4482475edb.10.1685021504024;
        Thu, 25 May 2023 06:31:44 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id r3-20020a056402034300b0050bce352dc5sm543380edw.85.2023.05.25.06.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 06:31:43 -0700 (PDT)
Date: Thu, 25 May 2023 16:31:40 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 05/30] net: dsa: mt7530: read XTAL value from
 correct register
Message-ID: <20230525133140.xewm6g5rl7sm57d2@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-6-arinc.unal@arinc9.com>
 <20230524165701.pbrcs4e74juzb4r3@skbuf>
 <7c915d5b-56c9-430d-05ac-544f76966eb1@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c915d5b-56c9-430d-05ac-544f76966eb1@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_063151_212308_7BC067EB 
X-CRM114-Status: GOOD (  34.58  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 25, 2023 at 09:20:08AM +0300, Arınç ÜNAL wrote:
> On 24.05.2023 19:57, Vladimir Oltean wrote:
> > On Mon, May 22, 2023 at 03:15:07PM +0300, arinc9.unal@gmail.com wrote:
> > > From: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > 
> > > On commit 7ef6f6f8d237 ("net: dsa: mt7530: Add MT7621 TRGMII mode support")
> > > macros for reading the crystal frequency were added under the MT7530_HWTRAP
> > > register. However, the value given to the xtal variable on
> > > mt7530_pad_clk_setup() is read from the MT7530_MHWTRAP register instead.
> > > 
> > > Although the document MT7621 Giga Switch Programming Guide v0.3 states that
> > > the value can be read from both registers, use the register where the
> > > macros were defined under.
> > > 
> > > Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > ---
> > 
> > I'm sorry, but I refuse this patch, mainly as a matter of principle -
> > because that's just not how we do things, and you need to understand why.
> > 
> > The commit title ("read XTAL value from correct register") claims that
> > the process of reading a field which cannot be changed by software is
> > any more correct when it is read from HWTRAP rather than MHWTRAP
> > (modified HWTRAP).
> > 
> > Your justification is that it's confusing to you if two registers have
> > the same layout, and the driver has a single set of macros to decode the
> > fields from both. You seem to think it's somehow not correct to decode
> > fields from the MHWTRAP register using macros which have just HWTRAP in
> > the name.
> 
> No, it doesn't confuse me that two registers share the same layout. My
> understanding was that the MHWTRAP register should be used for modifying the
> hardware trap, and the HWTRAP register should be used for reading from the
> hardware trap.

My understanding is that reading from the read-only HWTRAP always gives
you the power-on settings, while reading from the r/w MHWTRAP always
gives you the current settings. If those settings coincide, as happens
here, there's no practical difference.

> I see that the XTAL constants were defined under the HWTRAP
> register so I thought it would make sense to change the code to read the
> XTAL values from the HWTRAP register instead. Let me know if you disagree
> with this.

I disagree as a matter of principle with the reasoning. The fact that
XTAL constants are defined under HWTRAP is not a reason to change the
code to read the XTAL values from the HWTRAP register. The fact that
XTAL_FSEL is read-only in MHWTRAP is indeed a reason why you *could*
read it from HWTRAP, but also not one why you *should* make a change.

> > Seriously, please first share these small rewrites with someone more
> > senior than you, and ask for a preliminary second opinion.
> 
> Would submitting this as an RFC had been a similar action to your describing
> here? Because I already did that:
> 
> https://lore.kernel.org/netdev/20230421143648.87889-6-arinc.unal@arinc9.com/

In practice, volume is also an issue. The higher the volume, the lower
the chances that people will be able to crop a chunk of time large enough
to review.

> I should've given more effort to explain my reasons for this patch. I
> disagree that the series is a large volume of worthless and misguided
> refactoring and am happy to discuss it patch by patch.

I agree that the follow-up patches, as far as I could reach into this
series, are not as gratuitous as this one.

