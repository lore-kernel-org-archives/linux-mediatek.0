Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C420EC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 07:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcLdFTHsKhxsWZKbXum3q12jRap59Wq5H+bR99icFo4=; b=R6M+/xVv3AAyQpcClkt9+YiEvb
	XXqm1sY584o/fkGATMdWqVibgNIolS1HmysPCdPhle+PhSJztC+2eut1WTFbv8dn1wHpBIB85C/TI
	R0Efxrzbss3wS1Ou3J1ftElmAZWduYDrR2lsmCrWW7lMzEPQ92yf6T1G1Fg8qtaowgLthBMNdpXLn
	O/w4WcWX8JfgGlOibz0juTOWISuEO80rAKJFr+aQLOwA2teC+h4vd+TcRVl+YT2/yVMtuUnt7v/ge
	6mTtk4iF1CHK192C5XbX0OrxcJMiXgQ7oAfbOayZe7Qz71X0h7BwGteiyPRMoRNRWxuEkuYJqZ0jl
	4yoeLUgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIs3-0000000BYn8-1QsC;
	Wed, 12 Jun 2024 07:58:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIs0-0000000BYlo-3qXR
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jun 2024 07:58:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso31766265e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 00:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718179089; x=1718783889; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcLdFTHsKhxsWZKbXum3q12jRap59Wq5H+bR99icFo4=;
        b=G92tyQeWa9lIsaQiho/ieI7WEAUeJ5hD/2qDNU45hzLSYq7cFOhTTAtyxCV51dPQ0p
         WBDh24beCrN9sELf/r2v553ktjVPRUGPL05yZ5iiVzAHW0bh97RFIn9mB8EXVOJFvrVH
         EbsxMhRU2z+NGvu83NFMACfjyjhfjeA3SRnW91XM4xEm9wfrmXfCie56X2qng3culMY8
         GX7JAuFI7Iixzm+nJHQXtLTXpAALjzN4nn17G97G42VLnTh+QF8x15BiWZYtWl+NFuFd
         tpxqwYIkVPOXgyByYfjtPpX9fLto66dSa4+giTuDrVZs+NYuXyVt298dBVrS8KzcMiGG
         pR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179089; x=1718783889;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bcLdFTHsKhxsWZKbXum3q12jRap59Wq5H+bR99icFo4=;
        b=g5vKZRMzw2zTK706JsYltJDxyetcPakRTqWVWuJzfs/p4+DFJDZ916t0DF3TUYqftm
         l9L/b6iNz/hzERt0nKPBmMv7V8UsawdONPsbvrxQbwPymQcoI8RUOPBk5F76gwEGNKHB
         833u2b+MSR7dm26048mlm3y+fL/5U1JVBQDKNfvi99nY33lR1SQ/5fk38PgMoV+I4FuF
         xmXdULD1F/a0Ptq4klYvvdq7wQojzLoVvOWLk/zb2GZmnSdg/t5oAZtD7+fePsDiycFZ
         PeJSqByW70HIlqFGZFSYDGixo6ArSrm3LVRYinnsSlZ20h638a9UbG8ozuucKncxbOdC
         NqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ7XQCjCGhLuloUN0piA7WvNUD0Jpp0Ka/bolR2saRQX2/HtSDgff9zYyULspHo/ogssV2hcGKB7L2uNzWCKVk1Vew/XRSTZkrvxT54YWFCHPW
X-Gm-Message-State: AOJu0YyW2GuXP6tq0SmRQ64tKj+utOJzCQW2LinEF6HwlrRN4vxTlMXl
	25H9vk6a1SuLVJ36+QPpJlEMF8QxvFV0Hi1WRC81Zb0i0O8ToohdrwUQKHXWGss=
X-Google-Smtp-Source: AGHT+IEJGltYyHPm5azIaXZsfp0ocu+v/Cqr2tZqTEenkv7mLVqkDy/oZNxcfiL3PNM4Ugjo8ukmUw==
X-Received: by 2002:a05:600c:4f0e:b0:422:97d:4403 with SMTP id 5b1f17b1804b1-422866c2684mr12207455e9.31.1718179088584;
        Wed, 12 Jun 2024 00:58:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb? ([2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f26857582sm6538100f8f.77.2024.06.12.00.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 00:58:08 -0700 (PDT)
Message-ID: <a314c676-3dbd-46f8-826a-2e59367d30ce@linaro.org>
Date: Wed, 12 Jun 2024 09:58:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_005813_058467_B0EDA1F9 
X-CRM114-Status: GOOD (  14.96  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/06/2024 07:50, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/imx/soc-imx8m.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-qmgr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-npe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/mediatek/mtk-cmdq-helper.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/amlogic/meson-clk-measure.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> This is the last of the issues that I see in the soc directory
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 1 +

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> # for amlogic/meson-clk-measure.c

>   drivers/soc/imx/soc-imx8m.c             | 1 +
>   drivers/soc/ixp4xx/ixp4xx-npe.c         | 1 +
>   drivers/soc/ixp4xx/ixp4xx-qmgr.c        | 1 +
>   drivers/soc/mediatek/mtk-cmdq-helper.c  | 1 +
>   5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 3f3039600357..a6453ffeb753 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -688,4 +688,5 @@ static struct platform_driver meson_msr_driver = {
>   	},
>   };
>   module_platform_driver(meson_msr_driver);
> +MODULE_DESCRIPTION("Amlogic Meson SoC Clock Measure driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index ec87d9d878f3..fe111bae38c8 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -252,4 +252,5 @@ static int __init imx8_soc_init(void)
>   	return ret;
>   }
>   device_initcall(imx8_soc_init);
> +MODULE_DESCRIPTION("NXP i.MX8M SoC driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/soc/ixp4xx/ixp4xx-npe.c b/drivers/soc/ixp4xx/ixp4xx-npe.c
> index 35825ee95dff..34a6f187c220 100644
> --- a/drivers/soc/ixp4xx/ixp4xx-npe.c
> +++ b/drivers/soc/ixp4xx/ixp4xx-npe.c
> @@ -764,6 +764,7 @@ static struct platform_driver ixp4xx_npe_driver = {
>   module_platform_driver(ixp4xx_npe_driver);
>   
>   MODULE_AUTHOR("Krzysztof Halasa");
> +MODULE_DESCRIPTION("Intel IXP4xx Network Processor Engine driver");
>   MODULE_LICENSE("GPL v2");
>   MODULE_FIRMWARE(NPE_A_FIRMWARE);
>   MODULE_FIRMWARE(NPE_B_FIRMWARE);
> diff --git a/drivers/soc/ixp4xx/ixp4xx-qmgr.c b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
> index 244ad8d7e80b..cb112f3643e9 100644
> --- a/drivers/soc/ixp4xx/ixp4xx-qmgr.c
> +++ b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
> @@ -465,6 +465,7 @@ static struct platform_driver ixp4xx_qmgr_driver = {
>   };
>   module_platform_driver(ixp4xx_qmgr_driver);
>   
> +MODULE_DESCRIPTION("Intel IXP4xx Queue Manager driver");
>   MODULE_LICENSE("GPL v2");
>   MODULE_AUTHOR("Krzysztof Halasa");
>   
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 046522664dc1..dd70d4d2bed7 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -526,4 +526,5 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>   }
>   EXPORT_SYMBOL(cmdq_pkt_finalize);
>   
> +MODULE_DESCRIPTION("MediaTek Command Queue (CMDQ) driver");
>   MODULE_LICENSE("GPL v2");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240611-md-drivers-soc-1780b1939627
> 


