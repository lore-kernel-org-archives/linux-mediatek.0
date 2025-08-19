Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C46CA0EE6
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Aug 2025 11:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRnvcJ2f2fPQ8sZ2OC8GktyRnLPTrLj3Sq7t/FTrOnE=; b=eQqRNc2Kt6XTIA
	2kOf6Izef91db7FyGYp8DOcq9h15w8z6vbigOpq25vQ1yXbEShUCgjpLc9U4CHqFYse+dQ/zJaDlA
	9GMIRzJfOeUj2JKeC2QKgdWVZwIHCAoO9C2z0ptTe2RlYnHXC5exGI95HY873zMPkq1+IaTGz7qz3
	K+fCOWMicVdNCJaVytgbU2Qsm+RyhNyYm1RBSkvmy8elI8IGnB/jIAT3IqM7aL0zmVEYc86g8AgcG
	8uaFA8UkGPLS8E7uL7DBhLUw8DiJaxUFPspuNJUiFnWuriZeRFVy79KjkE1yHQI7c1PpkLXpatmB8
	5uVShIuZJnznpDtChLfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKaE-0000000AI39-2qL7;
	Tue, 19 Aug 2025 11:32:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIsL-0000000A0ei-041W
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Aug 2025 09:43:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b9d41c1963so2521226f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Aug 2025 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596607; x=1756201407; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRnvcJ2f2fPQ8sZ2OC8GktyRnLPTrLj3Sq7t/FTrOnE=;
        b=V5NJf2ZyJj/cGDzYMPVAjW4OSeJ6niZE2fY/C6b/caNVii3nCGMfRWz+KXiFwQ9fZr
         vRpaXrC4CKBSwAlzecGAqahfcHX7qrk2oS1eiohr5EdCWrNYXT25SrLpL1F6XaKysPJe
         sIyt7++xCGOAx31/3I+B05hxxbb1PlJtXTIG88ZpdBbLr820s9nJZmEcIqrIzz4Yd1DJ
         LyPhFV++tXrAhCAsV2OAKkNfFSL0xJOIhyKNZ/WRJvs+g8StCU2lgEm7AHnySs7UNqzh
         2qG6AjOSJLt3Jyb09aMlXHgsUdHTYgaGQ3UAAHg0aM+fScb/qpTBMr+AirwhAuv+KDrr
         Gfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596607; x=1756201407;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rRnvcJ2f2fPQ8sZ2OC8GktyRnLPTrLj3Sq7t/FTrOnE=;
        b=WwTUG6P5GigZh4EXRI2x1ttvBc6Illffx84/6J2Xq5GiH5E0/c1ku0SrwJmLEDRD1n
         jD2UuXsef79rUVAwO6eiexVHIsNmFbTL5kIE2gBd5JDaNGcvuSJQDZjCF3NIBUxQReiq
         5spAgdYdvGZGnJzO2kyheqjPF3mLt7Md7nid+9008QT1N7TRgm5Ue73PNctfC9g1cEZa
         fqipjj7kWNAyGZgQc7+bVWZPR6tcv6Car7lJywXoAXPdibQRwrRvXG9Qe23LFb48HppG
         ZA9ZlJISxj7kzNZCJSZlOvwIX4jfFxgRwg4VE4htFmVSQ/KuokXC75PRZ0X6AMPAOXPR
         8Xjg==
X-Forwarded-Encrypted: i=1; AJvYcCWXvwNhwFcduzygVwtl6bc83quiN7OApfyRsea++jcg26WIIbsr4Z5HSzoKFca7MgAMdGGPJDZh3WtcfPbLxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe/xj0k+LDA6gSV6IOoBkKB4/fHDzzmw3ilxHEYcdx3+LI6CF5
	yoxwizpmQy+ZyLim+Ry0Od/jbTnyqXYl7CVgHFpyovXOrt9BmwcoloKPNpby3xlshYc=
X-Gm-Gg: ASbGncvnBtSqNK21RVFd8C7ai8tgl0pIReecAoT/ZpX4+1rh5kQnCSgimvqb6gsyW+N
	oT2O0gYJNZgJ/seya3HssbClYkpmAU1/S6yIrAVvQVYm8GMCHkthVSb9EGZq+BpV77ro3QJ2TYa
	l1ivkRleQGEuAQEU3FHuVFy443bPNzFlNzOrQvDnQ2KMsK3uh+gdkzL3D1Avy2rw9YiWxXcnRUo
	e9xoFOnk+285GDc8kz0CoDxAyZa4YQWbJNIovsW2OvxNpvwWW/78lOG6RMCjPtcS4IKkSP89NvH
	sp5sebtqNYhQH7/laknTBUhMivkeE7C+Iof07ccHD1zc0Xuuf0VeKxRsXjZhnKhG2Q2l2hnbba+
	9Qb2ZTqU92b9xAI6LZgU2uh14Yz5GmTnNajrO8fMUrVFVh3kDPTuN9d7lBx6J/GoxAJc5VQTkIR
	0t17LKdb4=
