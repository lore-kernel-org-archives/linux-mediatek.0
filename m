Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F45C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 09:11:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B18F20679
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 09:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bcxZN+84";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCdfGnts"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B18F20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6E/QE7AEHzFtPAyvM3mfEevqjJOMIHZ1kyN97Ml3LlE=; b=bcxZN+84e1pAshqp9bufU76DJ
	fXZHddzEK57S5O8voCntuKFASKfoGkEYbXmMQYsHiwh4+dEMonhJNhtN8cZFgUMQsOp9vOVwZR8pV
	b+IjomVkSGcvGBsgV88YURK6F5ZAaU2PFWx1aZVWFYx06ZElfztvjnHzLnT4MTtETMJLxTEtyShLg
	ibOQpfZvovs8ABU4vFdtsLaYt3k0/O/blx28gRcgd0Hsy510sMUgOYUEV9u9kTi7gcmXczRPHcZMv
	00axU+Kd1SIqZ/yDxM3PvCn53wanCH9YhsbvDCCNDykgurEKNwHtA7tgh3QLPey8/DNgpCxro1YhA
	wU4fXkeVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOH69-0003up-Q0; Fri, 02 Oct 2020 09:11:29 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOH67-0003u4-Rq; Fri, 02 Oct 2020 09:11:28 +0000
Received: by mail-wm1-x341.google.com with SMTP id t17so922221wmi.4;
 Fri, 02 Oct 2020 02:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n8sjYxuBkwwfLCJdcsNIECFFL7vsWBubB9+n9PHGGPs=;
 b=TCdfGntsyw1waB7d5uBvcniLx8tutSj7FDcOqvJU4dyVkDfnDWJ7IhasTN846qxkRF
 eUvNlYKJ60wEdTN0SxEicLHUPbdVzztUVIkfC6nNeWtfsRQmqRZgu2UJynLpfcWrFq7Y
 +C82+9ko/wvLdY7CmZPElmbUnO3WXiI8VCKr9TgiHKCeJyDhfXmggU6DX/AGICVxLwnW
 y+kppNhU4mF28ptAXoXC6pqbG28FxSBRpMrnzD/JhC8P2/5TxPjJ3VvgHv2VKBYelR2L
 zNJ6Kzu0yp/qHcih9cM51/HNxs1+UxqB/OA/CVr8KBOkAoDweaiUJhNkbrWWBUhqINm8
 y7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n8sjYxuBkwwfLCJdcsNIECFFL7vsWBubB9+n9PHGGPs=;
 b=n62k0vjxTbaI0DE1O5Kp59N7BDrRTnTfDnNA6sJgT5hF/xjFxQ4K05+x/CSkIA3mQu
 jNqkJYld5m1xG3EOyRsNULWbEyWkcgPqRxD/bWQ9WKRdsPpb1pw8fHp9sou53RqOXLeW
 0U1zuKaOKU68at1eBwBXg82sDsUIYp3eEzc4ZfbRJf0/o4CdNuSOD9EWdH15lx5cUz+q
 JHB58WJBkdfpXiVIgwc8DwIICGEVyZhlTmncZxojO/DqhU0Fs0bV2z3mGTjF2OATjJoo
 VgcacRiyw0nb3GC9hDtNLAcEto5e26JDOVbpf8bU4BcPKADVYCxUjuRQrn5AwIj+h796
 q73Q==
X-Gm-Message-State: AOAM531+KP+mINj6U6JhqCDzl4zeE7mcPz9eVxBmSvOKfCP5og6ehCEf
 3Az+PhHnkZDBTeynXQlj3sX2VQPH7ovwEQ==
X-Google-Smtp-Source: ABdhPJy8Mrw34LM+35Ok95pZgOyUQ2MIWncbi40rYI4yc/UePQnaewZFhARbTSOC00ajkgbtSYmNnA==
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr1748837wmb.139.1601629886617; 
 Fri, 02 Oct 2020 02:11:26 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id t203sm1031893wmg.43.2020.10.02.02.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 02:11:26 -0700 (PDT)
Subject: Re: [PATCH v2 12/12] arm64: dts: mediatek: Add mt8183 power domains
 controller
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
 <20201001160154.3587848-13-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6b972d3c-df15-7900-eeb0-df928fa3899f@gmail.com>
Date: Fri, 2 Oct 2020 11:11:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201001160154.3587848-13-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_051127_935477_EEBD5567 
X-CRM114-Status: GOOD (  19.13  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 01/10/2020 18:01, Enric Balletbo i Serra wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Add power domains controller node for SoC mt8183
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v2: None
> 
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 162 +++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c         |   4 -
>   2 files changed, 162 insertions(+), 4 deletions(-)
> 
[...]
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index ec4cc5eeabff..0c490f509655 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -560,10 +560,6 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>   		.compatible = "mediatek,mt8173-mmsys",
>   		.data = &mt8173_mmsys_driver_data,
>   	},
> -	{
> -		.compatible = "mediatek,mt8183-mmsys",
> -		.data = &mt8183_mmsys_driver_data,
> -	},

Looks like an oversight from your side? At least it's not explained in the 
commit message.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
