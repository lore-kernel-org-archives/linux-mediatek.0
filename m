Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDF7C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMA9OrU/15fPUa0Dy5HWt9/3JbIUzxDlly+e73u9etQ=; b=ML6IbW2RNIYsK4J4fCZuCeJXk4
	rN3302WocNQ4tMsKdUbIIGH8BwaCLr/AF1CIzmBIA55enpAxt62Qmop1XtkzuR5CFUGb1Gc7j9RSK
	sMIgdxXUI5qj7SvKxO3QVoeJbZaiiXIXUKBTBk+gc+h72WoU8Ru8OUIp2iFj7QDo5HuxIUgCP7CoK
	jwwLKIST9/84lvtIIZ5ZEcoMHMzRKkE97tVVC8ICKa1wZzg3eL1wdeI8n90odFEbGJs475aLolsxx
	In6dYVvpesRQsfLqrd1KR43iWy2LGomAcYttTlSRxjivtR18hxY6YeCl1V9yU4rPQjtiTP8dqS8/S
	AD/Gi3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1pmu-00DjIQ-1B;
	Wed, 24 May 2023 14:48:28 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1pmr-00DjHK-1t;
	Wed, 24 May 2023 14:48:26 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f24d8440c9so1046689e87.1;
        Wed, 24 May 2023 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684939702; x=1687531702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XMA9OrU/15fPUa0Dy5HWt9/3JbIUzxDlly+e73u9etQ=;
        b=SRGgeknfaJW9HxYvJDQYT3/MtL3CtkbovJiM1N4FuHjrfmsuijxccWeL8T6BZ8srnn
         B67fpywaBScdbX4GcRdGuZu9+uQcFIvdYrmuUY4lfx6++q0iUdE/J0mIAZ/0D7f14YpP
         h77AhZOR8avLjbV++eaHDlilOwr3Yn9StKQqMsVsEvZovwU1IL0b+HVgg++Xv4w1RRYN
         mLsmXdy2ZHn8Ltv1yQEXmYTBtZjzju/HSAg8hg8pJR3VkMm+/5pqG6WoHf//uxqcp+nY
         iiGopGp1bIbWstvn8UufMhd8O0tJV/pIO8kSJq11hZ9wBlT0wc+l0E1uqZgs0IcJPu3C
         wOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684939702; x=1687531702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMA9OrU/15fPUa0Dy5HWt9/3JbIUzxDlly+e73u9etQ=;
        b=XOeD09a5nzMMbQ+UqguEiyLZhKikvIEYCgTGcc4i8IbBLAhoDLcgxm88eT6X3vBiUN
         n0sC1UAJsCGarVTH0BKJ5gKMhEtEnFRcOMIrnEja20j2la/bYwNGcPIcw6tgtG2xOcpR
         d+vXhS+JglWW2VmrQe9BJWlxgI5ZFwJRsDNLU/Q8BXfy0sx0rxaDGyWNqfk63ePHW8wm
         9uNb0EFAmOtyj1A2dOCPydnYnjen7mymt/9IcuT+Fkf2VottgLpIWE2oyUrxPv5YxUQd
         wzfm9XRk+dJZbTGvUTn+Vt5sXdLhIsh3HElmIwrKCqHdVwRUmU5qLkl+yCdzNmx/+UXB
         RFxA==
X-Gm-Message-State: AC+VfDzLBLOKGya6vS71mSZIpSn4i4Er9tKei3N7TeIkl6RvYgF6kEJc
	JCIeikMd47nMgEP/SM5vg2g=
X-Google-Smtp-Source: ACHHUZ5XkiPQ059g/mB5V15M6VwZz2Sbq592VYrkn4uU78BxhyGBj66JRl7gvxctkgOXcoC2bcw4Gg==
X-Received: by 2002:a05:6512:3d0d:b0:4f4:7a5:e800 with SMTP id d13-20020a0565123d0d00b004f407a5e800mr3788949lfv.10.1684939702123;
        Wed, 24 May 2023 07:48:22 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id u22-20020ac243d6000000b004f14535a962sm1750995lfl.174.2023.05.24.07.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 07:48:21 -0700 (PDT)
Date: Wed, 24 May 2023 17:48:17 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 03/30] net: dsa: mt7530: properly support
 MT7531AE and MT7531BE
Message-ID: <20230524144817.dubqwmfbthes2ggh@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-4-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-4-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_074825_645792_8F322F03 
X-CRM114-Status: GOOD (  18.36  )
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

On Mon, May 22, 2023 at 03:15:05PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Introduce the p5_sgmii field to store the information for whether port 5
> has got SGMII or not.
> 
> Move the comment about MT7531AE and MT7531BE to mt7531_setup(), where the
> switch is identified.
> 
> Get rid of mt7531_dual_sgmii_supported() now that priv->p5_sgmii stores the
> information. Address the code where mt7531_dual_sgmii_supported() is used.
> 
> Get rid of mt7531_is_rgmii_port() which just prints the opposite of
> priv->p5_sgmii.
> 
> Remove P5_INTF_SEL_GMAC5_SGMII. The p5_interface_select enum is supposed to
> represent the mode that port 5 is being used in, not the hardware
> information of port 5. Set p5_intf_sel to P5_INTF_SEL_GMAC5 instead, if
> port 5 is not dsa_is_unused_port().
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> ---

Pretty busy patch, and after reading it, I'm not sure:

- why? (this seems to be absent from the commit message)
- how are MT7531AE and MT7531BE supported any more properly after this
  change, as the commit title claims
- what is the overall effect, other than just refactoring. If that's
  all, what's written on the tin needs to be a better representation of
  what's inside.

Pure refactoring is not a bad goal in itself, as long as we're on the
same page that there is a justification which makes the new code better
than the old one.

