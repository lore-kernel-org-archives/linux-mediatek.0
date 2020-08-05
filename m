Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E20C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 03:18:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48668207FC
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 03:18:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CFGjNyAG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Bx3/hFA/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48668207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MufDlRhxnX3MSm080cRtGVJBBxJOZI3fW5ucmfINXJk=; b=CFGjNyAGxdnn6Q9vqjPcaDH+7
	pXROFYNOLiHfe/uR+qpbcK+LIyi17xVswfqJi4tLH/Hgoh4/XO471Ouv0SxHogVHT9uoMljWiOo8f
	BvXGGeBMgr3CZJ7AxJQI5EuIRx5SDcas9mMofHp5v2wN7Qa24rni3QqDT19lnEtOCPpDdRs5a+VtJ
	X/8eEl3DzuTabppFeO6WWLNt0CRHvbNf2Vdc9KbVnEQCaFnFrdE1azgyJuPYsepCMeNajF2/MAW1D
	yiDKDoWuEeupbXClwlX7qJHwME4SsmOFGDSCaw/TCN6aJJ8aWwTCjr5nPV5s5fu2nodMJzYFh4Cat
	a7Rem1dvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k39x2-0002I8-Ly; Wed, 05 Aug 2020 03:18:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k39wy-0002Gf-Lo; Wed, 05 Aug 2020 03:18:45 +0000
X-UUID: f8fd4e261d3544cfa0e239bb3e4bbe90-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=et9EAKGQ+wvN9/4s+WLRmGJE+vHZKpAba9xuq5FFsmI=; 
 b=Bx3/hFA/zXC1jrzapxoBLyQ/XMsneLCT+n0z+Nqxo/O0SAaC46FPBonzlAuZ7DKMtRqeXKDKE0ylYwLNXGkadU0dnRrP8XB/AMo7mutB3JRYtHcCQMIjQjTQQWKicN7ueYh9rGIGpXXQ6sABK2novuiLmkkpIDMMHiRnlY5sUXI=;
X-UUID: f8fd4e261d3544cfa0e239bb3e4bbe90-20200804
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1951792163; Tue, 04 Aug 2020 19:18:38 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 20:14:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Aug 2020 11:14:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 5 Aug 2020 11:14:12 +0800
Message-ID: <1596597253.31794.7.camel@mtksdaap41>
Subject: Re: [v2,5/6] reset-controller: ti: Introduce force-update method
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Crystal Guo <crystal.guo@mediatek.com>
Date: Wed, 5 Aug 2020 11:14:13 +0800
In-Reply-To: <20200803061511.29555-6-crystal.guo@mediatek.com>
References: <20200803061511.29555-1-crystal.guo@mediatek.com>
 <20200803061511.29555-6-crystal.guo@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_231844_847629_6D1DB983 
X-CRM114-Status: GOOD (  17.43  )
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
 matthias.bgg@gmail.com, stanley.chu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-08-03 at 14:15 +0800, Crystal Guo wrote:
> Introduce force-update method for assert and deassert interface,
> which force the write operation in case the read already happens
> to return the correct value.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
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

You are using 'force-update' in commit message, and I think that a
better one.
Please change it if we still need this one

Joe.C
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
