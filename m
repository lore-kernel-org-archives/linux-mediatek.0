Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E53BC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 04:34:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9311E2177B
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 04:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oyN47D9Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QnKE1/cY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9311E2177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CZ9vOjQzWMwyMHgLHh+zGhhBfMuD+3L56CNeLko3lUs=; b=oyN47D9ZXtvuKlI6SgkX+MLWP
	syQZNwc/L7vuP1s6EGC5G69scLx0dnL8YvPFMXmhCi+RuUNDODKwBCB3BP4u/21q5m59OkO29M8fh
	AlVN44FOA1ful4izjkDodF9CGz4BDfPex0aHT3Bu19PztI+3fu4Ev4gBqaWTc1JQVmqF1L3upWx/p
	Mz4mqH6O+sxBJRA+9Km8nMEZso8Pg55gf4k0KCz7N4v+X9OZ2IWCMz8W1Yr1ZDT6PWQ0zvFyRbFk/
	puTajypHMbvTyKLHTCZ5j4sZCJhIuIw9Jk/kG3fzXyttIvCO0t0x8QBfqjOceUdl52ghWbn37FPDN
	WPN1GPUig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2oeY-00007R-Lw; Tue, 04 Aug 2020 04:34:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2oeU-00006X-FE; Tue, 04 Aug 2020 04:34:15 +0000
X-UUID: 70311d21410947e6ba6585a5971497d2-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Yktds26mQO27rxfVid1topcTCyi1DOqMyji8rDcAx+Q=; 
 b=QnKE1/cYdNQA4DxtVCekO5SKeeupV1mNbU70SFh1b+aZHbsQP/aB5HjKo2ep0xmHDtGQlc28C7IVP9hMPiWrFzOo5tPUkTirUzKdtxaBOc1f66RV/AQUDZ2pmiB74nXBUmfM47ZaLYGYR0JFNAf/T3MZrzOu5VPlARZEUPR/qEw=;
X-UUID: 70311d21410947e6ba6585a5971497d2-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1382501360; Mon, 03 Aug 2020 20:25:50 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 21:15:45 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 12:15:46 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 12:15:46 +0800
Message-ID: <1596514546.32283.29.camel@mtkswgap22>
Subject: Re: [v2,5/6] reset-controller: ti: Introduce force-update method
From: Stanley Chu <stanley.chu@mediatek.com>
To: Crystal Guo <crystal.guo@mediatek.com>
Date: Tue, 4 Aug 2020 12:15:46 +0800
In-Reply-To: <20200803061511.29555-6-crystal.guo@mediatek.com>
References: <20200803061511.29555-1-crystal.guo@mediatek.com>
 <20200803061511.29555-6-crystal.guo@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F731C297E4C566B4F072E2A72C27549312D9B54D96BA0768F50EF657855B62E32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_003414_756646_24CC6EEB 
X-CRM114-Status: GOOD (  17.53  )
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
>  
>  	data->rcdev.ops = &ti_syscon_reset_ops;
>  	data->rcdev.owner = THIS_MODULE;

This patch is good to help MediaTek drivers' transition to use
ti-syscon-reset-controller, also not have side effect to existed users.

Acked-by: Stanley Chu <stanley.chu@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
