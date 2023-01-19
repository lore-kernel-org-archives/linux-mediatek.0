Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDD2C38142
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 17:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzbxECxJMQfMp/BMDtp/vx0yN9hZtlBlPpuqP9cm6XE=; b=cp5cmq0yhhocoA8IbUUw19umsg
	Ve+jaLRCgHeCqLvtnDaS7mSgYo5VLsPrrg4ZZ1Tx9xT77Ybm2zx4zM0zdfX2ibwyh4ogTNno+M9ic
	HoS314V+ZLfpfGlKIKujQ+yC2T7bh9Vyw4zU9CIkuGOiwjFYG4YBhJhWWpAZ763oqGD7d1sPMs9uX
	0djgqQU2fq73Mqm1r3XJjKR5PRMh5F2s/5hJIL1Y9522q4uRR++LleW94Fwq+UHGC6IeV5zjiSUqR
	1QF5NK1cdaxq6CgaJNK0ddju2m75jjxZmnp5fAWXzol4+G9iSQB3g88OGr3nO0QW6eKXWML2NjLjO
	n9mBxsxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZ2a-006O58-FM; Thu, 19 Jan 2023 17:49:32 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZ2M-006Nyv-5F; Thu, 19 Jan 2023 17:49:19 +0000
Received: by mail-ed1-x530.google.com with SMTP id b4so3913409edf.0;
        Thu, 19 Jan 2023 09:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HzbxECxJMQfMp/BMDtp/vx0yN9hZtlBlPpuqP9cm6XE=;
        b=DBf7kxBij7qqGeC7y7+/eqPUNl/8sOo6pjwRD5rPQGl0lx7NTp7BuXJfur2TrngUPV
         ULYhqcN9kHR5CXjNHQhWdKbwud/976vBMvMeJAP5FMwrgIVv+p8E2GmSmpu0KR3uuip2
         veExlKiY2VEZtxAQWVGpiOuAZKtVjqGZ4r/rlY6JQVS4D68da+htH0j4rwKbEcY/eMTy
         YPG1U327j7N6pnxhrtJ2fF+jYpFJWE4q2/ijC158tRJd0AIXqKXEJu6AylTqq9vl2i+m
         8ffY5NgAvCR0JE4zsEayxYlyib5K1zL2xstODNZP6fh9hcdL5axzDvBbMJ7uk/pvIgDv
         63WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HzbxECxJMQfMp/BMDtp/vx0yN9hZtlBlPpuqP9cm6XE=;
        b=nSeBLCmNriUWNtS5CDMv7WQ/NjNaR1uVA/8JUkKnem1CbWWwzG7ZvVMpA2J1F7OXgZ
         ix709n7Rd7TGKuWEizOSnkwSXrcYtlAf4MqAIeQCzvzK6Km8p6rUgCunn/XVN6/4E/wK
         IjkEVDKscZ1/Y3ux826pmLohHc7IyVviHpSUCgKzHLMSiPdUCM7/a6uYn3+Wt/sVISYS
         1Ed7obh0auxf1hnMcTFKjw6PTd+qKS70ZdnphP+rM2Ap/jmGBLQlImYiGs4ov2mCb+fP
         kSSo2GAG/rnVMQqTKmTUq24mIBdG1/NGPWxGVI6RhfdD1YlvVCDOJ4o9mCMqFw+GUlKJ
         JsTA==
X-Gm-Message-State: AFqh2koeyR9IYSZV4/j/yGRxwjSqlua2UqmAKhiK4+lkpplQigNGtfYH
	XP+1FaTocQJMUcfra/P1eGM=
X-Google-Smtp-Source: AMrXdXsZQQe0vv6Eyi0PePX3epUTaqg5CG+wRcZzRJjobIDth2dMK20TRtch3CyxAPpklgKJPDsJvg==
X-Received: by 2002:a05:6402:10c4:b0:48e:94ec:b7ac with SMTP id p4-20020a05640210c400b0048e94ecb7acmr10498888edu.7.1674150554336;
        Thu, 19 Jan 2023 09:49:14 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id eq19-20020a056402299300b0049e65e4ff20sm1440818edb.14.2023.01.19.09.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 09:49:13 -0800 (PST)
Message-ID: <8d05d100-ef97-049a-561f-1a65db7a4112@gmail.com>
Date: Thu, 19 Jan 2023 18:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8192: Mark scp_adsp clock as
 broken
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
References: <20221229101202.1655924-1-wenst@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221229101202.1655924-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_094918_255791_ADB4868E 
X-CRM114-Status: GOOD (  16.72  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 29/12/2022 11:12, Chen-Yu Tsai wrote:
> The scp_adsp clock controller is under the SCP_ADSP power domain. This
> power domain is currently not supported nor defined.
> 
> Mark the clock controller as broken for now, to avoid the system from
> trying to access it, and causing the CPU or bus to stall.
> 
> Fixes: 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192 clock controllers")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied thanks!

> ---
> Changes since v1:
> - Changed "broken" to "fail"
> - Rebased onto v6.2-rc1 plus v6.2-tmp/* from mediatek repo
> 
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index dd618c563e8a..ef4fcefa2bfc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -644,6 +644,8 @@ scp_adsp: clock-controller@10720000 {
>   			compatible = "mediatek,mt8192-scp_adsp";
>   			reg = <0 0x10720000 0 0x1000>;
>   			#clock-cells = <1>;
> +			/* power domain dependency not upstreamed */
> +			status = "fail";
>   		};
>   
>   		uart0: serial@11002000 {

