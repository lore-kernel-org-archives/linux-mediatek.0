Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03628606A331
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 10:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pUu5IIpG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZqT4Y+W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fKA8BFLGdwVjzSEcP9TB5OaODNCZi8nQaBdamkoL5gM=; b=pUu5IIpGJr4p1r
	qZ4gd+Iu1Dfl29/C9V4tzy1OWUdS2VZW7BtmQv1YCWagrjdI+sOrb/oG5o+fxz/rNgyjQaCsB4uwB
	c7feMfCSNsoXHAOtveTuT/g83RAlhdf+Cto17X8uT2greA8IBcnzBb8cRQrwnYxQkKmgcNRS5GKV7
	oMw2RbwPvNc2pK3VSLsyu4Ycmt2tpZDWybU+caGi+sYS0SMCP2pr5kuex479ec2NTN1OkRBPvxgxh
	gusZqEua22dtA3fokDI9rqL4U1OzxMsafKim/QmsgtE4hWdkhlraYq/78oqGTUh5Huj3N9ITD80Rd
	i1ltNsEAasPKG6WufUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAik-00000009Wwx-2oTc;
	Wed, 25 Nov 2026 10:59:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAij-00000009WwK-30k1;
	Wed, 25 Nov 2026 10:59:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7758A40B71;
	Wed, 25 Nov 2026 10:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7236E1F000C0;
	Wed, 25 Nov 2026 10:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795604364;
	bh=fKA8BFLGdwVjzSEcP9TB5OaODNCZi8nQaBdamkoL5gM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=fZqT4Y+W6Ev/Ih99QzPAtBImX2Ne4q0CdhL4POHSaBLNGEK6nF8HOZSLpbO1X8K01
	 Q5xzdAZBUSPSzIMJX8VdQ980dCRtBrevcY5VKUrz/xkrfoVbr816XApV+G337DHIqJ
	 EvGlnPrKAqU6aSvI7WeeNboVmSdonsCWOYZG+KKU2G8DcvPWhvIgNgQuqTtxUza/OD
	 9Et22BIbcucuv3pH2nZWchAVCzmOvMv/BFxD6HpKJOn7/4E4LJcaTYdeFe01UdkyJN
	 dQPhZprYXBjrKN3BWRhNlaQzbnj/XABqLpSluS5uvaPPUyyi+kY/xjy8WIeKvOnkbS
	 /X+ASzcAC7rIA==
Message-ID: <180e1abc-9463-4973-9cf0-a6e8c86e17fa@kernel.org>
Date: Wed, 25 Nov 2026 11:59:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] soc: mediatek: mmdvfs: add VCP backend
To: Echo Zhang <echo.zhang@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 MMDVFS Team <linux-mediatek@lists.infradead.org>, kyrie.wu@mediatek.com,
 ming-fan.chen@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, llvm@lists.linux.dev
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
 <20261125060037.649659-5-echo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261125060037.649659-5-echo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/2026 07:00, Echo Zhang wrote:
> Add the VCP transport used by MMDVFS to map AP and firmware shared
> memory, manage feature power references and send IPI commands.
> 
> Wait for VCP readiness and handle the selected MMUP or VCP READY
> notification to initialize firmware after boot and resume. Serialize
> IPI transactions while shared memory and acknowledgment state are in
> use.
> 
> Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
> ---
>  drivers/soc/mediatek/mmdvfs/Makefile          |    2 +
>  drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c      |   39 +-
>  drivers/soc/mediatek/mmdvfs/mmdvfs-core.c     |  272 +++--
>  drivers/soc/mediatek/mmdvfs/mmdvfs-internal.h |  160 ++-
>  drivers/soc/mediatek/mmdvfs/mmdvfs-up-priv.h  |   57 +
>  drivers/soc/mediatek/mmdvfs/mmdvfs-up.c       |  275 +++++
>  .../soc/mediatek/mmdvfs/mmdvfs-vcp-memory.h   |  104 ++
>  drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c      | 1075 +++++++++++++++++
>  include/soc/mediatek/mmdvfs.h                 |   66 +-
>  9 files changed, 1846 insertions(+), 204 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-up-priv.h
>  create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-up.c
>  create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-vcp-memory.h
>  create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-vcp.c
> 
> diff --git a/drivers/soc/mediatek/mmdvfs/Makefile b/drivers/soc/mediatek/mmdvfs/Makefile
> index 33a280827006..16ecee30bff6 100644
> --- a/drivers/soc/mediatek/mmdvfs/Makefile
> +++ b/drivers/soc/mediatek/mmdvfs/Makefile
> @@ -4,3 +4,5 @@ obj-$(CONFIG_MTK_MMDVFS) += mtk-mmdvfs.o
>  
>  mtk-mmdvfs-y += mmdvfs-core.o
>  mtk-mmdvfs-y += mmdvfs-clk.o
> +mtk-mmdvfs-y += mmdvfs-up.o
> +mtk-mmdvfs-y += mmdvfs-vcp.o
> diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c b/drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c
> index 114f3148cf46..b9025427782d 100644
> --- a/drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c
> +++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-clk.c
> @@ -15,7 +15,6 @@
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>

Srsly, you just added this. So you add buggy code just to fix it...


>  #include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> @@ -27,9 +26,18 @@
>  
>  static const char *mmdvfs_get_clkdev_name(const char *name, char *buf, size_t size)
>  {
> +	int ret;
> +
>  	if (strlen(name) < MMDVFS_CLKDEV_CON_ID_MAX)
>  		return name;
>  
> +	if (str_has_prefix(name, "mmdvfs-vcp-")) {
> +		ret = snprintf(buf, size, "mmdvfs-v-%s",
> +			       name + strlen("mmdvfs-vcp-"));
> +		if (ret > 0 && ret < (int)size)
> +			return buf;
> +	}
> +
>  	return NULL;
>  }
>  
> @@ -66,7 +74,7 @@ static int mmdvfs_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  	data = mmdvfs->data;
>  
> -	if (!data->init_done)
> +	if (!READ_ONCE(data->init_done))
>  		return -EPROBE_DEFER;
>  
>  	if (!mmdvfs_is_valid_user_id(user->id) ||
> @@ -76,12 +84,6 @@ static int mmdvfs_set_rate(struct clk_hw *hw, unsigned long rate,
>  		return -EINVAL;
>  	}
>  
> -	if (rate == 0) {
> -		mmdvfs_dbg(mmdvfs->dev, "Zero rate request for user %s\n",
> -			   user->name);
> -		return 0;
> -	}

NAK, this is just random coding, without any architectural oversight.

Best regards,
Krzysztof

