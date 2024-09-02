Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F29CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 15:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfR441/z2KXRbtRPvcV5jaQ/+dlUWdH1GL8QEmA05xU=; b=2C1nADkbLN5m2p9U9F9bTtWvoa
	9a8KW+Iio1LJFvN5N3evxJBz+ZdsPSdkJqOhJh9XkspQJCYGdTd7f02SO0qQ831z/THdRFXJoVO+Y
	e0BHl/S8cbiqU0gQDdHbW56pSXUaRjQZjeW6UXiyJxLCSGYK/j08odJxZvVYYPF8tJm9EzyYrB4+C
	umFSAdxQQEcmXfv+qIrbv+qKYJ8ctzK4myXIJv56B+x9GEvk8Gm0NL/FnnRUbNHj5cwXuAE3mcicT
	woYdNF342CqTn+t5+xR7v6xwPAsomfVOHFciKl5smypO5Z6WwW6Pmg2mj5R48KqyK4GDBpTdQ2BuN
	QZifVESg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9LA-0000000Eul8-3JLy;
	Mon, 02 Sep 2024 15:51:40 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9KE-0000000EuW8-1eSu;
	Mon, 02 Sep 2024 15:50:44 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2f409c87b07so54761761fa.0;
        Mon, 02 Sep 2024 08:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725292241; x=1725897041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bfR441/z2KXRbtRPvcV5jaQ/+dlUWdH1GL8QEmA05xU=;
        b=CQGklO0vAhRGR9d0ALLRALe8GMmEdo30KvOpxT7F+quinaPvF64MdKUS2ffi5aTQlJ
         tC3paK4AEV8yyhS5wvac+/w6vfaNkazqOpvxUZg7xZ25lR85BvnYm+BlwQ6CzXqurMpv
         qZmfZAlFQlX/jYFUUd2BSR6O0qsznWA+DDD0NxHOJKWEhckvmUB1EPNvV14oIg0Cij32
         qeUuSEXBdeYfFfzqHq1Pj34yu31hBhftLzcdI26z3TQe3ra91yODqU1U6ynSiqyDytfZ
         vdVthX33VPvIal6VZZJVW4UmBP3GRl5cRYrXxabTA2nKVN0yPO/pY6rdC9MJBkWXfnXo
         7qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292241; x=1725897041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfR441/z2KXRbtRPvcV5jaQ/+dlUWdH1GL8QEmA05xU=;
        b=Vc+EeQrDcsmG+lQWRiSnmxJJ3DcKF/74gnGVTs4kN6eHs4wokG2MMgtt34sO4GcTqp
         uybFT1zwQoS+wD9b0K2QZe6+fQ5MNW25yLUtoX4GdrJtTLL1po+QzyExJLp4+cyB1YOv
         LaiMGCJZw5+LpjTV74EYZf/4/WKxSrccpP2+djGESkA4kEK8IyDmTvbOEOo8jsTVtZMK
         aWELjrqq/3qsiMbbX36S9Pz71ZyM39bT/WMMWtK+uOF3fv/poFyxcX8ry6X6Cl367wMW
         IFMlH0NUguFaBMZaB/b2C6wepS4BR2Lf4wqRCyMnldopdIdN1Pn5TEZZ2jGxQ5B+45xN
         5/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXChzrUtpviCv3/MbmOIjKJZiJ3S0L+BQhxiss8J+gRilkqAeX+itwJmPoeOLO4D9s3mHKFZRfLk+8Xm34PZl0=@lists.infradead.org, AJvYcCXVP2Heb2+/A21iWL87QdrFlpaTt5dqrMOulT97OGqdR9WEw08fAV9/6ul+5gFjCgoFmBRpuxR1654OnzmNP/zi@lists.infradead.org
X-Gm-Message-State: AOJu0YxxD8HsbVvx2rlfoMg4hCPFafHouAlZL2mZxQZ+LwUfV00CUDFU
	scTtVunq5frwqiUYRFRp050izZM6eVyC43gxmo5ExnpoOYT/MNW2tD3rqw==
X-Google-Smtp-Source: AGHT+IGBu4sXdVkP/DfgdJUulgeC3nRnKuj4BLMXI2x7OZ5cdEIkk/9G5JXSziB5lUuUgi07UyYq6Q==
X-Received: by 2002:a05:6512:68b:b0:52e:f367:709b with SMTP id 2adb3069b0e04-53546b93fb3mr8150957e87.42.1725292239827;
        Mon, 02 Sep 2024 08:50:39 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196715sm571049866b.113.2024.09.02.08.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:50:38 -0700 (PDT)
Message-ID: <b0d83115-db4f-4c3b-9cfe-e889b1410c44@gmail.com>
Date: Mon, 2 Sep 2024 17:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Correct clock order for
 dp_intf*
