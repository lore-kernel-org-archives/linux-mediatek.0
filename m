Return-Path: <SRS0=f9HX=7P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28423C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 10:39:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F020A20734
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 10:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oLBTpXez";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3/70se8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F020A20734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gz8nOBPwHH0uczv0ioouWQq0bSlEFf0/7F5kDBYB1fo=; b=oLBTpXezAqSK9q
	5UhnmHa1hlx4ayowa1sjBz3q0F8FehD6YerENlucaVnp+4K2ART00Pnww2z5HLSah2pTfN6RRnxuS
	ffeyStP4EtvNIH8buJMEE8tnRAba5FHM2E5itX+XLVlFx0FiZR2WtiMifYGwLjG9c6vLcpdDs+Ppi
	3R38tC1KN693ki9bp9Rab89ormoqJE4Qu0NLDx/SdtabBjNDtc0s1qyy/Qrhn4wC7BVLAOOTHwOFZ
	qxaOo8QopK0o/frDOxctv7aZKQYujbiD6iYmQPB2l2JPRlDjbYQc5KfwUNx3doT91YH6h/zP3duVL
	+osseYGq1X7VwMmGigSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg4K2-0001kW-Ln; Tue, 02 Jun 2020 10:39:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg4Ju-0001bq-UG; Tue, 02 Jun 2020 10:39:00 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 018D620679;
 Tue,  2 Jun 2020 10:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591094337;
 bh=7akxGeDBAwqDHNPbY466qX2fnjCF1AbecUSRAueZ4ks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W3/70se8FzD74EQgzLoM4WhS0WIFPuiz7g0/2ciOHh3Xc0FSr/jthKdOtp5PmKmdY
 QrDCOXwBnqXE/oLAjx/8js9OllASJ22QQ0+ivqnrDbzjBsC24dp0S161dymIlJhoAx
 6Dnkltsajp8l/b7wPNhTx3EkkUsqk3dGVo0gK43c=
Date: Tue, 2 Jun 2020 12:38:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neal Liu <neal.liu@mediatek.com>
Subject: Re: [PATCH v6 2/2] hwrng: add sec-rng driver
Message-ID: <20200602103855.GB2991896@kroah.com>
References: <1591085678-22764-1-git-send-email-neal.liu@mediatek.com>
 <1591085678-22764-3-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591085678-22764-3-git-send-email-neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_033859_012797_FCF3D0B5 
X-CRM114-Status: GOOD (  25.43  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Arnd Bergmann <arnd@arndb.de>, Sean Wang <sean.wang@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, wsd_upstream@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-crypto@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Crystal Guo <Crystal.Guo@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 02, 2020 at 04:14:38PM +0800, Neal Liu wrote:
> For security awareness SoCs on ARMv8 with TrustZone enabled,
> peripherals like entropy sources is not accessible from normal world
> (linux) and rather accessible from secure world (HYP/ATF/TEE) only.
> This driver aims to provide a generic interface to Arm Trusted
> Firmware or Hypervisor rng service.
> 
> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> ---
>  drivers/char/hw_random/Kconfig   |   13 ++++
>  drivers/char/hw_random/Makefile  |    1 +
>  drivers/char/hw_random/sec-rng.c |  155 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 169 insertions(+)
>  create mode 100644 drivers/char/hw_random/sec-rng.c
> 
> diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
> index 9bc46da..cb9c8a9 100644
> --- a/drivers/char/hw_random/Kconfig
> +++ b/drivers/char/hw_random/Kconfig
> @@ -474,6 +474,19 @@ config HW_RANDOM_KEYSTONE
>  	help
>  	  This option enables Keystone's hardware random generator.
>  
> +config HW_RANDOM_SECURE
> +	tristate "Arm Security Random Number Generator support"
> +	depends on HAVE_ARM_SMCCC || COMPILE_TEST
> +	default HW_RANDOM
> +	help
> +	  This driver provides kernel-side support for the Arm Security
> +	  Random Number Generator.
> +
> +	  To compile this driver as a module, choose M here. the
> +	  module will be called sec-rng.
> +
> +	  If unsure, say Y.

Why Y?



> +
>  endif # HW_RANDOM
>  
>  config UML_RANDOM
> diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
> index a7801b4..04533d1 100644
> --- a/drivers/char/hw_random/Makefile
> +++ b/drivers/char/hw_random/Makefile
> @@ -41,3 +41,4 @@ obj-$(CONFIG_HW_RANDOM_S390) += s390-trng.o
>  obj-$(CONFIG_HW_RANDOM_KEYSTONE) += ks-sa-rng.o
>  obj-$(CONFIG_HW_RANDOM_OPTEE) += optee-rng.o
>  obj-$(CONFIG_HW_RANDOM_NPCM) += npcm-rng.o
> +obj-$(CONFIG_HW_RANDOM_SECURE) += sec-rng.o
> diff --git a/drivers/char/hw_random/sec-rng.c b/drivers/char/hw_random/sec-rng.c
> new file mode 100644
> index 0000000..c6d3872
> --- /dev/null
> +++ b/drivers/char/hw_random/sec-rng.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 MediaTek Inc.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/hw_random.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#define SMC_RET_NUM	4
> +#define SEC_RND_SIZE	(sizeof(u32) * SMC_RET_NUM)
> +
> +#define HWRNG_SMC_FAST_CALL_VAL(func_num) \
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, \
> +			   ARM_SMCCC_OWNER_SIP, (func_num))
> +
> +#define to_sec_rng(p)	container_of(p, struct sec_rng_priv, rng)
> +
> +typedef void (sec_rng_fn)(unsigned long, unsigned long, unsigned long,
> +			  unsigned long, unsigned long, unsigned long,
> +			  unsigned long, unsigned long,
> +			  struct arm_smccc_res *);

