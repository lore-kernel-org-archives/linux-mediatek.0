Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD18C47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 19:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eLfl0HX6++Px3EAfYBIkTshUZGU3OZxAvTMxrDWMYE=; b=up/aKKWukJQQ1yT2UbQQjU8hZL
	QtudHkonHJsjgy8GUDljWcKt2iDKTyomK2gfuKLgkLtOyXtE+5T43lyv+tKeYNDzDGPap886wwuSr
	2kURTO+t3YBzJrSrGVekNTRh2ZLUE8JAJUB8LXzmyxNWNJ3IR1HNDR9ivhyDAHcDhuGJ4g0i+Jb5D
	IDjDSuySqFworWfVEYj7tPRpkB9VTL1tSoxRLSRirf3qEz57RIY+GdBORr8pIKPdfgFjU8CgvH0kv
	ZTJvsVgKBc9P5qfCaLuSbGXidFtBFFGjo3PYsAlbG1slcUK2DYv41Eb8BcNCEXnP+UrVr4JKrccvF
	2ZYajzmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS0Bk-00DktO-0h;
	Mon, 22 Jan 2024 19:42:32 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS0Bb-00DklY-2e;
	Mon, 22 Jan 2024 19:42:25 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2dd05e02ffso354772266b.3;
        Mon, 22 Jan 2024 11:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705952540; x=1706557340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eLfl0HX6++Px3EAfYBIkTshUZGU3OZxAvTMxrDWMYE=;
        b=OERCGg+QFC6HH9Cw1TwujhwSzI9L2gD6WaSmsGMfu1U4mTTQdVCXe8qYQMHhmqJifq
         sQffpXLgh+I0vQH4Dr30ArDAykIQ8atmL08y48k9O7XlSrEsyBOKoK90iHhnif64VDEm
         LvPAuN1qlcCnt9kw7iPYmPxA45kfEaiTgWueSRpv0qDtIZP8Na9p6FlDNjkvYD2Vysyf
         XL3nshaXhAMPxtOjLZAqMiCuJWaJEpaFmpq+d4aO48rIM0KnwU0PP0z9dXRN84mNNB63
         eYGvrL/YPV3KGSKpUQj/e8OLGRsmHuksl5K5J4t5yZprTdfvLqWoiNKckbEMOJAnwwNR
         mtUQ==
X-Gm-Message-State: AOJu0Ywg5WpS5jCk/7sE0gCl1SKDmVTfJFk8oZB5fS32S9KdwkeFbBC8
	FfENCySBnjJc1+nTa0WNxcsKyL1mf9l0o8zngfKgZTM8i2s1HZK2
X-Google-Smtp-Source: AGHT+IGFDrIf8N972kKgxrVcyi7WYBgEj25uwIEFf8XU2BYN2taBe0GLDZSjKrdJLU5gOXmfwwOIMA==
X-Received: by 2002:a17:907:18cb:b0:a2f:ba78:2b3e with SMTP id lm11-20020a17090718cb00b00a2fba782b3emr1457199ejc.101.1705952540153;
        Mon, 22 Jan 2024 11:42:20 -0800 (PST)
Received: from gmail.com (fwdproxy-cln-015.fbsv.net. [2a03:2880:31ff:f::face:b00c])
        by smtp.gmail.com with ESMTPSA id cu15-20020a170906ba8f00b00a2ec877d3a6sm6726116ejd.167.2024.01.22.11.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 11:42:19 -0800 (PST)
Date: Mon, 22 Jan 2024 11:42:17 -0800
From: Breno Leitao <leitao@debian.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: kuba@kernel.org, davem@davemloft.net, abeni@redhat.com,
	edumazet@google.com, Ioana Ciornei <ioana.ciornei@nxp.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>, Alexander Couzens <lynxis@fe80.eu>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>, dsahern@kernel.org,
	weiwan@google.com,
	"open list:LYNX PCS MODULE" <netdev@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next 03/22] net: fill in MODULE_DESCRIPTION()s for
 PCS Layer
Message-ID: <Za7FGS7xfBBq0Te+@gmail.com>
References: <20240122184543.2501493-1-leitao@debian.org>
 <20240122184543.2501493-4-leitao@debian.org>
 <Za7ChrR88vvqAJ5X@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Za7ChrR88vvqAJ5X@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_114223_880879_97E60A6F 
X-CRM114-Status: GOOD (  16.62  )
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

On Mon, Jan 22, 2024 at 07:31:18PM +0000, Daniel Golle wrote:
> Hi Breno,
> 
> On Mon, Jan 22, 2024 at 10:45:24AM -0800, Breno Leitao wrote:
> > W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> > Add descriptions to the LynxI PCS MediaTek's SoC.
> > 
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> >  drivers/net/pcs/pcs-lynx.c      | 1 +
> >  drivers/net/pcs/pcs-mtk-lynxi.c | 1 +
> >  drivers/net/pcs/pcs-xpcs.c      | 1 +
> >  3 files changed, 3 insertions(+)
> > 
> > diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
> > index dc3962b2aa6b..d51d09beaab3 100644
> > --- a/drivers/net/pcs/pcs-lynx.c
> > +++ b/drivers/net/pcs/pcs-lynx.c
> > @@ -398,4 +398,5 @@ void lynx_pcs_destroy(struct phylink_pcs *pcs)
> >  }
> >  EXPORT_SYMBOL(lynx_pcs_destroy);
> >  
> > +MODULE_DESCRIPTION("MediaTek SGMII library for Lynx PCS");
> 
> Nah, pcs-lynx.c is used by various SoC vendors **other than MediaTek**
> such as Freescale and STMicroelectronics.
> 
> Users of the pcs-lynx.c driver are
> ethernet/stmicro/stmmac/dwmac-socfpga.c
> ethernet/altera/altera_tse_main.c
> ethernet/freescale/dpaa2/dpaa2-mac.c
> ethernet/freescale/enetc/enetc_pf.c
> ethernet/freescale/fman/fman_memac.c
> dsa/ocelot/felix_vsc9959.c
> dsa/ocelot/seville_vsc9953.c

Thanks. What about something as?

MODULE_DESCRIPTION("Lynx PCS MDIO helpers");


