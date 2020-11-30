Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB8EC64E90
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 11:14:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 654B72085B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 11:14:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Max64fHA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nqhj9BT9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 654B72085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nOUmyyICqJS1BU3j/G+uIesSaKRRyhOV6QotHtrrmHY=; b=Max64fHArWiM1GIzje2YWBBQl
	aghFuV0JfzokeBcnk86u1rvuz7a7SPj0S/PNgVw4zlKUYwtWPgXmerxgHAza+tlbv+O9mMn/MesTT
	lhhxRetj86Qbj0xfbQdyhjU/9IXhaMDqfnBUYHTapL3IGY9iTg3nlkEi/eb54Qgkq02BkbrWRRUmT
	jofX3V2gU/wo0RNmwA2fa/zAKuZ2wpzWMN/uQsT8oysk8gyNi0GUIpF/eUiDQD6mK4V6mcm/grcTh
	ET4uaCQftOC1BAXp0iE8uMa4FmffAUWvkerfmlqE7bPZmcSJYswEeWyUlXh5UOBTCfDhywUrmmCtn
	IcaDexmYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjh85-0001l8-Tp; Mon, 30 Nov 2020 11:14:02 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjh7r-0001h2-4f
 for linux-mediatek@lists.infradead.org; Mon, 30 Nov 2020 11:13:48 +0000
Received: by mail-pf1-x442.google.com with SMTP id w187so10185876pfd.5
 for <linux-mediatek@lists.infradead.org>; Mon, 30 Nov 2020 03:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ylWqeCaojXahUBRs7tWWOFsUs6Y8SM8mpT1ztQJPZd0=;
 b=nqhj9BT9+WCVKuCz8Q2lcCFUUmolsn0nXw9i4y3ckunvZuV1abLCXaTszeMWjQM0Bq
 wzszHyudG7j/Ony1y37fPgtGPcI7tbTfZS80x1ktlFE/uuRI6uaIl7hyTv5g6iHCVonW
 YXvaA6MX2yS5rPPM8FPphL7BJQz59I8vY5AKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ylWqeCaojXahUBRs7tWWOFsUs6Y8SM8mpT1ztQJPZd0=;
 b=qDiRfBhVPYxYv3/4uNEJ9lVUcon+WWp2+vTVH/JImOnvHHDpsdnNxaC5BLsEdfjUfm
 JKH7kpq62ut7/VNCsj+kDUdUpAhhaM42QLn8oPf8+Z/DiESoSUbpP7evuFf1y/mElf47
 FaDEtLm8I7quB1uerY3MwFQsh28yGUAkeLcdthjEps/Jpw11e3KxE9QoO0pm53R3+Omz
 BYzp6KgH3U7trvwdjVI1SMdvMV1sAYPxYKpjPKZzG2ELlO+y0H06LaqS5NC10eFOm72Y
 RyTMZDQq/P8d28jvCxTSwTU8li6v9+nNGD7CdYnOPhv5fJ3TlKxRkE6qkUUVHrszIQRu
 ZnMQ==
X-Gm-Message-State: AOAM533L1kpZOtez7xzoL149vpbV/iZYcCjnbxCfDqXS5LwUauaDcmBx
 IK+2f19/1Jix5sD9bauNT7Ylsw==
X-Google-Smtp-Source: ABdhPJxtxKJ3Ouuac5shSBMgyDJniyLHnpSM3fINGObBbJy49hgqBs8/pwklTMJIjQlKupFLUXTDiQ==
X-Received: by 2002:a05:6a00:1389:b029:18b:2d21:2f1a with SMTP id
 t9-20020a056a001389b029018b2d212f1amr18263454pfg.1.1606734824573; 
 Mon, 30 Nov 2020 03:13:44 -0800 (PST)
Received: from chromium.org ([2401:fa00:1:b:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id 10sm4147168pgq.93.2020.11.30.03.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 03:13:44 -0800 (PST)
Date: Mon, 30 Nov 2020 19:13:40 +0800
From: Ikjoon Jang <ikjn@chromium.org>
To: Crystal Guo <crystal.guo@mediatek.com>
Subject: Re: [v6, 3/3] reset-controller: ti: force the write operation when
 assert or deassert
Message-ID: <20201130111340.GA3042402@chromium.org>
References: <20200930022159.5559-1-crystal.guo@mediatek.com>
 <20200930022159.5559-4-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930022159.5559-4-crystal.guo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_061347_245521_C29582BD 
X-CRM114-Status: GOOD (  19.32  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com, s-anna@ti.com,
 srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, yingjoe.chen@mediatek.com, stanley.chu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 10:21:59AM +0800, Crystal Guo wrote:
> Force the write operation in case the read already happens
> to return the correct value.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  drivers/reset/reset-ti-syscon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> index 5d1f8306cd4f..c34394f1e9e2 100644
> --- a/drivers/reset/reset-ti-syscon.c
> +++ b/drivers/reset/reset-ti-syscon.c
> @@ -97,7 +97,7 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
>  	mask = BIT(control->assert_bit);
>  	value = (control->flags & ASSERT_SET) ? mask : 0x0;
>  
> -	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
> +	return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
>  }

I don't think there are no reset controllers with cached regmap,
thus I don't think this is needed.
Are there any specific reasons behind this, what I've missed here?

We need to be sure that all other devices using this driver
should have no side effects on write.

I can think of a weird controller doing unwanted things internally
on every write disregarding the current state. (or is this overly
paranoid?)

>  
>  /**
> @@ -128,7 +128,7 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
>  	mask = BIT(control->deassert_bit);
>  	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
>  
> -	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
> +	return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
>  }
>  
>  /**

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
