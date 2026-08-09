Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DA0C5AD55
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 20:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vO4zsqd6+CKiqzXBlsgszWemmLXQdGd/m+GIX3H8Vzs=; b=BukpKrCqQy4g/LuQbMZp2oYRpF
	KYlDRexDj3nCizXBVG3dwND4bE+21wAuSP2nHoM1SzrrAo1cv+XGARacSp2DjGFDeucOUO+69XY8X
	ntxDPc+1+4KhloPriSpse92nO3Qk1DQ14gjNZ2ruHkDJBNpsnXuhN48LbPFS6ialyMhCF/AHqKBlt
	KFp3PNuMg3fSE8jFweoExKo/ZXF+B3zBhqlDmSE2uJyFbGA2cV7d1V7tsTfZOqQZhFqqhrmLHppHM
	61C8gyhEq62DtwR2ktZpSoEvkxcS+jCwyDrr09Tm21xm9kP6A6UAyUkGLqx5LhTQo/jenaelxpPLa
	6ztCt3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtAcT-0000000AiQv-3NoI;
	Sun, 09 Aug 2026 20:59:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtAcR-0000000AiQ9-0bTY
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 20:59:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-480033bdcf4so578999f8f.2
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 13:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786309181; x=1786913981; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vO4zsqd6+CKiqzXBlsgszWemmLXQdGd/m+GIX3H8Vzs=;
        b=SyrDrtgLmdoqdb8v/MJFn2wXAh8asgfqdNhZPFIw863ueFiP2YgGdZCwplHH83bySd
         WUtuZtJzp8swPzKOM0tt+Lbbpj4e8faBUytSXi3/xNv+yxBgIMPe5/gFa7WL/kgNm99g
         WRpahvzGvfng0cCGCOIwZg43adCr8ft2+uOPo1Vt/Gi93binh1Gw08ZZ8xaIQuQk1d9/
         nIyJdExklPeJxB0NvE8qQTeBqtQlZYo5nZCPOn8D3rUBL1EHU60SfJK25qxW/IkaE9k1
         iU1HMpt7JmeCpHueSt4vzRxt1F3Q/Gnlmjv0clEaBHbrHJabjz+DeWqAnhprUxbDYXv/
         85hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786309181; x=1786913981;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vO4zsqd6+CKiqzXBlsgszWemmLXQdGd/m+GIX3H8Vzs=;
        b=OHN20fY/NUhPX293IeleWrhMMtppyvcao8G1TlqEra2tgKbVpXWtk/4SePSe14h+Bz
         G4T/rKuyZFyC80LrXBUPlOEuyvLy+8d6OMBtyxvLg0j9m6xyrklMqEEWLFHZMwP283zu
         2omD45Nh3FOQgbnJnTYCjRkki8bMlkNRoxyml8R+3/hDuedPRox+vOklLzRuoktTjNzI
         zyRoT0Mg/1wapGqxGrMYkiru41xUS34q+sibX6fJMaGVyfkrht4RCFF5+63LB8hZq2m+
         +laHdDM5lmvHDH8e+EdY2xDKrUwF/USMRjxc3vKlauzQDx9r6gxy83ZBm8vNKNfFccNG
         n8pg==
X-Forwarded-Encrypted: i=1; AHgh+RqfzJEQq37rb8OtN8opM9Q9lswcE8mnd5lKNsN3AkEWv+Yft4K3XsOb2fItM4rmFPtssifdYmqEdAz9I1nmrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq1RGjFoGKXnyDvvMcG4P/xFJRPjsfag6waxxSUvzyN6xFH8KP
	0BzSVTcArghz79KvccHnMmRa92PJacXckK85FyCfWltxN/l0hFJgSMKN
