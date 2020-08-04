Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28343C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 05:20:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D135206F6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 05:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mIZyPvbt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NiOcZHdm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D135206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MKicZvaNbHs7qrJmqx2ThOwIiCxRM+1vEWCDD/4I/xo=; b=mIZyPvbt3sQXF8uwW38Y+wMYu
	xuau4BsEbm9jbrrVikPoFFD0vmvQGLKHsiKq2gRgPrGYbc7/6XX6M/unthiLmcnxJxQ5xpKuiyBiw
	KwNYEzBr+aRhrQAYTiKVr/p7Tb8p+I5FtnO/I0cZ5QRtm2UxQw4maXVrJl3gnzrwhNWHt36t3YrRH
	tuPZCUfD9fojPEF2va/M6z0EewEKk6GuLzfzYbRV0Ojzac1qL6NV8PdTYZ+YLlthWaNfN0/ZFkbRp
	d6l+XP+CvFtEnE/8Z4AnxaLVOEe4ASHBqwlczY+VCPBJ2pHBEufivXbyZTLDsb2pHYoDa770TNcco
	O2HwPsoyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2pNR-0002QM-NJ; Tue, 04 Aug 2020 05:20:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2pNN-0002Pg-Pp; Tue, 04 Aug 2020 05:20:39 +0000
X-UUID: 6df11de8bf2c4b199d7f0d07cddb25b0-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HcqTMCQTc6cS8wLmYpdxtIBv3OwMvyeVXOAl4pmbLwo=; 
 b=NiOcZHdmhwCnv5eyaxQnmjiYjRDCQJtzmsCfSPczEPVplRmKlP/5HmJzdKMEmaRMUH6UfR8JSRxL/wAaOAXoe9BWqznSYzUzICRxs/+a9mj5AeMecoMLOmpzlkgoGIfO8ncfDQmtQMA12VoCSNhhw9U1Ile45DfPSo8K6gPJ2Fw=;
X-UUID: 6df11de8bf2c4b199d7f0d07cddb25b0-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1565939004; Mon, 03 Aug 2020 21:20:34 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 22:10:32 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 13:10:30 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 13:10:32 +0800
Message-ID: <1596517831.27829.3.camel@mtkswgap22>
Subject: Re: [v2,4/6] reset-controller: ti: introduce a new reset handler
From: Stanley Chu <stanley.chu@mediatek.com>
To: Crystal Guo <crystal.guo@mediatek.com>
Date: Tue, 4 Aug 2020 13:10:31 +0800
In-Reply-To: <20200803061511.29555-5-crystal.guo@mediatek.com>
References: <20200803061511.29555-1-crystal.guo@mediatek.com>
 <20200803061511.29555-5-crystal.guo@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_012038_068781_5B558AF4 
X-CRM114-Status: GOOD (  18.83  )
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
Cc: yong.liang@mediatek.com, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, yingjoe.chen@mediatek.com,
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

Please drop "Change-Id" tags.

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
>  	data->rcdev.ops = &ti_syscon_reset_ops;
>  	data->rcdev.owner = THIS_MODULE;
>  	data->rcdev.of_node = np;

Perhaps please provide the reason why you shall add this new method? Any
existed or upcoming users?

Thanks,

Stanley Chu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
