Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26864CAC598
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Sep 2025 09:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i09V1V+8m07vXTofqYygiTDdC5J30D33C6bZzl31WR8=; b=guldQIIWwCTcse23ZzPfsJeeaw
	ja9oZI1pCh0+U+CfPANp9zDsYOan60pTPX/oCpcAGgtFjmsoj4IMCu1BxnuL3vhmqPZ2QxXS7dUya
	ZktwWlTvtqCbn2zp7o7i6BjmFd3GqZaaZvWwzej4o6o1ilSbbbR+EMD61of+uti7lLMnm3FB2wEGf
	vgheBA92tWCzrBkfEWWvVZip22WjIPKSPY9CGtElGe2tOL0+gpIkzvNO4RuvXsLcWvOYAyLYfdi8F
	EFVZQ2UDUYn2xH+gNCCs1/uVicRMllVHHygFCKmqpf2rkEsl9EssLKGnECrJaBmAOzrkpC9bMwH/Q
	ZSz1Gjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyogE-0000000ApnA-1inH;
	Wed, 17 Sep 2025 09:42:26 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyogB-0000000Apm0-19dp
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Sep 2025 09:42:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45f2a69d876so21992295e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Sep 2025 02:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758102141; x=1758706941; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i09V1V+8m07vXTofqYygiTDdC5J30D33C6bZzl31WR8=;
        b=hS1loWfcpf4Z1lwP8fv5reV9nW/DVyGiF4pq1qTi7lYE1SoHHOWBBNjZj5ELxPx/oi
         t25nvY1wU7mq4cqvmc9k8dgbK71fYXz+rNpKCbPTJsY5eHPE8H0p90zrZlAJBWn2Mnuv
         QR+HUJ4uNgtg6DGFG4+G7IVw0PhBzUCayouM4E1jqXzbmnlWuVXKQODNknPS4bZov1gV
         HBkBvS4yZaIxMUqV1mEa5phvzgmFM+Vu62S/+YYKZGVDcnqiG/r+7dzG180GdAVSnW3p
         FmGS74h5woKP6R5vUZQ7VVeHa4G0x7haENqdgDN4/ByW1zpoBRoYVhw9mu7cWzTmVfVK
         mzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758102141; x=1758706941;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i09V1V+8m07vXTofqYygiTDdC5J30D33C6bZzl31WR8=;
        b=v120ujKTugA2LgOqNZLR3TSmiJJJUG/QEHXvvzVTKC3/9AG2idUBhN6pK8/buCxYTK
         l3dNVYXsCTX8FBJWesuOcVTWf9vncfHo/GslJPNU2u4FRMnI1fXOVTFTvjLFVy/MhJpA
         UKGMF7dpaudN5q/SCSW9bAuBxBfYvQ8clpsywge5Hv5FJn61ojdHM8uzn7+2Se5DUVq3
         817jyQup64OKWwbNacIzLpQI5bj7xsIemMEl0aUsr1F1/Lgs+nw66X2ipIZxiYTBF/rj
         I+GfVyPt4q7zFN7yLcP7enKXKFtlcOap+jN0GLLIPrmI2bhNmgcMCy7Oomt8bLWHWrYw
         hMSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhMTruqDLOt6d6WA2b7fdUfAzs4ruZ8LwkrdHeqR0Edh2vbV7o6hgSDf53eYlG9F1FbG1jJrK5W3X14MKWLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkPh7SQhxOxT9qi8aJWLJQ/tEgysyQVi8iLLgUdbpyEm7U6vCv
	RRf9WMimtTvPwD6S8UzSDATVZQr6/zEM1DSDDtd4WPsIHkGmBCzUYXhW
X-Gm-Gg: ASbGncum3KoDK4DRHsSXg0JiUmTPhSz5MONcw8OAyObYTMGU6afXb8DktIHrkVSFJNp
	8TmKjNCShuodbNSAu5bv0uSjg5hyC7N+oyg+5fOLwFpQVMk5QsdPh44ApO3STOqf9HgMpJvDm+e
	RgROxtmWkoWopuKy/jjjsUEqvtvw1wF1f0x0Cr16eurURDwe3kv5RDSMefVozJV2I4Duz3jW5YL
	FymYIV8b6WV/cJwNbg14D0CV6tEfbR+bhXxVag2E2kl36acvinFJISrCERoW9OrIWBWfE7eEdkz
	E4XywtdvoJO9vK2Zqw4+SwIzzC2gIhZl7v+UTCbUnelZY+DSgsORuJxAz3lzengap4BnugjQ41s
	9z8/zNAk0zYKTOw/zGHvOKDKpmAMxDazFxfar+pM8/X/qwM2y8vvflONYAB4/5jM8fFfGTg==