To: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240802070951.1086616-1-wenst@chromium.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 xsFNBFP1zgUBEAC21D6hk7//0kOmsUrE3eZ55kjc9DmFPKIz6l4NggqwQjBNRHIMh04BbCMY
 fL3eT7ZsYV5nur7zctmJ+vbszoOASXUpfq8M+S5hU2w7sBaVk5rpH9yW8CUWz2+ZpQXPJcFa
 OhLZuSKB1F5JcvLbETRjNzNU7B3TdS2+zkgQQdEyt7Ij2HXGLJ2w+yG2GuR9/iyCJRf10Okq
 gTh//XESJZ8S6KlOWbLXRE+yfkKDXQx2Jr1XuVvM3zPqH5FMg8reRVFsQ+vI0b+OlyekT/Xe
 0Hwvqkev95GG6x7yseJwI+2ydDH6M5O7fPKFW5mzAdDE2g/K9B4e2tYK6/rA7Fq4cqiAw1+u
 EgO44+eFgv082xtBez5WNkGn18vtw0LW3ESmKh19u6kEGoi0WZwslCNaGFrS4M7OH+aOJeqK
 fx5dIv2CEbxc6xnHY7dwkcHikTA4QdbdFeUSuj4YhIZ+0QlDVtS1QEXyvZbZky7ur9rHkZvP
 ZqlUsLJ2nOqsmahMTIQ8Mgx9SLEShWqD4kOF4zNfPJsgEMB49KbS2o9jxbGB+JKupjNddfxZ
 HlH1KF8QwCMZEYaTNogrVazuEJzx6JdRpR3sFda/0x5qjTadwIW6Cl9tkqe2h391dOGX1eOA
 1ntn9O/39KqSrWNGvm+1raHK+Ev1yPtn0Wxn+0oy1tl67TxUjQARAQABzSlNYXR0aGlhcyBC
 cnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPsLBkgQTAQIAPAIbAwYLCQgHAwIGFQgC
 CQoLBBYCAwECHgECF4AWIQTmuZIYwPLDJRwsOhfZFAuyVhMC8QUCWt3scQIZAQAKCRDZFAuy
 VhMC8WzRD/4onkC+gCxG+dvui5SXCJ7bGLCu0xVtiGC673Kz5Aq3heITsERHBV0BqqctOEBy
 ZozQQe2Hindu9lasOmwfH8+vfTK+2teCgWesoE3g3XKbrOCB4RSrQmXGC3JYx6rcvMlLV/Ch
 YMRR3qv04BOchnjkGtvm9aZWH52/6XfChyh7XYndTe5F2bqeTjt+kF/ql+xMc4E6pniqIfkv
 c0wsH4CkBHqoZl9w5e/b9MspTqsU9NszTEOFhy7p2CYw6JEa/vmzR6YDzGs8AihieIXDOfpT
 DUr0YUlDrwDSrlm/2MjNIPTmSGHH94ScOqu/XmGW/0q1iar/Yr0leomUOeeEzCqQtunqShtE
 4Mn2uEixFL+9jiVtMjujr6mphznwpEqObPCZ3IcWqOFEz77rSL+oqFiEA03A2WBDlMm++Sve
 9jpkJBLosJRhAYmQ6ey6MFO6Krylw1LXcq5z1XQQavtFRgZoruHZ3XlhT5wcfLJtAqrtfCe0
 aQ0kJW+4zj9/So0uxJDAtGuOpDYnmK26dgFN0tAhVuNInEVhtErtLJHeJzFKJzNyQ4GlCaLw
 jKcwWcqDJcrx9R7LsCu4l2XpKiyxY6fO4O8DnSleVll9NPfAZFZvf8AIy3EQ8BokUsiuUYHz
 wUo6pclk55PZRaAsHDX/fNr24uC6Eh5oNQ+v4Pax/gtyyc7BTQRd1TlIARAAm78mTny44Hwd
 IYNK4ZQH6U5pxcJtU45LLBmSr4DK/7er9chpvJ5pgzCGuI25ceNTEg5FChYcgfNMKqwCAekk
 V9Iegzi6UK448W1eOp8QeQDS6sHpLSOe8np6/zvmUvhiLokk7tZBhGz+Xs5qQmJPXcag7AMi
 fuEcf88ZSpChmUB3WflJV2DpxF3sSon5Ew2i53umXLqdRIJEw1Zs2puDJaMqwP3wIyMdrfdI
 H1ZBBJDIWV/53P52mKtYQ0Khje+/AolpKl96opi6o9VLGeqkpeqrKM2cb1bjo5Zmn4lXl6Nv
 JRH/ZT68zBtOKUtwhSlOB2bE8IDonQZCOYo2w0opiAgyfpbij8uiI7siBE6bWx2fQpsmi4Jr
 ZBmhDT6n/uYleGW0DRcZmE2UjeekPWUumN13jaVZuhThV65SnhU05chZT8vU1nATAwirMVeX
 geZGLwxhscduk3nNb5VSsV95EM/KOtilrH69ZL6Xrnw88f6xaaGPdVyUigBTWc/fcWuw1+nk
 GJDNqjfSvB7ie114R08Q28aYt8LCJRXYM1WuYloTcIhRSXUohGgHmh7usl469/Ra5CFaMhT3
 yCVciuHdZh3u+x+O1sRcOhaFW3BkxKEy+ntxw8J7ZzhgFOgi2HGkOGgM9R03A6ywc0sPwbgk
 gF7HCLirshP2U/qxWy3C8DkAEQEAAcLBdgQYAQgAIBYhBOa5khjA8sMlHCw6F9kUC7JWEwLx
 BQJd1TlIAhsMAAoJENkUC7JWEwLxtdcP/jHJ9vI8adFi1HQoWUKCQbZdZ5ZJHayFKIzU9kZE
 /FHzzzMDZYFgcCTs2kmUVyGloStXpZ0WtdCMMB31jBoQe5x9LtICHEip0irNXm80WsyPCEHU
 3wx91QkOmDJftm6T8+F3lqhlc3CwJGpoPY7AVlevzXNJfATZR0+Yh9NhON5Ww4AjsZntqQKx
 E8rrieLRd+he57ZdRKtRRNGKZOS4wetNhodjfnjhr4Z25BAssD5q+x4uaO8ofGxTjOdrSnRh
 vhzPCgmP7BKRUZA0wNvFxjboIw8rbTiOFGb1Ebrzuqrrr3WFuK4C1YAF4CyXUBL6Z1Lto//i
 44ziQUK9diAgfE/8GhXP0JlMwRUBlXNtErJgItR/XAuFwfO6BOI43P19YwEsuyQq+rubW2Wv
 rWY2Bj2dXDAKUxS4TuLUf2v/b9Rct36ljzbNxeEWt+Yq4IOY6QHnE+w4xVAkfwjT+Vup8sCp
 +zFJv9fVUpo/bjePOL4PMP1y+PYrp4PmPmRwoklBpy1ep8m8XURv46fGUHUEIsTwPWs2Q87k
 7vjYyrcyAOarX2X5pvMQvpAMADGf2Z3wrCsDdG25w2HztweUNd9QEprtJG8GNNzMOD4cQ82T
 a7eGvPWPeXauWJDLVR9jHtWT9Ot3BQgmApLxACvwvD1a69jaFKov28SPHxUCQ9Y1Y/Ct
