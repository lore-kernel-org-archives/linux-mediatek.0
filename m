Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D493BC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 16:12:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 796CA64DF1
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 16:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 796CA64DF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UBTrSysKlE7DvbPx5qUBcdvrg9jHHRnjEakyW0kj478=; b=bqFVp0lqPaVRLn4sP61YnJQi0
	KC0cSA/h0DmiM0yXKxUzCwBJOvaldE+81pPlohVmxV4gkJMKO0F1W3Bwe4I9cHcCy4cTlJTOgjlPt
	+v2g55hqDI9Wl0zlnsX2z8j5MoRHVn9c3jstZ2+yTs4Xn71PS1LM7GEIM57TxmQ4iExJAzlwrGWOo
	lLu2w+tru5ElwOp8GUjYx6fUkmZcJsCGYrJ3QGpKPIc9bUhBxDMJos9kT/gOLAc/+9RWQVKreE7Sk
	/H/fh4igsAmKLJzbtCZYC20NML1f+fOUFSsvM9pQGUY0OrpUim3UWsMaMEoze888sFhKBiqaa4aBZ
	I6pG37cXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5WNu-00030z-P2; Fri, 29 Jan 2021 16:12:34 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5WNr-000302-RD; Fri, 29 Jan 2021 16:12:33 +0000
Received: by mail-wr1-x42d.google.com with SMTP id l12so9407204wry.2;
 Fri, 29 Jan 2021 08:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ST7WdW4AHMNwNKW4LPK5UDb5h0XM0Wouc3DTcnCaFsw=;
 b=o4cMsn5fUlqQFg1SsaMNgyb2WrAgCI4eXiys0l/OBn+Le5zRaE3mAu5d7HntVtgzKC
 wEQjMjOoXwhOBAiEbIOR+yajPwwuH1AJOJlJkiO3DZh1MxwcA3uHocJthtej2v9jsikR
 4/+aZzcWkLhXfD79k85hd1/Q/JbAHOPStif/ey33ikMxSoyscn55k1XD3lYdgHgPnpT+
 9vCFrlqZE43prthHuoRL9uZOvFXeTM8bts8hWgJC+hgk/c3GAM//KO5kCLHMeulRzeiS
 6JOWQAx3SumXwZ79GQaZjG8xzQI+D/+nrxDsQem6C+Ve2zxjNcwapWmJGJdbVDewUulH
 Q4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ST7WdW4AHMNwNKW4LPK5UDb5h0XM0Wouc3DTcnCaFsw=;
 b=Zw1/rziUyKQO+zxKhbn/dLvY7VDMZkXnTJvk1kBb+tJK2YvpkO9Tmn4tZgz26SwJ+4
 5OokH4CWpQ1+unKIaPN4rW2R0KGZzzrGJmDj3p30XZ5OLEP5RIDJk9lK/RIJc14yTWXn
 WVNTrQPcIaXqDKhwdO+nl+iDp3MxUNUHkEnbdKNMh5UUlRloczj46OfF7Nr/NF3Js/8t
 xn493UUL+Rt13AxFJJF4m7MMOBCNryCv3HvWp8YBa+73lHTTkfoM0GPueanVEvyYfJ9S
 y3QyNZftAy1EzFTgnb+7FwYruwrTcDUG08d16fz9/huX9/iqFTTFk67uIW+/iEAFWag/
 KvYg==
X-Gm-Message-State: AOAM530Do7qsdNrIF5xpiU1+r5B/zfmCwJoU+yNmAztmprqUtux6R4gh
 fjZdsVLCOi33kphzUMI6V8UVNdqJ7Bo=
X-Google-Smtp-Source: ABdhPJwZm9/wuYgszu439FbMT2Qol8n6NhEfnm0e4FNm/uAOa1Jden148CgRpOWPWqy+WheOS4ewhg==
X-Received: by 2002:a5d:47a2:: with SMTP id 2mr5340921wrb.393.1611936750230;
 Fri, 29 Jan 2021 08:12:30 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id 9sm2446960wra.80.2021.01.29.08.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 08:12:29 -0800 (PST)
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: mt8183: add pwm node
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>
References: <20201209120322.137610-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <06a08867-9e54-3591-dc73-7ac88d2b806a@gmail.com>
Date: Fri, 29 Jan 2021 17:12:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20201209120322.137610-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_111232_065409_8B66FF41 
X-CRM114-Status: GOOD (  15.67  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 09/12/2020 13:03, Fabien Parent wrote:
> MT8183 SoC has 4 PWMs. Add the pwm node in order to support them.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied to v5.11-next/dts64

Thanks

> ---
> 
> V2: rename pwm0 to pwm1 since disp-pwm has been merged in v5.11 as pwm0
> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5b782a4769e7..a0004bd9f9c2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -667,6 +667,20 @@ pwm0: pwm@1100e000 {
>  			clock-names = "main", "mm";
>  		};
>  
> +		pwm1: pwm@11006000 {
> +			compatible = "mediatek,mt8183-pwm";
> +			reg = <0 0x11006000 0 0x1000>;
> +			#pwm-cells = <2>;
> +			clocks = <&infracfg CLK_INFRA_PWM>,
> +				 <&infracfg CLK_INFRA_PWM_HCLK>,
> +				 <&infracfg CLK_INFRA_PWM1>,
> +				 <&infracfg CLK_INFRA_PWM2>,
> +				 <&infracfg CLK_INFRA_PWM3>,
> +				 <&infracfg CLK_INFRA_PWM4>;
> +			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
> +				      "pwm4";
> +		};
> +
>  		i2c3: i2c@1100f000 {
>  			compatible = "mediatek,mt8183-i2c";
>  			reg = <0 0x1100f000 0 0x1000>,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
