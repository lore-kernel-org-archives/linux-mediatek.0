Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BF7C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xe29dpH/lEwoUgqXwXUV/OMUbK9mfNYESN56Bn6Kzu4=; b=fmd+uEdwTQF5RY/SKfEf6ikvFS
	zTX/Gxvns04shoHnktv2vBOYqJ4SU8pZPOsnG4M8yl7Y5uMM5CDCFMHpN6eBb/fjDQhSoUGBQ2PHF
	M5Me619NiYahaJBS7gwABl15/fAF8DfwlP/+tngIHqTPpSE+0yFqWozm0bBQcNrV9VoYH+SkRJ3Ik
	huSUqcvRzQ9YhE35GTx7dYu7zjTdwhslkPtkb05TaWFBJ7EFq6yfP3lQ2wQaw9E5lLCJ7qcwDyFwG
	u950vie65IPmrIn34sXF50PPZmeOnmhQQaeOJoDmPiIWqus/IloZ/v9VKzE2sYT0+ffNO7k/5aFLf
	j9e1Khrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQWuq-007LSc-94; Tue, 23 Aug 2022 16:38:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQWum-007LQC-VP
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 16:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661272687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xe29dpH/lEwoUgqXwXUV/OMUbK9mfNYESN56Bn6Kzu4=;
	b=WY8joLahEERGHVc563Ywgqf/ijzJa4iW4UIxwz8vXUBeg0VqyZluuUaSReEp9ufBtVhC4+
	tk8KV8BwYbHMTmyfh126YhTVA1IR3n83rPZTb3Jj6/bHqAzgE7XB9i17AqLtWKonJo9zd6
	oIkwi85xP0TkukyOnIdDPs7HCIFiiuc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208-xkAiKOqINtSaakCWJ_5l7g-1; Tue, 23 Aug 2022 12:38:05 -0400
X-MC-Unique: xkAiKOqINtSaakCWJ_5l7g-1
Received: by mail-qv1-f71.google.com with SMTP id od16-20020a0562142f1000b00496e2ea7934so3702165qvb.13
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 09:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=xe29dpH/lEwoUgqXwXUV/OMUbK9mfNYESN56Bn6Kzu4=;
        b=DXJCbw262zQ2oafJFiUWmGfzP4V8RDBzhYM7L/L0IcNBPtEkzoAb+zTHmRmJ804fdQ
         YZj8d8MRR35esyxqKdA0lp+u8DtwXrRbZvmzLj0+u0utA8VdQd2AKMgfKjwCezX+oMyg
         iE/26XR1TODj63WIgiUp6Ctko4zIpEUkg0iN9gYieDNN0qVGR+YWP3dOTDESlaf1qnaB
         xxaS+2nZ9rXDIemi8gBqtWGZ02yT4mQBVUIzHDaM6IgAm2F2cD0vtgC0RJH7ftv1oSBw
         /L+NFeIrMuIioWI30iQEYqYQ+LYzKgVyx/x4CiCm9ydFbxSzM/KbVLmEJpU4+tXT6C/D
         TmXg==
X-Gm-Message-State: ACgBeo2cM0ZJuyecvPsWmXAlsf2FoGkyW8WU/TB9aiv1cmE38elvGbam
	i5kWXKDlb9Wz5IfMERCAqbdwrwi3gQBWxYTp6hu2X2xdTac5p2AHa9tyW9twNtvCVpflcpyajeD
	CCJsBqHQaYPhj9mIY7iSS2SAj462SAtqt
X-Received: by 2002:ad4:5aae:0:b0:496:dd09:9cc6 with SMTP id u14-20020ad45aae000000b00496dd099cc6mr10131377qvg.130.1661272685341;
        Tue, 23 Aug 2022 09:38:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7hiUx6KqHne7ie641hJobc8RQc2G0WUgp2XEXEJJ0nVJG12HNX/e7DZI8cUcUAGpyGHTvJlQ==
X-Received: by 2002:ad4:5aae:0:b0:496:dd09:9cc6 with SMTP id u14-20020ad45aae000000b00496dd099cc6mr10131352qvg.130.1661272685049;
        Tue, 23 Aug 2022 09:38:05 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-97-176.dyn.eolo.it. [146.241.97.176])
        by smtp.gmail.com with ESMTPSA id q9-20020a05620a0d8900b006bc0c544d01sm6580768qkl.131.2022.08.23.09.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 09:38:04 -0700 (PDT)
