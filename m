Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6457C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:31:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E580222C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:31:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0naYLpCn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofu92/Wh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E580222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=76eay8juQyRvympNa2LXCndgtpMouA3ECc5ltYJDDuk=; b=0naYLpCnF+4oFcTHsJTOP53eG
	9exlUNy+hi6hNe+G4UWXnkGGhqZbbM6wZ3hH7cTPdqqmb3ZP+DpIgO1Xk3lve5WQ8VTZO+9dU/if4
	0TtYvZcISjwCR3Cp0ABp7oYCtlDHXjEOtu4oRPad0AkWOYlG+wSKgQyFakEzlhUw2cmK2flL3oFsx
	uNUmjNXksteT9o+GP3W9K21/09lTvqsjtiPZm3sG4RskvCFYELpXN2r8NW/9j7e/CdDHepxTXYBJs
	ixGhZVW7QEGY4Hm9kJ13dNCva1gcREdFXHbPwMZk39DuTuHutIqs1CHz1hPW0REvJ+0J9CrpQQSSz
	CyjpMlSrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUWCC-0000wf-GA; Mon, 19 Oct 2020 14:31:32 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUWC6-0000v0-EZ; Mon, 19 Oct 2020 14:31:27 +0000
Received: by mail-ed1-x542.google.com with SMTP id 33so10453667edq.13;
 Mon, 19 Oct 2020 07:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NK1LgREI0grlGA48q0LtomCwz/5B/5iMVXhRLFRzRu4=;
 b=ofu92/Wh94NyihEjSyRw0rLG9de1gsHCTSSgjasjE6Na9acvd3ZxxJgab97VVfNNin
 omety/hO40VF/gHPpSP0Tl/8tr2fpBWpoJhjyI3MgKsUvsh5XzdwW70nJqXnW28Czm/d
 fd5rzwwzX3JD2zAxgBSm9XLPsApb5W6AoGdxaLEg9gbOXYo8MtEz8q6+xF2Qm1rC+Vb9
 XliKMjBGys6QhbG+CxCPS6YQjunTfYd14nc1rw0z43knYdzuFhaN9/5g/RXpWhmaWkM0
 i43x7SjycFqzJBLo6XD/0Nav/9BM5pv+XAPTgxiy76GFfvoxVRjOMGVc8UujDyXd9Kj7
 XqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NK1LgREI0grlGA48q0LtomCwz/5B/5iMVXhRLFRzRu4=;
 b=fCTYvosLppKH/SIy4X3mcvXK0CiA0iEzvljhjDT+NrW3oLa2TPxOIl8UmVP2yXQ+9o
 NRgK3g9C1C8nawXSV2jHc9fIALu7WGLpQ8oZ63bgD2QgahD6A4gQszC+4d6Y0elrUqBN
 RWw8RWm2ZeQqX5R+Yq0ELX5nbfdkTVg9h8njHXzZU9Mz/KWc7N5RxyK4BVNc3u8PJH6F
 T/7honjHONqEvPMx7Vg+e0O0Wy7kXVLylBucioraxk9zQ75pemdmiYISDbaBaABVlMDj
 RK3/Cyz+X9kz3ZtXODr7Bcp41gu2SjVz8hdsTxn/W5jyZGVsvZ2zEZxJWpHjHtx7EWab
 o+4A==
X-Gm-Message-State: AOAM533bHrFKLBJ0E1JsKBTDUO2UFu2BP6kI1n2uF9iQX9ZtYkUsMOw5
 w3D4UW1q/bDCdcDCkP/5Em0=
X-Google-Smtp-Source: ABdhPJytlnwdS3LMPlKFbzRg/UyWOvHdc461PBbrWGNT8bH7bBuodDLpq+6U4lGgDLrFxbJ+0Fif0Q==
X-Received: by 2002:aa7:d4d8:: with SMTP id t24mr32228edr.247.1603117884937;
 Mon, 19 Oct 2020 07:31:24 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id y32sm2459726edy.4.2020.10.19.07.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 07:31:24 -0700 (PDT)
Subject: Re: [PATCH 3/5] pwm: pwm-mediatek: Add MT8183 SoC support
To: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20201019140705.1518822-1-fparent@baylibre.com>
 <20201019140705.1518822-4-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <53afa92c-b32f-eff7-95a8-3fe12db5e8fd@gmail.com>
Date: Mon, 19 Oct 2020 16:30:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201019140705.1518822-4-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_103126_520107_5D7FC0C0 
X-CRM114-Status: GOOD (  19.07  )
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
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, lee.jones@linaro.org,
 u.kleine-koenig@pengutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/10/2020 16:07, Fabien Parent wrote:
> Add PWM support for the MT8183 SoC
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/pwm/pwm-mediatek.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> index 108881619aea..9052b500b8f0 100644
> --- a/drivers/pwm/pwm-mediatek.c
> +++ b/drivers/pwm/pwm-mediatek.c
> @@ -314,6 +314,12 @@ static const struct pwm_mediatek_of_data mt7629_pwm_data = {
>   	.has_ck_26m_sel = false,
>   };
>   
> +static const struct pwm_mediatek_of_data mt8183_pwm_data = {
> +	.num_pwms = 4,
> +	.pwm45_fixup = false,
> +	.has_ck_26m_sel = true,
> +};
> +
>   static const struct pwm_mediatek_of_data mt8516_pwm_data = {
>   	.num_pwms = 5,
>   	.pwm45_fixup = false,
> @@ -326,6 +332,7 @@ static const struct of_device_id pwm_mediatek_of_match[] = {
>   	{ .compatible = "mediatek,mt7623-pwm", .data = &mt7623_pwm_data },
>   	{ .compatible = "mediatek,mt7628-pwm", .data = &mt7628_pwm_data },
>   	{ .compatible = "mediatek,mt7629-pwm", .data = &mt7629_pwm_data },
> +	{ .compatible = "mediatek,mt8183-pwm", .data = &mt8183_pwm_data },
>   	{ .compatible = "mediatek,mt8516-pwm", .data = &mt8516_pwm_data },
>   	{ },
>   };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
