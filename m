Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68A7C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKI2TnFH1VivBlI9Zu+f4DLD1Oxh3uwKhDHr4Ttuqi4=; b=orbx5U3ResuMrW0wbkGO/W+1bH
	x9AUpW9tk5YCcqFDnVZgfilONn4x8wEv/zl8zBTO99Xiy822Umf9VWY/fedGUYwTkUlTKA3UL+Nen
	0qLSFZ+bguxSnNL381MJ03G8HQ2r7kNIYxX/1Mwnr2DSyXVFXB0SfZk8r/iAhQIpJ1uhT//XuFk3W
	L28Eufj/oaOoZJ3wDppJSxmB8hbeJfJCXSijyJXA+fIh+atdleDID5VQ8JvJ6F2bR7nDiew+3Rx9V
	GnwUVpvS0qStUhzEVnL8tVycdDrOD9SC8PyskdaqoyMG/NVzteCtXSOh1tUBwhUrun47qrV/CYKSK
	AfA7r/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScfM-009zql-M5; Thu, 16 Feb 2023 11:43:08 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScf8-009zmY-IZ; Thu, 16 Feb 2023 11:42:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id d4so1478635wrj.1;
        Thu, 16 Feb 2023 03:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKI2TnFH1VivBlI9Zu+f4DLD1Oxh3uwKhDHr4Ttuqi4=;
        b=gZrP2qlYh/6CWJTLqXysnOcvuh52GIC3d9yfVG0MJpITqyjaFvdpUPeyAbqMkcM3Fa
         zXUSjvUfnTXjRU7JDXzCXkJPfg6imR/g6SaSUTLojExscX49w9mtfsR46pXfNAxLJ+SD
         N4MbZhH7U5Ch1QWp0RK+7HQaoLs7hNEkBRUrc98Go21KPDvJYo9k5Jxcwg60I34kBiO+
         jzOdiyIcNvEffCQDJ+R+4oiEbHiYpWCC7SztqVRM0a5mkaA2h1vc8A30s9hJVYxiQTtx
         Ib/y5W17q02KtYLuNS7y2CNKXljk01bV4+sm4WZKuiGzO7rasB8rgb2OEWJAWVzLw/kI
         0D+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OKI2TnFH1VivBlI9Zu+f4DLD1Oxh3uwKhDHr4Ttuqi4=;
        b=40Rv+4adD+42clGXBq8DfGVgnkVgJvbL3rBWRPXwfCITmTh6+bwq0SBg+37b4LKxn9
         QilXwwG3XFIPZvcD3NjgvN6mnqIno3d7fi87nv5cqhilUPaLnIf4hCB8A96FR+AMRlgL
         aQ8qgwjvs3ZvNUnJlM062Rs/i5Rpqwq88IKd2vxXfc75e1phC5Qmlnn0rV/7woOU4YrQ
         JPif31/4M01WaewMo1TZiR1yigBt/u1vgd0p9oNXOLLPRX72+xQ1BhfNs5yjawEdSPgl
         FM1SwjNqpf9jRnExJ0pVeNEgr1La8070EFrMNgYArgY/DQx6VTffdE/50RqkevGUuGsi
         Vsng==
X-Gm-Message-State: AO0yUKX7R0ElRHzUHGpybiBFzA9ZzAcoo3Ex4t5sUR+2Hkr3cPUE+5am
	OVzpJKAS5imfoVwdi4IWa5c=
X-Google-Smtp-Source: AK7set+dKyKPNF2+oXsuE4x1TqOXOhwS+x+LUr+rCYzBOGgJDag9Cq+SNQNNO/rL9nq18lzBFFSx1w==
X-Received: by 2002:a5d:4486:0:b0:2c3:da8a:192 with SMTP id j6-20020a5d4486000000b002c3da8a0192mr4607178wrq.15.1676547769878;
        Thu, 16 Feb 2023 03:42:49 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g1-20020a5d46c1000000b002c55306f6edsm1309313wrs.54.2023.02.16.03.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 03:42:49 -0800 (PST)
Message-ID: <a08cb6a6-2453-34fe-f6f3-9ff81585d65d@gmail.com>
Date: Thu, 16 Feb 2023 12:42:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230215041257.14548-1-tinghan.shen@mediatek.com>
 <20230215041257.14548-5-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 04/12] remoteproc: mediatek: Add SCP core 1 register
 definitions
In-Reply-To: <20230215041257.14548-5-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_034254_662959_A950E9F2 
X-CRM114-Status: GOOD (  13.18  )
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



On 15/02/2023 05:12, Tinghan Shen wrote:
> Add MT8195 SCP core 1 related register definitions.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

In general I would say this patch should be squashed into 5/12, but please see 
comments below.

> ---
>   drivers/remoteproc/mtk_common.h | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index ea6fa1100a00..3778894c96f3 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -47,6 +47,7 @@
>   #define MT8192_SCP2SPM_IPC_CLR		0x4094
>   #define MT8192_GIPC_IN_SET		0x4098
>   #define MT8192_HOST_IPC_INT_BIT		BIT(0)
> +#define MT8195_CORE1_HOST_IPC_INT_BIT	BIT(4)
>   
>   #define MT8192_CORE0_SW_RSTN_CLR	0x10000
>   #define MT8192_CORE0_SW_RSTN_SET	0x10004
> @@ -56,6 +57,26 @@
>   
>   #define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
>   
> +#define MT8195_CPU1_SRAM_PD			0x1084
> +#define MT8195_SSHUB2APMCU_IPC_SET		0x4088
> +#define MT8195_SSHUB2APMCU_IPC_CLR		0x408C
> +#define MT8195_CORE1_SW_RSTN_CLR		0x20000
> +#define MT8195_CORE1_SW_RSTN_SET		0x20004
> +#define MT8195_CORE1_MEM_ATT_PREDEF		0x20008
> +#define MT8195_CORE1_WDT_IRQ			0x20030

Should be part of 10/12 maybe?

> +#define MT8195_CORE1_WDT_CFG			0x20034
> +
> +#define MT8195_SEC_CTRL				0x85000
> +#define MT8195_CORE_OFFSET_ENABLE_D		BIT(13)
> +#define MT8195_CORE_OFFSET_ENABLE_I		BIT(12)
> +#define MT8195_L2TCM_OFFSET_RANGE_0_LOW		0x850b0
> +#define MT8195_L2TCM_OFFSET_RANGE_0_HIGH	0x850b4
> +#define MT8195_L2TCM_OFFSET			0x850d0

Should be part of 9/12 maybe

> +#define SCP_SRAM_REMAP_LOW			0
> +#define SCP_SRAM_REMAP_HIGH			1
> +#define SCP_SRAM_REMAP_OFFSET			2
> +#define SCP_SRAM_REMAP_SIZE			3

Never used.

> +
>   #define SCP_FW_VER_LEN			32
>   #define SCP_SHARE_BUFFER_SIZE		288
>   

