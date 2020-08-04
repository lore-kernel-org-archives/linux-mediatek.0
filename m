Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131FBC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 07:16:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 092DC2076C
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 07:16:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K20fO+U0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 092DC2076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N6Ax5+SYFV9lgNqqjuB4YbD2wjm5ofnerzYu49QcX0Q=; b=K20fO+U0MNFXG1WfsL1UPMoIA
	VCXspnelmFvtBVl6KnAhz4iJqgbkrNoVC5jmiO/5PAdSsZKA5gVo1bYgugh8r19RLPtd5upisssSd
	i1lAo6v5ZeaVkuOcbF0btAVMy9LzyovOJdDYZa1xHPxVOGeSCr/QRJ4+ErC4kPsp82ahsIrmGqSu/
	S7tXdrcMPTCTUJcn+PPxR2QZ8Auq4hRCz/NlOeoCybncg8oJA018pNpukwRmatW4LfJ/yrrIBQkXA
	J4p5w5mIT13FulDq0XBHXbJZ0sQ22PRgnnrG9jeSZ72JIcYTz7sDsPW23fCdFN3l/Lj+hQB23C8tL
	eOCeCGk/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2rB9-0005m7-U1; Tue, 04 Aug 2020 07:16:08 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2rB7-0005lM-7k
 for linux-mediatek@lists.infradead.org; Tue, 04 Aug 2020 07:16:05 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k2rB5-0005Db-KK; Tue, 04 Aug 2020 09:16:03 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k2rB5-0006F3-0K; Tue, 04 Aug 2020 09:16:03 +0200
Message-ID: <ce70cee90b5d9ecd7b52f6785159553732b9ae06.camel@pengutronix.de>
Subject: Re: [v2,4/6] reset-controller: ti: introduce a new reset handler
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Crystal Guo <crystal.guo@mediatek.com>, robh+dt@kernel.org, 
 matthias.bgg@gmail.com
Date: Tue, 04 Aug 2020 09:16:02 +0200
In-Reply-To: <20200803061511.29555-5-crystal.guo@mediatek.com>
References: <20200803061511.29555-1-crystal.guo@mediatek.com>
 <20200803061511.29555-5-crystal.guo@mediatek.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_031605_341574_E7A905E0 
X-CRM114-Status: GOOD (  19.08  )
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
Cc: yong.liang@mediatek.com, Suman Anna <s-anna@ti.com>,
 srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>,
 fan.chen@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, stanley.chu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-08-03 at 14:15 +0800, Crystal Guo wrote:
> Add ti_syscon_reset() to integrate assert and deassert together.
> If some modules need do serialized assert and deassert operations
> to reset itself, reset_control_reset can be called for convenience.
> 
> Change-Id: I9046992b115a46f3594de57fa89c6a2de9957d49
> ---
>  drivers/reset/reset-ti-syscon.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> index a2635c21db7f..1c74bcb9a6c3 100644
> --- a/drivers/reset/reset-ti-syscon.c
> +++ b/drivers/reset/reset-ti-syscon.c
> @@ -56,6 +56,7 @@ struct ti_syscon_reset_data {
>  	struct regmap *regmap;
>  	struct ti_syscon_reset_control *controls;
>  	unsigned int nr_controls;
> +	bool assert_deassert_together;
>  };
>  
>  #define to_ti_syscon_reset_data(rcdev)	\
> @@ -158,10 +159,24 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
>  		!(control->flags & STATUS_SET);
>  }
>  
> +static int ti_syscon_reset(struct reset_controller_dev *rcdev,
> +			  unsigned long id)
> +{
> +	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
> +
> +	if (data->assert_deassert_together) {
> +		ti_syscon_reset_assert(rcdev, id);
> +		return ti_syscon_reset_deassert(rcdev, id);

Even if your hardware engineers guarantee that no delays are necessary
between assert and deassert for any peripheral used with your reset
controller that may use this function, this is not generic.

I wonder if it would be better to define a minimum delay similarly to
reset-simple [1].

[1] https://lore.kernel.org/lkml/be2cecb2654e68385561a15df7967c7723d5531d.1590594512.git-series.maxime@cerno.tech/

> +	} else {
> +		return -ENOTSUPP;
> +	}
> +}
> +
>  static const struct reset_control_ops ti_syscon_reset_ops = {
>  	.assert		= ti_syscon_reset_assert,
>  	.deassert	= ti_syscon_reset_deassert,
>  	.status		= ti_syscon_reset_status,
> +	.reset		= ti_syscon_reset,
>  };
>  
>  static int ti_syscon_reset_probe(struct platform_device *pdev)
> @@ -204,6 +219,11 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
>  		controls[i].flags = be32_to_cpup(list++);
>  	}
>  
> +	if (of_property_read_bool(np, "assert-deassert-together"))
> +		data->assert_deassert_together = true;
> +	else
> +		data->assert_deassert_together = false;
> +

This could just be assigned directly, but as said above, I think it
might be better to have a reset-duration-us property or similar.

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
