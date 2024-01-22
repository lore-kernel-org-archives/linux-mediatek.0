Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2858AC4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nVtX6sIVg5JIaktwIHIF/8UXqbp4BOA0LlFNe3QMMA=; b=fQ9KeLfLPqyrlM2ZgvU1pODXQe
	3V/KPUYuCWkfkdVOqxATW3OaDVyoHq4lNoihI9o1JCil7q1oGrpKfXBrV0wUMB1kj6umXrQxI8RM9
	lpVUk5FTOqq0dFO65XS5ttOixmQvCg8fDZ2QQO9Himy+PWr2B7P3Zgyu+n30j3i6U1Bd5GFVKLNeP
	5TagekO4Y0feZfgW67roJk/TXFK4LqGDUjmalDlRuNBcULveu31ALhITjrk+1Xdkb8FbOKdwnvmm5
	hiA3jkaAhvSaTVsLBU2bgeq/Uld6VFdf/00Gma38zAH+n5+rrvNe0JjY/4GQHHrBFWfJ+nCuUDiP6
	bQZnHuAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpCi-00AxKV-03;
	Mon, 22 Jan 2024 07:58:48 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpCd-00AxHG-2r;
	Mon, 22 Jan 2024 07:58:45 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40e86a9fbd9so32169315e9.1;
        Sun, 21 Jan 2024 23:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705910322; x=1706515122; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9nVtX6sIVg5JIaktwIHIF/8UXqbp4BOA0LlFNe3QMMA=;
        b=lAHdF60eRWoebNm4rrFdX8Fg9YmEYikDuoXkRnVw2km9urQhybWaIuEWluy1m1Pd7S
         9s23NLW2yoYEBJ9CwJpVj8oqqcJtM9cs6dgAl3j9pIELsUSS+MHN+E6XFhgamHkEzQdn
         F31XXOXvg1CozLVMd/hYxlILy8RJ+iPpisjxJuINdqiUQ/mXZyO1fPDf5fDJnDaQyz03
         /G4PPCOA/XGGa3ErnWinPtplpMxr2yxbKqvokJXB2kE2VGmZQj9zHJ8L1+Xzfz8Y71Ca
         haQz8AAGrMJOdeL5vfcwF9DqIl39ulnmGPd8erO+8OCPbv4ZVF92nAqoETJG4VfK3oGg
         xNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705910322; x=1706515122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nVtX6sIVg5JIaktwIHIF/8UXqbp4BOA0LlFNe3QMMA=;
        b=Y1gDvJIXEjgBdoKWhvJFbnTdhd8xoiUznGrVu8ngjvcV8eFheaPKkPtZsLdAxZ5zBs
         T6vd7Jg694XWbqE5PfMfCJnuAWJ69t1bxJneGwDldHFGSZCqEyoYRmqiddB+NterHc1v
         0TbfIHlsLHaDTreZleHYxAjBiUNz2Z+YaIhN1daX5Ov3X/+NmWn0SVvtGr88sL7DdEa0
         eJ4fzr7JOIZHrSz6N+AQct7KJ5VuFZrZOcfX+Za7ZXB9xrprUFv/ROs1pyBN94XYNa40
         HeGf+2WvUWFbKMN/0+2qAD7fuqFjM07b2wf8Asje/l7oivUZjqd+rw/dheJloqy6MVvy
         1MvQ==
X-Gm-Message-State: AOJu0Yw6LrozDiFkhu/qirKEg/KFRYQG6NMazawUyZOY0vwD49W4KfIV
	5uJIvlxWzUDoAkOm9Th6N0vgcffOFAnqMJbjWEP7pdAU0eNJ8vvR
X-Google-Smtp-Source: AGHT+IFtddpIUtG+IVjYJjKBn8rjq14p00XlUywXjdfxArHpyN/4Lwp/RrZ0YgkMrSEcgdjBXUlEDw==
X-Received: by 2002:a05:600c:2353:b0:40e:8999:6c45 with SMTP id 19-20020a05600c235300b0040e89996c45mr2020997wmq.83.1705910321514;
        Sun, 21 Jan 2024 23:58:41 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id l34-20020a05600c1d2200b0040e89ade84bsm17815626wms.4.2024.01.21.23.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 23:58:40 -0800 (PST)
