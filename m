Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C4CC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:48:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E66C20809
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:48:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mq44E9h6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCFrhuo7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E66C20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j4n64lxeYCyKLNt+H0wjNn3bFn6ptB4NrF/LqpdCd1E=; b=Mq44E9h60EM637IHXUwOkkCeh
	d/21XrtSnhEO1g1RU4iKiuXX58KS2TF8FO5ee3YGQ96wQAl/Jmvh3AlbLMZn0LVZkgnfdyFOQQq+8
	zRahLgOHjHNOXeKt9l9epfAEmNhjieDE2iCq48FT+fReau94CQThSZ1MhWmt48Ut8aMXHWfT8WXe+
	ym7qhCMy8AsJVoIlkHzds7ST34NR9gPwT23VlwVMn6J8yMVrJK2lOr6fbSpld8dyzqZjsi4/Di9rA
	jiZL+r0HK9RvcD5OKYLQe+QjLm/0R1tSSlxkLL0044L0jLYgP051LlA5Sn58bY87riiMp13RZX+LZ
	UHbHBjqOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0gpV-0003eA-Qq; Wed, 29 Jul 2020 07:48:49 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0gpR-0003cw-Iv; Wed, 29 Jul 2020 07:48:46 +0000
Received: by mail-wm1-x343.google.com with SMTP id x5so1804247wmi.2;
 Wed, 29 Jul 2020 00:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wWA3cfypyLmf7qdbYPEp9Obskc/EXQ9KkvF/jWM+ZEI=;
 b=gCFrhuo7zYWBXf2i8cx0tOErYZ0Pmiuh2uXm0va/SQt0m42M9hhwAk8iDFOxRzSmz/
 7YZ+EGjSJBE9EHJDG8AhAOt5sOPumX6vDoSSvOD4swOTxjibEeLBP0PjQ9bFsO1oaKtH
 IQMTUYnH5Ytg8ONzqJo4ZTP/06cuBJx3hdkqDGYgm8rXjehHtPBM8uD5vzrCL3Dt1XBw
 XpzaVOCCWfFO3jrCyeIO7QPFvtgYTlpVGPvoCKNS5Whb4Zb1iz8DiskdKmoAH9TtB4H1
 O9oBxd/DJTehKCKhaalzFoeRsPcVOK2U3l6bQ3ls65MfeSZjaC8/8MMPOABf7vaNNB5k
 X7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wWA3cfypyLmf7qdbYPEp9Obskc/EXQ9KkvF/jWM+ZEI=;
 b=BPtaDPymHkmhFykD4jPqH0dfv9bCCLYuiV4lURqHyUWS3iF+ICMWiWJSlsESkf4uSl
 mDjkz8yLOGhoSAWMlI0Svxq0unw1RBbGNyl16hCTM1/qcBmXpMdCTdvxtCVT/uJiTLhr
 UVCrrKHwhiQ16KOdYtZ2oz5OA1c3JI/MzdbuzmS/Q4dfTj/o1M3sT2leJEndr8T883l8
 OQ7vHyfkMe1sm/6iLXWQmHwjsmzLxywgZUQIf+Tf29OmKDk8IzrqUwWga013elUerds7
 Ij0BaPbfsvOdLUYKJFale5R4Lx1lZk50CNn92xvaH6YAuD4wY6l6DhHUMYLWpgm/vHCd
 WeBw==
X-Gm-Message-State: AOAM531YMr3ONYKTphSJ18ovbJypTiyNzHkVCH4fyJ3yvy3Di8Ivc/bs
 DghxZyP+ygUJme2E3+tSqIE=
X-Google-Smtp-Source: ABdhPJw18Au7sbqmb2ly8qEkFwpnF373GPLonF39c3FLWDODiw+v1gYTJWkig9ko8XkbuWkbIICozQ==
X-Received: by 2002:a1c:660a:: with SMTP id a10mr7018743wmc.115.1596008924274; 
 Wed, 29 Jul 2020 00:48:44 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id 68sm3632756wra.39.2020.07.29.00.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 00:48:43 -0700 (PDT)
Subject: Re: [PATCH 1/2] reset-controller: ti: adjust the reset assert and
 deassert interface
To: Crystal Guo <crystal.guo@mediatek.com>, p.zabel@pengutronix.de,
 robh+dt@kernel.org
References: <1596008357-11213-1-git-send-email-crystal.guo@mediatek.com>
 <1596008357-11213-2-git-send-email-crystal.guo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <ba0d1e29-3ba3-5379-d03e-1ccec21c2ffa@gmail.com>
Date: Wed, 29 Jul 2020 09:48:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1596008357-11213-2-git-send-email-crystal.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_034845_665530_C823DAE1 
X-CRM114-Status: GOOD (  23.94  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 29/07/2020 09:39, Crystal Guo wrote:
> Add ti_syscon_reset() to integrate assert and deassert together,
> and change return value of the reset assert and deassert interface
> from regmap_update_bits to regmap_write_bits.
> 
> when clear bit is already 1, regmap_update_bits can not write 1 to it again.
> Some IC has the feature that, when set bit is 1, the clear bit change
> to 1 together. It will truly clear bit to 0 by write 1 to the clear bit
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   drivers/reset/reset-ti-syscon.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> index a2635c2..5a8ec8f 100644
> --- a/drivers/reset/reset-ti-syscon.c
> +++ b/drivers/reset/reset-ti-syscon.c
> @@ -89,7 +89,7 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
>   	mask = BIT(control->assert_bit);
>   	value = (control->flags & ASSERT_SET) ? mask : 0x0;
>   
> -	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
> +	return regmap_write_bits(data->regmap, control->assert_offset, mask, value);

Nack, this will break the driver for the other devices.
The kernel has to work not just for your SoC but for all devices of all 
architectures. You can't just hack something up, that will work on your specific 
SoC.

Regards,
Matthias

>   }
>   
>   /**
> @@ -120,7 +120,7 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
>   	mask = BIT(control->deassert_bit);
>   	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
>   
> -	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
> +	return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
>   }
>   
>   /**
> @@ -158,10 +158,19 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
>   		!(control->flags & STATUS_SET);
>   }
>   
> +static int ti_syscon_reset(struct reset_controller_dev *rcdev,
> +			   unsigned long id)
> +{
> +	ti_syscon_reset_assert(rcdev, id);
> +
> +	return ti_syscon_reset_deassert(rcdev, id);
> +}
> +
>   static const struct reset_control_ops ti_syscon_reset_ops = {
>   	.assert		= ti_syscon_reset_assert,
>   	.deassert	= ti_syscon_reset_deassert,
>   	.status		= ti_syscon_reset_status,
> +	.reset		= ti_syscon_reset,
>   };
>   
>   static int ti_syscon_reset_probe(struct platform_device *pdev)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
