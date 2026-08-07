Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C83AC2A09B
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 20:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIHw7SQVAKmO/CF3aTj88vDKj9Fbv2YT5iL9r3v/6gk=; b=nbZtgPSmueQ38XjxwygwlO938M
	xm/ziDc54D5ccVkEflLzkFZNNzoY32EW9d4K0CFb5VogTFCTjrGwVsaiVOTqi7F28RqGXlXm53tO1
	GSMJg/DCJ3A/XLf/a70piOzEfjmhceqP4BGXb6t1xyQcKwFt5T7DpaFYkrEFvwg+RShYiIuyXC7Ys
	qJ+sb90Dnndsoi5g4hOBd5L1MUYCutYObP2E3fcIdF2mCo/NOrpWCEeJyPpvCnsKGKqHEi6tG4Fkr
	7GRgfKq/qPBLGTYXMkJOZwSyZln4Pk6WFbg8U/HOhlgOSTs/x0Z/5Xg67iUkrysxmPVND5bBpCKGq
	LjNOqm5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsRCK-00000008j3w-3BoN;
	Fri, 07 Aug 2026 20:29:44 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsRCI-00000008j3e-2Vn1;
	Fri, 07 Aug 2026 20:29:42 +0000
Message-ID: <235c60e9-f19a-4336-a569-ddf5e5462fe5@infradead.org>
Date: Fri, 7 Aug 2026 13:29:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 03/12] net: pcs: implement Firmware node
 support for PCS driver
To: Christian Marangi <ansuelsmth@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
Cc: Daniel Golle <daniel@makrotopia.org>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-4-ansuelsmth@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260807131301.192060-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi--

On 8/7/26 6:12 AM, Christian Marangi wrote:
> Implement the foundation of Firmware node support for PCS driver.
> 

> 
> Co-developed-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/pcs/Kconfig          |   6 +
>  drivers/net/pcs/Makefile         |   1 +
>  drivers/net/pcs/pcs.c            | 240 +++++++++++++++++++++++++++++++
>  include/linux/pcs/pcs-provider.h |  65 +++++++++
>  include/linux/pcs/pcs.h          |  75 ++++++++++
>  5 files changed, 387 insertions(+)
>  create mode 100644 drivers/net/pcs/pcs.c
>  create mode 100644 include/linux/pcs/pcs-provider.h
>  create mode 100644 include/linux/pcs/pcs.h
> 


Please address these warnings:

WARNING: ../include/linux/pcs/pcs-provider.h:39 function parameter 'pp' not described in 'fwnode_pcs_del_provider'
WARNING: ../include/linux/pcs/pcs-provider.h:39 Excess function parameter 'fwnode' description in 'fwnode_pcs_del_provider'
WARNING: ../include/linux/pcs/pcs-provider.h:62 expecting prototype for fwnode_pcs_add_provider(). Prototype was for devm_fwnode_pcs_add_provider() instead

> diff --git a/include/linux/pcs/pcs-provider.h b/include/linux/pcs/pcs-provider.h
> new file mode 100644
> index 000000000000..5df48022bc6e
> --- /dev/null
> +++ b/include/linux/pcs/pcs-provider.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __LINUX_PCS_PROVIDER_H
> +#define __LINUX_PCS_PROVIDER_H
> +
> +struct fwnode_pcs_provider;
> +
> +/**
> + * fwnode_pcs_simple_get - Simple xlate function to retrieve PCS
> + * @pcsspec: reference arguments
> + * @data: Context data (assumed assigned to the single PCS)
> + *
> + * Returns: the PCS pointed by data.
> + */
> +struct phylink_pcs *fwnode_pcs_simple_get(struct fwnode_reference_args *pcsspec,
> +					  void *data);
> +
> +/**
> + * fwnode_pcs_add_provider - Registers a new PCS provider
> + * @fwnode: Firmware node
> + * @get: xlate function to retrieve the PCS
> + * @data: Context data
> + *
> + * Register and add a new PCS provider to the global providers list
> + * for the firmware node. The relevant PCS from the PCS provider
> + * is retrieved from the passed xlate function.
> + *
> + * Returns: A pointer to the registered PCS provider on success, or
> + * an ERR_PTR() encoded error code on failure.
> + */
> +struct fwnode_pcs_provider *
> +fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
> +			struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
> +						   void *data),
> +			void *data);
> +
> +/**
> + * fwnode_pcs_del_provider - Removes a PCS provider
> + * @fwnode: Firmware node
> + */
> +void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp);
> +
> +/**
> + * fwnode_pcs_add_provider - Registers a new PCS provider
> + * @dev: Device of the PCS provider
> + * @fwnode: Firmware node
> + * @get: xlate function to retrieve the PCS
> + * @data: Context data
> + *
> + * Register and add a new PCS provider to the global providers list
> + * for the firmware node. The relevant PCS from the PCS provider
> + * is retrieved from the passed xlate function. While at that, it
> + * also associates the device with the PCS provider using devres.
> + * On driver detach, release function is invoked on the devres data,
> + * then, devres data is freed.
> + *
> + * Returns: A pointer to the registered PCS provider on success, or
> + * an ERR_PTR() encoded error code on failure.
> + */
> +struct fwnode_pcs_provider *
> +devm_fwnode_pcs_add_provider(struct device *dev, struct fwnode_handle *fwnode,
> +			     struct phylink_pcs *(*get)(struct fwnode_reference_args *pcsspec,
> +							void *data),
> +			     void *data);
> +
> +#endif /* __LINUX_PCS_PROVIDER_H */

thanks.

-- 
~Randy