Message-ID: <d6cfce0d7210762bf0c4130ea4d59470cbabfb56.camel@redhat.com>
Subject: Re: [PATCH 2/4] net: mediatek: sgmii: ensure the SGMII PHY is
 powered down on configuration
From: Paolo Abeni <pabeni@redhat.com>
To: Alexander 'lynxis' Couzens <lynxis@fe80.eu>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Daniel
 Golle <daniel@makrotopia.org>
Date: Tue, 23 Aug 2022 18:38:00 +0200
In-Reply-To: <20220823161712.2cafa970@javelin>
References: <20220820224538.59489-1-lynxis@fe80.eu>
	 <20220820224538.59489-3-lynxis@fe80.eu>
	 <efd1c89e3bbd7364ef381292c9ceff430cbeda8d.camel@redhat.com>
	 <20220823161712.2cafa970@javelin>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_093809_121376_F70B97E5 
X-CRM114-Status: GOOD (  28.47  )
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

On Tue, 2022-08-23 at 16:17 +0200, Alexander 'lynxis' Couzens wrote:
> On Tue, 23 Aug 2022 15:18:31 +0200
> Paolo Abeni <pabeni@redhat.com> wrote:
> 
> > On Sun, 2022-08-21 at 00:45 +0200, Alexander Couzens wrote:
> > > The code expect the PHY to be in power down which is only true
> > > after reset. Allow changes of the SGMII parameters more than once.
> > > 
> > > Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> > > ---
> > >  drivers/net/ethernet/mediatek/mtk_sgmii.c | 16 +++++++++++++++-
> > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c
> > > b/drivers/net/ethernet/mediatek/mtk_sgmii.c index
> > > a01bb20ea957..782812434367 100644 ---
> > > a/drivers/net/ethernet/mediatek/mtk_sgmii.c +++
> > > b/drivers/net/ethernet/mediatek/mtk_sgmii.c @@ -7,6 +7,7 @@
> > >   *
> > >   */
> > >  
> > > +#include <linux/delay.h>
> > >  #include <linux/mfd/syscon.h>
> > >  #include <linux/of.h>
> > >  #include <linux/phylink.h>
> > > @@ -24,6 +25,9 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs
> > > *mpcs) {
> > >  	unsigned int val;
> > >  
> > > +	/* PHYA power down */
> > > +	regmap_write(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL,
> > > SGMII_PHYA_PWD);  
> > 
> > in mtk_pcs_setup_mode_an() and in mtk_pcs_setup_mode_force() the code
> > carefully flips only the SGMII_PHYA_PWD bit. Is it safe to overwrite
> > the full register contents?
> 
> I've read out the register without my patch and it's 0x0. The old driver
> worked as long the engine came out of reset.
> When writing the single bit SGMII_PHYA_PWD (0x10), the register might
> end up containing 0x19 and as long 0x9 is in the register the link
> doesn't work.
> 
> I've tested the driver with a mt7622 and Daniel Golle tested it with a
> mt7986.
> 
> 
> > 
> > > +
> > >  	/* Setup the link timer and QPHY power up inside SGMIISYS
> > > */ regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER,
> > >  		     SGMII_LINK_TIMER_DEFAULT);
> > > @@ -36,6 +40,10 @@ static int mtk_pcs_setup_mode_an(struct mtk_pcs
> > > *mpcs) val |= SGMII_AN_RESTART;
> > >  	regmap_write(mpcs->regmap, SGMSYS_PCS_CONTROL_1, val);
> > >  
> > > +	/* Release PHYA power down state
> > > +	 * unknown how much the QPHY needs but it is racy without
> > > a sleep
> > > +	 */
> > > +	usleep_range(50, 100);  
> > 
> > Ouch, this looks fragile, without any related H/W specification. 
> 
> The datasheet [1] doesn't say anything about it. I'ven't found a
> mediatek SDK which adds a usleep(). It seems they always expect the
> SGMII came out of reset and don't change after initial configured.
> But without it, it's racy.
> 
> [1] MT7622 Reference Manual, v1.0, 2018-12-19, 1972 pages

I see. 

Since it looks like a new revision of this patchset will be needed - as
per Russell comments - I suggest to extend/replace the comments with
something more alike this longer description, it will make the future
mainteinance simpler.

Thanks,

Paolo


