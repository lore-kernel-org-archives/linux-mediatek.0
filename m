Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B10C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 07:03:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E977622B45
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 07:03:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r7JLSIPH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E977622B45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l/ufkfQa9TtwcXnoMpGUyEeQB3ULNB+QqYhPl6HshfQ=; b=r7JLSIPHPNeBU5XlLZRVNeTJs
	a9VqLzP7mNsjOqDp+9SKJKuBnJkG7saihf4G/4H3ZoEnAIbnjIZZ4tlrZ53cugOwPllO94kvQ0HTz
	k10o9z+RDe7v8predLRl8s2LJauGdOm6pmQqwAodQQIlS4QmauhpQXRS3zX2wVMHevMv7e/Vcdhmv
	kPef589eLjylWT8W86GF09aK95qmw+O6+lctJqQ+CWxqMQYCBfKLFwACBAn5eEO4oEMe5FZj0Qubo
	RwYlkaW94hXHipWMfgskuEYwTE6KbACSPikkrR/vWD5uB4xsVDg+6oxJjOcy9dFml2uMq4MuOG3UM
	0tsV/oDrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2qzA-0004Z9-IF; Tue, 04 Aug 2020 07:03:44 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2qz8-0004Y3-11
 for linux-mediatek@lists.infradead.org; Tue, 04 Aug 2020 07:03:42 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k2qz4-0003zv-69; Tue, 04 Aug 2020 09:03:38 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1k2qz1-0004be-32; Tue, 04 Aug 2020 09:03:35 +0200
Message-ID: <3413ca889fcef11c6dafe1d6b135e1887d84a6e4.camel@pengutronix.de>
Subject: Re: [v2,5/6] reset-controller: ti: Introduce force-update method
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Crystal Guo <crystal.guo@mediatek.com>, robh+dt@kernel.org, 
 matthias.bgg@gmail.com
Date: Tue, 04 Aug 2020 09:03:35 +0200
In-Reply-To: <20200803061511.29555-6-crystal.guo@mediatek.com>
References: <20200803061511.29555-1-crystal.guo@mediatek.com>
 <20200803061511.29555-6-crystal.guo@mediatek.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_030342_103596_153963D3 
X-CRM114-Status: GOOD (  15.34  )
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

Hi Crystal,

On Mon, 2020-08-03 at 14:15 +0800, Crystal Guo wrote:
> Introduce force-update method for assert and deassert interface,
> which force the write operation in case the read already happens
> to return the correct value.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Added Suman and Andrew for confirmation: I think writing unconditionally
can't break any existing user. Just changing to regmap_write_bits()
instead of adding the update-force property as in v1 should be fine.

regards
Philipp

> ---
>  drivers/reset/reset-ti-syscon.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> index 1c74bcb9a6c3..f4baf78afd14 100644
> --- a/drivers/reset/reset-ti-syscon.c
> +++ b/drivers/reset/reset-ti-syscon.c
> @@ -57,6 +57,7 @@ struct ti_syscon_reset_data {
>  	struct ti_syscon_reset_control *controls;
>  	unsigned int nr_controls;
>  	bool assert_deassert_together;
> +	bool update_force;
>  };
>  
>  #define to_ti_syscon_reset_data(rcdev)	\
> @@ -90,7 +91,10 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
>  	mask = BIT(control->assert_bit);
>  	value = (control->flags & ASSERT_SET) ? mask : 0x0;
>  
> -	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
> +	if (data->update_force)
> +		return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
> +	else
> +		return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
>  }
>  
>  /**
> @@ -121,7 +125,10 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
>  	mask = BIT(control->deassert_bit);
>  	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
>  
> -	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
> +	if (data->update_force)
> +		return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
> +	else
> +		return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
>  }
>  
>  /**
> @@ -223,6 +230,10 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
>  		data->assert_deassert_together = true;
>  	else
>  		data->assert_deassert_together = false;
> +	if (of_property_read_bool(np, "update-force"))
> +		data->update_force = true;
> +	else
> +		data->update_force = false;
>  
>  	data->rcdev.ops = &ti_syscon_reset_ops;
>  	data->rcdev.owner = THIS_MODULE;
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
