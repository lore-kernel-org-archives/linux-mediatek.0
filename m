Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391A1CAC598
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Sep 2025 09:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kOKVRqVF/Jape5mVrAokP6dL8C+/K6JTCB2Gbup70E=; b=ege/Rcdbe0pQL+rz15HUUwLxab
	shTZPJYA9IqoK5zVrZ8IoF8jUo82FpRtx9xzQIQjZ+h3u9XZofxM9F4VBQpwKSAgK558i2jgJ3xPg
	F5wjVczPdJXwAPda09vxT3lvUkdfqO3zyRPKl86fsP8ZE6LwK7Kgw6IL4wKHpFeRsTGJK8ZKov1T7
	MQMgaHhJk+S9hUqjROEu4No42ZJ9wqN24hgpJII4lCoAV6Cuw1uIBHI9hIFQVT4MDqRetaB+iLK2k
	Z3HceEwEBjaPHFkEnjuCmtzZBVYhz60wMVVIddTvGyR2MYbR5slPj6Ay2XwToHyxQ1A0OGVsENBSM
	43AgsvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoZq-0000000Ao2z-1ks1;
	Wed, 17 Sep 2025 09:35:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoZn-0000000Ao1z-2viw
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Sep 2025 09:35:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45ddfe0b66dso13664315e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Sep 2025 02:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758101746; x=1758706546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2kOKVRqVF/Jape5mVrAokP6dL8C+/K6JTCB2Gbup70E=;
        b=i66cDwZdkhax0tfGZrp2UKMEn4mCBxxdi89Xz6+GLyYQHLH3V1OvKyGIfRZb5aJfbX
         vLB2C3mYKh8FRNpDiUXh7I/oDmILt4ccF2pvF6ICTE4HH8f77gVfrseHojUmlTSurdqq
         RQ3FK6s1URBJr4P4m7WSTBmCtH8t8qyfJ74enb/8tPIj/IwQtpSb4fV9HJC7pqo8ue9i
         gu19p5Wp0R/hfTRBMMrIIqwPyDPaysLxU7yDgcagTln/7QmlQvz/I1g+6ISZBo2glCFZ
         eLc76wTZvHNbT9gAsVNgux/rtVdVTY+LeML72jFaSTulUn2IKJj1FKUdpZCFWSRmXLVB
         tqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758101746; x=1758706546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kOKVRqVF/Jape5mVrAokP6dL8C+/K6JTCB2Gbup70E=;
        b=pcrTv4o2CywZVnmxxUz923aRx+lnM2BiMSbtfN38UkEIn8Tt5TtSKwzab1/AJ6s1Ih
         Tgk5/20k4z4J8HsoJYhylnEIlnUQwPYHbGPgMwwLnv8azXMwX4RUejRiei5iDTQiwdJ0
         8PtEzpxOz5jERLgcg+vBKtMljT6em3rW2uaxcVohr3zPXI/VV40zRuSWRH8F7yH9FYn9
         CU/onMMYQSuFtxzqPA5FnoUWqNeTZIbFJkp0QXsujfUn/BWzKIeR5qJf3b6Oe664YW/+
         nm8SnDi8Pmg4qzCHDoBdGU6eDN3j4G8lyS0o0758wE3kYJtWk/03s0g5QNPVWdvV1fDG
         jaUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuKjdm8/zYALSJk8d47iXwqWGbpfWr2yhZJJP/sQQN/+tXM9SFnXURu/Bj0KG5NySySAuz5xP4o2Yqjd+lbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwI/z/Xq/0iLpMw0Hi0QFbPgHTpkZ7HnpOb/WfY1fgbRHV3xVc3
	lpYOj8dNot4VbOO22u+rUF+ZwSbZ3V7+B6KJuvNRSDr04fHjPcFYHMiVKmzA/ftt
X-Gm-Gg: ASbGnctRvrtKZ5qnUbqfWPh0hsTVfRAuW78UBAIa6KyBNEgXc2WkSPfS72B/bBB9PJ4
	IV0ID3w2EXC80LiRgLOGJ49/wcYLdr27FvNjAzkBjek4Es27FsjTfvujkzksVwGmw6AefG5GufH
	UjX+YN6VQmi2JFA5oJgvmf/sRzpo9v8jZgdJSnbX+BfKkS3xKAVhyPCy6VtPhQhaz6PFWkwxfFZ
	IkqRYqH63kIcEeV8V5wwNUYE6GJRQAP0meZXcCNU8FdQfigCOyw/6xd3Q+PIuFkI/PLBdqVleys
	Fvi47qZAl4GBN41EZeU7gPCT8BBDLnIGTfoiQ/oM+qTPpAs88ny8VCEQX4sJ4Kbqc7IT7qbjcGF
	ZKh0h3zeQImwS1o4=