In-Reply-To: <20240802070951.1086616-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_085042_492778_DCFDB0FA 
X-CRM114-Status: GOOD (  14.21  )
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



On 02/08/2024 09:09, Chen-Yu Tsai wrote:
> The clocks for dp_intf* device nodes are given in the wrong order,
> causing the binding validation to fail.
> 
> Fixes: 6c2503b5856a ("arm64: dts: mt8195: Add dp-intf nodes")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 989e8ac545ac..e89ba384c4aa 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -3252,10 +3252,10 @@ dp_intf0: dp-intf@1c015000 {
>   			compatible = "mediatek,mt8195-dp-intf";
>   			reg = <0 0x1c015000 0 0x1000>;
>   			interrupts = <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>;
> -			clocks = <&vdosys0  CLK_VDO0_DP_INTF0>,
> -				 <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
> +			clocks = <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
> +				 <&vdosys0  CLK_VDO0_DP_INTF0>,
>   				 <&apmixedsys CLK_APMIXED_TVDPLL1>;
> -			clock-names = "engine", "pixel", "pll";
> +			clock-names = "pixel", "engine", "pll";
>   			status = "disabled";
>   		};
>   
> @@ -3522,10 +3522,10 @@ dp_intf1: dp-intf@1c113000 {
>   			reg = <0 0x1c113000 0 0x1000>;
>   			interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>;
>   			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> -			clocks = <&vdosys1 CLK_VDO1_DP_INTF0_MM>,
> -				 <&vdosys1 CLK_VDO1_DPINTF>,
> +			clocks = <&vdosys1 CLK_VDO1_DPINTF>,
> +				 <&vdosys1 CLK_VDO1_DP_INTF0_MM>,
>   				 <&apmixedsys CLK_APMIXED_TVDPLL2>;
> -			clock-names = "engine", "pixel", "pll";
> +			clock-names = "pixel", "engine", "pll";
>   			status = "disabled";
>   		};
>   

