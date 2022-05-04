Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F96C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXkFHFy44Hq7R4CXqF/0j/xUxFjRlf1qHm+C6p+e9tk=; b=YeQmP0ZTJMetbd
	UNQ+u9CYxn//+e686MUTUu/JcIq/ln/MgK0NpIUkBoyLHACl7H7J95nprWAJC1jpRrhNnHzEWPPlW
	3NdbDn9UUf4l4LDRZkaItOJqNXL27ddkgp8JgCBzPaAGfLuObXvO6xcYJu/vJpvVR/I/4sFgYIyGv
	YBFVDnJQzrVZ47+22HyKZykujonZg9sdAfzq8Q5paWZrJOHw4J4Apzp6DXMVgBR7t4aN3s5/2YeuE
	JqMor7T1Yw7InrpVSLw27PR/DijhOpJgkJA7yfU07mjM38CGFGAPbIaYWdm/xw0X0GA3q9dDE4KjJ
	yve7XZs5Ym+Ir9NAd/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmGoQ-00BPUn-Ly; Wed, 04 May 2022 15:21:10 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmGoN-00BPTV-U2; Wed, 04 May 2022 15:21:09 +0000
Received: by mail-ej1-x62b.google.com with SMTP id n10so3544284ejk.5;
 Wed, 04 May 2022 08:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LAHAvyI6ZnoSXv+X/gfsslQYBTBEo6ls5kRk7sRimNQ=;
 b=d2zLTEfxiFW8IHkGbm+yF8OyirFjLdhxSjhT022lHH3p4j3lqZegdJRmOF7k73ramv
 BMogGRR85t5Rl95au7I8Hes3qTx+i+viaO6tKgMdx4rG9HPoX5gKwW1oPK3d162VkOGo
 Mis72JEjdTrJMjrO/iTgIm/uQ6MrgEahwrVodKf9deWDreacy5g3h/GK9jtxofo0Q3OZ
 TlAM4Y4eoZs/iuLUkSRGzxIdXzsU0QS2V6t6H0495LmLh9lMOQfKEe/HTR4YC3+cQQk+
 Mw2OPi89yh5BJu8O3Zay0fyQJThboCs8+JiEGPG60JVHUYrhRcXNJ+EJFqrOLQbBGkr2
 rSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LAHAvyI6ZnoSXv+X/gfsslQYBTBEo6ls5kRk7sRimNQ=;
 b=sRc+fAaYqew//DznCoxL82967tQIiPJpZRiXw0FCCtIzb1y6VEMtSO1ilnRx5KwpIU
 vyez/6ATwVmnuJcGxtoaTimck7SibuRG0hKrpKlBhRnQZ1pCmF4Fv3bXgEXZRchOVTdB
 zO6kuo1tsBzV5DwMBMogyyVslvOmDx+KnEmx0x5ddCNcbEazEgLuqjEuyZ7v+tmC1ivd
 iP9ByzehP+CEGfUAqQ+YoNi18wFSwxBC2VyvFsUfh/rbgPQPkveDh1aweyBjsQVn232E
 PGI+U3NKvXRnp1nQ9WVA5pTU+KmFZ9eniVci03DVA2zA8Mte78ATxKyFJpH3qW/Xh+SX
 RHsw==
X-Gm-Message-State: AOAM531Co9PJVJRHseRtie/gf8zPCf1sxj5kORzhN8jof01uN/qBf0N4
 I4iysJdAN/65nIeIyWGn7m8=
X-Google-Smtp-Source: ABdhPJytXMsaNpSUTjcFGT9EV1QZ2w1xoQzIzDdeblj/sRBxFnmF0qT47s3Tb29DCb7pIUYkg6tCWw==
X-Received: by 2002:a17:907:7e91:b0:6f4:3b93:1f6e with SMTP id
 qb17-20020a1709077e9100b006f43b931f6emr16167776ejc.91.1651677665407; 
 Wed, 04 May 2022 08:21:05 -0700 (PDT)
Received: from skbuf ([188.25.160.86]) by smtp.gmail.com with ESMTPSA id
 ca19-20020aa7cd73000000b0042617ba63c3sm9264323edb.77.2022.05.04.08.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 08:21:04 -0700 (PDT)
Date: Wed, 4 May 2022 18:21:02 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [RFC v2 1/4] net: dsa: mt7530: rework mt7530_hw_vlan_{add,del}
Message-ID: <20220504152102.cj3fwae5anahthku@skbuf>
References: <20220430130347.15190-1-linux@fw-web.de>
 <20220430130347.15190-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220430130347.15190-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_082108_011597_EFE0B831 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Apr 30, 2022 at 03:03:44PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Rework vlan_add/vlan_del functions in preparation for dynamic cpu port.
> 
> Currently BIT(MT7530_CPU_PORT) is added to new_members, even though
> mt7530_port_vlan_add() will be called on the CPU port too.
> 
> Let DSA core decide when to call port_vlan_add for the CPU port, rather
> than doing it implicitly.
> 
> We can do autonomous forwarding in a certain VLAN, but not add br0 to that
> VLAN and avoid flooding the CPU with those packets, if software knows it
> doesn't need to process them.
> 
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
