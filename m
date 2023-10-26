Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714EBC25B70
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 22:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQfvT8y1gch6L7r+cd34RGIc+yfvci8UCEz/1CgAlZs=; b=J/po0XqOrrUNYlUFHkCyUlbVch
	cjtebZq7OAWmwI2/oVQawvIFrMPQd6bHpXnoaZAU/r4PypIKSG+L+Zd0+F2vm/hrI6YmDwWA9lZ08
	TLT/enM68YHtRKHAd0jTVIKOG1gDRNKp8osySUgR4zRN4hlND/OYO8scqFRQCJwSpuV8Dh0iwPJUP
	8EPc8oQ4eo4KyhX+B5yruGDDC0JbHMCYR6fb7YGYoKdYraqpI0spKOSeMXpU/QckASdXStOnmXoaI
	UJSSDKfAPrGFurvgmZWkjJfqoW9KK9GfcWAkElPs/+PoUkE32xmwDPkovLB+3BznQH1wLjTvctquA
	yNf/3DaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8RS-00FDai-1X;
	Thu, 26 Oct 2023 22:03:02 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8RO-00FDYv-1r;
	Thu, 26 Oct 2023 22:02:59 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507bd19eac8so2136984e87.0;
        Thu, 26 Oct 2023 15:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698357774; x=1698962574; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BQfvT8y1gch6L7r+cd34RGIc+yfvci8UCEz/1CgAlZs=;
        b=B5hlGvGxfFaDRqwb0V6kPwD59naJofv6hpRizwelAlIBFYFZiTJnCb3487DXrCfXDt
         Rc5WleIA8En1g3YomCM46OohQKYPhrtLjQuuBJFMw47gIv8KGSKJVv2x1Qj2DYfvaRjw
         85JxQ3luqvCHw98EjoZ0kXmFwnc1e1BkY8hbi6lKyuu1/rsVt/j39Wzf5q4cjiZYKggg
         +HU5g3TgwJBjLjtXStOrZo9tpVCiruL80qkYMi2sTfSCu2FzUn3hoynIVFqaotgS1Ger
         iV9C9+++AJnDtIc9HhCWRwEhnsIFKQedeoD2VMzFckmbZTBaPbp2J1/v7CrNaOnZ/Q5y
         PLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698357774; x=1698962574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQfvT8y1gch6L7r+cd34RGIc+yfvci8UCEz/1CgAlZs=;
        b=hzs0Ib7in9ne+vGgBlNNSeBMWfXip/EAWvGRzkLKFY4X6kajlddKI/7eMyuMCf4Ulz
         PnzPK5Yye1YlE9MPO+hJ1QeE75twhfvy9c9XKBnZ4LgDUqi6sLLSIbqYwjh+jRgjHnmX
         2p8RMShLOpkSorEk9vqRddZLMF7H7xIrmzCe8aDggh0zM3pvH7dJ9cFZ6MAHMsmD7dn3
         0He7hlKHGIWI0P5VjryP+O+ItPCur6Yu73rP1P27x9LpKw6fAqy9Mr0Th0vhlwSES9wP
         fpuHmGy1GRas6DO2vYU3Rw2L7OXMIqfU4L6c8ZMQjUCDSUNh+KGObC0Vn62fJmWN95q3
         tuag==
X-Gm-Message-State: AOJu0Yw2uGnXWqFSJYJH2zKpFUEC6briVxmTNHK3vQIpXil8H+TwLJJw
	MBm+RqP8jCssf8c6PF/7gOg=
X-Google-Smtp-Source: AGHT+IGuubdy/jFwl4wBIyZtQBS6fd10jfaDuzrU+e7/3gTcDFAAkjVweuEKeSjFQKbqhqZh5dT0+g==
X-Received: by 2002:ac2:5f76:0:b0:507:a66f:55e2 with SMTP id c22-20020ac25f76000000b00507a66f55e2mr482508lfc.10.1698357773694;
        Thu, 26 Oct 2023 15:02:53 -0700 (PDT)