Message-ID: <5bf2910f-c184-4681-a474-69bea8ee7b71@gmail.com>
Date: Mon, 22 Jan 2024 08:58:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: mtu3: Add MT8195 MTU3 ip-sleep wakeup support
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20240112133222.240038-1-angelogioacchino.delregno@collabora.com>
 <20240112133222.240038-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240112133222.240038-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_235843_923125_13CF9448 
X-CRM114-Status: GOOD (  14.79  )
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



On 12/01/2024 14:32, AngeloGioacchino Del Regno wrote:
> Add support for the ip-sleep wakeup functionality on the three MTU3
> controllers found on the MT8195 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/usb/mtu3/mtu3_host.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
> index 9f2be22af844..85f49e00e8db 100644
> --- a/drivers/usb/mtu3/mtu3_host.c
> +++ b/drivers/usb/mtu3/mtu3_host.c
> @@ -34,6 +34,19 @@
>   #define WC0_SSUSB0_CDEN		BIT(6)
>   #define WC0_IS_SPM_EN		BIT(1)
>   
> +/* mt8195 */
> +#define PERI_WK_CTRL0_8195	0x04
> +#define WC0_IS_P_95		BIT(30)	/* polarity */
> +#define WC0_IS_C_95(x)		((u32)(((x) & 0x7) << 27))
> +#define WC0_IS_EN_P3_95		BIT(26)
> +#define WC0_IS_EN_P2_95		BIT(25)
> +#define WC0_IS_EN_P1_95		BIT(24)

Not used, shouldn't we drop that?

Regards,
Matthias

> +
> +#define PERI_WK_CTRL1_8195	0x20
> +#define WC1_IS_C_95(x)		((u32)(((x) & 0xf) << 28))
> +#define WC1_IS_P_95		BIT(12)
> +#define WC1_IS_EN_P0_95		BIT(6)
> +
>   /* mt2712 etc */
>   #define PERI_SSUSB_SPM_CTRL	0x0
>   #define SSC_IP_SLEEP_EN	BIT(4)
> @@ -44,6 +57,9 @@ enum ssusb_uwk_vers {
>   	SSUSB_UWK_V2,
>   	SSUSB_UWK_V1_1 = 101,	/* specific revision 1.01 */
>   	SSUSB_UWK_V1_2,		/* specific revision 1.02 */
> +	SSUSB_UWK_V1_3,		/* mt8195 IP0 */
> +	SSUSB_UWK_V1_5 = 105,	/* mt8195 IP2 */
> +	SSUSB_UWK_V1_6,		/* mt8195 IP3 */
>   };
>   
>   /*
> @@ -70,6 +86,21 @@ static void ssusb_wakeup_ip_sleep_set(struct ssusb_mtk *ssusb, bool enable)
>   		msk = WC0_SSUSB0_CDEN | WC0_IS_SPM_EN;
>   		val = enable ? msk : 0;
>   		break;
> +	case SSUSB_UWK_V1_3:
> +		reg = ssusb->uwk_reg_base + PERI_WK_CTRL1_8195;
> +		msk = WC1_IS_EN_P0_95 | WC1_IS_C_95(0xf) | WC1_IS_P_95;
> +		val = enable ? (WC1_IS_EN_P0_95 | WC1_IS_C_95(0x1)) : 0;
> +		break;
> +	case SSUSB_UWK_V1_5:
> +		reg = ssusb->uwk_reg_base + PERI_WK_CTRL0_8195;
> +		msk = WC0_IS_EN_P2_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
> +		val = enable ? (WC0_IS_EN_P2_95 | WC0_IS_C_95(0x1)) : 0;
> +		break;
> +	case SSUSB_UWK_V1_6:
> +		reg = ssusb->uwk_reg_base + PERI_WK_CTRL0_8195;
> +		msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
> +		val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) : 0;
> +		break;
>   	case SSUSB_UWK_V2:
>   		reg = ssusb->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
>   		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;