X-Google-Smtp-Source: AGHT+IEKahjLn3hsskZUX8TpZV7OWQwmwyggAkHLtboEKsU7Lmkmo3zfNysZqXWAk/VpjouU5E9mvw==
X-Received: by 2002:a05:600c:3b27:b0:45c:b565:11f4 with SMTP id 5b1f17b1804b1-462024536a4mr7576795e9.1.1758101745594;
        Wed, 17 Sep 2025 02:35:45 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:8bcc:b603:fee7:a273])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-461394f6081sm29238745e9.20.2025.09.17.02.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 02:35:44 -0700 (PDT)
Date: Wed, 17 Sep 2025 12:35:41 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
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
Message-ID: <20250917093541.laeswsgzunu3avzp@skbuf>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-5-ansuelsmth@gmail.com>
 <20250915104545.1742-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915104545.1742-5-ansuelsmth@gmail.com>
 <20250915104545.1742-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_023547_777784_8B998E9C 
X-CRM114-Status: GOOD (  27.48  )
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

On Mon, Sep 15, 2025 at 12:45:40PM +0200, Christian Marangi wrote:
> Add variant of the MTK TAG for Airoha Switch and comments about difference
> between Airoha AN8855 and Mediatek tag bitmap.
> 
> Airoha AN8855 doesn't support controlling SA learning and Leaky VLAN
> from tag. Although these bits are not used (and even not defined for
> Leaky VLAN), it's worth to add comments for these difference to prevent
> any kind of regression in the future if ever these bits will be used.
> 
> Rework the makefile, config and tag driver to better report to
> external tool (like libpcap) the usage of this variant with a dedicated
> "Airoha" name.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  include/net/dsa.h |  2 ++
>  net/dsa/Kconfig   | 11 +++++++++++
>  net/dsa/Makefile  |  2 +-
>  net/dsa/tag_mtk.c | 36 +++++++++++++++++++++++++++++++++---
>  4 files changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/include/net/dsa.h b/include/net/dsa.h
> index d73ea0880066..bf03493e64ab 100644
> --- a/include/net/dsa.h
> +++ b/include/net/dsa.h
> @@ -55,6 +55,7 @@ struct tc_action;
>  #define DSA_TAG_PROTO_LAN937X_VALUE		27
>  #define DSA_TAG_PROTO_VSC73XX_8021Q_VALUE	28
>  #define DSA_TAG_PROTO_BRCM_LEGACY_FCS_VALUE	29
> +#define DSA_TAG_PROTO_AIROHA_VALUE		30
>  
>  enum dsa_tag_protocol {
>  	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
> @@ -69,6 +70,7 @@ enum dsa_tag_protocol {
>  	DSA_TAG_PROTO_KSZ9893		= DSA_TAG_PROTO_KSZ9893_VALUE,
>  	DSA_TAG_PROTO_LAN9303		= DSA_TAG_PROTO_LAN9303_VALUE,
>  	DSA_TAG_PROTO_MTK		= DSA_TAG_PROTO_MTK_VALUE,
> +	DSA_TAG_PROTO_AIROHA		= DSA_TAG_PROTO_AIROHA_VALUE,
>  	DSA_TAG_PROTO_QCA		= DSA_TAG_PROTO_QCA_VALUE,
>  	DSA_TAG_PROTO_TRAILER		= DSA_TAG_PROTO_TRAILER_VALUE,
>  	DSA_TAG_PROTO_8021Q		= DSA_TAG_PROTO_8021Q_VALUE,
> diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
> index 869cbe57162f..7d63ecda25c8 100644
> --- a/net/dsa/Kconfig
> +++ b/net/dsa/Kconfig
> @@ -98,12 +98,23 @@ config NET_DSA_TAG_EDSA
>  	  Say Y or M if you want to enable support for tagging frames for the
>  	  Marvell switches which use EtherType DSA headers.
>  
> +config NET_DSA_TAG_MTK_COMMON
> +	tristate
> +
>  config NET_DSA_TAG_MTK
>  	tristate "Tag driver for Mediatek switches"
> +	select NET_DSA_TAG_MTK_COMMON
>  	help
>  	  Say Y or M if you want to enable support for tagging frames for
>  	  Mediatek switches.
>  
> +config NET_DSA_TAG_AIROHA
> +	tristate "Tag driver for Airoha switches"
> +	select NET_DSA_TAG_MTK_COMMON
> +	help
> +	  Say Y or M if you want to enable support for tagging frames for
> +	  Airoha switches.
> +
>  config NET_DSA_TAG_KSZ
>  	tristate "Tag driver for Microchip 8795/937x/9477/9893 families of switches"
>  	help
> diff --git a/net/dsa/Makefile b/net/dsa/Makefile
> index 555c07cfeb71..7aba189a715c 100644
> --- a/net/dsa/Makefile
> +++ b/net/dsa/Makefile
> @@ -27,7 +27,7 @@ obj-$(CONFIG_NET_DSA_TAG_GSWIP) += tag_gswip.o
>  obj-$(CONFIG_NET_DSA_TAG_HELLCREEK) += tag_hellcreek.o
>  obj-$(CONFIG_NET_DSA_TAG_KSZ) += tag_ksz.o
>  obj-$(CONFIG_NET_DSA_TAG_LAN9303) += tag_lan9303.o
> -obj-$(CONFIG_NET_DSA_TAG_MTK) += tag_mtk.o
> +obj-$(CONFIG_NET_DSA_TAG_MTK_COMMON) += tag_mtk.o
>  obj-$(CONFIG_NET_DSA_TAG_NONE) += tag_none.o
>  obj-$(CONFIG_NET_DSA_TAG_OCELOT) += tag_ocelot.o
>  obj-$(CONFIG_NET_DSA_TAG_OCELOT_8021Q) += tag_ocelot_8021q.o
> diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
> index b670e3c53e91..32befcbdf4be 100644
> --- a/net/dsa/tag_mtk.c
> +++ b/net/dsa/tag_mtk.c
> @@ -11,6 +11,7 @@
>  #include "tag.h"
>  
>  #define MTK_NAME		"mtk"
> +#define AIROHA_NAME		"airoha"
>  
>  #define MTK_HDR_LEN		4
>  #define MTK_HDR_XMIT_UNTAGGED		0
> @@ -18,6 +19,9 @@
>  #define MTK_HDR_XMIT_TAGGED_TPID_88A8	2
>  #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
>  #define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
> +/* AN8855 doesn't support SA_DIS and Leaky VLAN
> + * control in tag as these bits doesn't exist.
> + */
>  #define MTK_HDR_XMIT_SA_DIS		BIT(6)
>  
>  static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
> @@ -94,6 +98,7 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev)
>  	return skb;
>  }
>  
> +#if IS_ENABLED(CONFIG_NET_DSA_TAG_MTK)
>  static const struct dsa_device_ops mtk_netdev_ops = {
>  	.name		= MTK_NAME,
>  	.proto		= DSA_TAG_PROTO_MTK,
> @@ -102,8 +107,33 @@ static const struct dsa_device_ops mtk_netdev_ops = {
>  	.needed_headroom = MTK_HDR_LEN,
>  };
>  
> -MODULE_DESCRIPTION("DSA tag driver for Mediatek switches");
> -MODULE_LICENSE("GPL");
> +DSA_TAG_DRIVER(mtk_netdev_ops);
>  MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_MTK, MTK_NAME);
> +#endif
>  
> -module_dsa_tag_driver(mtk_netdev_ops);
> +#if IS_ENABLED(CONFIG_NET_DSA_TAG_AIROHA)
> +static const struct dsa_device_ops airoha_netdev_ops = {
> +	.name		= AIROHA_NAME,
> +	.proto		= DSA_TAG_PROTO_AIROHA,
> +	.xmit		= mtk_tag_xmit,
> +	.rcv		= mtk_tag_rcv,
> +	.needed_headroom = MTK_HDR_LEN,
> +};
> +
> +DSA_TAG_DRIVER(airoha_netdev_ops);
> +MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_AIROHA, AIROHA_NAME);
> +#endif
> +
> +static struct dsa_tag_driver *dsa_tag_driver_array[] =	{
> +#if IS_ENABLED(CONFIG_NET_DSA_TAG_MTK)
> +	&DSA_TAG_DRIVER_NAME(mtk_netdev_ops),
> +#endif
> +#if IS_ENABLED(CONFIG_NET_DSA_TAG_AIROHA)
> +	&DSA_TAG_DRIVER_NAME(airoha_netdev_ops),
> +#endif

Unless the few tens of bytes saved matter on OpenWRT, I think this is
overkill (and you went too far with my previous suggestion).
Two Kconfig options are unnecessary from a maintainance point of view
(and config NET_DSA_AN8855 isn't even selecting the correct one!).
I suggest you register both tag drivers as part of CONFIG_NET_DSA_TAG_MTK,
at least until the differences increase to justify a new option.

> +};
> +
> +module_dsa_tag_drivers(dsa_tag_driver_array);
> +
> +MODULE_DESCRIPTION("DSA tag driver for Mediatek switches");
> +MODULE_LICENSE("GPL");
> -- 
> 2.51.0
> 


