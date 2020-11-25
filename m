Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1224DC56201
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 18:16:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90F9D2075A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 18:16:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jXWRxN2C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9JuQV1O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90F9D2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L8naVAKn+2J5P6c1VUqOToKXV5DItIvvWAbN8YO4Te0=; b=jXWRxN2CZ8t7ZgkrClLinMauo
	UUvcwEYFO7jxnnss5JtVKPY/N6mf2zWMYehfjJ06B2kF/y4fpY9smrhNege0kf6gMrCsAYsO3H5Fa
	W2Pcqcq/6gRhdgjb1lVGdCmqAr6aizJBRUqFbF3eZmH9aJmG/biisWJgmUj8LMZdk8OXe7lnNuyFC
	NhXpaF9Aud+1e6t7ep7d52/i+eQ7blOl6EORSoHLlFr79EMJogyfpsyXQllsxhMlWSnAXoYZuSdGB
	+0pbn5q6VK8kd3IV9pACCm6uxCWQ7AEqxAGgGQ08vBmmKHKRHkAga1xovgbn0uj92dntI0c9sB+91
	CYe2pdPFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khzLF-0000iQ-8c; Wed, 25 Nov 2020 18:16:33 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khzLC-0000gd-SM; Wed, 25 Nov 2020 18:16:31 +0000
Received: by mail-wr1-x444.google.com with SMTP id i2so2839271wrs.4;
 Wed, 25 Nov 2020 10:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n4hwd00ocT6s6wXE4aWR7hZJHlhuuSKMzexv7VkV7Mw=;
 b=a9JuQV1OC/BQyeL00FMok9glgoVuNCD/+Elyq/nge76ARwshEepHQSKxr7kCBHnEbe
 MbhHgYK3tuF6bsTXWzEKNqX0n2TCW3r7paoRT/DOnj9snKjDsukcZIYO9qcf+z7/NI4Z
 fL2fF5iW2LLPI3sfTE+KRW8E0AxqgaBUMYZVPBfU5LEJLkRFHuk6rxtakxVNs5QkxF4G
 SGI+Km0FmdZNSH1Z2lPoPAkapzVEPz6GjkEqhbh0d97SaEmE1fBDFjuzuo+Yh5W7K8a1
 VgmKjac9tMJ8UWzDjf+CD/L2itp5DfxjT6VVun80JW1tiX9TB/Pmg6B0jqNdxZO0MT5C
 PKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n4hwd00ocT6s6wXE4aWR7hZJHlhuuSKMzexv7VkV7Mw=;
 b=Ey1fquII4q1OPgf2tFXZpLNUAl3kvXU97p042TgT+fToA+bKf4vAoUbczBAWKHiBxm
 77FCY+PhxS7qWFgRq8QTRe5nodMwlzEV1UG6C1Xebl0VsR59nlSa/v3kHOtaSLEYmWNd
 lY01RzKW91iR3/MySkc0tE1huKO/sl8GwqEdG+6br1rJhzUziPJ+sjYbE0Irrnax6Did
 mNDA6hgSG3g0ar3sRUh2Lo8HAKtE9o3DWlFhGGyFK5AOWgf4BPv7W0nT2E39mXRHmZ4R
 qjXLIlY5E/E9Q3i01jOGz4J9RWXXMMp20sd8z05xI2vPYY0bByhYNx0f2iRheH3o8d0j
 yoYA==
X-Gm-Message-State: AOAM532tVR1TOty79X7puma8rGAh4BSVTEz617lr3bHmYJS2WfxDSQgp
 2s/KNAWIY4pzboo35T12QfE=
X-Google-Smtp-Source: ABdhPJw8vmMWiSs7cDX0SbbFaXMxwan1mjJjv4qDg0Hsg/qazz8EKp0A2vyM0mumuAxawkEJuc70Sw==
X-Received: by 2002:a05:6000:151:: with SMTP id
 r17mr5726131wrx.157.1606328189902; 
 Wed, 25 Nov 2020 10:16:29 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:a410:510b:ab5:5694?
 ([2a01:110f:b59:fd00:a410:510b:ab5:5694])
 by smtp.gmail.com with ESMTPSA id b145sm6244969wmd.0.2020.11.25.10.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 10:16:29 -0800 (PST)
Subject: Re: [PATCH v8 3/6] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606301475-7030-4-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <e16d7ef2-912e-8f2d-8368-603ba27833b3@gmail.com>
Date: Wed, 25 Nov 2020 19:16:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606301475-7030-4-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_131630_941191_38FED86C 
X-CRM114-Status: GOOD (  17.48  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Gene,

On 11/25/20 11:51 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add LED_FUNCTION_MOONLIGHT definitions
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   include/dt-bindings/leds/common.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 52b619d..843e65d 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -78,6 +78,7 @@
>   #define LED_FUNCTION_INDICATOR "indicator"
>   #define LED_FUNCTION_LAN "lan"
>   #define LED_FUNCTION_MAIL "mail"
> +#define LED_FUNCTION_MOONLIGHT "moonlight"
>   #define LED_FUNCTION_MTD "mtd"
>   #define LED_FUNCTION_PANIC "panic"
>   #define LED_FUNCTION_PROGRAMMING "programming"
> 

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