X-Google-Smtp-Source: AGHT+IHJcbfoHziYmKYumTTSzX3HBo05hfHJRAHATRASlvGKTD+Scv9wCOw89lV3HUAzWsOF4xrNaw==
X-Received: by 2002:a05:6000:2909:b0:3b7:92ca:2831 with SMTP id ffacd0b85a97d-3c0e028d43amr1435457f8f.12.1755596606910;
        Tue, 19 Aug 2025 02:43:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:e7a:79e6:53ed:ce35? ([2a01:e0a:3d9:2080:e7a:79e6:53ed:ce35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b437862afsm11782925e9.2.2025.08.19.02.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 02:43:26 -0700 (PDT)
Message-ID: <2d576dac-0f9d-4f04-8aef-b3df5f88c926@linaro.org>
Date: Tue, 19 Aug 2025 11:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <20250815-pinctrl-gpio-pinfuncs-v5-15-955de9fd91db@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-15-955de9fd91db@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_024329_055923_E2626E0E 
X-CRM114-Status: GOOD (  17.74  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 15/08/2025 11:09, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The strict flag in struct pinmux_ops disallows the usage of the same pin
> as a GPIO and for another function. Without it, a rouge user-space
> process with enough privileges (or even a buggy driver) can request a
> used pin as GPIO and drive it, potentially confusing devices or even
> crashing the system. Set it globally for all pinctrl-msm users.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index a5f69464827119dfe2a7781b558094b283fca215..1751d838ce95d6138c824b90098f74891dec7656 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
>   	.function_is_gpio	= pinmux_generic_function_is_gpio,
>   	.gpio_request_enable	= msm_pinmux_request_gpio,
>   	.set_mux		= msm_pinmux_set_mux,
> +	.strict			= true,
>   };
>   
>   static int msm_config_reg(struct msm_pinctrl *pctrl,
> 

I tested the patchset on CI, and I got the following errors:

db410c:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253304#L537
[    4.056081] msm8916-pinctrl 1000000.pinctrl: pin GPIO_38 already requested by 1000000.pinctrl:550; cannot claim for 7864900.mmc
[    4.061402] msm8916-pinctrl 1000000.pinctrl: error -EINVAL: pin-38 (7864900.mmc)
[    4.077245] msm8916-pinctrl 1000000.pinctrl: error -EINVAL: could not request pin 38 (GPIO_38) from group gpio38 on device 1000000.pinctrl
[    4.088430] sdhci_msm 7864900.mmc: Error applying setting, reverse things back
[    4.100751] msm8916-pinctrl 1000000.pinctrl: pin GPIO_38 already requested by 1000000.pinctrl:550; cannot claim for 7864900.mmc
[    4.107960] msm8916-pinctrl 1000000.pinctrl: error -EINVAL: pin-38 (7864900.mmc)
[    4.107970] msm8916-pinctrl 1000000.pinctrl: error -EINVAL: could not request pin 38 (GPIO_38) from group gpio38 on device 1000000.pinctrl
[    4.126971] sdhci_msm 7864900.mmc: Error applying setting, reverse things back
[    4.139203] sdhci_msm 7864900.mmc: failed to activate pinctrl state sleep

rb3gen2:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253305#L1120
[    4.155880] sc7280-pinctrl f100000.pinctrl: pin GPIO_91 already requested by f100000.pinctrl:638; cannot claim for 8804000.mmc
[    4.167636] sc7280-pinctrl f100000.pinctrl: error -EINVAL: pin-91 (8804000.mmc)
[    4.179817] sc7280-pinctrl f100000.pinctrl: error -EINVAL: could not request pin 91 (GPIO_91) from group gpio91 on device f100000.pinctrl
[    4.196265] sdhci_msm 8804000.mmc: Error applying setting, reverse things back
[    4.196293] sc7280-pinctrl f100000.pinctrl: pin GPIO_91 already requested by f100000.pinctrl:638; cannot claim for 8804000.mmc
[    4.203735] sc7280-pinctrl f100000.pinctrl: error -EINVAL: pin-91 (8804000.mmc)
[    4.203743] sc7280-pinctrl f100000.pinctrl: error -EINVAL: could not request pin 91 (GPIO_91) from group gpio91 on device f100000.pinctrl
[    4.235716] sdhci_msm 8804000.mmc: Error applying setting, reverse things back
[    4.235722] sdhci_msm 8804000.mmc: failed to activate pinctrl state sleep

x1-qcp:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253310#L1776
[    5.881549] mmc0: SDHCI controller on 8804000.mmc [8804000.mmc] using ADMA 64-bit
[    5.889494] x1e80100-tlmm f100000.pinctrl: pin GPIO_71 already requested by f100000.pinctrl:665; cannot claim for 8804000.mmc
[    5.901103] x1e80100-tlmm f100000.pinctrl: error -EINVAL: pin-71 (8804000.mmc)
[    5.913184] x1e80100-tlmm f100000.pinctrl: error -EINVAL: could not request pin 71 (GPIO_71) from group gpio71 on device f100000.pinctrl
[    5.913186] sdhci_msm 8804000.mmc: Error applying setting, reverse things back
[    5.913188] x1e80100-tlmm f100000.pinctrl: pin GPIO_71 already requested by f100000.pinctrl:665; cannot claim for 8804000.mmc
[    5.929538] x1e80100-tlmm f100000.pinctrl: error -EINVAL: pin-71 (8804000.mmc)
[    5.948557] x1e80100-tlmm f100000.pinctrl: error -EINVAL: could not request pin 71 (GPIO_71) from group gpio71 on device f100000.pinctrl
[    5.955983] sdhci_msm 8804000.mmc: Error applying setting, reverse things back
[    5.975984] sdhci_msm 8804000.mmc: failed to activate pinctrl state sleep

Neil

