Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3ADC54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 11:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmcsKjHOKYvrUOUyXFN2fyX5681YPhZugfu38EMuB08=; b=fqr3KF6hJ5id2LRzWy8DRbu9fZ
	ZK1iheGXfCHEPApA6hHsCEYc2VYJWg1B1tXLImibxvOrceYpU//JubglvNwPgneHxsJn16/LEAqJf
	OcGcT4YCOXJhHJiGoL5Mz1ecnCYUfa3iVaj5xGpN0F1CiwUAiGU0wgisKaGm+GFlQkYC5Q0Lw3kPE
	wJy4rvPsCYhRo0m6sS9FogZydRToR8xN8y8+g8rTz5w/yKC03sdtou4QG6oUMUXnco48pXOg9L4M7
	bZP9qJ0Xe6zFqOqY/HrTQQW/LsU/xZo67QjyWpMPvdL5Y8h82zE+A9YDPu8UvmS/iq8Zth22RQc70
	MYR+TDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSnj-003O4r-0J; Mon, 30 Jan 2023 11:58:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSmj-003Nus-KH
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 11:57:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id q10so10811320wrm.4
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jan 2023 03:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XmcsKjHOKYvrUOUyXFN2fyX5681YPhZugfu38EMuB08=;
        b=H2FPuCMk/NF+fT6BAcIMqqiJEBfns65LIpOPsw5l2IRunMicVdx3XMV5/qZ+gvz80o
         c2ym7rtY3PllyRlph6/nAcDVro7vxo5QN37nVetUJ8fnIhYKNcNYT36gON1zlwpkhfKm
         TqyJLZKKFYc9gomPikcHOSM/Fh+IIAhxBYRllJTJ5B9ZarX1C4CLORSnT8Q9qWSyRx+M
         SarrGtpFcNeORELwQaDTH87A9GuMt0YwGJKiBRYhjyZqi0/aPRb9w3/rPvoVSi0AM3td
         qpRwW2J7Xg+vy7C8cVsDH0kwHXosXoncBm0nLFU/oaAdQdioTu2E/pc95qo4vOQ+CITZ
         t+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XmcsKjHOKYvrUOUyXFN2fyX5681YPhZugfu38EMuB08=;
        b=rApkrKe/hSfom74RLWXybyZePVAQsVotMKXRLAvRImt0BgLruM8xMJb3PbkaJPxzqG
         drusoyGnWLw6Ku1BIPDHhEwTSyWwhTLvnOvooyoy7SepRbgBl6Rf2yp6DXsDUIov3P+S
         1s4Nohh3glaturi/prnc1rCke+NbYQlra5Xz9ZWRx1WbgJb6sosv+fooxRaoaeP3cpq3
         Bay8Zhuzsd2kg9nwRzi8wk0Xyc/cfSTOCEmNTSPxtvfcFhssV8VLZq//gTb95ikh4jVH
         ixKWlnO25Fw0wE1W++T0lkhWSnBVCaqf1Ikho4YJ1qgVuRxCYH6T7Du8EwL8hiYu3GtP
         nAXw==
X-Gm-Message-State: AFqh2koiHl/jEXV1V0n+DOdw0mxa3o7xv82fiXKap/kdAjE4zP1OKp0x
	fe93OCXRKNMZ144oLxiYoHaRCg==
X-Google-Smtp-Source: AMrXdXvY1RmKLr2Gv1YwpANPagILR9MGIr+duSCkotDjClMAoKjRsaSW02r6KnsoxsJY+EfDL1FMlA==
X-Received: by 2002:adf:8bd6:0:b0:2bf:95d0:fa5d with SMTP id w22-20020adf8bd6000000b002bf95d0fa5dmr32299686wra.9.1675079835446;
        Mon, 30 Jan 2023 03:57:15 -0800 (PST)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id m2-20020a056000180200b002bfb5618ee7sm11648461wrh.91.2023.01.30.03.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 03:57:14 -0800 (PST)
Message-ID: <921aa473-b2a6-0905-2b52-1acf84ed399a@baylibre.com>
Date: Mon, 30 Jan 2023 12:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] dt-bindings: memory: mediatek: Add support of
 unmanaged iommu domain
To: Alexandre Bailon <abailon@baylibre.com>, yong.wu@mediatek.com,
 joro@8bytes.org, will@kernel.org
Cc: robin.murphy@arm.com, matthias.bgg@gmail.com,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230130102722.133271-1-abailon@baylibre.com>
 <20230130102722.133271-2-abailon@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230130102722.133271-2-abailon@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_035717_922305_87B7DD3D 
X-CRM114-Status: GOOD (  14.69  )
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

On 30/01/2023 11:27, Alexandre Bailon wrote:
> Currently, the only way to have an unmanaged domain for a device
> is having a dedicated iova region or bank.
> This adds a new bit to MTK_M4U_ID that allows defining devices
> that needs unmanaged iommu domain.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>   include/dt-bindings/memory/mtk-memory-port.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/memory/mtk-memory-port.h b/include/dt-bindings/memory/mtk-memory-port.h
> index 2f68a0511a257..86896c776691a 100644
> --- a/include/dt-bindings/memory/mtk-memory-port.h
> +++ b/include/dt-bindings/memory/mtk-memory-port.h
> @@ -7,11 +7,14 @@
>   #define __DT_BINDINGS_MEMORY_MTK_MEMORY_PORT_H_
>   
>   #define MTK_LARB_NR_MAX			32
> +#define MTK_UNMANAGED_DEVICE            (1 << 31)
>   
>   #define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
>   #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0x1f)
>   #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
> +#define MTK_M4U_UNMANAGED(id)		((id) & MTK_UNMANAGED_DEVICE)
>   
>   #define MTK_IFAIOMMU_PERI_ID(port)	MTK_M4U_ID(0, port)
> +#define MTK_M4U_UNMANAGED_ID(larb, port) (MTK_M4U_ID(larb, port) | MTK_UNMANAGED_DEVICE)
>   
>   #endif

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