Received: from skbuf ([188.26.57.160])
        by smtp.gmail.com with ESMTPSA id q26-20020adfb19a000000b0031f82743e25sm324618wra.67.2023.10.26.15.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 15:02:52 -0700 (PDT)
Date: Fri, 27 Oct 2023 01:02:48 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Justin Stitt <justinstitt@google.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shay Agroskin <shayagr@amazon.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>,
	Saeed Bishara <saeedb@amazon.com>, Rasesh Mody <rmody@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Dimitris Michailidis <dmichail@fungible.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Louis Peens <louis.peens@corigine.com>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Brett Creeley <brett.creeley@amd.com>, drivers@pensando.io,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Ronak Doshi <doshir@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <keescook@chromium.org>, intel-wired-lan@lists.osuosl.org,
	oss-drivers@corigine.com, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH next v2 1/3] ethtool: Implement ethtool_puts()
Message-ID: <20231026220248.blgf7kgt5fkkbg7f@skbuf>
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
 <20231026-ethtool_puts_impl-v2-1-0d67cbdd0538@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026-ethtool_puts_impl-v2-1-0d67cbdd0538@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_150258_632008_0A0DBCCD 
X-CRM114-Status: GOOD (  21.90  )
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

Hi Justin,

On Thu, Oct 26, 2023 at 09:56:07PM +0000, Justin Stitt wrote:
> Use strscpy() to implement ethtool_puts().
> 
> Functionally the same as ethtool_sprintf() when it's used with two
> arguments or with just "%s" format specifier.
> 
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  include/linux/ethtool.h | 34 +++++++++++++++++++++++-----------
>  net/ethtool/ioctl.c     |  7 +++++++
>  2 files changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
> index 226a36ed5aa1..7129dd2e227c 100644
> --- a/include/linux/ethtool.h
> +++ b/include/linux/ethtool.h
> @@ -1053,22 +1053,34 @@ static inline int ethtool_mm_frag_size_min_to_add(u32 val_min, u32 *val_add,
>   */
>  extern __printf(2, 3) void ethtool_sprintf(u8 **data, const char *fmt, ...);
>  
> +/**
> + * ethtool_puts - Write string to ethtool string data
> + * @data: Pointer to start of string to update
> + * @str: String to write
> + *
> + * Write string to data. Update data to point at start of next
> + * string.
> + *
> + * Prefer this function to ethtool_sprintf() when given only
> + * two arguments or if @fmt is just "%s".
> + */
> +extern void ethtool_puts(u8 **data, const char *str);
> +
>  /* Link mode to forced speed capabilities maps */
>  struct ethtool_forced_speed_map {
> -	u32		speed;
> +	u32 speed;
>  	__ETHTOOL_DECLARE_LINK_MODE_MASK(caps);
>  
> -	const u32	*cap_arr;
> -	u32		arr_size;
> +	const u32 *cap_arr;
> +	u32 arr_size;
>  };
>  
> -#define ETHTOOL_FORCED_SPEED_MAP(prefix, value)				\
> -{									\
> -	.speed		= SPEED_##value,				\
> -	.cap_arr	= prefix##_##value,				\
> -	.arr_size	= ARRAY_SIZE(prefix##_##value),			\
> -}
> +#define ETHTOOL_FORCED_SPEED_MAP(prefix, value)                      \
> +	{                                                            \
> +		.speed = SPEED_##value, .cap_arr = prefix##_##value, \
> +		.arr_size = ARRAY_SIZE(prefix##_##value),            \
> +	}
>  
> -void
> -ethtool_forced_speed_maps_init(struct ethtool_forced_speed_map *maps, u32 size);
> +void ethtool_forced_speed_maps_init(struct ethtool_forced_speed_map *maps,
> +				    u32 size);
>  #endif /* _LINUX_ETHTOOL_H */

Maybe this is due to an incorrect rebase conflict resolution, but you
shouldn't have touched any of the ethtool force speed maps.

Please wait for at least 24 hours to pass before posting a new version,
to allow for more comments to come in.