X-Google-Smtp-Source: AGHT+IEKiwJZQCrLPEgkzRNnTHskaZnK9OmVkfYp3uZ3v0rYXitoWfeTluLHukDJc9g2ASRO8v71/A==
X-Received: by 2002:a05:600c:1c87:b0:45f:2cf9:c229 with SMTP id 5b1f17b1804b1-461fd2e4377mr14209635e9.0.1758102141144;
        Wed, 17 Sep 2025 02:42:21 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46139e87614sm30184935e9.23.2025.09.17.02.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 02:42:20 -0700 (PDT)
Message-ID: <68ca827c.050a0220.11f9b4.a3f0@mx.google.com>
X-Google-Original-Message-ID: <aMqCdW_r6QYeldBm@Ansuel-XPS.>
Date: Wed, 17 Sep 2025 11:42:13 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v18 4/8] net: dsa: tag_mtk: add Airoha variant
 usage of this TAG
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-5-ansuelsmth@gmail.com>
 <20250915104545.1742-5-ansuelsmth@gmail.com>
 <20250917093541.laeswsgzunu3avzp@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917093541.laeswsgzunu3avzp@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_024223_355541_E98C47EA 
X-CRM114-Status: GOOD (  32.01  )
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

On Wed, Sep 17, 2025 at 12:35:41PM +0300, Vladimir Oltean wrote:
> On Mon, Sep 15, 2025 at 12:45:40PM +0200, Christian Marangi wrote:
> > Add variant of the MTK TAG for Airoha Switch and comments about difference
> > between Airoha AN8855 and Mediatek tag bitmap.
> > 
> > Airoha AN8855 doesn't support controlling SA learning and Leaky VLAN
> > from tag. Although these bits are not used (and even not defined for
> > Leaky VLAN), it's worth to add comments for these difference to prevent
> > any kind of regression in the future if ever these bits will be used.
> > 
> > Rework the makefile, config and tag driver to better report to
> > external tool (like libpcap) the usage of this variant with a dedicated
> > "Airoha" name.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  include/net/dsa.h |  2 ++
> >  net/dsa/Kconfig   | 11 +++++++++++
> >  net/dsa/Makefile  |  2 +-
> >  net/dsa/tag_mtk.c | 36 +++++++++++++++++++++++++++++++++---
> >  4 files changed, 47 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/net/dsa.h b/include/net/dsa.h
> > index d73ea0880066..bf03493e64ab 100644
> > --- a/include/net/dsa.h
> > +++ b/include/net/dsa.h
> > @@ -55,6 +55,7 @@ struct tc_action;
> >  #define DSA_TAG_PROTO_LAN937X_VALUE		27
> >  #define DSA_TAG_PROTO_VSC73XX_8021Q_VALUE	28
> >  #define DSA_TAG_PROTO_BRCM_LEGACY_FCS_VALUE	29
> > +#define DSA_TAG_PROTO_AIROHA_VALUE		30
> >  
> >  enum dsa_tag_protocol {
> >  	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
> > @@ -69,6 +70,7 @@ enum dsa_tag_protocol {
> >  	DSA_TAG_PROTO_KSZ9893		= DSA_TAG_PROTO_KSZ9893_VALUE,
> >  	DSA_TAG_PROTO_LAN9303		= DSA_TAG_PROTO_LAN9303_VALUE,
> >  	DSA_TAG_PROTO_MTK		= DSA_TAG_PROTO_MTK_VALUE,
> > +	DSA_TAG_PROTO_AIROHA		= DSA_TAG_PROTO_AIROHA_VALUE,
> >  	DSA_TAG_PROTO_QCA		= DSA_TAG_PROTO_QCA_VALUE,
> >  	DSA_TAG_PROTO_TRAILER		= DSA_TAG_PROTO_TRAILER_VALUE,
> >  	DSA_TAG_PROTO_8021Q		= DSA_TAG_PROTO_8021Q_VALUE,
> > diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
> > index 869cbe57162f..7d63ecda25c8 100644
> > --- a/net/dsa/Kconfig
> > +++ b/net/dsa/Kconfig
> > @@ -98,12 +98,23 @@ config NET_DSA_TAG_EDSA
> >  	  Say Y or M if you want to enable support for tagging frames for the
> >  	  Marvell switches which use EtherType DSA headers.
> >  
> > +config NET_DSA_TAG_MTK_COMMON
> > +	tristate
> > +
> >  config NET_DSA_TAG_MTK
> >  	tristate "Tag driver for Mediatek switches"
> > +	select NET_DSA_TAG_MTK_COMMON
> >  	help
> >  	  Say Y or M if you want to enable support for tagging frames for
> >  	  Mediatek switches.
> >  
> > +config NET_DSA_TAG_AIROHA
> > +	tristate "Tag driver for Airoha switches"
> > +	select NET_DSA_TAG_MTK_COMMON
> > +	help
> > +	  Say Y or M if you want to enable support for tagging frames for
> > +	  Airoha switches.
> > +
> >  config NET_DSA_TAG_KSZ
> >  	tristate "Tag driver for Microchip 8795/937x/9477/9893 families of switches"
> >  	help
> > diff --git a/net/dsa/Makefile b/net/dsa/Makefile
> > index 555c07cfeb71..7aba189a715c 100644
> > --- a/net/dsa/Makefile
> > +++ b/net/dsa/Makefile
> > @@ -27,7 +27,7 @@ obj-$(CONFIG_NET_DSA_TAG_GSWIP) += tag_gswip.o
> >  obj-$(CONFIG_NET_DSA_TAG_HELLCREEK) += tag_hellcreek.o
> >  obj-$(CONFIG_NET_DSA_TAG_KSZ) += tag_ksz.o
> >  obj-$(CONFIG_NET_DSA_TAG_LAN9303) += tag_lan9303.o
> > -obj-$(CONFIG_NET_DSA_TAG_MTK) += tag_mtk.o
> > +obj-$(CONFIG_NET_DSA_TAG_MTK_COMMON) += tag_mtk.o
> >  obj-$(CONFIG_NET_DSA_TAG_NONE) += tag_none.o
> >  obj-$(CONFIG_NET_DSA_TAG_OCELOT) += tag_ocelot.o
> >  obj-$(CONFIG_NET_DSA_TAG_OCELOT_8021Q) += tag_ocelot_8021q.o
> > diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
> > index b670e3c53e91..32befcbdf4be 100644
> > --- a/net/dsa/tag_mtk.c
> > +++ b/net/dsa/tag_mtk.c
> > @@ -11,6 +11,7 @@
> >  #include "tag.h"
> >  
> >  #define MTK_NAME		"mtk"
> > +#define AIROHA_NAME		"airoha"
> >  
> >  #define MTK_HDR_LEN		4
> >  #define MTK_HDR_XMIT_UNTAGGED		0
> > @@ -18,6 +19,9 @@
> >  #define MTK_HDR_XMIT_TAGGED_TPID_88A8	2
> >  #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
> >  #define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
> > +/* AN8855 doesn't support SA_DIS and Leaky VLAN
> > + * control in tag as these bits doesn't exist.
> > + */
> >  #define MTK_HDR_XMIT_SA_DIS		BIT(6)
> >  
> >  static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
> > @@ -94,6 +98,7 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev)
> >  	return skb;
> >  }
> >  
> > +#if IS_ENABLED(CONFIG_NET_DSA_TAG_MTK)
> >  static const struct dsa_device_ops mtk_netdev_ops = {
> >  	.name		= MTK_NAME,
> >  	.proto		= DSA_TAG_PROTO_MTK,
> > @@ -102,8 +107,33 @@ static const struct dsa_device_ops mtk_netdev_ops = {
> >  	.needed_headroom = MTK_HDR_LEN,
> >  };
> >  
> > -MODULE_DESCRIPTION("DSA tag driver for Mediatek switches");
> > -MODULE_LICENSE("GPL");
> > +DSA_TAG_DRIVER(mtk_netdev_ops);
> >  MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_MTK, MTK_NAME);
> > +#endif
> >  
> > -module_dsa_tag_driver(mtk_netdev_ops);
> > +#if IS_ENABLED(CONFIG_NET_DSA_TAG_AIROHA)
> > +static const struct dsa_device_ops airoha_netdev_ops = {
> > +	.name		= AIROHA_NAME,
> > +	.proto		= DSA_TAG_PROTO_AIROHA,
> > +	.xmit		= mtk_tag_xmit,
> > +	.rcv		= mtk_tag_rcv,
> > +	.needed_headroom = MTK_HDR_LEN,
> > +};
> > +
> > +DSA_TAG_DRIVER(airoha_netdev_ops);
> > +MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_AIROHA, AIROHA_NAME);
> > +#endif
> > +
> > +static struct dsa_tag_driver *dsa_tag_driver_array[] =	{
> > +#if IS_ENABLED(CONFIG_NET_DSA_TAG_MTK)
> > +	&DSA_TAG_DRIVER_NAME(mtk_netdev_ops),
> > +#endif
> > +#if IS_ENABLED(CONFIG_NET_DSA_TAG_AIROHA)
> > +	&DSA_TAG_DRIVER_NAME(airoha_netdev_ops),
> > +#endif
> 
> Unless the few tens of bytes saved matter on OpenWRT, I think this is
> overkill (and you went too far with my previous suggestion).
> Two Kconfig options are unnecessary from a maintainance point of view
> (and config NET_DSA_AN8855 isn't even selecting the correct one!).
> I suggest you register both tag drivers as part of CONFIG_NET_DSA_TAG_MTK,
> at least until the differences increase to justify a new option.
>

Ok, was following the pattern done by the other. Will drop the
additional kconfig.

> > +};
> > +
> > +module_dsa_tag_drivers(dsa_tag_driver_array);
> > +
> > +MODULE_DESCRIPTION("DSA tag driver for Mediatek switches");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.51.0
> > 
> 

-- 
	Ansuel

