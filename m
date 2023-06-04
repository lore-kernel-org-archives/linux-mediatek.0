Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7804C7EE29
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 13:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7koqCf4VFYg5A/2SlKvWQmfNZkGvHu+fwrX65NT2BI4=; b=gEGFRvKG6kqtrSj0BnIuDdleC8
	G4y/+8Na9jXMeAX0JoFYITNIyY5CRwqkqFFGk+tNQtyAP9bTqMLjgsqFY3bnzM0d7j7LfnljHqH34
	fSWYc2uunEAscXzzZDNtWv4Ia+7s11wkUhNG+gaNLHkr7feMi8S7GkHk85C2abGsXdt9p7Py3uAOT
	TZevfIFJU3yWN70E1Z64luvYVRgxk1xrnEXWfRgdC2sOVFJlLKdAOqH7MOXyIPYW5lVx5xxtYwu4B
	vNQmSnx4cj/a6LVVsILkpeYOT9gG0JrG9awXP+k9LIoFe2TwaGyIDHIIohAPlYiL2mchWy+yM6mV/
	7a7gWYHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nc8-00CDND-0j;
	Sun, 04 Jun 2023 13:17:44 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nc4-00CDLj-28;
	Sun, 04 Jun 2023 13:17:41 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5149390b20aso5892759a12.3;
        Sun, 04 Jun 2023 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685884659; x=1688476659;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7koqCf4VFYg5A/2SlKvWQmfNZkGvHu+fwrX65NT2BI4=;
        b=jMZgvtnFApMUryc5DT7S8bjme4Qu0G0eeb8MHj7I7ZZSFcLIIEE66aQJvSX9v/PjSK
         Qla4Dhh0sY0o4psUyfZVUyJl8vHiKe/wIKZk9rBAtRzpjgjE5gTEWS/BbzRI8g6sd64d
         52OB/NWm8zms+Xw8EzaCDLo4GxvRLVV+aGWKQyjFGPX9zY8W7cmVcuijwWSqM9iZ5CAe
         kPVZh48BVRYR8ehICFc1RRXkSnnFRip4jEY9ZAwd21rD+yil3n//VdMNcJFN/nUnf8mv
         wCy4L/3tCKgikqc2Abaji7GTuVRmjqd3dstJg0uitXWM1WlmUZMINZGlkY3qZwngIDob
         fUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685884659; x=1688476659;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7koqCf4VFYg5A/2SlKvWQmfNZkGvHu+fwrX65NT2BI4=;
        b=WppMM5Y3TqS890S0sJUDB+eJvQubyWoLpvitbi0pa1XjznK4REmiza9dlaXfjL8e1m
         HHDdB+3a1ID3ceXx5vCYNSaD8/5vm2gHPudilNC98oN3DbxQ6EJ3fPSqs3OrBUXwqJaU
         6BQYxgRVGFrMAM9QXcedjjC+oSWzOyxnvhsTP43LfenaLUulXNF0Fh8FVnBXTyWzctDZ
         Weboa4ReH5L6UJbo55BeStU4kK+z1hcw3RTD12MBQ/j4ZeBuztzQQcKE6nO/Nisw/DiS
         MoxTEQPyPLdEdkzBhMAeZ6tpdy+SUQYimg/6vr1vDu2ZPz5isAqVNMAw11oRKDZt7Evl
         CeRw==
X-Gm-Message-State: AC+VfDzuvy31J7FLr09gty5SHMhZaclsaKN6Nf1c5PrMnxExaf8nX+8t
	0H+uvTsPS/Bq580EERqF5Go=
X-Google-Smtp-Source: ACHHUZ7saaoTRYRxO+7KKd51tlh3hT91vDB1ym0R5O2wcD/2PGqGdEjATdeMyC7eoypX6390GMp+xw==
X-Received: by 2002:a17:907:720c:b0:973:ff8d:2a46 with SMTP id dr12-20020a170907720c00b00973ff8d2a46mr4415968ejc.3.1685884658963;
        Sun, 04 Jun 2023 06:17:38 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id s18-20020a056402165200b00510b5051f95sm2730393edx.90.2023.06.04.06.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 06:17:38 -0700 (PDT)
Date: Sun, 4 Jun 2023 16:17:35 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 24/30] net: dsa: mt7530: rename MT7530_MFC to
 MT753X_MFC
Message-ID: <20230604131735.f2clcinq67wspuun@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-25-arinc.unal@arinc9.com>
 <20230526154258.skbkk4p34ro5uivr@skbuf>
 <ZHDVUC1AqncfF2mK@shell.armlinux.org.uk>
 <e4aff9aa-d0c6-1f2e-7f16-35df59d51b90@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4aff9aa-d0c6-1f2e-7f16-35df59d51b90@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_061740_704223_BFA27672 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jun 04, 2023 at 11:06:32AM +0300, Arınç ÜNAL wrote:
> > Even better are:
> > #define  MT7531_MIRROR_PORT_GET(x)	FIELD_GET(MT7531_MIRROR_MASK, x)
> > 
> > > > +#define  MT7531_MIRROR_PORT_SET(x)	(((x) & 0x7) << 16)
> > > 
> > > and here: (((x) << 16) & GENMASK(18, 16))
> > 
> > #define  MT7531_MIRROR_PORT_SET(x)	FIELD_PREP(MT7531_MIRROR_MASK, x)
> > 
> > No need to add parens around "x" in either of these uses as we're not
> > doing anything with x other than passing it into another macro.
> 
> Thanks. I suppose the GENMASK, FIELD_PREP, and FIELD_GET macros can be
> widely used on mt7530.h? Like GENMASK(2, 0) on MT7530_MIRROR_MASK and
> FIELD_PREP(MT7530_MIRROR_MASK, x) on MT7530_MIRROR_PORT(x)?

I suppose the answer would be "yes, they can be used", but then, I'm not
really sure what answer you're expecting.