X-Gm-Gg: AR+sD13PC19FNK+RO6FAHRhcbiAIDUJ7iVnpyGMC9bKrJTNK6em97FqpS6hU2WWRcTW
	DVvVHJMLa/0HO6pVIZJno8j/YgT2O4eSOanfh+MrwlfV1BHGg/CM9oLmL6FUssoWK1Of2KL4muY
	I/ry0q6496Q73GZBQwaGkx4cs8JnEPJYOMrHkmL2eROxAqnmtqGqwwOPQ+u8ALQeD18hSRvIJ4R
	vjDdl4Ql0nzDTbMma2FbxDM3Sx0FPt7X1CKRTa6ur4frqtzvu5gF/o8mVVwcMXpy6XMVqHij7sO
	UzJjhdCa08awjqv4XUpt9WgvYV/avtX2TWHU1NTM9W7UYSWAcxG8KrINci5cTWsNxEofAMZla5Q
	H2T92kdthHF2KajGHb/RB0XGOT/Nwfapl0YRZHZsugNI/soNdfm4y92wF7EpwgqQBAZeVY6veKd
	EpapAA8+6IX8nSYXSUMUfGW97gfihEyZFr20kaUngu6r/LQNoc7cu/geCRRR6TupiTadMIvAy3f
	1C4Ium2KceYNsaWFjCqvkb6MA0rNf8=
X-Received: by 2002:a05:6000:2006:b0:480:c5:d635 with SMTP id ffacd0b85a97d-48000c5d6d9mr30371840f8f.0.1786309181299;
        Sun, 09 Aug 2026 13:59:41 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220a6d9sm30149581f8f.34.2026.08.09.13.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:59:40 -0700 (PDT)
Message-ID: <6a78ea3c.be490abf.cfd7.7505@mx.google.com>
X-Google-Original-Message-ID: <anjqOJWkUJvo6Wsi@Ansuel-XPS.>
Date: Sun, 9 Aug 2026 22:59:36 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v11 00/12] net: pcs: Introduce support for
 fwnode PCS
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <4c595c15-17d9-4c23-bb44-344c48d36e9a@lunn.ch>
 <6a78bdc6.89544747.3fcae.b8e0@mx.google.com>
 <f9151481-7dcf-4c9e-9507-7eb0c217851d@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9151481-7dcf-4c9e-9507-7eb0c217851d@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_135943_224906_E8C48CB0 
X-CRM114-Status: GOOD (  28.25  )
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

On Sun, Aug 09, 2026 at 10:43:27PM +0200, Andrew Lunn wrote:
> > I think the most annoying one will be stmmac with the 3 different PCS
> > implementation but we already handled that in a upcoming ipq50xx driver
> > currently present in OpenWrt mainline.
> 
> stmmac is always annoying :-(
> 
> If this can make it more uniform, make internal and external PCS look
> the same, that would be great.
> 
>

I posted v12 that should smooth stuff even more. I think I found a good way
with the notifier approach.
 
> > @@ -6808,7 +6792,10 @@ static void mvpp2_acpi_start(struct mvpp2_port *port)
> >         };
> >         struct phylink_pcs *pcs;
> > 
> > -       pcs = mvpp2_select_pcs(&port->phylink_config, port->phy_interface);
> > +       if (mvpp2_is_xlg(port->phy_interface))
> > +               pcs = &port->pcs_xlg;
> > +       else
> > +               pcs = &port->pcs_gmac;
> 
> I thought the point of new API was that phylink picked the PCS. Why
> this if? Why not register both and let phylink pick?
> 

Yep I'm not sure of this... If they expose different interface mode then
both can be provided at the same time. I think it was done to reduce the
logic difference and patch delta to the minimum.

> > +static int mvpp2_port_fill_pcs(struct phylink_config *config,
> > +                              struct phylink_pcs **available_pcs,
> > +                              unsigned int num_possible_pcs)
> > +{
> > +       struct mvpp2_port *port = mvpp2_phylink_to_port(config);
> > +
> > +       available_pcs[0] = &port->pcs_gmac;
> > +
> > +       if (mvpp2_port_supports_xlg(port)) {
> > +               if (num_possible_pcs < 2)
> > +                       return -EINVAL;
> 
> This seems like defensive programming. If we said there was two, we
> should assume available_pcs has room for two. I would not even pass
> int num_possible_pcs as a parameter.
> 

Yes the if is redundant. The phylink core code ALWAYS allocate based on the
phylink_config value. The num_possible is just as a validation value of
what the space allocated in available_pcs.

If everyone is ok I can change and include this in the series.

-- 
	Ansuel

