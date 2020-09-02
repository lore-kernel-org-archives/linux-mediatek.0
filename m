Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF0DC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 23:40:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FC0B206E7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 23:40:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ylp1GcOV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DXxDiC6z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FC0B206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BP4ttzHNKxk+Om6GZ+5wzsCPcO7Gf39tW4MTQ5e1S4A=; b=Ylp1GcOVq59i3Iz8NXnWl4FRZ
	iJfqmp0UyD1o3xD7VGiAQ68a/vI35MLJVfj9E/+MpLcqgnG7/CZ6qy7DbdEgOUmV26+1G8rXKDCvT
	vHNyd23knvHgj/GYz/koKc/h2uPX1pc3QDsJ9vPDmOiB5iZhBgWRjuRQFzviJw5gcrNr8h2kpcnjR
	hoszGpifjcKGIwerd6TO8CY3fY/WeAq/t8H3urKl+NyPmF3o3Ne0rq+lASzqJy6RLo861mHPIhunn
	dVjIuUJhgLItqTVCA75dem6/3v00kVpOwYheXjjhpPE8JNbEvaraP4u3Sj0W7DmA+Xres2jQ1gaiX
	eZY2eB+qQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDcMl-0004dt-Vs; Wed, 02 Sep 2020 23:40:36 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDcMj-0004dJ-Bc; Wed, 02 Sep 2020 23:40:34 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 082NeUfk061757;
 Wed, 2 Sep 2020 18:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599090030;
 bh=BFbzFeJpfcaC6ycaf4eZClFigSVdESVAB5glK64fSDw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=DXxDiC6zHHq3/4GkD5eKFXhhia0zcyCk6W9P2W7ahuO56qpqpRtTnwP4Wv3T0Irsi
 orCV1XB9pxji1b3LegMI8OO9432U5YNH0JeIZnS/7BnOPlSiwIXvRufYKvjg7FQP/A
 0Po+cNMcrA6g3+Jmh34JsJo+Gf9bdynE17JtAhzM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 082NeUX1040689
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 2 Sep 2020 18:40:30 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 2 Sep
 2020 18:40:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 2 Sep 2020 18:40:29 -0500
Received: from [10.250.34.112] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 082NeTBX025309;
 Wed, 2 Sep 2020 18:40:29 -0500
Subject: Re: [v4,3/4] reset-controller: ti: introduce a new reset handler
To: Crystal Guo <crystal.guo@mediatek.com>, <p.zabel@pengutronix.de>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-4-crystal.guo@mediatek.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <3a5decee-5f31-e27d-a120-1f835241a87c@ti.com>
Date: Wed, 2 Sep 2020 18:40:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817030324.5690-4-crystal.guo@mediatek.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_194033_676408_B9428E55 
X-CRM114-Status: GOOD (  25.22  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 stanley.chu@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Crystal,

On 8/16/20 10:03 PM, Crystal Guo wrote:
> Introduce ti_syscon_reset() to integrate assert and deassert together.
> If some modules need do serialized assert and deassert operations
> to reset itself, reset_control_reset can be called for convenience.

There are multiple changes in this same patch. I think you should split this
functionality away from the change for the regmap_update_bits() to
regmap_write_bits(), similar to what you have done in your v2 Patch 4.

> 
> Such as reset-qcom-aoss.c, it integrates assert and deassert together
> by 'reset' method. MTK Socs also need this method to perform reset.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  drivers/reset/reset-ti-syscon.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> index a2635c21db7f..08289342f9af 100644
> --- a/drivers/reset/reset-ti-syscon.c
> +++ b/drivers/reset/reset-ti-syscon.c
> @@ -15,6 +15,7 @@
>   * GNU General Public License for more details.
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -56,6 +57,7 @@ struct ti_syscon_reset_data {
>  	struct regmap *regmap;
>  	struct ti_syscon_reset_control *controls;
>  	unsigned int nr_controls;
> +	unsigned int reset_duration_us;
>  };
>  
>  #define to_ti_syscon_reset_data(rcdev)	\
> @@ -89,7 +91,7 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
>  	mask = BIT(control->assert_bit);
>  	value = (control->flags & ASSERT_SET) ? mask : 0x0;
>  
> -	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
> +	return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
>  }
>  
>  /**
> @@ -120,7 +122,7 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
>  	mask = BIT(control->deassert_bit);
>  	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
>  
> -	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
> +	return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
>  }
>  
>  /**
> @@ -158,9 +160,26 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
>  		!(control->flags & STATUS_SET);
>  }
>  
> +static int ti_syscon_reset(struct reset_controller_dev *rcdev,
> +				  unsigned long id)
> +{
> +	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
> +	int ret;
> +
> +	ret = ti_syscon_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	if (data->reset_duration_us)
> +		usleep_range(data->reset_duration_us, data->reset_duration_us * 2);
> +
> +	return ti_syscon_reset_deassert(rcdev, id);

I echo Philipp's comments [1] from your original v1 series about this. We don't
need a property to distinguish this, but you could add a flag using match data
and Mediatek compatible, and use that within this function, or optionally set
this ops based on compatible (whatever is preferred by Philipp).

regards
Suman

[1] https://patchwork.kernel.org/comment/23519193/

> +}
> +
>  static const struct reset_control_ops ti_syscon_reset_ops = {
>  	.assert		= ti_syscon_reset_assert,
>  	.deassert	= ti_syscon_reset_deassert,
> +	.reset		= ti_syscon_reset,
>  	.status		= ti_syscon_reset_status,
>  };
>  
> @@ -204,6 +223,9 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
>  		controls[i].flags = be32_to_cpup(list++);
>  	}
>  
> +	of_property_read_u32(pdev->dev.of_node,	"reset-duration-us",
> +				&data->reset_duration_us);
> +
>  	data->rcdev.ops = &ti_syscon_reset_ops;
>  	data->rcdev.owner = THIS_MODULE;
>  	data->rcdev.of_node = np;
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
