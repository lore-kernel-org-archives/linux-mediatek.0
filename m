Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADA7C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWBdICZs1ylHFsz8zslSqh0ccqIAuQOZUPv8JnOg1n4=; b=KdTvGWPQXWH8Vx9zph8f2xYNL+
	tSrjezFU0DHWp9P/t3Byoq5jd8GlG0pMcUf5deaHSGFyZZNDY/PzgaigB53BgTlPIcb7bGQrd9E+b
	cdSHLgslLWx0jQwasGabMWMGkTgSBHbDrtOcXQikaIaFHwgTLI2JgaxQSyYzOfCuDtTbK9kP45Lub
	KPxCXnZD2OIheL3J+TnhlSoPaozueiLSyBKm6WtebD0bmjDOvtY/W11riL5k474qXMPmqCgaACPCC
	uv7mZShBHOdnS7MBn/Cyl2l+XpPUSpiWUFVfN8FUGmj0HOwICu5aOVl0LeyExig9MORrNgzdzjNfB
	Fe8Qf6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sYT-00EFBg-2C;
	Wed, 24 May 2023 17:45:45 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sYP-00EF99-2z;
	Wed, 24 May 2023 17:45:43 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-96fe88cd2fcso228052366b.1;
        Wed, 24 May 2023 10:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684950338; x=1687542338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nWBdICZs1ylHFsz8zslSqh0ccqIAuQOZUPv8JnOg1n4=;
        b=Ph7hH4NN5Xzd3WzBdsSVQS8+U87aBSWIrpyy7+WW0QkU1h5rnmAglEqXX+qT8idyBn
         tuGBsqy4bNR0P53kYTfSXcv1RVx8P56JrjDguFJ2xDB2Jik1T7xuU68m7BLTI6vydpBx
         4/vYBbe6gwOchR/v4SnWspk2/qa+klTSroJ/HZE9nio1csB5CsvtuWQBAw3X2wM5N72V
         RWOe1yPtyX+SB1o+4y7Vfl1FqeSZah/FtQcfO7aAisxjzo96nvUquvYRLFzTHHRJYfMB
         we7KhGHMmZmN1xxtrD17MLFmjbw8pI8ji/9G6fRM7laNyrmArTJCgVKO4wfxQTUk5mg6
         DTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684950338; x=1687542338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWBdICZs1ylHFsz8zslSqh0ccqIAuQOZUPv8JnOg1n4=;
        b=HxpoDJGhLWV4KgvGaL72rCrCTsNGauwZMh3fRaBp3c9FFW+VcM1w18ze0hjiS0EK4F
         duvqMkIxsjh+kbBGbak0/DaULzTkO761i3VGg6YjUnu1lANztN9CEvVJhqtgb6AB9dCL
         f56xBHAZxAExHVDCUGbmrPWMCYapGIq75NDj57UrBREtAi7s+PtFID6d7ct2FowSWf65
         qJPh1HasfotHpEsVY2bC3tc84E8iAArvzC6tKqTLTXEIbXkGtYs09aPQ6Pzm8t3MtKK1
         IebdZnykuiZhxpkZ/MH8lG0/WE1qVRtF8FOW21j5zvNc66p5Y9MzTkFEn4VpZpG3JpG5
         JsuA==
X-Gm-Message-State: AC+VfDx3rcpLZybfgqYOt1S4sqfAH15PACv4UpMUNUOHrPrCaJhUaUUK
	YOSiYtqukVXMpojXqpU3kjg=
X-Google-Smtp-Source: ACHHUZ5kNjjMXypD+xFlWxn/uIyXBW8jfQ4bsLcwCAUAU/F/MLjAg+8IbDjx5a+657iaeX5f2L+AEg==
X-Received: by 2002:a17:907:9809:b0:966:23e5:c8f7 with SMTP id ji9-20020a170907980900b0096623e5c8f7mr17741535ejc.62.1684950338056;
        Wed, 24 May 2023 10:45:38 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id ja26-20020a170907989a00b0096b55be592asm6025738ejc.92.2023.05.24.10.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:45:37 -0700 (PDT)
Date: Wed, 24 May 2023 20:45:34 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 07/30] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Message-ID: <20230524174534.hcxn6tjhjmho6io7@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-8-arinc.unal@arinc9.com>
 <20230522121532.86610-8-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-8-arinc.unal@arinc9.com>
 <20230522121532.86610-8-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_104541_981771_DD2545D9 
X-CRM114-Status: GOOD (  13.65  )
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

On Mon, May 22, 2023 at 03:15:09PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There's no need to run all the code on mt7530_setup_port5() if port 5 is
> disabled. The only case for calling mt7530_setup_port5() from
> mt7530_setup() is when PHY muxing is enabled. That is because port 5 is not
> defined as a port on the devicetree, therefore, it cannot be controlled by
> phylink.
> 
> Because of this, run mt7530_setup_port5() if priv->p5_intf_sel is
> P5_INTF_SEL_PHY_P0 or P5_INTF_SEL_PHY_P4. Remove the P5_DISABLED case from
> mt7530_setup_port5().
> 
> Stop initialising the interface variable as the remaining cases will always
> call mt7530_setup_port5() with it initialised.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

