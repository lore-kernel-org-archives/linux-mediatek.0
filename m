Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E511C6379F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 19:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8wxn5zU9hrSXYKgcJgtYOni4ihYgf3wye9qtJ+vVco=; b=D8lv7eB6sTMOkv87rPCwM4jfjj
	ogh5wM/L5MIZNjNNLqr+ewUvyJgWnPcj30XiDXDZlBpaw4LGT2a3MjBQ5jPkUio22+8IP+P7SK3qP
	8SAoh6OcLItS0HRBNf/8ABJYN5RgniSXxuRDoGolqaCHf1b+81wm4PUOmyBW5w/dBWPSegMFSs9w7
	gPSoPIqN/VL1EI4qQhDjy51J8KCPQjs9vGGMWBWj9RrgTV5Df3DTfpaPZeOGeLzKZSYH2dcDOtfkT
	lcHUH89SUv1corErdZbBAjfZEbhz9cRNfl3Ie2OGyK3aPPI/HbQ3UGVPwezhu+95Pk1sn1zBvyp5O
	Cn3mPFgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCGd-005Ql8-A8; Mon, 20 Feb 2023 19:56:07 +0000
Received: from [2601:1c2:980:9ec0::df2f]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCGY-005QkH-MB; Mon, 20 Feb 2023 19:56:02 +0000
Message-ID: <2f9aa86e-40e1-91f6-06b2-c79d62f7a136@infradead.org>
Date: Mon, 20 Feb 2023 11:55:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH V3 2/2] nvmem: add generic driver for devices with MMIO
 access
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20230220174930.7440-1-zajec5@gmail.com>
 <20230220174930.7440-3-zajec5@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230220174930.7440-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

On 2/20/23 09:49, Rafał Miłecki wrote:
> +static int mmio_nvmem_write(void *context, unsigned int offset, void *val, size_t bytes)
> +{
> +	struct mmio_nvmem *priv = context;
> +
> +	switch (priv->io_width) {
> +	case 1:
> +	case 2:
> +	case 4:
> +		return -EOPNOTSUPP;

I'm just curious: (since read supports those cases)

what size writes are typically used here?
And what value for priv->io_width?



Thanks.

> +	default:
> +		memcpy_toio(priv->base + offset, val, bytes);
> +	}
> +
> +	return 0;
> +}

-- 
~Randy