Why not throw some more unsigned longs in there?  :)

Seriously, no variable names for these?  Why not?

And given that you only use the first parameter, why have 7 of them that
are not used at all?  That feels pointless and needlessly complex.

> +
> +struct sec_rng_priv {
> +	u16 func_num;
> +	sec_rng_fn *rng_fn;
> +	struct hwrng rng;
> +};

Nit, if you put 'struct hwrng' at the top of the structure, your
"to_sec_rng()" macro resolves to a simple cast, no math at all.

> +
> +/* Simple wrapper functions to be able to use a function pointer */
> +static void sec_rng_smc(unsigned long a0, unsigned long a1,
> +			unsigned long a2, unsigned long a3,
> +			unsigned long a4, unsigned long a5,
> +			unsigned long a6, unsigned long a7,
> +			struct arm_smccc_res *res)
> +{
> +	arm_smccc_smc(a0, a1, a2, a3, a4, a5, a6, a7, res);
> +}
> +
> +static void sec_rng_hvc(unsigned long a0, unsigned long a1,
> +			unsigned long a2, unsigned long a3,
> +			unsigned long a4, unsigned long a5,
> +			unsigned long a6, unsigned long a7,
> +			struct arm_smccc_res *res)
> +{
> +	arm_smccc_hvc(a0, a1, a2, a3, a4, a5, a6, a7, res);
> +}
> +
> +static bool __sec_get_rnd(struct sec_rng_priv *priv, uint32_t *val)
> +{
> +	struct arm_smccc_res res;
> +
> +	priv->rng_fn(HWRNG_SMC_FAST_CALL_VAL(priv->func_num),
> +			0, 0, 0, 0, 0, 0, 0, &res);

See, all 0's :(

You could hard-code them in the functions above instead.

But, all of this pointer indirection is really odd, why is it needed at
all?  Why not just call one or the other depending on the "type" at
runtime?  Wouldn't that actually be faster (hint, it is...), if you
cared about speed here (hint, I doubt it matters).

> +
> +	if (!res.a0 && !res.a1 && !res.a2 && !res.a3)
> +		return false;
> +
> +	val[0] = res.a0;
> +	val[1] = res.a1;
> +	val[2] = res.a2;
> +	val[3] = res.a3;

So no values out of the random number generator can be 0?  Feels like an
odd thing for a random number not to be allowed to do, why this
restriction?

> +
> +	return true;
> +}
> +
> +static int sec_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
> +{
> +	struct sec_rng_priv *priv = to_sec_rng(rng);
> +	u32 val[4] = {0};
> +	int retval = 0;
> +	int i;
> +
> +	while (max >= SEC_RND_SIZE) {
> +		if (!__sec_get_rnd(priv, val))
> +			return retval;
> +
> +		for (i = 0; i < SMC_RET_NUM; i++) {
> +			*(u32 *)buf = val[i];
> +			buf += sizeof(u32);

Wait, what happens if buf is not a multiple of 4?  Didn't you just
overwrite some memory above with the previous line?

> +		}
> +
> +		retval += SEC_RND_SIZE;
> +		max -= SEC_RND_SIZE;
> +	}
> +
> +	return retval;
> +}
> +
> +static int sec_rng_probe(struct platform_device *pdev)
> +{
> +	struct sec_rng_priv *priv;
> +	const char *method;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	if (of_property_read_string(pdev->dev.of_node, "method", &method))
> +		return -ENXIO;
> +
> +	if (!strncmp("smc", method, strlen("smc")))
> +		priv->rng_fn = sec_rng_smc;
> +	else if (!strncmp("hvc", method, strlen("hvc")))
> +		priv->rng_fn = sec_rng_hvc;
> +
> +	if (IS_ERR(priv->rng_fn)) {

How can this ever be true?

Just put another else on the above list and you should be fine.

> +		dev_err(&pdev->dev, "method %s is not supported\n", method);
> +		return -EINVAL;
> +	}
> +
> +	if (of_property_read_u16(pdev->dev.of_node, "method-fid",
> +				 &priv->func_num))
> +		return -ENXIO;
> +
> +	if (of_property_read_u16(pdev->dev.of_node, "quality",
> +				 &priv->rng.quality))
> +		return -ENXIO;
> +
> +	priv->rng.name = pdev->name;
> +	priv->rng.read = sec_rng_read;
> +	priv->rng.priv = (unsigned long)&pdev->dev;
> +
> +	ret = devm_hwrng_register(&pdev->dev, &priv->rng);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register rng device: %d\n", ret);

Doesn't the caller print out something if this fails?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
