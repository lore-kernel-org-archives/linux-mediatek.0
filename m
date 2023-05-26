Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635BDC77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UkK3Ol11xLBzUOFBbpZXenRGfaW52LIpYuNVdpGopU=; b=Mjmu94b7jkECVXbneaHhhGCv4r
	/674UqvQfjFSodd8uUjq4zL9E8F/ugo4bOqd7d6vQUTq9vTqvpEJ2fRnDrVh+6z1BoTOcqBKAfIMQ
	YtMLvuxQk2YR7AEjxlvYEEks/sg6TAqoOvMvy+RQpCUW+gvYknLcZpMk484q7dHc1RkMTysk1iyIz
	oJlsXJOVWZjj/fGTB/T61ZQhTwuBniatBnMIECYM1e/fEjDfns8HqxdU1KpjuE6qHu8PnJ7h66Zhw
	5SZtoRrk3goHSP8lZn1wQcAvuyYScHHu5B7kfTTerx69UfrGJc8l3HKCwz2zRIz0xNn6GGI5Mv3Pj
	APufJhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2X4t-002ZDo-1j;
	Fri, 26 May 2023 13:01:55 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2X4p-002ZCn-21;
	Fri, 26 May 2023 13:01:52 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51478f6106cso763496a12.1;
        Fri, 26 May 2023 06:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685106109; x=1687698109;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+UkK3Ol11xLBzUOFBbpZXenRGfaW52LIpYuNVdpGopU=;
        b=YT9VAl+/ZzJNxlLHYnjBgzgNEshcqoBEUpSFRIUDZR5ZcObO2G5ERynF8v/ElWHu9K
         39ze1h7dpTBqIK/FlhNMxfMi7H2ypRQtuqY0qvPT2aCXKiE9BeUXsGQAoQlmaoEqj1EH
         jTurxdL0cnVywnDeluazuZmKAG8CCcFgO9UqDheXhX5MZf6Zr7SkE9gcig8jxzkaJHqQ
         QMpbt50BNsVaUuLyMfRBjZY2tMVAN8B9avpDpzp3D26+fFxh2p2d+j2B6CNStgYz/946
         BDHXjXYrS0xTro2seuyrM7jn1HZWUh4O+EkDxGGtU8aJbN0LAfr5NgjZHaWQtoCzahRq
         B3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685106109; x=1687698109;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+UkK3Ol11xLBzUOFBbpZXenRGfaW52LIpYuNVdpGopU=;
        b=XjyaRXZS/VQ/X5Ta6RqSnG8mcqCI3sMA/m6rXIbsCVhTsMx9ufsgGd/rDITdiMkQut
         2nYDW60+i9v1pZRLpJn+4AVvg0TbXHl8EaMr6O3OkRqAawxjA9hlKLiTvXol4gc0E+CB
         QvJDkwpaALs0sLnv/1ZAXIMS5UYsM5PQt9udsu7FDk+Ba5EOFsb8cdO4pWi3+qIl3bUn
         5R8CDCKka2nIvPiXrR7+Vt4v2qd3nqhQDG26MSVqo2nSfNh/HIGwXHzvjjJMwvX5dhwU
         QD4+UiNAJr3vQ4iH4YSy0Reps+QTl1tWq1ErVEOrFzgjyfuFZvaGhs4D9ey5TME3GPry
         AvIg==
X-Gm-Message-State: AC+VfDxhjpYXN4qNWyIi/kiqLmqZONujscJe4Mpw/zXhvuFgU9GluSY6
	OEkLXTKFQYPKfgzCbHHMovs=
X-Google-Smtp-Source: ACHHUZ7Q0qTv8CU3FTLJQtAIegaK0bcCQcBAXF1BfM4+j3yzx+O/MuhHTGIN+FlciNjFbwFlY+93eA==
X-Received: by 2002:aa7:d9cc:0:b0:509:c6e6:c002 with SMTP id v12-20020aa7d9cc000000b00509c6e6c002mr970029eds.39.1685106108296;
        Fri, 26 May 2023 06:01:48 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id c7-20020aa7c987000000b0050bc41352d9sm1551632edt.46.2023.05.26.06.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 06:01:47 -0700 (PDT)
Date: Fri, 26 May 2023 16:01:45 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface
 to p{5,6}_configured
Message-ID: <20230526130145.7wg75yoe6ut4na7g@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230524175107.hwzygo7p4l4rvawj@skbuf>
 <576f92b0-1900-f6ff-e92d-4b82e3436ea1@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <576f92b0-1900-f6ff-e92d-4b82e3436ea1@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_060151_661658_6F8C8081 
X-CRM114-Status: GOOD (  17.60  )
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

On Thu, May 25, 2023 at 09:49:58AM +0300, Arınç ÜNAL wrote:
> On 24.05.2023 20:51, Vladimir Oltean wrote:
> > On Mon, May 22, 2023 at 03:15:10PM +0300, arinc9.unal@gmail.com wrote:
> > > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > > index 710c6622d648..d837aa20968c 100644
> > > --- a/drivers/net/dsa/mt7530.c
> > > +++ b/drivers/net/dsa/mt7530.c
> > > @@ -2728,25 +2722,20 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
> > >   			goto unsupported;
> > >   		break;
> > >   	case 5: /* Port 5, can be used as a CPU port. */
> > > -		if (priv->p5_interface == state->interface)
> > > +		if (priv->p5_configured)
> > >   			break;
> > >   		if (mt753x_mac_config(ds, port, mode, state) < 0)
> > >   			goto unsupported;
> > > -
> > > -		if (priv->p5_intf_sel != P5_DISABLED)
> > > -			priv->p5_interface = state->interface;
> > 
> > If you don't replace this bit with anything, who will set priv->p5_configured
> > for mt7530?
> 
> I intend priv->p5_configured and priv->p6_configured to be only used for
> MT7531 as I have stated on the mt7530_priv description.

Ok, but given the premise of this patch set, that phylink is always available,
does it make sense for mt7531_cpu_port_config() and mt7988_cpu_port_config()
to manually call phylink methods?

